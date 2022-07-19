--Grąžinkite pirmo recepto visų ingredientų id ir pavadinimus.

SELECT i.id, i.pavadinimas
FROM receptai r
JOIN sujungimas_receptai_ingridientai sri ON r.id=sri.receptas_id
JOIN ingridientai i ON i.id=sri.ingridientas_id
WHERE r.id=1;

--Grąžinkite antro recepto ingredientų kainas ir kalorijas per 100 g

SELECT i.kaina, i.kalorijos_per100g
FROM receptai r
JOIN sujungimas_receptai_ingridientai sri ON r.id = sri.receptas_id
JOIN ingridientai i ON i.id = sri.ingridientas_id
WHERE r.id=2;

--Grąžinkite trečio recepto ingredientų kainų sumą (nenaudojant kaina stulpelio recepto lentelėje, o sumuojant ingredientų kainas)

SELECT SUM(i.kaina)
FROM ingridientai i
JOIN sujungimas_receptai_ingridientai sri ON i.id = sri.ingridientas_id
JOIN receptai r ON r.id = sri.receptas_id
WHERE r.id=3;

SELECT SUM(i.kaina)
FROM receptai r
JOIN sujungimas_receptai_ingridientai sri ON r.id = sri.receptas_id
JOIN ingridientai i ON i.id = sri.ingridientas_id
WHERE r.id=3;

--Grąžinkite ketvirto recepto visas alergijas ir jų id.

SELECT a.id, a.pavadinimas
FROM receptai r
JOIN sujungimas_receptai_alergijos sra ON r.id = sra.receptas_id
JOIN alergijos a ON a.id = sra.alergija_id
WHERE r.id = 4;

--Grąžinkite visas alergijas receptų, kurių kaina yra mažiau nei 7.20

SELECT a.id, a.pavadinimas
FROM receptai r
JOIN sujungimas_receptai_alergijos sra ON r.id = sra.receptas_id
JOIN alergijos a ON a.id = sra.alergija_id
WHERE r.kaina < 7.20;

--Grąžinkite kokie ingredientai yra naudojami pirmame, antrame ir trečiame recepte, tačiau pasikartojančių ingredientų neišveskite antrą kartą (tam naudojamas SELECT DISTINCT)

SELECT DISTINCT  i.id, i.pavadinimas
FROM receptai r
JOIN sujungimas_receptai_ingridientai sri ON r.id=sri.receptas_id
JOIN ingridientai i ON i.id=sri.ingridientas_id
WHERE r.id=1 OR r.id=2 OR r.id=3;

--Grąžinkite receptų id, pavadinimą ir nurodymus, kurie yra “Universali” virtuvės receptai

SELECT r.id, r.pavadinimas, r.nurodymai
FROM receptai r
JOIN sujungimas_receptai_kategorija srk ON r.id = srk.receptas_id
JOIN kategorija_virtuve v ON v.id=srk.kategorija_id
WHERE v.pavadinimas="Universali";

--Grąžinkite visas devinto (id) ingrediento alergijas (id ir pavadinimas stulpelius) surikiuotus abėcėlės didėjančia tvarka pagal pavadinimo stulpelį.

SELECT a.id, a.pavadinimas
FROM ingridientai i
JOIN sujungimas_ingridientai_alergijos sia ON i.id=sia.ingridientas_id
JOIN alergijos a ON a.id=sia.alergija_id
WHERE i.id=9
ORDER BY a.pavadinimas

--Grąžinkite visų alergijų id ir pavadinimą, kurių pavadinimas prasideda “s” raide (JOIN šiai užduočiai nereikia, reikia naudoti MySQL LIKE 

SELECT a.id, a.pavadinimas 
FROM alergijos a
WHERE a.pavadinimas LIKE 's%';

--Grąžinkite visų alergijų id, kurių pavadinimas baigiasi “ai” raidėmis 

SELECT a.id, a.pavadinimas 
FROM alergijos a
WHERE a.pavadinimas LIKE '%ai';

--Grąžinkite visus receptus, kurie priklauso arba “Lietuviška” arba “Morokietiška” arba “Vidurio Rytų” virtuvėms/šalims

SELECT r.id, r.pavadinimas, v.pavadinimas
FROM receptai r
JOIN sujungimas_receptai_kategorija srk ON r.id = srk.receptas_id
JOIN kategorija_virtuve v ON v.id=srk.kategorija_id
WHERE v.pavadinimas IN ('vidurio rytu','marokietiska','lietuviska');

--Išveskite visų receptų kainas ir kalorijas, kuriuose yra pirmas (id) ingredientas

SELECT r.kaina, r.kalorijos_per100g, i.pavadinimas
FROM receptai r
JOIN sujungimas_receptai_ingridientai sri ON r.id = sri.receptas_id
JOIN ingridientai i ON i.id = sri.ingridientas_id
WHERE i.id=1;

--Išveskite visus receptus, kuriuose yra “glitimas” alergija.

SELECT r.pavadinimas
FROM receptai r
JOIN sujungimas_receptai_alergijos sra ON r.id = sra.receptas_id
JOIN alergijos a ON a.id = sra.alergija_id
WHERE a.pavadinimas = "glitimas";

--Grąžinkite KELIUOSE ingredientuose yra alergija pavadinimu “glitimas”. (naudoti JOIN ir COUNT)

SELECT COUNT(i.id)
FROM ingridientai i
JOIN sujungimas_ingridientai_alergijos sia ON i.id=sia.ingridientas_id
JOIN alergijos a ON a.id=sia.alergija_id
WHERE a.pavadinimas="glitimas";

--Grąžinkite KIEK yra ingredientų antrame recepte.

SELECT COUNT( i.id)
FROM receptai r
JOIN sujungimas_receptai_ingridientai sri ON r.id=sri.receptas_id
JOIN ingridientai i ON i.id=sri.ingridientas_id
WHERE r.id=2;

--Grąžinkite receptą, kuris turi daugiausiai ingredientų 
--cia klaida, ingridientu skaiciu rodo didziausia, bet ne tam receptui

SELECT a.pavadinimas, MAX(ingridientu_skaicius) AS daugiausia
FROM (
SELECT r.pavadinimas , COUNT(*) AS ingridientu_skaicius 
FROM receptai r
JOIN sujungimas_receptai_ingridientai sri ON r.id=sri.receptas_id
JOIN ingridientai i ON i.id=sri.ingridientas_id
GROUP BY r.id) a;


