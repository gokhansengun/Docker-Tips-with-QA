CREATE TABLE article (
    article_id bigserial primary key,
    article_name varchar(20) NOT NULL,
    article_desc text NOT NULL,
    date_added timestamp default NULL
);

