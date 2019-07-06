<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>


<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <%-- <link rel="icon" href="/favicon.ico"> --%>

    <title>问题管理</title>

    <!-- Bootstrap core CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
  </head>

<body>
    <%@ include file="/WEB-INF/page/admin_board_left.jsp"%>


    <!--通过bootstrap的栅格系统布局-->
    <div class="container">
        <!--标题-->
        <div class="row">
            <div class="col-md-12">
                <h2>问题管理</h2>
                <button onclick="update_question()" class="btn btn-primary">
                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                    插入
                </button>
            </div>
        </div>


        <!--显示表格数据-->
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover">
                    <tr>
                        <th>#</th>
                        <th>id</th>
                        <th>问题</th>
                        <%-- <th>提问者</th> --%>
                        <th>提问时间</th>
                        <th>操作</th>
                    </tr>


                    <c:forEach items="${pageInfo.list}" var="question">
                        <tr>
                            <th></th>
                            <th>${question.question_id}</th>
                            <th>
                                <a id="surf_question"
                                    href="/surf_question.mvc?qid=${question.question_id}">
                                    ${question.title}
                                </a>
                            </th>
                            <th>${question.ask_date}</th>
                            <th>
                                <a href="/update_question_page.mvc?qid=${question.question_id}">
                                <button onclick="update_question(${question.question_id})" class="btn btn-primary" >
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    更新
                                </button>
                                </a>
                                <button  onclick="delete_question(${question.question_id})" class="btn btn-danger" >
                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                    <%-- <a id="delete_q" href="/delete_question_by_qid.mvc?qid=${question.question_id}">删除</a> --%>
                                    删除
                                </button>
                            </th>
                        </tr>
                    </c:forEach>

                </table>
                <%-- <h2>问题标题：${question.title}</h2> --%>
            </div>
        </div>



        <!--显示分页信息-->
<div class="row">
  <!--文字信息-->
  <div class="col-md-6">
      当前第 ${pageInfo.pageNum} 页.总共 ${pageInfo.pages} 页.一共 ${pageInfo.total} 条记录
  </div>

  <!--点击分页-->
  <div class="col-md-6">
      <nav aria-label="Page navigation">
          <ul class="pagination" >
              <!--首页-->
              <li><a href="${pageContext.request.contextPath}/admin_findAllQuestions.mvc?pageNum=1">首页</a></li>
              &nbsp;&nbsp;
              <!--上一页-->
              <li>
                  <c:if test="${pageInfo.hasPreviousPage}">
                      <a href="${pageContext.request.contextPath}/admin_findAllQuestions.mvc?pageNum=${pageInfo.pageNum-1}" aria-label="Previous">
                          <span aria-hidden="true">«</span>
                      </a>
                  </c:if>
              </li>
              &nbsp;&nbsp;
              <!--循环遍历连续显示的页面，若是当前页就高亮显示，并且没有链接-->
              <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
                  <c:if test="${page_num == pageInfo.pageNum}">
                      <li class="active"><a href="#">${page_num}&nbsp;&nbsp;</a></li>
                  </c:if>
                  <c:if test="${page_num != pageInfo.pageNum}">
                      <li><a href="${pageContext.request.contextPath}/admin_findAllQuestions.mvc?pageNum=${page_num}">${page_num}</a></li>
                      &nbsp;&nbsp;
                  </c:if>
              </c:forEach>

              <!--下一页-->
              <li>
                  <c:if test="${pageInfo.hasNextPage}">
                      <a href="${pageContext.request.contextPath}/admin_findAllQuestions.mvc?pageNum=${pageInfo.pageNum+1}"
                         aria-label="Next">
                          <span aria-hidden="true">»</span>
                      </a>
                  </c:if>
              </li>
              &nbsp;&nbsp;

              <li><a href="${pageContext.request.contextPath}/admin_findAllQuestions.mvc?pageNum=${pageInfo.pages}">尾页</a></li>
          </ul>
      </nav>
  </div>

</div>

    </div>


    <%-- <canvas class="my-4" id="myChart" width="900" height="380"></canvas> --%>

    <%-- <h2>Section title</h2>
    <div class="table-responsive">
        table
    </div> --%>


    <script src="/js/jquery-3.3.1.min.js"></script>
    <script src="/js/bootstrap.bundle.min.js" ></script>

    <script type="text/javascript">
        function delete_question(qid) {
            var url = "/delete_question_by_qid.mvc?qid=" + qid;
            $.ajax({
                url: url,
                type: "GET",
                success: function(data) {
                    alert('删除成功');
                    window.location.reload();
                },
                error: function(data) {
                    alert('error');
                }
            });
        }
    </script>


    <%-- <script type="text/javascript">
        function update_question(qid) {
            var url = "/update_question.mvc?qid=" + qid;
            $.ajax({
                url: url,
                type: "GET",
                success: function(data) {
                    alert('删除成功');
                    window.location.reload();
                },
                error: function(data) {
                    alert('error');
                }
            });
        }
    </script> --%>

<%-- <script type="text/javascript">
    var question = $('#delete_q'); 无法获取 forEach中的所有元素
    alert(question.size());
</script> --%>

  </body>
</html>
