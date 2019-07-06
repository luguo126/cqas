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
        <h3>管理员注册</h3>

        <mvc:form modelAttribute="admin" action="/admin_register.mvc">
            <table>
                <tr>
                    <td><mvc:label path="admin_id">id</mvc:label></td>
                    <td><mvc:input path="admin_id" cssErrorClass="formFieldError" /></td>
                    <td><mvc:errors path="admin_id" /></td>
                </tr>
                <tr>
                    <td><mvc:label path="name">姓名</mvc:label></td>
                    <td><mvc:input path="name" cssErrorClass="formFieldError" /></td>
                    <td><mvc:errors path="name" /></td>
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

        <c:if test="${ isEmpty == true }" >
            <div class="alert alert-danger" role="alert">
                <p>${requestScope.isEmpty}</p>
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
