<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">

    <title></title>
    <link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <style>
      html, body, .mycontent {
  		  height: 100%;
  	  }
    </style>

  </head>


  <body>

    <%@ include file="/WEB-INF/page/header.jsp"%>


    <div  class="main container body-content mycontent">
    <div class="row">
        <div class="col-md-4" >
          <h1>Bootstrap starter template</h1>
          <p class="lead">Use this document as a way to quickly start any new project.
              <br> All you get is this text and a mostly barebones HTML document.</p>
        </div>


        <div class="col-md-8" style="border-left:1px solid grey">

          <div class="row">
              <h3>最新问题</h3>
              <!-- <button href="/ask_question.mvc" type="button" class="btn btn-success">提问</button> -->
              <a href="/ask_question.mvc" role="button" class="btn btn-success">提问</a>

          </div>

          <h1>Bootstrap starter template</h1>
          <p class="lead">Use this document as a way to quickly start any new project.
              <br> All you get is this text and a mostly barebones HTML document.
          </p>
        </div>
    </div>

    </div>

    <%@ include file="/WEB-INF/page/footer.jsp"%>

    <script src="/js/jquery-3.3.1.slim.min.js"></script>
    <script src="/js/bootstrap.bundle.min.js" ></script>
    <%-- <script>
        $("#rgister-login-e").hide()
    </script> --%>
</body>


</html>
