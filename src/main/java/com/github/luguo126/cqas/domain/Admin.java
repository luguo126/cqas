package com.github.luguo126.cqas.domain;


// import org.hibernate.validator.constraints.Email;

import javax.validation.constraints.Pattern;
// import javax.validation.constraints.Size;

public class Admin {
    // 帐号是否合法(字母开头，允许3-16字节，允许字母数字下划线)：^[a-zA-Z][a-zA-Z0-9_]{4,15}$
    @Pattern(regexp = "^[a-zA-Z][a-zA-Z0-9_]{2,15}$")
	public String admin_id;

    //中文 2-4
    @Pattern(regexp = "^[\u4E00-\u9FA5]{2,4}$")
    public String name;

    // 强密码(必须包含大小写字母和数字的组合，可以使用特殊字符，长度在8-16之间)
    @Pattern(regexp = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}$")
    public String password;





	/**
	* Returns value of admin_id
	* @return
	*/
	public String getAdmin_id() {
		return admin_id;
	}

	/**
	* Sets new value of admin_id
	* @param
	*/
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	/**
	* Returns value of name
	* @return
	*/
	public String getName() {
		return name;
	}

	/**
	* Sets new value of name
	* @param
	*/
	public void setName(String name) {
		this.name = name;
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
	* Create string representation of Admin for printing
	* @return
	*/
	@Override
	public String toString() {
		return "Admin [admin_id=" + admin_id + ", name=" + name + ", password=" + password + "]";
	}
}
