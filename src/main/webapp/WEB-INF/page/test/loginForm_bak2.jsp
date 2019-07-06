<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>login</title>

    <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/css/style.css">



</head>
<body>
    <div class="container">
        <div class="form row">
            <div class="form-horizontal col-md-offset-3" id="login_form">
                <h3 class="form-title">登录</h3>

                <div class="col-md-9">

                    <div class="form-group">
                        <i class="fa fa-user fa-lg"></i>
                        <input class="form-control required" type="text" placeholder="Username" id="username" name="username" autofocus="autofocus" maxlength="20"/>
                    </div>
                    <div class="form-group">
                            <i class="fa fa-lock fa-lg"></i>
                            <input class="form-control required" type="password" placeholder="Password" id="password" name="password" maxlength="8"/>
                    </div>
                    <div class="form-group ">
                        <label class="checkbox">
                            <input type="checkbox" name="remember" value="1"/>记住我
                        </label>
                        <a href="#">忘记密码</a>
                    </div>
                    <div class="form-inline form-group col-md-offset-9">
                        <button type="submit" class="btn btn-primary pull-right" formtarget="/registerForm.mvc">注册</button>&nbsp;&nbsp;&nbsp;
                        <button type="submit" class="btn btn-success pull-right" name="submit">登录</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%-- <div class="container">
        <h2>User Login Form</h2>
        <mvc:form modelAttribute="user" action="login.mvc">
            <table>
                <tr>
                    <td><mvc:label path="user_id">User ID</mvc:label></td>
                    <td><mvc:input path="user_id" cssErrorClass="formFieldError" /></td>
                    <td><mvc:errors path="user_id" /></td>
                </tr>
                <tr>
                    <td><mvc:label path="password">Password</mvc:label></td>
                    <td><mvc:password path="password" cssErrorClass="formFieldError" /></td>
                    <td><mvc:errors path="password" /></td>
                </tr>
                <tr>
                    <td colspan="3">
                        <input type="submit" value="登录" />

                    </td>
                </tr>
            </table>
        </mvc:form>
    </div> --%>
</body>
</html>
