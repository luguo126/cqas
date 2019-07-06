<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<html>
<head>
    <meta charset="utf-8">
    <title>Spring MVC Form Validation</title>
    <style type="text/css">
        .formFieldError { background-color: #FFC; }
    </style>

    <!-- Bootstrap core CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <style>
      html, body, .mycontent {
          height: 100%;
      }

      .main-footer {
          background: #202020;
          padding: 35px 0 0;
          color: #959595;
      }
    </style>
</head>


<body>
<%@ include file="/WEB-INF/page/header.jsp"%>


<div class="mycontent">
    <div class="container">
        <h2>管理员登录</h2>
        <mvc:form modelAttribute="admin" action="/admin_login.mvc">
        	<table>
        	    <tr>
        	        <td><mvc:label path="admin_id">用户id</mvc:label></td>
        	        <td><mvc:input path="admin_id" cssErrorClass="formFieldError" /></td>
        	        <td><mvc:errors path="admin_id" /></td>
        	    </tr>
        	    <tr>
        	        <td><mvc:label path="password">密码</mvc:label></td>
        	        <td><mvc:password path="password" cssErrorClass="formFieldError" /></td>
           	        <td><mvc:errors path="password" /></td>
        	    </tr>
                <tr>
        	        <td colspan="3">
                        <input type="submit" value="登录" />
                        <a href="/admin_registerForm.mvc">还没注册?</a>
                        <%-- <a href="/sendmailForm.mvc">忘记密码?</a> --%>
        	        </td>
        	    </tr>
        	</table>
        </mvc:form>

        <c:if test="${ no_user_msg != null }" >

            <div class="alert alert-danger" role="alert">
                <p>${requestScope.no_user_msg}</p>
            </div>
        </c:if>

        <c:if test="${ password_err_msg != null }" >

            <div class="alert alert-danger" role="alert">
                <p>${requestScope.password_err_msg}</p>
            </div>
        </c:if>
    </div>
</div>


<%@ include file="/WEB-INF/page/footer.jsp"%>

<script src="/js/jquery-3.3.1.slim.min.js"></script>
<script src="/js/bootstrap.bundle.min.js" ></script>
<script>
    $("#rgister-login-e").hide()
</script>
</body>
</html>
