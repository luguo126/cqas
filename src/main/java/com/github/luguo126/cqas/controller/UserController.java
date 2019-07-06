package  com.github.luguo126.cqas.controller;

import com.github.luguo126.cqas.domain.QuestionType;
import java.util.HashSet;
import java.util.Set;
import java.util.HashMap;
import java.util.Iterator;

import com.github.luguo126.cqas.domain.SurfHistory;
import com.github.luguo126.cqas.domain.UserDetail;
import java.util.Date;
import java.io.FileOutputStream;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.FileInputStream;
import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
// import com.github.luguo126.cqas.model.Page;
import java.util.ArrayList;
import com.github.luguo126.cqas.service.BaseService;
import org.springframework.web.bind.annotation.ResponseBody;
import com.github.luguo126.cqas.domain.Answer;
// import org.springframework.web.bind.annotation.PostMapping;
import com.github.luguo126.cqas.domain.Question;
import org.springframework.web.bind.annotation.RequestBody;
import javax.servlet.http.HttpSession;
// import javax.servlet.http.Cookie;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


// import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestParam;

import  com.github.luguo126.cqas.domain.User;
import com.github.luguo126.cqas.service.UserService;
//import com.github.luguo126.cqas.service.impl.UserServiceImpl;

import javax.validation.Valid;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.web.multipart.MultipartFile;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageInfo;
import com.github.pagehelper.PageHelper;




import com.github.luguo126.cqas.util.CosineSimilarity;



@Controller
public class UserController {
	private User USER_SESSION = null;

	@Autowired
	private UserService userService;

	@Autowired
	private BaseService baseService;



	// @RequestMapping("/index")
	// public String findQuestions(@RequestParam(required=false,defaultValue = "1",value = "pageNum")Integer pageNum,
	//                    Map<String,Object> map){
	//     PageHelper.startPage(pageNum,10);
	// 	PageInfo<Question> pageInfo = null;
	//     List<Question> question = userService.findQuestionWithinTwoHours();
	// 	List<Question> hotQuestion_lst = userService.findHotQuestions(15);
	//
	// 	if (question.size() > 0) {
	// 		pageInfo = new PageInfo<>(question,5);
	// 		map.put("pageInfo", pageInfo);
	// 	}
	//
	// 	if (hotQuestion_lst.size() > 0) {
	// 		map.put("hotQuestion_lst", hotQuestion_lst);
	// 	}
	//
	//
	//     return "index";
	// }



	@RequestMapping(value="/login", method=RequestMethod.POST)
	public ModelAndView login(@Valid User user,
		BindingResult result, HttpSession session,
		HttpServletRequest request, HttpServletResponse response,
		Map<String,Object> map,
		@RequestParam(required=false,defaultValue = "1",value = "pageNum")Integer pageNum) {

		PageHelper.startPage(pageNum,10);
		List<Question> question = userService.findQuestionWithinTwoHours();
		PageInfo<Question> pageInfo = new PageInfo<>(question,5);
		map.put("pageInfo",pageInfo);


		List<Question> hotQuestion_lst = userService.findHotQuestions(15);
		if (hotQuestion_lst.size() > 0) {
			map.put("hotQuestion_lst", hotQuestion_lst);
		}


		ModelAndView modelAndView = new ModelAndView();
        System.err.println(user);
		// test: 用户名和密码符合要求
        if (result.hasErrors()) {
            modelAndView.setViewName("loginForm");
            return modelAndView;
        }

		if( userService.findUserByUid(user.getUser_id()) == null ) {
			// branch: 用户不存在

			modelAndView.addObject("no_user_msg", "没有id为" + user.getUser_id() + "的用户");
			modelAndView.setViewName("loginForm");
			return modelAndView;

		} else if ( userService.findUser( user.getUser_id(),user.getPassword() ) != null ) {
			// branch: 用户存在 & 用户名和密码都输入正确

			session.setAttribute("USER_SESSION", user);
			USER_SESSION = (User)session.getAttribute("USER_SESSION");
        	modelAndView.setViewName("index");
        	return modelAndView;

		} else if(userService.findUserByUid(
					user.getUser_id()).getPassword() != user.getPassword()) {
			// branch: 用户存在 & 密码错误

			modelAndView.addObject("password_err_msg", "密码错误");
			modelAndView.setViewName("loginForm");
			return modelAndView;


		}

		// try {
		// 	// request.getRequestDispatcher("/index.mvc").forward(request,response);
		// 	response.sendRedirect("/index.mvc");
		// } catch(IOException e) {
		// 	e.printStackTrace();
		// } catch(Exception e) {
		// 	e.printStackTrace();
		// }

		modelAndView.setViewName("index");
        return modelAndView;
	}




