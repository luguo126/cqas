package com.github.luguo126.cqas.domain;


// import org.hibernate.validator.constraints.Email;
//
// import javax.validation.constraints.Pattern;
// import javax.validation.constraints.Size;

public class UserDetail {


    // create table user_detail(
    //     user_detail_id  bigint(12) not null primary key,
    //     username    varchar(12),
    //     email   varchar(36),
    //     head_img    varchar(36),
    //     intro       varchar(128),
    //     intrests    varchar(36),
    //
    //     user_id     bigint(12)  not null,
    //
    //     constraint fk_user_userdetatil foreign key(user_id)
    //     references user(user_id)
    // );

    public Long  user_detail_id;
    public String username;
    public String email;
    public String head_img;
    public String intro;
    public String intrests;
    public String user_id;



	/**
	* Returns value of user_detail_id
	* @return
	*/
	public Long getUser_detail_id() {
		return user_detail_id;
	}

	/**
	* Sets new value of user_detail_id
	* @param
	*/
	public void setUser_detail_id(Long user_detail_id) {
		this.user_detail_id = user_detail_id;
	}

	/**
	* Returns value of username
	* @return
	*/
	public String getUsername() {
		return username;
	}

	/**
	* Sets new value of username
	* @param
	*/
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	* Returns value of email
	* @return
	*/
	public String getEmail() {
		return email;
	}

	/**
	* Sets new value of email
	* @param
	*/
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	* Returns value of head_img
	* @return
	*/
	public String getHead_img() {
		return head_img;
	}

	/**
	* Sets new value of head_img
	* @param
	*/
	public void setHead_img(String head_img) {
		this.head_img = head_img;
	}

	/**
	* Returns value of intro
	* @return
	*/
	public String getIntro() {
		return intro;
	}

	/**
	* Sets new value of intro
	* @param
	*/
	public void setIntro(String intro) {
		this.intro = intro;
	}

	/**
	* Returns value of intrests
	* @return
	*/
	public String getIntrests() {
		return intrests;
	}

	/**
	* Sets new value of intrests
	* @param
	*/
	public void setIntrests(String intrests) {
		this.intrests = intrests;
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
	* Create string representation of UserDetail for printing
	* @return
	*/
	@Override
	public String toString() {
		return "UserDetail [user_detail_id=" + user_detail_id + ", username=" + username + ", email=" + email + ", head_img=" + head_img + ", intro=" + intro + ", intrests=" + intrests + ", user_id=" + user_id + "]";
	}
}
