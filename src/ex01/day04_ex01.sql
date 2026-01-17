SELECT name FROM v_persons_female -- запрос для поиска в первом представлении "женщины"
UNION -- объединим без дубликатов
SELECT name FROM v_persons_male
ORDER BY name;
/*найдем имена мужчин и женщин из 2-х представлений БД
и объединим их без дубликатов*/