	@RequestMapping("/logout")
	public String logout(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		System.err.println("logout executed");
		session.invalidate();
		return "redirect:/index.mvc";
	}




	/*
	 * 采用file.Transto 来保存上传的文件
	 */
    @RequestMapping("upload_headimg")
    public ModelAndView  upload_headimg(@RequestParam(value="file") CommonsMultipartFile file) throws IOException {
		ModelAndView mv = new ModelAndView();

		 // long  startTime=System.currentTimeMillis();
        System.out.println("fileName："+file.getOriginalFilename());
		String originalFileName = file.getOriginalFilename();
		String suffix = originalFileName.substring(originalFileName.lastIndexOf('.')+1);

        String path="/Users/gibili/bs/cqas/src/main/webapp/image/"+USER_SESSION.getUser_id() + "." + suffix;

        File newFile = new File(path);
        //通过CommonsMultipartFile的方法直接写文件（注意这个时候）
        file.transferTo(newFile);
        // long  endTime=System.currentTimeMillis();
        // System.out.println("运行时间："+String.valueOf(endTime-startTime)+"ms");
		String head_img = "/image/" + USER_SESSION.getUser_id() + "." + suffix;
		UserDetail user_detail = userService.find_user_detail_by_uid(USER_SESSION.getUser_id());

		// 如果没有头像就设置头像
		// if (user_detail.getHead_img().isEmpty()) {
		// 	userService.update_userdetail_headurl_by_uid(USER_SESSION.getUser_id(), head_img);
		// } else {
		// 	userService.update_userdetail_headurl_by_uid(USER_SESSION.getUser_id(), head_img);
		// }
		// 无论有没有头像，都执行更新操作
		userService.update_userdetail_headurl_by_uid(USER_SESSION.getUser_id(), head_img);

		// 更新后， 重新取出 user_detail
		user_detail = userService.find_user_detail_by_uid(USER_SESSION.getUser_id());

		mv.addObject("user_detail", user_detail);
		mv.setViewName("my_information");

		return mv;
    }



	@RequestMapping(value = "/register", method= RequestMethod.POST)
	public ModelAndView processUser(@Valid User user, BindingResult result) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("u", user);

