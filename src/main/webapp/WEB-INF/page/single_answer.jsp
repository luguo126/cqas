<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>
<%@ page import="com.github.luguo126.cqas.domain.User" %>
<%-- <%
    User me = (User)request.getSession().getAttribute("USER_SESSION");
    String uid = null;
    if(me != null) {
        uid = me.getUser_id();
    }

%> --%>

<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <title>我给出的答案</title>

    <link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="/editormd/css/editormd.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="/highlight/styles/atom-one-light.css">
    <link href="https://cdn.bootcss.com/font-awesome/5.8.2/css/all.css" rel="stylesheet">
  </head>


  <body>
      <%@ include file="/WEB-INF/page/header.jsp"%>
      <br>

      <div class="container border-bottom">
          <h4>我给出的答案</h4>

      </div>


      <div  class="main container body-content mycontent">
      <div class="row">
          <div class="col-md-8" style="border-right:1px solid grey">

              <div class="container border-bottom">
                  <p id="mm">问题</p>
                  ${question.title}
              </div>

              <div class="container border-bottom">
                  <p>问题描述</p>
                  ${question.content}
              </div>

              <div class="container">
                  <br>
                  <button id="question_like" class="btn btn-block btn-primary" ><i class="fa fa-thumbs-up"></i>Like</button>
                  浏览数: ${question.surf_number}
                  <br>
                  点赞数: <em id="like_number">${question.like_number}</em>
              </div>

          </div>

          <div class="col-md-4" >
            <h1>相似问题推荐列表</h1>
            <p class="lead">Use this document as a way to quickly start any new project.
                <br> All you get is this text and a mostly barebones HTML document.</p>
          </div>

      </div>
      </div>

      <div class="container border-bottom">
          <br><br><br><br>
      </div>

      <script type="text/javascript" src="/js/jquery-1.12.4.js"></script>
      <script type="text/javascript" src="/editormd/editormd.min.js"></script>
      <script src="/highlight/highlight.pack.js"></script>
      <script>hljs.initHighlightingOnLoad();</script>

      <%-- <script src="/js/jquery-3.3.1.slim.min.js"></script>
      <script src="/js/bootstrap.bundle.min.js" ></script> --%>


      <%-- 刷新点赞 --%>
      <%-- <script type="text/javascript">
          $(function(){
              $('#question_like').click(function(){
                  $.get("/click_like.mvc?qid=${question.question_id}", function(data){
                      var like_number = $('#like_number').text();
                      $('#like_number').html(Number(like_number) + 1);
                  });


              })
          });
      </script> --%>

</body>


</html>
