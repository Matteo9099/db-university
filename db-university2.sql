
    -- Query con GROUP BY

--  Contare quanti iscritti ci sono stati ogni anno
SELECT COUNT(`students`.`id`) AS `iscrizioni_annuali`, YEAR(`enrolment_date`) AS `anno_scolastico`
FROM `students`
GROUP BY YEAR(`enrolment_date`)


-- Contare gli insegnanti che hanno l'ufficio nello stesso edificio



-- Calcolare la media dei voti di ogni appello d'esame
SELECT `exam_student`.`exam_id` AS `appello_esame`, AVG(`vote`) AS `valutazione_media`
FROM `exam_student`
GROUP BY `exam_student`.`exam_id`;

-- Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT COUNT(`degrees`.`name`) AS `numero_corsi`, `degrees`.`department_id` as `numero_dipartimenti`
FROM `degrees`
GROUP BY `degrees`.`department_id`


    -- Query con JOIN

-- Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT `students`.`name`,`students`.`surname`,`students`.`date_of_birth`,`degrees`.`department_id`,`degrees`.`name`
FROM `students`
JOIN `degrees` ON `students`.`degree_id`= `degrees`.`id`
WHERE `degrees`.`name` = "Corso di Laurea in Economia"


-- Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
SELECT *
FROM `degrees`
JOIN `departments` ON `departments`.`id`
WHERE `departments`.`name` = "Dipartimento di Neuroscienze"


-- Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT `course_teacher`.`teacher_id`,`courses`.`name`,`courses`.`description`,`courses`.`period`,`courses`.`year`,`courses`.`cfu`
FROM `course_teacher`
JOIN `courses` ON `course_teacher`.`course_id` = `course_teacher`.`course_id`
WHERE `course_teacher`.`teacher_id` = 44