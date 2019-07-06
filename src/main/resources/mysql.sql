

create table user(

	username    varchar(12) primary key,
	email		varchar(16),
	password	varchar(16)
);

insert into user(username, email, password)
		values("郭天娇", "withtz@163.com", "2s1/2blz.");
insert into user(username, email, password)
		values("李刚", "ligang@163.com", "2s1/2blz.");
insert into user(username, email, password)
		values("扬天", "yangtian@163.com", "2s1/2blz.");



-- 问题：问题的ID， 问题的内容，提出者，提出时间，点赞数目
create table question(
	id		bigint(12)	not null auto_increment primary key,
	content varchar(512),
	publisher	varchar(16) not null,
	publish_datetime	datetime not null default current_timestamp,
	vote_num	bigint(12) not null default 0,
	answer_num	bigint(12) not null default 0
);
