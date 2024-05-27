SELECT * FROM universitate.note;
SET @MIN = '1996-01-07 00:00:00';
SET @MAX = '2000-03-24 00:00:00';

UPDATE `student` 
SET `data_nastere` =  TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, @MIN, @MAX)), @MIN);


SET @MIN = '1960-04-30';
SET @MAX = '1980-04-30';
update profesor set data_nastere =  TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, @MIN, @MAX)), @MIN);


select * from student WHERE 
         DATE_FORMAT(data_nastere,'%m-%d') ='09-11';
         
-- 8
SELECT * FROM `student` where bursa * 12 >4000 ;

-- Aplicatia 1.3
-- o singura inregistrare
INSERT INTO `profesori` SET nume='Popescu', prenume='Ion', data_nastere='1965-05-05', grad_didactic='I';
-- una sau mai multe inregistrari cand nu se mentioneaza campurile
-- dar trebuie sa se respecte ordinea si numarul campurilor din baza de date
INSERT INTO `profesori` VALUES (13,'Ionescu','Dumitru',NULL,'1974-05-28','I')
-- varianta recomandata
INSERT INTO `profesori` (`nume`, `prenume`, `data_nastere`, `grad_didactic`) VALUES ('Albu', 'Dan', '1971-01-10', 'II');
-- din alta tabela
INSERT INTO `profesori` (`nume`, `prenume`, `data_nastere`)
SELECT nume,prenume,data_nastere FROM`studenti` WHERE id=102;
-- ON DUPLICATE KEY UPDATE
INSERT INTO `profesori` VALUES (16,'Ionescu','Dumitru',NULL,'1980-08-08','III')
ON DUPLICATE KEY UPDATE nume='Ionescu2', prenume='Dumitru2';
-- REPLACE
REPLACE INTO `profesori` VALUES (13,'Ionescu3','Dumitru3',NULL,'1980-08-08','III' )


-- Aplicatia 2
-- 1. Afiseaza data curenta
SELECT NOW();
SELECT CURDATE();
SELECT CURDATE() as 'azi este in';
SELECT VERSION();

-- 2. Selecteaza toate liniile si coloanele din tabelul studenti
SELECT * FROM studenti;

-- 3. Selecteaza numele cursurilor disponibile
SELECT titlu_curs FROM cursuri;

-- 4. Selectati doar numele si prenumele studentilor inscrisi la facultate, apoi cei admisi 
SELECT nume, prenume FROM student;

SELECT * FROM `student` WHERE status='admis';

-- 5. Afisati numarul de studenti din anul 1, 2 si 3, apoi doar pe cei care sunt mai multi sau egal cu 10 
SELECT COUNT(id) AS nr_studenti, an FROM `student` GROUP BY an;
SELECT COUNT(id) AS nr_studenti, an FROM `student` GROUP BY an HAVING nr_studenti >=10;  

SELECT * FROM studenti WHERE an between '1' AND '3';
SELECT * FROM studenti WHERE an IN('1','2','3');
SELECT * FROM studenti WHERE an='1' OR an='2' OR an='3';

-- 6. Afisati valoarea totala a burselor din anul 1.
SELECT SUM(bursa) FROM studenti WHERE an='1';

--7. Studentii care au bursa sa li se schimbe statusul din admis in bursier 
UPDATE studenti SET status='bursier' WHERE bursa IS NOT NULL;



--Aplicatia 5
--1.Afisati studentii nascuti incepand cu anul 1996
SELECT * FROM student WHERE data_nastere >= '1996-01-01';
SELECT * FROM student WHERE YEAR(data_nastere)  >= '1996';

--2.Afisati studentii nascuti intre 1993 si 1994
SELECT * FROM student WHERE YEAR(data_nastere) >='1993' AND YEAR(data_nastere)<='1994'; 
SELECT * FROM student WHERE YEAR(data_nastere) BETWEEN'1993' AND '1994'; 

--3. Listati toti profesorii de gradul 1 si 2
SELECT * FROM `profesor` WHERE grad_didactic='II' OR grad_didactic='I';

--4. Listati cursurile din anul 2 semestul 2
SELECT * FROM `cursuri` WHERE an=2 AND semestru=2; 

--5. Listati studentii care isi serbeaza onomastica de Sf.Ion
SELECT * FROM `student` WHERE prenume LIKE 'ion%' OR prenume LIKE 'ioa';

--Daca vrem sa cautam un cuvant ce se termina cu "ela" scriem
SELECT * FROM `student` WHERE prenume LIKE '%ela';

