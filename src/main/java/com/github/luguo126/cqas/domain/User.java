package com.github.luguo126.cqas.domain;


// import org.hibernate.validator.constraints.Email;

import javax.validation.constraints.Pattern;
// import javax.validation.constraints.Size;

public class User {

    // 帐号是否合法(字母开头，允许3-16字节，允许字母数字下划线)：^[a-zA-Z][a-zA-Z0-9_]{4,15}$
    @Pattern(regexp = "^[a-zA-Z][a-zA-Z0-9_]{2,15}$")
	public String user_id;

    // 强密码(必须包含大小写字母和数字的组合，可以使用特殊字符，长度在8-16之间)
    @Pattern(regexp = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}$")
    public String password;



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
	* Returns value of password
	* @return
	*/
	public String getPassword() {
		return password;
	}

	/**
	* Sets new value of password
	* @param
	*/
	public void setPassword(String password) {
		this.password = password;
	}



	/**
	* Create string representation of User for printing
	* @return
	*/
	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", password=" + password + "]";
	}
}
