<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>


<html>
<head>
    <title>Spring MVC Form Validation</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <style>
      html, body, .mycontent {
          height: 100%;
      }
    </style>
    <style type="text/css">
        .formFieldError { background-color: #FFC; }
    </style>
</head>
<body>

<%@ include file="/WEB-INF/page/header.jsp"%>


<div class="mycontent">
    <div class="container">
        <h3>用户注册</h3>
        <%-- 通过使用请求映射 /result, 将表单提交给一个方法处理 --%>
        <mvc:form modelAttribute="user" action="register.mvc">
            <table>
                <tr>
                    <td><mvc:label path="user_id">用户id</mvc:label></td>
                    <!-- cssErrorClass 设置了出错信息的样式 -->
                    <td><mvc:input path="user_id" cssErrorClass="formFieldError" /></td>
                    <!-- errors标签的每一个path属性可以设为模型类的属性名
                        path特性可以不设置,但是无法看到相关字段的出错信息 -->
                    <td><mvc:errors path="user_id" /></td>
                </tr>

                <tr>
                    <td><mvc:label path="password">密码</mvc:label></td>
                    <td><mvc:password path="password" cssErrorClass="formFieldError" /></td>
                    <td><mvc:errors path="password" /></td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="注册" />
                    </td>
                </tr>
            </table>
        </mvc:form>

        <c:if test="${ register_success != null }" >

            <div class="alert alert-success" role="alert">
                <p>${requestScope.register_success}</p>
            </div>
        </c:if>

        <c:if test="${ uid_exist != null }" >

            <div class="alert alert-danger" role="alert">
                <p>${requestScope.uid_exist}</p>
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
