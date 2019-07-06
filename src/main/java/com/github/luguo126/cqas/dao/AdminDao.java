package com.github.luguo126.cqas.dao;


 import com.github.luguo126.cqas.domain.User;
 import java.util.List;
 import org.apache.ibatis.annotations.Param;

import com.github.luguo126.cqas.domain.Admin;
 import com.github.luguo126.cqas.domain.Question;


public interface AdminDao {
	public Admin findAdmin(@Param("admin_id") String admin_id,
			@Param("password") String password);

    public Admin findAdminByID(@Param("admin_id") String admin_id);

	public void insertAdmin(Admin Admin);

    public void insertQuestion(Question uestion);

    public List<User> findAllUsers();

    public void delete_user_by_uid(@Param("uid") String uid);

}
