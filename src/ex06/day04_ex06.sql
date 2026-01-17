CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS ( -- создаем материализованное представление
    SELECT pizzeria.name AS pizzeria_name
    FROM person_visits
    JOIN person ON person_visits.person_id = person.id
    JOIN menu ON person_visits.pizzeria_id = menu.pizzeria_id
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    WHERE person.name = 'Dmitriy'
        AND person_visits.visit_date = '2022-01-08'
        AND menu.price < 800
)
/*найдем инфу о пиццериях, которые Дмитрий посетил 08.01.2022
и где он мог купить пиццу по цене менее 800 руб.*/
/*материализованное представление (materialized view) - 
особенный тип представления в БД, этот тип сохраняет результат
выполнения запроса в физическом виде, т.е. данных хранятся на
жестком диске и могут быть использованы повтоно без повторного
выполнения запроса. А обычное представление выполняет запрос
каждый раз когда к нему обращаются. Т.е. это отдельная таблица -
сохраненная копия - но она может устаревать и становиться
неактуальной!*/
-- обновляется посредством REFRESH MATERIALIZED VIEW