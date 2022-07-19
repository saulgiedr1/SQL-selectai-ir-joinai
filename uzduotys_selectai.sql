--ingridientu kainu stulpelis

SELECT i.kaina
FROM ingridientai i;

--ingridientu kainu ir kaloriju stulpeliai

SELECT i.kaina,i.kalorijos_per100g
FROM ingridientai i
WHERE i.kalorijos_per100g < 90;


--ingridientu pavadinimo ir kainu stulpeliai

SELECT i.pavadinimas,i.kaina
FROM ingridientai i
WHERE  i.kaina < 5.80 AND i.kaina > 2.20;

--ingridientu stulpelis, kur id >=6

SELECT i.pavadinimas , i.id
FROM ingridientai i
WHERE  i.id  >= 6 AND i.id <=10 ;

--didziausia kaina

SELECT i.pavadinimas , MAX(kaina) 
FROM ingridientai i;

--receptu id ir pavadinimas

SELECT r.id, r.pavadinimas 
FROM receptai r;

-- vidutine receptu kaina

SELECT  AVG(kaina)
FROM receptai r;

----kainu suma
SELECT  SUM(kaina)
FROM receptai r;

-- kuriu id nuo 3 iki 8 ir turi daugiau 500 kaloriju

SELECT  r.id, r.pavadinimas , r.kalorijos_per100g
FROM receptai r
WHERE r.id >= 3 AND r.id <=8 AND r.kalorijos_per100g >500;

--kuriu kaina < 10 ir kalorijos < 350

SELECT  r.pavadinimas , r.nurodymai
FROM receptai r
WHERE r.kaina < 10  AND r.kalorijos_per100g < 350;

-- vidutinis kaloriju sk , kuriu id <=5

SELECT  AVG(kalorijos_per100g)
FROM receptai r
WHERE r.id <= 5;

--brangiausio recepto pavadinimas 

SELECT r.id, r.pavadinimas
FROM receptai r
WHERE kaina = (SELECT MAX(kaina)FROM receptai);

--kaloringiausio recepto pavadinimas ir nurodymai

SELECT  r.pavadinimas, r.nurodymai
FROM receptai r
WHERE kalorijos_per100g = (SELECT MAX(kalorijos_per100g)FROM receptai);

-- brangiausiu receptu top 3
SELECT   r.kaina
FROM receptai r
ORDER BY  r.kaina DESC
LIMIT 3;

--pigiausiu  5 receptu id ir pavadinimai
SELECT  r.id, r.pavadinimas
FROM receptai r
ORDER BY  r.kaina
LIMIT 5;

