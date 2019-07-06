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

    <title>我的回答</title>

    <!-- Bootstrap core CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
  </head>

<body>
    <%@ include file="/WEB-INF/page/settings_left.jsp"%>


    <!--通过bootstrap的栅格系统布局-->
    <div class="container">
        <!--标题-->
        <div class="row">
            <div class="col-md-12">
                <h2>我的回答</h2>
            </div>
        </div>


        <!--显示表格数据-->
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover">
                    <tr>
                        <%-- <th>#</th> --%>
                        <%-- <th>id</th> --%>
                        <th>问题id</th>
                        <%-- <th>提问者</th> --%>
                        <th>提问时间</th>
                        <th>操作</th>
                    </tr>


                    <c:forEach items="${pageInfo.list}" var="answer">
                        <tr>
                            <%-- <th></th> --%>
                            <%-- <th>${answer.question_id}</th> --%>
                            <th>
                                <a id="surf_question"
                                    href="/surf_answer.mvc?qid=${answer.question_id}">
                                    ${answer.question_id}
                                </a>
                            </th>
                            <th>${answer.answer_date}</th>
                            <th>
                                <%-- <button class="btn btn-primary">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    编辑
                                </button> --%>

                                <button class="btn btn-danger">
                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                    删除
                                </button>

                            </th>
                        </tr>
                    </c:forEach>

                </table>
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
          <ul class="pagination">
              <!--首页-->
              <li><a href="${pageContext.request.contextPath}/my_answer.mvc?pageNum=1">首页</a></li>
              &nbsp;&nbsp;
              <!--上一页-->
              <li>
                  <c:if test="${pageInfo.hasPreviousPage}">
                      <a href="${pageContext.request.contextPath}/my_answer.mvc?pageNum=${pageInfo.pageNum-1}" aria-label="Previous">
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
                      <li><a href="${pageContext.request.contextPath}/my_answer.mvc?pageNum=${page_num}">${page_num}</a></li>
                      &nbsp;&nbsp;
                  </c:if>
              </c:forEach>

              <!--下一页-->
              <li>
                  <c:if test="${pageInfo.hasNextPage}">
                      <a href="${pageContext.request.contextPath}/my_answer.mvc?pageNum=${pageInfo.pageNum+1}"
                         aria-label="Next">
                          <span aria-hidden="true">»</span>
                      </a>
                  </c:if>
              </li>
              &nbsp;&nbsp;

              <li><a href="${pageContext.request.contextPath}/my_answer.mvc?pageNum=${pageInfo.pages}">尾页</a></li>
          </ul>
      </nav>
  </div>

</div>

    </div>



    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script type="text/javascript" src="/js/jquery-1.12.4.js"></script>
    <script>window.jQuery || document.write('<script src="/js/vendor/jquery-3.3.1.slim.min.js"><\/script>')</script>
    <script type="text/javascript" src="/js/vendor/popper.min.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>

    <!-- Icons -->
    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>

  </body>
</html>