        if (result.hasErrors()) {
            modelAndView.setViewName("registerForm");
			return modelAndView;
        }
		if( userService.findUserByUid(user.getUser_id()) == null ) {
			// branch: 用户名存在
        	System.out.println(user);
        	userService.insertUser(user);
			userService.insert_userdetail_uid(USER_SESSION.getUser_id());
			modelAndView.addObject("register_success", "注册成功");
            modelAndView.setViewName("registerForm");

        } else {
			// branch: 用户名不存在
			modelAndView.addObject("uid_exist", user.getUser_id() + "已被注册!");
			modelAndView.setViewName("registerForm");
		}
		return modelAndView;
	}



	@RequestMapping(value = "/save_question", method= RequestMethod.POST)
	@ResponseBody
    public ModelAndView save_question(@RequestBody Question question, HttpServletRequest request) {

		ModelAndView modelAndView = new ModelAndView();

		// System.out.println(USER_SESSION.getUser_id());
		question.setUser_id(USER_SESSION.getUser_id());

		if ( (!question.getType().isEmpty()) && (!question.getTitle().isEmpty())
			&& (!question.getContent().isEmpty()) &&  (!question.getContent_md().isEmpty()) ) {
			userService.insertQuestion(question);
			modelAndView.addObject("submit_success", "问题提交成功");
			modelAndView.setViewName("ask_question.mvc");
			return modelAndView;
		} else if (question.getType().isEmpty()) {
			// System.out.println("type isEmpty: " + question.getType().isEmpty());
			// modelAndView.addObject("no_type", "没有选择问题类型");
			modelAndView.setViewName("ask_question.mvc");
			return modelAndView;
		} else if (question.getTitle().isEmpty()) {
			// modelAndView.addObject("no_title", "没有填写问题的标题");
			modelAndView.setViewName("ask_question.mvc");
			return modelAndView;
		} else if (question.getContent().isEmpty()) {
			// modelAndView.addObject("no_content", "没有填写问题的内容");
			modelAndView.setViewName("ask_question.mvc");
			return modelAndView;
		}
		modelAndView.setViewName("ask_question.mvc");
		return modelAndView;
    }









	@RequestMapping("/findQuestion")
	public String findQuestion(@RequestParam(required=false,defaultValue = "1",value = "pageNum")Integer pageNum,
	                   Map<String,Object> map){

	    //引入分页查询，使用PageHelper分页功能
	    //在查询之前传入当前页，然后多少记录
	    PageHelper.startPage(pageNum,5);
	    //startPage后紧跟的这个查询就是分页查询
	    List<Question> question = userService.findQuestionByUid(USER_SESSION.getUser_id());
	    //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以
	    PageInfo<Question> pageInfo = new PageInfo<>(question,5);
	    //pageINfo封装了分页的详细信息，也可以指定连续显示的页数
	    map.put("pageInfo",pageInfo);

	    return "my_question";
	}


	/* 浏览问题 */
	@RequestMapping(value="/surf_question")
	public ModelAndView surf_question(HttpServletResponse response,
			@RequestParam(required=true,value = "qid")long qid) {

		ModelAndView modelAndView = new ModelAndView();
		Question question_cur = null;
		Question question = null;
		question_cur = userService.findQuestionByQid(qid);

		// 用户登录了, 才可以设置浏览记录
		if(USER_SESSION != null ) {
			// 如果没找到浏览记录 （user_id, qid）
			if (userService.find_surf_data_by_qid_uid(qid, USER_SESSION.getUser_id()) == null ) {
				/* 在surf_history 表中记住此次浏览记录, 即 qid 被 uid 浏览了 */
				userService.add_surf_data(qid, USER_SESSION.getUser_id());
				// 浏览数 ++
				userService.question_surf_counter_add_one(qid);
			} else {
				// 如果找到了浏览记录
				// 更新浏览时间
				userService.update_surf_date(qid, USER_SESSION.getUser_id());
			}
		}
		question = userService.findQuestionByQid(qid);
		modelAndView.addObject("question", question);



		List<Question> history_question = null;
		List<Question> question_recommended = new ArrayList<>();

		if (USER_SESSION != null) {
			// List<Question> question_recommended = new ArrayList<>();
			history_question = userService.findQuestionsBasedOnSurfhistory(USER_SESSION.getUser_id());
			Set<String> type_set = new HashSet<>();
			List<String> type_list = new ArrayList<>();
			List<QuestionType> questionType_lst = new ArrayList<>();
			List<Question> question_tmp = null;

			if (history_question.size() > 0) {
				for(Question q: history_question) {
					type_set.add(q.getType().trim());
					type_list.add(q.getType().trim());
				}
				double total = type_list.size();
				// QuestionType qt = new QuestionType();  err ArrayList
				for (String t: type_set) {
					QuestionType qt = new QuestionType();
					double counter = 0;
					for(String t2: type_list) {
						if (t.equalsIgnoreCase(t2)) {
							counter = counter + 1;
						}
					}
					// System.out.println("类型"+t + ": " + counter);
					qt.setType(t);
					qt.setNumber(counter);
					qt.setRatio(counter / total);
					questionType_lst.add(qt);
				}
				System.out.println("--------------------");
				for(QuestionType q: questionType_lst) {
					System.out.println(q);
					question_tmp = userService.findQuestionByTypeNRows(q.getType() , Math.round(q.getRatio()*15 ) );
					if (question_tmp != null && question_tmp.size() > 0) {
						for(Question e: question_tmp) {
							question_recommended.add(e);
							// System.out.println("#######");
							// System.out.println(e);

						}
					}
				}


			} // ~ 有浏览记录
		}


		List<Question> history_question2 = null;
		List<Question> question_recommended2 = new ArrayList<>();
		if (USER_SESSION != null) {
			history_question2 = userService.findQuestionsBasedOnSurfhistory(USER_SESSION.getUser_id());
			Set<String> type_set = new HashSet<>();
			List<String> type_list = new ArrayList<>();
			List<QuestionType> questionType_lst = new ArrayList<>();
			List<Question> question_tmp = null;
			// 考虑用户的兴趣
			// userService.find_user_detail_by_uid(USER_SESSION.getUser_id())
			// ~
			if (history_question2.size() > 0) {
				for(Question q: history_question2) {
					type_set.add(q.getType().trim());
					type_list.add(q.getType().trim());
				}
				double total = type_list.size();
				for (String t: type_set) {
					QuestionType qt = new QuestionType();
					double counter = 0;
					for(String t2: type_list) {
						if (t.equalsIgnoreCase(t2)) {
							counter = counter + 1;
						}
					}
					qt.setType(t);
					qt.setNumber(counter);
					qt.setRatio(counter / total);
					questionType_lst.add(qt);
				}

				// 分配
				for(QuestionType q: questionType_lst) {
					System.out.println(q);
					question_tmp = userService.findQuestionByTypeWithMostAnswers(q.getType() , Math.round( q.getRatio()*15 ) );
					if (question_tmp != null && question_tmp.size() > 0) {
						for(Question e: question_tmp) {
							question_recommended2.add(e);
						}
					}
				}
			} // ~ 有浏览记录
		}

		// for (Question q: question_recommended) {
		// 	System.out.println(q);
		// }


		modelAndView.addObject("question_recommended_lst", question_recommended);
		modelAndView.addObject("question_with_most_answers_lst", question_recommended2);
		// userService.findSurfHistory();

		modelAndView.setViewName("surf_question");
        return modelAndView;
	}


	@RequestMapping(value = "/save_answer")
	@ResponseBody
    public  Map<String,Object> save_answer(@RequestBody Answer answer, @RequestParam(value="qid") long qid) {
		SurfHistory sf = null;

		Map<String,Object> map = new HashMap<String,Object>();

		if (USER_SESSION == null) {
			System.out.println("没登录，不能回答问题");
			// return "loginForm"map;
			map.put("not_login_tips", "请先登录");
		}
		System.out.println("qid = " + qid);
		// 已登录
		if ( !answer.getAnswer().isEmpty() ) {
			answer.setUser_id(USER_SESSION.getUser_id());
			// 判断user_id 用户是否为该问题做过回答
			sf = userService.find_surf_data_by_qid_uid(qid, USER_SESSION.getUser_id());

			if ( sf == null) {  // 没做过回答, 因为 用户回答过该问题后，一定会有记录
				userService.insertAnswer(answer); // 保存答案
				System.out.println("以保存答案");

			} else { // 浏览过问题，不知道有没有回答问题
				if ( sf.isAnswered() == false ) {  // 没回答过该问题
					userService.insertAnswer(answer); // 保存答案
					// 回答数 ++
					userService.add_question_answer_number_one(qid);
					// 在浏览记录里 设置 answered 为 true
					userService.update_surfhistory_answered_set_true(qid, USER_SESSION.getUser_id());
					System.out.println("您已更新浏览记录, answered 置为 true");
					map.put("answer_saved", "答案已经保存");
				} else {
					System.out.println("您已经回答过问题了");
					map.put("answered_tips", "您已经回答过问题了");
				}
			}

		}else {
			map.put("answer_empty_tips", "问题不能为空");
		}

		// map.put("question_with_most_answers_lst", question_recommended);

		return map;
    }




	@RequestMapping("/search")
	public ModelAndView search(@RequestParam(required=false,defaultValue="question",value="question")String question,
						HttpServletRequest request ) {

		ModelAndView mv = new ModelAndView();
	    System.out.println(question);
		List<Question> q = userService.findQuestion();
		List<Question> result = new ArrayList<>();
		for(Question item: q) {
			double degree = CosineSimilarity.getSimilarity(item.getTitle(), question);
			System.out.println(degree);
			if( degree > 0.700000 ) {
				result.add(item);
			}
		}
		// System.out.println("question_number = " +result.size());
		System.out.println("总共计算了 " + q.size() +" 条数据的相似度");
		mv.addObject("question_lst", result);
		mv.setViewName("search_result_page");
		return mv;
	}


	/* 浏览答案 */
	@RequestMapping(value="/surf_answer")
	public ModelAndView surf_answer(HttpServletResponse response,
			@RequestParam(required=true,value = "qid")long qid) {

		ModelAndView modelAndView = new ModelAndView();
		// 查询问题qid的所有答案
		List<Answer> answer_lst = baseService.findAnswerByQid(qid);
		Question question = userService.findQuestionByQid(qid);
		// List<Question> history_question = null;
		// List<Question> question_recommended = new ArrayList<>();
		// userService.question_surf_counter_add_one(qid);
		modelAndView.addObject("question", question);
		modelAndView.addObject("answer_lst", answer_lst);




		modelAndView.setViewName("surf_answers");
        return modelAndView;
	}

	/* 浏览我给出的答案 */
	@RequestMapping(value="/surf_my_answer_only")
	public ModelAndView surf_my_answer_only(HttpServletResponse response,
			@RequestParam(required=true,value = "qid")long qid) {

		ModelAndView modelAndView = new ModelAndView();

		// 查询问题qid的所有答案
		List<Answer> answer_lst = baseService.findAnswerByQid(qid);

		List<Answer> my_answer = new ArrayList<>();
		for(Answer item: answer_lst) {
			if( item.getUser_id() == USER_SESSION.getUser_id() ) {
				my_answer.add(item);
			}
		}

		System.out.println("##################");
		for(Answer item: my_answer) {
			System.out.println(item.getUser_id());
		}



		Question question = userService.findQuestionByQid(qid);
		// userService.question_surf_counter_add_one(qid);
		modelAndView.addObject("question", question);
		modelAndView.addObject("answer_lst", my_answer);
		modelAndView.setViewName("surf_answers");
        return modelAndView;
	}



	/* 展示我的答案 */
	@RequestMapping("/my_answer")
	public String my_answer(@RequestParam(required=false,defaultValue = "1",value = "pageNum")Integer pageNum,
	                   Map<String,Object> map){
	    PageHelper.startPage(pageNum,10);
	    List<Answer> answer = userService.findAnswerByUid(USER_SESSION.getUser_id());
	    PageInfo<Answer> pageInfo = new PageInfo<>(answer,5);
	    map.put("pageInfo",pageInfo);

	    return "my_answer";
	}




	@RequestMapping("/index")
	public String findQuestions(@RequestParam(required=false,defaultValue = "1",value = "pageNum")Integer pageNum,
	                   Map<String,Object> map){
	    PageHelper.startPage(pageNum,10);
		PageInfo<Question> pageInfo = null;
	    List<Question> question = userService.findQuestionWithinTwoHours();
		List<Question> hotQuestion_lst = userService.findHotQuestions(15);

		if (question.size() > 0) {
			pageInfo = new PageInfo<>(question,5);
			map.put("pageInfo", pageInfo);
		}

		if (hotQuestion_lst.size() > 0) {
			map.put("hotQuestion_lst", hotQuestion_lst);
		}


	    return "index";
	}





	@RequestMapping("/question_all")
	public String question_all(@RequestParam(required=false,defaultValue = "1",value = "pageNum")Integer pageNum,
	                   Map<String,Object> map){
	    PageHelper.startPage(pageNum,10);
	    List<Question> question = userService.findQuestion();
	    PageInfo<Question> pageInfo = new PageInfo<>(question,5);
	    map.put("pageInfo",pageInfo);

	    return "question_all";
	}



	/* 点赞 */
	@RequestMapping("/click_like")
	public String click_like(@RequestParam(required=true, value="qid")long qid){
		// 登录后才允许点赞
		if( !USER_SESSION.getUser_id().isEmpty() ) {
			// 判断用户是否为该问题点过赞
			SurfHistory sh = userService.find_surf_data_by_qid_uid(qid, USER_SESSION.getUser_id());
			if (sh != null) { // 如果问题被浏览过了, 实际上肯定 有了 浏览记录

				if (sh.isThumbsup() == true) { // 如果问题被点赞过了
					;
				} else { // 如果问题没有被点赞
					// 如果问题是自己提出的，不允许自己去点赞
					if(userService.findQuestionByQid(qid).getUser_id() != USER_SESSION.getUser_id()) {
						// 点赞
						userService.update_surfhistory_thumbsup_set_true(qid, USER_SESSION.getUser_id());
						// 点赞数加一
						userService.question_like_counter_add_one(
								userService.findQuestionByQid(qid).like_number + 1L, qid);
					}

				}
			}
		} else { // 没有登录，点击“点赞”图标后，什么也不做
			;
		}

		return "surf_question";
	}



	@RequestMapping(value="/my_information")
	public ModelAndView my_information() {
		ModelAndView mv = new ModelAndView();
		UserDetail user_detail = userService.find_user_detail_by_uid(USER_SESSION.getUser_id());
		mv.addObject("user_detail", user_detail);
		mv.setViewName("my_information");

		return mv;
	}



	@RequestMapping(value = "/resetPassword", method=RequestMethod.GET)
	public ModelAndView resetPassword(HttpServletRequest request, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();

		String password = request.getParameter("pwd");
		String regex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}$";
		boolean password_reasonable = password.matches(regex);

		if(password_reasonable == false) {
			modelAndView.addObject("pws_err", "密码" + password + "不合要求");
			modelAndView.setViewName("reset_password_form");
			return modelAndView;
		} else {
			String to = (String)session.getAttribute("TO_EMAIL");
			modelAndView.addObject("pws_ok", "密码重置成功");
			// update
			userService.updateUserPassword(password, to);
			modelAndView.setViewName("reset_password_form");
			return modelAndView;
		}
	}
}