--6.Listati toti studentii care s-au nascut in aceeasi zi 09-21
SELECT * FROM `student` WHERE data_nastere LIKE '%-09-21';
SELECT * FROM `student` WHERE DATE_FORMAT(data_nastere, '%m-%d') = '09-21';

--7.Listati toti studentii care  nu au bursa (IS NULL) apoi cei care au bursa (IS NOT NULL)


--8. Listati studentii cu bursa anuala mai mare de 4000
SELECT * FROM `student` WHERE bursa * 12>4000;
-- Daca vrem sa ne faca si un total al bursei
SELECT *, (bursa) * 12 AS bursa_anuala FROM `student` WHERE bursa * 12>4000;



-- Aplicatia 6
--1.Listati studentii alfabetic dupa nume crescator si descrescator. 
SELECT * FROM `student` ORDER BY nume ASC, prenume DESC;

--2.Afisati profesorii in ordine aleatoare (random)
SELECT * FROM `profesor` ORDER BY rand();

--3.Pentru a lua random un castigator dintr-un concurs
SELECT nume, prenume FROM `profesor` ORDER BY rand() LIMIT 1;

--4.Listati alfabetic primi 5 studenti cei mai tineri
SELECT * FROM `student` ORDER BY data_nastere DESC LIMIT 5;

--4.Listati alfabetic urmatorii 5 studenti cei mai tineri
SELECT * FROM `student` ORDER BY data_nastere DESC LIMIT 5,5;

--5.Listati nr.studentilor din fiecare an (o singura interogare GROUP BY) cu conditia sa fie mai multi de 9 studenti in fiecare an.
SELECT *, COUNT(id) AS nr FROM `student` GROUP BY an HAVING nr >9;




-- ap3 1.
SELECT nume as 'Nume Profesor' FROM profesori;
-- ATENTIE
SELECT nume,prenume  FROM profesori;
SELECT nume prenume  FROM profesori;
-- ap3 2.
SELECT an, count(id) as nr  FROM studenti  GROUP BY an;

-- ap4 6.
select * from studenti WHERE
         DATE_FORMAT(data_nastere,'%m-%d') ='09-11';

--ap4  8
SELECT * FROM `studenti` WHERE bursa * 12 >4000 ;

--ap5 4.
SELECT * FROM `profesori` ORDER BY rand();

-- Aplicatia 7+9
SELECT c.id_curs, c.titlu_curs, n.valoare FROM `cursuri` c NATURAL JOIN note n;
SELECT * FROM studenti CROSS JOIN note;
SELECT * FROM studenti JOIN note;
SELECT * FROM studenti INNER JOIN note;
SELECT * FROM studenti , note;
SELECT * FROM studenti CROSS JOIN note WHERE prenume='Andrei';
SELECT * FROM studenti CROSS JOIN note CROSS JOIN cursuri;
SELECT * FROM cursuri INNER JOIN note USING (id_curs);
SELECT * FROM cursuri c INNER JOIN note n on c.id_curs= n.id_curs;


-- Aplicatia 10
-- 1.Listati ce note a pus un anumit professor la un anumit curs
SELECT * FROM `cursuri` c left join note n on  c.id_curs = n.id_curs inner join didactic d on d.id_curs = n.id_curs and d.id_prof =1
where c.id_curs = 21;

-- 2.Cate cursuri sunt fara profesor?
SELECT * FROM `cursuri` WHERE id_curs not in (select id_curs from didactic);

-- 3.Cati studenti nu s-au inscris la niciun curs?
SELECT * FROM `student` where id not in (select id_student from note);

-- 4.Cati studentiau minim 2 note/ sunt inscrisi la minim 2 cursuri
SELECT id_student, count(id_student) as nr FROM `note` group by id_student having nr >=2 ;


-- 5.Cati strudenti si profesori isi serbeaza ziua de Sf. ION?
(SELECT nume, prenume FROM `student` where prenume like 'ion%') UNION (select nume,prenume from profesor where prenume like 'ion%');
-- 6.Pentru un anumit student doresc sa vad ce note are la cursurile sale
select s.nume,s.prenume, n.valoare, c.titlu_curs from student s left join note n on s.id = n.id_student inner join cursuri c on n.id_curs= c.id_curs where s.id=101 ;
-- 7.Calculati media notelor primite pentru un anumit student
select s.nume,s.prenume, avg(n.valoare) from student s left join note n on s.id = n.id_student where s.id=101; 
-- 8. media fiecarui student 
select s.nume,s.prenume, avg(n.valoare) from student s left join note n on s.id = n.id_student group by s.id ;
-- 9. media studentilor pe ani
select s.an, avg(n.valoare) from student s left join note n on s.id = n.id_student group by s.an