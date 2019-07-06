<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="com.github.luguo126.cqas.domain.Question" %>


<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <title>提问</title>
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

    <link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="/editormd/css/editormd.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="/css/bootstrap-select.min.css">
    <script type="text/javascript" src="/js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="/editormd/editormd.min.js"></script>
    <script type="text/javascript"src="/js/bootstrap-select.min.js"></script>
    <script type="text/javascript"src="/js/defaults-zh_CN.min.js"></script>
    <style>
      .bootstrap-select > .dropdown-toggle {
           width: auto;
      }
    </style>
  </head>


  <body>
    <%@ include file="/WEB-INF/page/header.jsp"%>

    <div class="container">
        <h2>更新问题<h2> <br>

    </div>

    <div class="container">
        <div  class="container border-bottom">
            <p>1. 给你的问题打标签(如果你不确定，请选 <em>others</em>  )</p>
            <%@ include file="/WEB-INF/page/tags_for_selection.jsp"%>
        </div>
        <br>
        <div  class="container border-bottom">
            <p>2. 用一句话概括你的问题</p>
            <div class="input-group mb-3">
              <div class="input-group-prepend">
                <span class="input-group-text">?</span>
              </div>
              <input id="title" type="text" class="form-control" aria-label="Amount (to the nearest dollar)">
            </div>
        </div>
        <br>

        <div  class="container">
            <p>3. 问题的具体描述</p>
            <div class="editormd" id="test-editormd">
                <textarea class="editormd-markdown-textarea" name="test-editormd-markdown-doc" id="editormd">
                    ${question.content_md}
                </textarea>
                <!-- 第二个隐藏文本域，用来构造生成的HTML代码，方便表单POST提交，这里的name可以任意取，后台接受时以这个name键为准 -->
                <!-- html textarea 需要开启配置项 saveHTMLToTextarea == true -->
                <textarea class="editormd-html-textarea" name="editorhtml" id="editorhtml"></textarea>
            </div>
        </div>

        <div class="container">
            <button id="submit">更改问题</button>
            <br><br>
        </div>
    </div>

    <%@ include file="/WEB-INF/page/footer.jsp"%>

    <script src="/js/bootstrap.bundle.min.js" ></script>

    <script type="text/javascript">
        $(document).ready(function(){
            var title = '${question.title}';
            $('#title').val(title);
        });
    </script>


    <script type="text/javascript">
        $(function(){
            $('#submit').click(function(){
                var html = $("#editorhtml").val();
                var md = $("#editormd").val();
                var title = $("#title").val();
                var tag='';

                $("#tags_for_selection option:selected").each(function(){
                    tag = $(this).val() + ',' + tag;
                });
                tag = tag.slice(0,-1);

                if (tag == null || tag == "") {
                    alert('提交失败: 没有选择问题类型');
                    return;
                }else if(title==null || title == "") {
                    alert('提交失败: 没有填写问题的标题');
                    return;
                } else if(html == "" || html == ""){
                    alert('提交失败: 没有填写问题的内容');
                    return;
                } else if(md==null || md=="") {
                    alert('提交失败');
                    return;
                }

                $.ajax({
                    url: "/update_question.mvc",
                    type: "POST",
                    data: JSON.stringify(
                        {
                            question_id: ${question.question_id},
                            content: html,
                            content_md: md,
                            type: tag,
                            title: title
                        }
                    ),
                    dataType: "json",
                    contentType: "application/json;charset=UTF-8",
                    success: function(data) {
                        alert(data);
                    },
                    error: function(data) {
                        alert("更改成功");
                    }
                });
            })
        });

    </script>


    <script type="text/javascript">
      var testEditor;

      testEditor=$(function() {
          editormd("test-editormd", {
               width   : "100%",
               height  : 666,
               codeFold : true,
               syncScrolling : "single",
               path    : "<%=request.getContextPath()%>/editormd/lib/",
               imageUpload: false,
               emoji: false,
               taskList: true,
               tocm: true,
               tex: true,
               flowChart: false,
               sequenceDiagram: false,
              //这个配置在simple.html中并没有，但是为了能够提交表单，使用这个配置可以让构造出来的HTML代码直接在第二个隐藏的textarea域中，方便post提交表单。
               saveHTMLToTextarea : true
          });

      });
    </script>
</body>


</html>
