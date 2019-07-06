<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>
<%@ page import="com.github.luguo126.cqas.domain.User" %>


<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <title>答案</title>

    <link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <%-- <link href="/editormd/css/editormd.min.css" rel="stylesheet" type="text/css"> --%>
    <link rel="stylesheet" href="/highlight/styles/atom-one-light.css">
    <%-- <link href="https://cdn.bootcss.com/font-awesome/5.8.2/css/all.css" rel="stylesheet"> --%>
  </head>


  <body>
      <%@ include file="/WEB-INF/page/header.jsp"%>
      <br>

      <div class="container border-bottom">
          <h4>答案</h4>
          <br>
      </div>


      <div  class="main container body-content mycontent">
          <div class="row">
              <div class="col-md-8" >
                  <%-- style="border-right:1px solid grey" --%>
                  <div class="container border-bottom">
                      <p>
                         问题: <a href="/surf_question.mvc?qid=${question.question_id}">${question.title}</a>
                      </p>
                  </div>

                  <c:if test="${ answer_lst != null }">
                      <!--显示表格数据-->
                    <div class="container border-bottom">
                        <h4>上述问题的回答: </h4> <br><br>
                        <c:forEach items="${answer_lst}" var="answer">
                            <div class="container ">
                                ${answer.answer}
                                <br><br>
                            </div>

                            <div class="container border-bottom">
                                回答日期: &nbsp; ${answer.answer_date} <br>
                                <%-- 点赞数: <em id="like_number">${answer.like_number}</em> --%>
                                <%-- <a href="/show_comment.mvc?qid=${answer.comment_id}">
                                    <button type="button" name="button">展示评论</button>
                                </a> --%>
                                作答者: &nbsp; ${answer.user_id} <br><br><br><br>
                            </div>

                            <%-- <hr class="simple" color="#6f5499" /> --%>
                        </c:forEach>
                    </div>
                  </c:if>



              </div>

              <div class="col-md-4" >
                <h1>相似问题推荐列表</h1>
                <p class="lead">Use this document as a way to quickly start any new project.
                    <br> All you get is this text and a mostly barebones HTML document.</p>
              </div>
          </div>

      <div class="container border-bottom">
          <br><br><br><br>
      </div>

      <script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
      <%-- <script type="text/javascript" src="/editormd/editormd.min.js"></script> --%>
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
