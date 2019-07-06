package com.github.luguo126.cqas.interceptor;


import com.github.luguo126.cqas.domain.Admin;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import  com.github.luguo126.cqas.domain.User;

/**
 * 登录拦截器
 */
public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse
									response, Object handler) throws Exception {

		HttpSession session = request.getSession();
		Admin admin = (Admin) session.getAttribute("ADMIN_SESSION");
		User user = (User) session.getAttribute("USER_SESSION");


		// URL:除了登录请求外，其他的URL都进行拦截控制
		if (request.getRequestURL().indexOf("/index.mvc") >= 0) {
			return true;
		}
		if (request.getRequestURL().indexOf("/index2.mvc") >= 0) {
			return true;
		}
		if (request.getRequestURL().indexOf("/question_all.mvc") >= 0) {
			return true;
		}

		if (request.getRequestURL().indexOf("/surf_answer.mvc") >= 0) {
			return true;
		}

		if (request.getRequestURL().indexOf("/checkName.mvc") >= 0) {
			return true;
		}


		if(admin != null) {   /* 如果管理员登录了，就不拦截这些URL */
			if (request.getRequestURL().indexOf("/admin_logout.mvc") >= 0) {
				return true;
			}

			if (request.getRequestURL().indexOf("/delete_user_by_uid.mvc") >= 0) {
				return true;
			}

			if (request.getRequestURL().indexOf("/update_user.mvc") >= 0) {
				return true;
			}

			if (request.getRequestURL().indexOf("/add_user.mvc") >= 0) {
				return true;
			}

			if (request.getRequestURL().indexOf("/admin_board.mvc") >= 0) {
				return true;
			}

			if (request.getRequestURL().indexOf("/admin_findAllQuestions.mvc") >= 0) {
				return true;
			}
			if (request.getRequestURL().indexOf("/delete_question_by_qid.mvc") >= 0) {
				return true;
			}

			if (request.getRequestURL().indexOf("/update_question_page.mvc") >= 0) {
				return true;
			}
			if (request.getRequestURL().indexOf("/update_question.mvc") >= 0) {
				return true;
			}

			if (request.getRequestURL().indexOf("/ask_question.mvc") >= 0) {
				return true;
			}

			if (request.getRequestURL().indexOf("/admin_findAllUsers.mvc") >= 0) {
				return true;
			}

		} else { // admin == null   如果管理员没有登陆了，不拦截这些URL
			if (request.getRequestURL().indexOf("/admin_register.mvc") >= 0) {
				return true;
			}
			if (request.getRequestURL().indexOf("/admin_registerForm.mvc") >= 0) {
				return true;
			}
			if (request.getRequestURL().indexOf("/admin_login.mvc") >= 0) {
				return true;
			}
			if (request.getRequestURL().indexOf("/admin_loginForm.mvc") >= 0) {
				return true;
			}

		}


		if (user != null) {
			return true;    // 如果已登录,放行
		} else {
			// 如果没有登录, 跳转到登录页面
			// request.getRequestDispatcher(
			// 		"loginForm.mvc").forward(request, response);
			if (request.getRequestURL().indexOf("/loginForm.mvc") >= 0) {
				return true;
			}
			if (request.getRequestURL().indexOf("/registerForm.mvc") >= 0) {
				return true;
			}
			if (request.getRequestURL().indexOf("/login.mvc") >= 0) {
				return true;
			}


			if (request.getRequestURL().indexOf("/register.mvc") >= 0) {
				return true;
			}
			if (request.getRequestURL().indexOf("/surf_question.mvc") >= 0) {
				return true;
			}
			if (request.getRequestURL().indexOf("/sendMail.mvc") >= 0) {
				return true;
			}
			if (request.getRequestURL().indexOf("/sendmailForm.mvc") >= 0) {
				return true;
			}
			if (request.getRequestURL().indexOf("/retrievePassword.mvc") >= 0) {
				return true;
			}
			if (request.getRequestURL().indexOf("/sendHtmlMail.mvc") >= 0) {
				return true;
			}

			if (request.getRequestURL().indexOf("/resetPasswordForm.mvc") >= 0) {
				return true;
			}

			if (request.getRequestURL().indexOf("/resetPassword.mvc") >= 0) {
				return true;
			}
			if (request.getRequestURL().indexOf("/search.mvc") >= 0) {
				return true;
			}


			request.getRequestDispatcher(
					"/loginForm.mvc").forward(request, response);
		}


		return false;
	}





	@Override
	public void postHandle(HttpServletRequest request,
					HttpServletResponse response, Object handler,
					ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}
}
