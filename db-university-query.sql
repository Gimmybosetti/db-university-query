-- 1. Selezionare tutti gli studenti nati nel 1990
select * from students s where year(s.date_of_birth) = 1990;

-- 2. Selezionare tutti i corsi che valgono più di 10 crediti
select * from courses c where c.cfu > 10;

-- 3. Selezionare tutti gli studenti che hanno più di 30 anni
select * from students s where timestampdiff(year, s.date_of_birth, curdate()) > 30 order by s.date_of_birth desc;

-- 4. Selezionare tutti i corsi di laurea magistrale
select * from  degrees d where d.level = "magistrale";

-- 5. Da quanti dipartimenti è composta l’università?
select count(d.id) as Dipartimenti_totali from departments d;

-- 6. Quanti sono gli insegnanti che non hanno un numero di telefono?
select count(t.id) as Insegnanti_senza_phone from teachers t where t.phone is null;

-- 7. Contare quanti iscritti ci sono stati ogni anno
select YEAR(s.enrolment_date) as Anno_iscrizione, count(s.id) as Iscritti_per_anno from students s group by s.enrolment_date;

-- 8. Calcolare la media dei voti di ogni appello d’esame
select e.id as ID_Esame, avg(es.vote) as Media from exams e inner join exam_student es where e.id = es.exam_id group by e.id;

-- 9. Contare quanti corsi di laurea ci sono per ogni dipartimento
select dep.name as Nome_Dipartimento, count(c.id) as Numero_Corsi from courses c 
inner join degrees d on c.degree_id = d.id 
inner join departments dep on d.department_id = dep.id
group by dep.name;

-- 10. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
select * from students s where s.degree_id = 53;

-- 11. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
select * from degrees d where d.department_id = 7 and d.level = "magistrale";

-- 12. Selezionare tutti i corsi in cui insegna Fulvio Amato
select * from courses c inner join course_teacher ct on c.id = ct.course_id where ct.teacher_id = 44;

-- 13. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono
--     iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
select s.name as Nome, s.surname as Cognome, d.name as Nome_Corso, d.level as Livello,
d.address as Indirzzo_Corso, d.email as Email_Corso, d.website as Sito_Corso,
dep.name as `Nome_Dip.`, dep.address as `Indirizzo_Dip.`, dep.phone as `Tel_Dip.`, 
dep.email as `Email_Dip.`, dep.website as `Sito_Dip.`, dep.head_of_department as `Capo_Dip.` 
from students s
inner join degrees d on s.degree_id = d.id
inner join departments dep on d.department_id = dep.id
order by Nome desc, Cognome desc;

-- Bonus. Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per
--        superare ciascuno dei suoi esami
select s.name as Nome_Studente, s.surname as Cognome_Studente, es.exam_id as ID_Esame, count(es.exam_id) as Tentativi
from exam_student es
inner join students s on es.student_id = s.id 
group by es.exam_id
order by Nome_Studente asc, Cognome_Studente asc;






