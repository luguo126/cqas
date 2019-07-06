package com.github.luguo126.cqas;



import org.junit.Test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.github.luguo126.cqas.dao.UserDao;
import com.github.luguo126.cqas.domain.User;


/**
 * DAO测试类
 */
public class DaoTests {
	@Test
	public void findCustomerByIdDaoTest(){
		ApplicationContext act = 
		    new ClassPathXmlApplicationContext("applicationContext.xml");
          // 根据容器中Bean的id来获取指定的Bean
		UserDao userDao = (UserDao) act.getBean("userDao");
//	    CustomerDao customerDao = act.getBean(CustomerDao.class);
		User user = userDao.findUser("李刚", "2s1/2blz.");
		
		((ClassPathXmlApplicationContext)act).close();
		System.out.println(user);
	}
	


}
