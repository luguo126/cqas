package com.github.luguo126.cqas.domain;

import java.util.Date;
// import javax.validation.constraints.Pattern;
// import javax.validation.constraints.Size;
// import org.hibernate.validator.constraints.Email;


public class Comment {
    // create table comment(
    //     comment_id      bigint(12) not null primary key,
    //     comment_date    datetime not null default current_timestamp,
    //     comment         varchar(512) not null,
    //
    //     answer_id       bigint(12) not null,
    //     user_id         bigint(12) not null,
    //
    //     constraint fk_answer_comment foreign key(answer_id)
    //     references answer(answer_id),
    //     constraint fk_user_comment foreign key(user_id)
    //     references user(user_id)
    // );

    public Long comment_id;
    public Date comment_date;
    public String comment;
    public Long answer_id;
    public String user_id;



	/**
	* Returns value of comment_id
	* @return
	*/
	public Long getComment_id() {
		return comment_id;
	}

	/**
	* Sets new value of comment_id
	* @param
	*/
	public void setComment_id(Long comment_id) {
		this.comment_id = comment_id;
	}

	/**
	* Returns value of comment_date
	* @return
	*/
	public Date getComment_date() {
		return comment_date;
	}

	/**
	* Sets new value of comment_date
	* @param
	*/
	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}

	/**
	* Returns value of comment
	* @return
	*/
	public String getComment() {
		return comment;
	}

	/**
	* Sets new value of comment
	* @param
	*/
	public void setComment(String comment) {
		this.comment = comment;
	}

	/**
	* Returns value of answer_id
	* @return
	*/
	public Long getAnswer_id() {
		return answer_id;
	}

	/**
	* Sets new value of answer_id
	* @param
	*/
	public void setAnswer_id(Long answer_id) {
		this.answer_id = answer_id;
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
	* Create string representation of Comment for printing
	* @return
	*/
	@Override
	public String toString() {
		return "Comment [comment_id=" + comment_id + ", comment_date=" + comment_date + ", comment=" + comment + ", answer_id=" + answer_id + ", user_id=" + user_id + "]";
	}
}
