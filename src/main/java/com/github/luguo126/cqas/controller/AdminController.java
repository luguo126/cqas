package com.github.luguo126.cqas.controller;

import javax.servlet.ServletException;
import  com.github.luguo126.cqas.domain.Question;
import  com.github.luguo126.cqas.domain.User;
import com.alibaba.fastjson.JSON;
import com.github.luguo126.cqas.domain.Admin;
import com.github.luguo126.cqas.service.AdminService;
import com.github.luguo126.cqas.service.BaseService;
import com.github.luguo126.cqas.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.web.bind.annotation.RequestMethod;
import javax.servlet.http.HttpServletRequest;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.PageHelper;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;



import  com.github.luguo126.cqas.domain.User;
import com.github.luguo126.cqas.service.BaseService;


@Controller
public class AdminController {

    private Admin ADMIN_SESSION = null;
    private User USER_SESSION = null;

	@Autowired
	private AdminService adminService;

    @Autowired
	private UserService userService;

	@Autowired
	private BaseService baseService;



    @RequestMapping("/admin_findAllQuestions")
	public String admin_findAllQuestions(@RequestParam(required=false,defaultValue = "1",value = "pageNum")Integer pageNum,
	                   Map<String,Object> map){

	    PageHelper.startPage(pageNum,5);
	    List<Question> question = baseService.findAllQuestions();
	    PageInfo<Question> pageInfo = new PageInfo<>(question,5);
	    map.put("pageInfo",pageInfo);
        // debug
		System.out.println("page size = " + pageInfo.getPageSize());
	    return "admin_question";
	}



    @RequestMapping("/delete_question_by_qid")
    public String delete_question_by_qid(@RequestParam(required=true,value = "qid")long qid,
                       ModelAndView mv ,Map<String,Object> map, HttpServletRequest request,
                       HttpServletResponse response) throws Exception {

        baseService.delete_question_by_qid(qid);
        System.out.println("question " + qid + " deleted!");
        mv.addObject("delete_ok", "true");
        // mv.setViewName("admin_question");
        // return mv;
        // return "redirect:/delete_question_by_qid.mvc?qid="+qid; 无限循环
        // request.getRequestDispatcher("/WEB-INF/page/admin_question.jsp").forward(request, response); 不跳转

        return null;
    }


    @RequestMapping("/delete_user_by_uid")
    public String delete_user_by_uid(@RequestParam(required=true,value = "uid")String uid,
                       ModelAndView mv ,Map<String,Object> map, HttpServletRequest request,
                       HttpServletResponse response) throws Exception {
        System.out.println("delete_user_by_uid");
        adminService.delete_user_by_uid(uid);
        System.out.println("user " + uid + " deleted!");
        mv.addObject("delete_ok", "true");
        // mv.setViewName("admin_question");
        // return mv;
        // return "redirect:/delete_question_by_qid.mvc?qid="+qid; 无限循环
        // request.getRequestDispatcher("/WEB-INF/page/admin_question.jsp").forward(request, response); 不跳转

        return null;
    }


    @RequestMapping(value="/admin_register", method=RequestMethod.POST)
	public ModelAndView admin_register(@Valid Admin admin, BindingResult result, HttpServletRequest request) {
        System.out.println(admin);
        ModelAndView modelAndView = new ModelAndView();

        if (result.hasErrors()) {
            modelAndView.setViewName("admin_registerForm");
			return modelAndView;
        }
		if( adminService.findAdminByID(admin.getAdmin_id()) == null ) {
			// branch: 用户名不存在
        	adminService.insertAdmin(admin);
			modelAndView.addObject("register_success", "注册成功");
            modelAndView.setViewName("admin_registerForm");
        } else {
			// branch: 用户名存在
			modelAndView.addObject("uid_exist", admin.getAdmin_id() + "已被注册!");
			modelAndView.setViewName("admin_registerForm");
		}

		return modelAndView;
	}



    @RequestMapping(value="/admin_login", method=RequestMethod.POST)
	public ModelAndView admin_login(@Valid Admin admin,
		BindingResult result, HttpSession session, HttpServletRequest request) {

		ModelAndView modelAndView = new ModelAndView();
        System.err.println(admin);

		// test: 用户名和密码符合要求
        if (result.hasErrors()) {
            modelAndView.setViewName("admin_loginForm");
            return modelAndView;
        }

		if( adminService.findAdminByID(admin.getAdmin_id()) == null ) {
			// branch: 用户不存在
            System.out.print("fffffffff");
            System.out.println( adminService.findAdminByID(admin.getAdmin_id()) );

			modelAndView.addObject("no_user_msg", "没有id为" + admin.getAdmin_id() + "的用户");
			modelAndView.setViewName("admin_loginForm");
			return modelAndView;

		} else if ( adminService.findAdmin( admin.getAdmin_id(),admin.getPassword() ) != null ) {
			// branch: 用户存在 & 用户名和密码都输入正确
            System.out.println( "----" + adminService.findAdminByID(admin.getAdmin_id()) );
			session.setAttribute("ADMIN_SESSION", admin);
			ADMIN_SESSION = (Admin)session.getAttribute("ADMIN_SESSION");
        	modelAndView.setViewName("admin_board");
        	return modelAndView;

		} else if(adminService.findAdminByID(
					admin.getAdmin_id()).getPassword() != admin.getPassword()) {
			// branch: 用户存在 & 密码错误

			modelAndView.addObject("password_err_msg", "密码错误");
			modelAndView.setViewName("admin_loginForm");
			return modelAndView;
		}

		modelAndView.setViewName("admin_board");
        return modelAndView;
	}


