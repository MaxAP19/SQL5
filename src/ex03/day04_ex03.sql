SELECT generated_date AS missing_date -- выберем сгенерированные даты и создадим псевдоним
FROM v_generated_dates -- из созданного нами ранее представления
LEFT JOIN person_visits -- делаем лефт джойн с визитами персон, чтобы сохранить все данные в левой таблице
ON person_visits.visit_date = v_generated_dates.generated_date
WHERE person_visits.visit_date is NULL -- выберем те, где посещения НУЛЛ
ORDER BY missing_date;
/*для поиска пропущенных дат, т.е. дат в январе 2022 г. когда
не было посещений пиццерий.*/