package com.github.luguo126.cqas.domain;


import java.sql.Date;
// import org.hibernate.validator.constraints.Email;

import javax.validation.constraints.Pattern;
// import javax.validation.constraints.Size;


public class SurfHistory {
    public long surf_history_id;
    public long question_id;
    public String user_id;
    public boolean answered;
    public Date surf_date;
    public boolean thumbsup;





	/**
	* Returns value of surf_history_id
	* @return
	*/
	public long getSurf_history_id() {
		return surf_history_id;
	}

	/**
	* Sets new value of surf_history_id
	* @param
	*/
	public void setSurf_history_id(long surf_history_id) {
		this.surf_history_id = surf_history_id;
	}

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
	* Returns value of answered
	* @return
	*/
	public boolean isAnswered() {
		return answered;
	}

	/**
	* Sets new value of answered
	* @param
	*/
	public void setAnswered(boolean answered) {
		this.answered = answered;
	}

	/**
	* Returns value of surf_date
	* @return
	*/
	public Date getSurf_date() {
		return surf_date;
	}

	/**
	* Sets new value of surf_date
	* @param
	*/
	public void setSurf_date(Date surf_date) {
		this.surf_date = surf_date;
	}

	/**
	* Returns value of thumbsup
	* @return
	*/
	public boolean isThumbsup() {
		return thumbsup;
	}

	/**
	* Sets new value of thumbsup
	* @param
	*/
	public void setThumbsup(boolean thumbsup) {
		this.thumbsup = thumbsup;
	}





	/**
	* Create string representation of SurfHistory for printing
	* @return
	*/
	@Override
	public String toString() {
		return "SurfHistory [surf_history_id=" + surf_history_id + ", question_id=" + question_id + ", user_id=" + user_id + ", answered=" + answered + ", surf_date=" + surf_date + ", thumbsup=" + thumbsup + "]";
	}
}