    @RequestMapping("/admin_logout")
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		session.invalidate();

		return "redirect:/admin_board.mvc";
	}



    @RequestMapping(value = "/update_question_page")
    public ModelAndView update_question_page(HttpServletResponse response,
                            @RequestParam(required=true,value="qid")long qid) {
        ModelAndView mv = new ModelAndView();
        Question question = userService.findQuestionByQid(qid);
        System.out.println("update_question_page");
        System.out.println(question);

        // mv.addObject("question", JSON.toJSONString(question));
        mv.addObject("question", question);

        mv.setViewName("update_question_page");

        return mv;
    }



    @RequestMapping(value = "/update_question", method= RequestMethod.POST)
    public ModelAndView update_question(@RequestBody Question question, HttpServletRequest request) {

		ModelAndView modelAndView = new ModelAndView();

		// System.out.println(USER_SESSION.getUser_id());
		// question.setUser_id(USER_SESSION.getUser_id());

		System.out.println("/update_question executed");

		if ( (question.getQuestion_id() >= 0) && (!question.getType().isEmpty()) && (!question.getTitle().isEmpty())
			&& (!question.getContent().isEmpty()) &&  (!question.getContent_md().isEmpty()) ) {

			baseService.update_question(question);

			// modelAndView.addObject("submit_success", "问题提交成功");
			modelAndView.setViewName("update_question_page");
			return modelAndView;
		} else if (question.getType().isEmpty()) {
			// System.out.println("type isEmpty: " + question.getType().isEmpty());
			// modelAndView.addObject("no_type", "没有选择问题类型");
			modelAndView.setViewName("update_question_page");
			return modelAndView;

		} else if (question.getTitle().isEmpty()) {
			// modelAndView.addObject("no_title", "没有填写问题的标题");
			modelAndView.setViewName("update_question_page");
			return modelAndView;

		} else if (question.getContent().isEmpty()) {
			// modelAndView.addObject("no_content", "没有填写问题的内容");
			modelAndView.setViewName("update_question_page");
			return modelAndView;
		}

		modelAndView.setViewName("update_question_page");
		return modelAndView;
    }


    @RequestMapping("/admin_findAllUsers")
    public String admin_findAllUsers(@RequestParam(required=false,defaultValue = "1",value = "pageNum")Integer pageNum,
                       Map<String,Object> map){

        PageHelper.startPage(pageNum,5);

        List<User> user = adminService.findAllUsers();

        PageInfo<User> pageInfo = new PageInfo<>(user,5);
        map.put("pageInfo",pageInfo);
        // debug
        System.out.println("page size = " + pageInfo.getPageSize());
        return "admin_user";
    }



    @RequestMapping(value = "/update_user", method= RequestMethod.POST)
    public String update_user(@RequestBody User user, HttpServletRequest request,
                        HttpServletResponse response) {
        // String password = user.getPassword();
        System.out.println("update_user_password");
        System.out.println(user);

        baseService.update_user_password(user);

        return null;
    }



    @RequestMapping(value = "/add_user.mvc", method= RequestMethod.POST)
    public void add_user(User user, HttpServletRequest request,
                        HttpServletResponse response) throws IOException {
        ModelAndView mv = new ModelAndView();
        System.out.println("add_user executed");
        System.out.println(user);

        // @Pattern(regexp = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}$")
		String password = user.getPassword();
        String uid = user.getUser_id();
		String password_regex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}$";
        String uid_regex = "^[a-zA-Z][a-zA-Z0-9_]{2,15}$";
		boolean password_reasonable = password.matches(password_regex);
        boolean uid_reasonable = password.matches(uid_regex);
        if (password_reasonable && uid_reasonable) {
            if( userService.findUserByUid(user.getUser_id()) == null ) {
                // branch: 用户名不存在
                userService.insertUser(user);
                request.setAttribute("register_success", "添加成功");
            } else {
                // branch: 用户名存在
                request.setAttribute("uid_exist", user.getUser_id() + "已被注册!");
            }
        }else {
            request.setAttribute("reasonable", "用户名或密码不合要求!");
        }



        // userService.insertUser(user);

        // response.sendRedirect("admin_findAllUsers.mvc");
        try {
            request.getRequestDispatcher("admin_findAllUsers.mvc").forward(request,response);

        }catch(ServletException e) {
            e.printStackTrace();
        }
        // mv.setViewName("admin_user");
        // return mv;  org.eclipse.jetty.io.EofException: Closed

    }


}
