<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>



<html>
<head>
    <title>重置密码</title>
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
        <form action="/resetPassword.mvc" >
            <div class="form-group">
                <br><br><br>
              <label for="pwd">新密码(密码必须包含大小写字母和数字的组合，
                  可以使用特殊字符，长度在8-16之间):</label>
              <input type="password" class="form-control" id="pwd" name="pwd"
                  placeholder="写入新密码">
            </div>

            <%-- <div class="form-group">
              <label for="email">输入绑定的邮箱地址:</label>
              <input type="email" class="form-control" name="email" id="email" placeholder="Enter email">
            </div> --%>


            <button id="btn_submit" type="submit" class="btn btn-primary">重置</button>
        </form>

        <c:if test="${ pws_err != null }" >
            <div class="alert alert-danger" role="alert">
                <p>${requestScope.pws_err }</p>
            </div>
        </c:if>

        <c:if test="${ pws_ok != null }" >
            <div class="alert alert-success" role="alert">
                <p>${requestScope.pws_ok }</p>
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

<%-- <script type="text/javascript">
    $(function(){
        $('#btn_submit').click(function(){
            var to = <%=to%>;
            /* var pwd = $('#pwd').val(); */
            alert("to: " + to);

            // $.get("/resetPassword.mvc", function(data){
            //     ;
            // });


        })
    });

</script> --%>


</body>
</html>
