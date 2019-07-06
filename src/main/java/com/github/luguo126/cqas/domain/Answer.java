package com.github.luguo126.cqas.domain;

import java.util.Date;
// import org.hibernate.validator.constraints.Email;
//
// import javax.validation.constraints.Pattern;
// import javax.validation.constraints.Size;

public class Answer {


    // create table answer(
    //     answer_id   bigint(12)  not null primary key,
    //     answer      varchar(512) not null,
    //     answer_date     datetime not null default current_timestamp,
    //
    //     user_id     bigint(12) not null,
    //     question_id bigint(12) not null,
    //
    //     constraint fk_user_answer foreign key(user_id)
    //     references user(user_id),
    //     constraint fk_question_answer foreign key(question_id)
    //     references question(question_id)
    // );

    public Long answer_id;
    public String answer;
    public Date answer_date;
    public String user_id;
    public Long question_id;



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
	* Returns value of answer
	* @return
	*/
	public String getAnswer() {
		return answer;
	}

	/**
	* Sets new value of answer
	* @param
	*/
	public void setAnswer(String answer) {
		this.answer = answer;
	}

	/**
	* Returns value of answer_date
	* @return
	*/
	public Date getAnswer_date() {
		return answer_date;
	}

	/**
	* Sets new value of answer_date
	* @param
	*/
	public void setAnswer_date(Date answer_date) {
		this.answer_date = answer_date;
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
	* Returns value of question_id
	* @return
	*/
	public Long getQuestion_id() {
		return question_id;
	}

	/**
	* Sets new value of question_id
	* @param
	*/
	public void setQuestion_id(Long question_id) {
		this.question_id = question_id;
	}



	/**
	* Create string representation of Answer for printing
	* @return
	*/
	@Override
	public String toString() {
		return "Answer [answer_id=" + answer_id + ", answer=" + answer + ", answer_date=" + answer_date + ", user_id=" + user_id + ", question_id=" + question_id + "]";
	}
}
