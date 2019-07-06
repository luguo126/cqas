<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>
<%@ page import="com.github.luguo126.cqas.domain.User" %>
<%
    User me = (User)request.getSession().getAttribute("USER_SESSION");
    String uid = null;
    if(me != null) {
        uid = me.getUser_id();
    }

%>

<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <title>浏览问题</title>

    <link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="/editormd/css/editormd.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="/highlight/styles/atom-one-light.css">
    <link href="https://cdn.bootcss.com/font-awesome/5.8.2/css/all.css" rel="stylesheet">
  </head>


  <body>
      <%@ include file="/WEB-INF/page/header.jsp"%>
      <br>


      <div class="container border-bottom">
          <h4>浏览问题</h4>

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

              <div class="container">
                  <br>
                  <a href="/surf_answer.mvc?qid=${question.question_id}">
                      <button id="question_like" class="btn btn-block btn-primary">浏览该问题的答案</button>
                  </a>

              </div>


              <br><br><br><br>

              <div  class="container">
                  <p class="h4">你的回答</p>
                  <div class="editormd" id="test-editormd">
                      <textarea class="editormd-markdown-textarea" name="test-editormd-markdown-doc" id="editormd"></textarea>
                      <!-- 第二个隐藏文本域，用来构造生成的HTML代码，方便表单POST提交，这里的name可以任意取，后台接受时以这个name键为准 -->
                      <!-- html textarea 需要开启配置项 saveHTMLToTextarea == true -->
                      <textarea class="editormd-html-textarea" name="editorhtml" id="editorhtml"></textarea>
                  </div>
                  <button id="answer_submit">提交答案</button>
              </div>

          </div>

          <div class="col-md-4" >
            <h2>您可能感兴趣的问题</h2>
            <table class="table table-hover table-sm">
                <c:forEach items="${question_recommended_lst}" var="question_recommended">
                    <tr>
                      <td>${question_recommended.question_id}</td>
                      <td>${question_recommended.surf_number}</td>
                      <td>
                          <a id="surf_question"
                              href="/surf_question.mvc?qid=${question_recommended.question_id}">
                              ${question_recommended.title}
                          </a>
                      </td>
                    </tr>
                </c:forEach>
            </table>
            <hr>
            <hr>

            <h2>您可能有意回答问题</h2>
            <table class="table table-hover table-sm">
                <c:forEach items="${question_with_most_answers_lst}" var="question_recommended">
                    <tr>
                      <td>${question_recommended.question_id}</td>
                      <td>${question_recommended.answer_number}</td>
                      <td>
                          <a id="surf_question"
                              href="/surf_question.mvc?qid=${question_recommended.question_id}">
                              ${question_recommended.title}
                          </a>
                      </td>
                    </tr>
                </c:forEach>
            </table>


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


      <script type="text/javascript">
        var testEditor;

        testEditor=$(function() {
            editormd("test-editormd", {
                 width   : "100%",
                 height  : 800,
                 // markdown : md,
                 codeFold : true,
                 syncScrolling : "single",
                 //你的lib目录的路径
                 path    : "<%=request.getContextPath()%>/editormd/lib/",
                 imageUpload: false,
                 /*theme: "dark",//工具栏主题
                 previewTheme: "dark",//预览主题
                 editorTheme: "pastel-on-dark",//编辑主题 */
                 emoji: true,
                 taskList: true,
                 tocm: true,         // Using [TOCM]
                 tex: true,                   // 开启科学公式TeX语言支持，默认关闭
                 flowChart: true,             // 开启流程图支持，默认关闭
                 sequenceDiagram: true,       // 开启时序/序列图支持，默认关闭,
                //这个配置在simple.html中并没有，但是为了能够提交表单，使用这个配置可以让构造出来的HTML代码直接在第二个隐藏的textarea域中，方便post提交表单。
                 saveHTMLToTextarea : true
            });

        });
      </script>

      <%-- 保存答案 --%>
      <script type="text/javascript">
          $(function(){
              $('#answer_submit').click(function(){
                  var html = $("#editorhtml").val();
                  var uid = "<%=uid%>";
                  if (uid == "null") {
                      alert("用户还没有登录,请先登录!")
                      return;
                  }
                  if (html == null || html == "") {
                      alert("保存失败: 回答不能为空");
                      return;
                  }

                  $.ajax({
                      url: "/save_answer.mvc?qid="+${question.question_id},
                      type: "POST",
                      data: JSON.stringify({answer:html, question_id:${question.question_id}}),
                      dataType: "json",
                      contentType: "application/json;charset=UTF-8",
                      success: function(data) {
                          var answered_tips = data.answered_tips;
                          var answer_saved = data.answer_saved;
                          if (answered_tips != "" || answered_tips != null) {
                              alert(data.answered_tips);
                          }
                          if (answer_saved != "" || answer_saved != null) {
                              alert(data.answer_saved);
                          }
                      },
                      error: function(data) {
                          alert("提交失败");
                      }
                  });

              })
          });
      </script>


      <%-- 保存答案 --%>
      <script type="text/javascript">
          $(function(){
              $('#answer_submit2222').click(function(){
                  var html = $("#editorhtml").val();
                  var uid = "<%=uid%>";
                  if (uid == "null") {
                      alert("用户还没有登录,请先登录!")
                      return;
                  }
                  if (html == null || html == "") {
                      alert("保存失败: 回答不能为空");
                      return;
                  }

                  $.ajax({
                      url: "/checkName.mvc?name=guolu",
                      type: "POST",
                      data: JSON.stringify({answer:html, question_id:${question.question_id}}),
                      dataType: "json",
                      contentType: "application/json;charset=UTF-8",
                      success: function(data) {
                          alert('sdsd');
                          alert(data.ds);
                      },
                      error: function(data) {

                          alert("err: " + data.info.answered_tips);
                          // alert("答案已经保存");
                      }
                  });

              })
          });
      </script>


      <%-- 刷新点赞 --%>
      <script type="text/javascript">
          $(function(){
              $('#question_like').click(function(){
                  $.get("/click_like.mvc?qid=${question.question_id}", function(data){
                      var like_number = $('#like_number').text();
                      $('#like_number').html(Number(like_number) + 1);
                  });


              })
          });

      </script>

</body>


</html>
