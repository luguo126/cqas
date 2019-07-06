package com.github.luguo126.cqas;


import org.junit.Test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.github.luguo126.cqas.service.UserService;
import com.github.luguo126.cqas.service.impl.UserServiceImpl;
import com.github.luguo126.cqas.domain.User;

//			UserDao userDao = (UserDao) act.getBean("userDao");
//		    CustomerDao customerDao = act.getBean(CustomerDao.class);
public class UserServiceTests {
	@Test
	public void findUserTest() {
		ApplicationContext act =
			    new ClassPathXmlApplicationContext("applicationContext.xml");
			UserService userService = (UserServiceImpl) act.getBean("userService");
			User user = userService.findUser("李刚", "2s1/2blz.");
			((ClassPathXmlApplicationContext)act).close();
			System.out.println(user);
	}
	
	@Test
	public void insertUserTest() {
		ApplicationContext act =
			    new ClassPathXmlApplicationContext("applicationContext.xml");
			UserService userService = (UserServiceImpl) act.getBean("userService");
			User user = new User();
			user.setUser_id("王丽丽");
			// user.setEmail("wanglili");
			user.setPassword("2s1/2blz.");
			userService.insertUser(user);
		((ClassPathXmlApplicationContext)act).close();
	}
}
