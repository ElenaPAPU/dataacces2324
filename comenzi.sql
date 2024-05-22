SELECT * FROM `profesor` WHERE grad_didactic='II' OR grad_didactic='I';
SELECT * FROM `cursuri` WHERE an=2 AND semestru=2;
SELECT * FROM `student` WHERE prenume LIKE 'ion%';
SELECT * FROM `student` WHERE prenume LIKE 'ion%' OR prenume LIKE 'ioa';
SELECT * FROM `student` WHERE prenume LIKE '%ela%';
SELECT * FROM `student` WHERE data_nastere LIKE '%-09-21';
SELECT * FROM `student` WHERE bursa * 12 > 4000;
SELECT * ,(bursa) *12 AS bursa_anuala FROM `student` WHERE bursa *12 >4000;
SELECT * FROM `student` ORDER BY nume ASC;
SELECT * FROM `student` ORDER BY nume ASC, prenume DESC;
SELECT * FROM `student` ORDER BY nume ASC, prenume DESC, an ASC;
SELECT * FROM `profesor` ORDER BY rand();
SELECT nume, prenume FROM `profesor` ORDER BY rand() LIMIT 1;
SELECT * FROM `student` ORDER BY data_nastere DESC LIMIT 5;
SELECT * FROM `student` ORDER BY data_nastere DESC LIMIT 5, 5;
SELECT * FROM `student` ORDER BY data_nastere DESC LIMIT 10, 5;
SELECT *, COUNT(id) AS nr FROM `student` GROUP BY an;
SELECT *, COUNT(id) AS nr FROM `student` GROUP BY an HAVING nr >9;

INSERT INTO `voluntariat` (`id`, `id_student`, `nume_program`) VALUES (NULL, '100', 'Demo1'), (NULL, '101', 'Demo2');
SELECT s.nume, s.prenume, v.nume_program FROM `student` AS s INNER JOIN `voluntariat` AS v ON s.id = v.id_student;
SELECT c.id_curs, c.titlu_curs, n.valoare FROM `cursuri` c NATURAL JOIN note n;

SELECT * FROM student CROSS JOIN note; GRESIT

SELECT c.id_curs, c.titlu_curs FROM cursuri AS c LEFT JOIN didactic AS d ON c.id_curs = d.id_curs WHERE d.id_prof = 1;
SELECT c.id_curs, c.titlu_curs, n.valoare FROM cursuri AS c LEFT JOIN didactic AS d ON c.id_curs = d.id_curs LEFT JOIN note AS n ON c.id_curs = n.id_curs WHERE d.id_prof = 1;
SELECT c.id_curs, c.titlu_curs, AVG( n.valoare) FROM cursuri AS c LEFT JOIN didactic AS d ON c.id_curs = d.id_curs LEFT JOIN note AS n ON c.id_curs = n.id_curs WHERE d.id_prof = 1 GROUP BY n.id_curs;
SELECT c.id_curs, c.titlu_curs, AVG( n.valoare), p.nume, p.prenume FROM cursuri AS c LEFT JOIN didactic AS d ON c.id_curs = d.id_curs LEFT JOIN profesor AS p ON p.id=d.id_prof LEFT JOIN note AS n ON c.id_curs = n.id_curs WHERE d.id_prof = 1 GROUP BY n.id_curs;
SELECT * FROM `cursuri` WHERE id_curs not IN (select id_curs from didactic);
