package  com.github.luguo126.cqas.controller;



import java.util.HashMap;
import java.util.HashMap;
import java.util.Map;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


// import org.springframework.ui.ModelMap;
// import org.springframework.web.bind.annotation.RequestParam;

import  com.github.luguo126.cqas.domain.User;



@Controller
public class UserPageController {

	// @RequestMapping(value = "/index")
	// public ModelAndView index() {
	// 		return new ModelAndView("index");
	// }

	@RequestMapping(value = "/registerForm")
	public ModelAndView register_form() {
			return new ModelAndView("registerForm","user", new User());
	}

	@RequestMapping(value="/loginForm")
	public ModelAndView login_form() {
			return new ModelAndView("loginForm","user", new User());
	}


	@RequestMapping(value="/myaccount")
	public ModelAndView myaccount() {
			return new ModelAndView("myaccount");
	}

	@RequestMapping(value = "/ask_question")
	public ModelAndView ask_question() {
			return new ModelAndView("ask_question");
	}


	@RequestMapping(value="/my_question")
	public ModelAndView my_question() {
			return new ModelAndView("my_question");
	}

	// @RequestMapping(value="/my_answer")
	// public ModelAndView my_answer() {
	// 		return new ModelAndView("my_answer");
	// }



	@RequestMapping(value="/sendmailForm")
	public ModelAndView sendmailForm() {
			return new ModelAndView("sendmailForm");
	}

	@RequestMapping(value="/resetPasswordForm")
	public ModelAndView resetPasswordForm() {
			return new ModelAndView("reset_password_form");
	}

	@RequestMapping("/checkName")
	@ResponseBody   //使用@ResponseBody，表示这个是处理ajax的请求
	public Map<String, Object> checkName(@RequestParam("name")String name){
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("收到了");
		map.put("ds", "dssasddskf");
		return map;  //表示此时的用户名不存在，可以使用
	}

}
