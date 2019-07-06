package com.github.luguo126.cqas.domain;

import java.sql.Date;


public class Question {

    // create table question(
    // 	question_id		bigint(12)	not null auto_increment primary key,
    //     type    varchar(36) not null,
    //     title   varchar(128) not null,
    //     content varchar(512) not null,
    //     like_number     bigint(12) not null default 0,
    //     answer_number   bigint(12) not null default 0,
    //     surf_number     bigint(12) not null default 0,
    // 	ask_date	datetime not null default current_timestamp,
    //
    //     user_id     bigint(12) not null,
    //
    //
    //     constraint fk_user_question foreign key(user_id)
    //     references user(user_id)
    // );

    public long question_id;
    public String type;
    public String title;
    public String content;
    public long like_number;
    public long answer_number;
    public long surf_number;
    public Date ask_date;
    public String user_id;
    public String content_md;




	/**
	* Returns value of question_id
	* @return
	*/
	public long getQuestion_id() {
		return question_id;
	}

	/**
	* Sets new value of question_id
	* @param
	*/
	public void setQuestion_id(long question_id) {
		this.question_id = question_id;
	}

	/**
	* Returns value of type
	* @return
	*/
	public String getType() {
		return type;
	}

	/**
	* Sets new value of type
	* @param
	*/
	public void setType(String type) {
		this.type = type;
	}

	/**
	* Returns value of title
	* @return
	*/
	public String getTitle() {
		return title;
	}

	/**
	* Sets new value of title
	* @param
	*/
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	* Returns value of content
	* @return
	*/
	public String getContent() {
		return content;
	}

	/**
	* Sets new value of content
	* @param
	*/
	public void setContent(String content) {
		this.content = content;
	}

	/**
	* Returns value of like_number
	* @return
	*/
	public long getLike_number() {
		return like_number;
	}

	/**
	* Sets new value of like_number
	* @param
	*/
	public void setLike_number(long like_number) {
		this.like_number = like_number;
	}

	/**
	* Returns value of answer_number
	* @return
	*/
	public long getAnswer_number() {
		return answer_number;
	}

	/**
	* Sets new value of answer_number
	* @param
	*/
	public void setAnswer_number(long answer_number) {
		this.answer_number = answer_number;
	}

	/**
	* Returns value of surf_number
	* @return
	*/
	public long getSurf_number() {
		return surf_number;
	}

	/**
	* Sets new value of surf_number
	* @param
	*/
	public void setSurf_number(long surf_number) {
		this.surf_number = surf_number;
	}

	/**
	* Returns value of ask_date
	* @return
	*/
	public Date getAsk_date() {
		return ask_date;
	}

	/**
	* Sets new value of ask_date
	* @param
	*/
	public void setAsk_date(Date ask_date) {
		this.ask_date = ask_date;
	}

	/**
	* Returns value of user_id
	* @return
	*/
	public String getUser_id() {
		return user_id;
	}

	/**
	* Sets new value of user_id
	* @param
	*/
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	/**
	* Returns value of content_md
	* @return
	*/
	public String getContent_md() {
		return content_md;
	}

	/**
	* Sets new value of content_md
	* @param
	*/
	public void setContent_md(String content_md) {
		this.content_md = content_md;
	}


	/**
	* Create string representation of Question for printing
	* @return
	*/
	@Override
	public String toString() {
		return "Question [question_id=" + question_id + ", type=" + type + ", title=" + title + ", content=" + content + ", like_number=" + like_number + ", answer_number=" + answer_number + ", surf_number=" + surf_number + ", ask_date=" + ask_date + ", user_id=" + user_id + ", content_md=" + content_md + "]";
	}
}
