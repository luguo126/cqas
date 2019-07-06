package com.github.luguo126.cqas.service;

import com.github.luguo126.cqas.domain.User;
import java.util.List;
import com.github.luguo126.cqas.domain.Question;
// import org.apache.ibatis.annotations.Param;


// import com.github.luguo126.cqas.dao.UserDao;
import com.github.luguo126.cqas.domain.Admin;



public interface AdminService {

    public Admin findAdminByID(String admin_id);
    public Admin findAdmin(String admin_id,String password);

	public void insertAdmin(Admin admin);

    public void insertQuestion(Question uestion);

    public List<User> findAllUsers();

    public void delete_user_by_uid(String uid);
}
