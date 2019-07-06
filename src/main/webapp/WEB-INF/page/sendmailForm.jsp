<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>


<html>
<head>
    <title>找回密码</title>
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

        <%-- <div class="form row">
            <div class="form-horizontal col-md-offset-3" id="login_form">
                <h3 class="form-title">找回密码</h3>
                <div class="col-md-9">
                    <div class="form-group">
                        <input class="form-control required" type="email" placeholder="邮箱" id="email" name="emial" autofocus="autofocus"/>
                    </div>
                    <div class="form-inline form-group col-md-offset-9">
                        <button type="submit" class="btn btn-primary pull-right" formtarget="/retrievePassword.mvc">找回密码</button>&nbsp;&nbsp;&nbsp;
                    </div>
                </div>
            </div>
        </div> --%>

        <form action="/retrievePassword.mvc">
            <div class="form-group">
              <label for="email">输入绑定的邮箱地址:</label>
              <input type="email" class="form-control" name="email" id="email" placeholder="Enter email">
            </div>
            <%-- <div class="form-group">
              <label for="pwd">Password:</label>
              <input type="password" class="form-control" id="pwd" placeholder="Enter password">
            </div>
            <div class="form-check">
              <label class="form-check-label">
                <input class="form-check-input" type="checkbox"> Remember me
              </label>
            </div> --%>
            <button type="submit" class="btn btn-primary">找回</button>
          </form>

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
