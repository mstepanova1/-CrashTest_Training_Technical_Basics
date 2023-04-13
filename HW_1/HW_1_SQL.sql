-- 1. Найти все комментарии (comment_content) в блоге и их автора, оставленные пользователем admin

SELECT comment_content, comment_author 
FROM wp_comments wc 
WHERE comment_author = 'admin'
;

-- 2. Найти все заголовки постов и количество комментариев, где количество комментариев находится в диапазоне от 1 до 5

SELECT post_title, comment_count 
FROM wp_posts wp 
WHERE comment_count BETWEEN 1 and 5
;

-- 3. Найти все заголовки постов и их уникальные комментарии, если они есть

SELECT wp.post_title, wc.comment_content
FROM wp_posts wp 
LEFT JOIN wp_comments wc ON 1=1
AND wc.comment_post_ID = wp.ID 
;

-- 4. Найти все комментарии (comment_content) и заголовки постов, у которых буква “e” в текст комментария является третьей с конца

SELECT wp.post_title, wc.comment_content
FROM wp_posts wp 
JOIN wp_comments wc ON 1=1
AND wc.comment_post_ID = wp.ID 
WHERE wc.comment_content like '%e__'
;

-- 5. **Вывести: названия категорий, заголовки постов и контент комментариев, которые соответствуют друг другу

SELECT wt.name, wp.post_title, wc.comment_content
FROM wp_posts wp 
JOIN wp_comments wc ON 1=1
AND wp.ID = wc.comment_post_ID
JOIN wp_term_relationships wtr ON 1=1
AND wtr.object_id = wp.ID
JOIN wp_terms wt ON 1=1
AND wt.term_id = wtr.term_taxonomy_id
;