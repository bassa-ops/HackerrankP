
/*occupations Solution*/
SELECT MIN(IF(Occupation = 'Doctor',Name,NULL)),MIN(IF(Occupation = 'Professor',Name,NULL)),MIN(IF(Occupation = 'Singer',Name,NULL)),MIN(IF(Occupation = 'Actor',Name,NULL)) FROM( SELECT ROW_NUMBER() OVER(PARTITION BY Occupation ORDER BY Name) AS row_num, Name, Occupation FROM OCCUPATIONS) AS ord GROUP BY row_num
# BST Tree Solution SELECT N, CASE WHEN P IS NULL THEN 'Root' WHEN (SELECT COUNT(*) FORM BST WHERE B.N=P)>0 THEN 'Inner' ELSE 'Leaf' END AS PLACE FROM BST B ORDER BY N;
