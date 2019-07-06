package com.github.luguo126.cqas.service.impl;

import java.util.List;
// import org.apache.ibatis.annotations.Param;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.luguo126.cqas.dao.AdminDao;
import com.github.luguo126.cqas.domain.Admin;
import com.github.luguo126.cqas.service.AdminService;
import com.github.luguo126.cqas.domain.Question;
import com.github.luguo126.cqas.domain.User;


@Service("adminService")
@Transactional
public class AdminServiceImpl implements AdminService {

    private AdminDao adminDao;

    @Autowired
	@Qualifier("adminDao")
	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}


    public Admin findAdminByID(String admin_id) {
        return adminDao.findAdminByID(admin_id);
    }

    @Override
    public Admin findAdmin(String admin_id, String password) {
        return adminDao.findAdmin(admin_id, password);
    }

    @Override
	public void insertAdmin(Admin admin) {
		adminDao.insertAdmin(admin);
	}

    public void insertQuestion(Question uestion) {
        adminDao.insertQuestion(uestion);
    }

    public List<User> findAllUsers() {
        return adminDao.findAllUsers();
    }

    public void delete_user_by_uid(String uid) {
        adminDao.delete_user_by_uid(uid);
    }

}
