create table admin (
    admin_id    varchar(16) not null primary key,
    username    varchar(16),
    password    varchar(16) not null
);

create table user(
    user_id     varchar(16) primary key,
	password	varchar(16)
);

create table user_detail(
    user_detail_id  bigint(12) not null auto_increment primary key,
    username    varchar(12),
    email   varchar(36),
    head_img    varchar(36),
    intro       varchar(128),
    intrests    varchar(36),

    user_id     varchar(16)  not null,

    constraint fk_user_userdetatil foreign key(user_id)
    references user(user_id)
);
alter table user_detail drop foreigh key fk_user_userdetatil;
alter table user_detail add
    constraint fk_user_userdetatil foreign key(user_id)
    ON DELETE CASCADE ON UPDATE CASCADE;



-- 问题：问题的ID， 问题的内容，提出者，提出时间，点赞数目
create table question(
	question_id		bigint(12)	not null auto_increment primary key,
    type    varchar(36) not null,
    title   varchar(128) not null,
    content varchar(512) not null,
    like_number     bigint(12) not null default 0,
    answer_number   bigint(12) not null default 0,
    surf_number     bigint(12) not null default 0,
	ask_date	datetime not null default current_timestamp,

    user_id     varchar(16) not null,


    constraint fk_user_question foreign key(user_id)
    references user(user_id)
);



create table answer(
    answer_id   bigint(12)  not null auto_increment primary key,
    answer      varchar(512) not null,
    answer_date     datetime not null default current_timestamp,

    user_id     varchar(16) not null,
    question_id bigint(12) not null,

    constraint fk_user_answer foreign key(user_id)
    references user(user_id),
    constraint fk_question_answer foreign key(question_id)
    references question(question_id)
);


create table comment(
    comment_id      bigint(12) not null auto_increment primary key,
    comment_date    datetime not null default current_timestamp,
    comment         varchar(512) not null,

    answer_id       bigint(12) not null,
    user_id         varchar(16) not null,

    constraint fk_answer_comment foreign key(answer_id)
    references answer(answer_id),
    constraint fk_user_comment foreign key(user_id)
    references user(user_id)
);
