<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">

    <title>cqas -- 一个IT社区问答网站</title>
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

    <br>
    <div  class="main container body-content mycontent">
    <div class="row">
        <div class="col-md-12" style="border-right:1px solid grey">
          <div class="row">
              <div class="col-md-6">
                  <h3>最新问题</h3>
              </div>
              <!-- <button href="/ask_question.mvc" type="button" class="btn btn-success">提问</button> -->
              <div class="col-md-6">
                  <a href="/ask_question.mvc" role="button" class="btn btn-success">提问</a>
              </div>
          </div>
          <br><br>

          <!--通过bootstrap的栅格系统布局-->
          <div class="container">
              <!--标题-->
              <div class="row">
                  <div class="col-md-12">
                      <h2>最新问题</h2>
                  </div>
              </div>


              <!--显示表格数据-->
              <div class="row">
                  <div class="col-md-12">
                      <table class="table table-hover table-sm">
                          <th>浏览</th>
                          <th>回答</th>
                          <th>获赞</th>
                          <th>用户</th>
                          <th>时间</th>
                          <c:forEach items="${pageInfo.list}" var="question">
                              <tr>
                                  <td>${question.surf_number}</td>
                                  <td>${question.answer_number}</td>
                                  <td>${question.like_number}</td>
                                  <td>${question.user_id}</td>
                                  <td>${question.ask_date}</td>
                                  <td>
                                      <a id="surf_question"
                                          href="/surf_question.mvc?qid=${question.question_id}">
                                          ${question.title}
                                      </a>
                                  </td>
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
                    <li><a href="${pageContext.request.contextPath}/question_all.mvc?pageNum=1">首页</a></li>
                    &nbsp;&nbsp;
                    <!--上一页-->
                    <li>
                        <c:if test="${pageInfo.hasPreviousPage}">
                            <a href="${pageContext.request.contextPath}/question_all.mvc?pageNum=${pageInfo.pageNum-1}" aria-label="Previous">
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
                            <li><a href="${pageContext.request.contextPath}/question_all.mvc?pageNum=${page_num}">${page_num}</a></li>
                            &nbsp;&nbsp;
                        </c:if>
                    </c:forEach>

                    <!--下一页-->
                    <li>
                        <c:if test="${pageInfo.hasNextPage}">
                            <a href="${pageContext.request.contextPath}/question_all.mvc?pageNum=${pageInfo.pageNum+1}"
                               aria-label="Next">
                                <span aria-hidden="true">»</span>
                            </a>
                        </c:if>
                    </li>
                    &nbsp;&nbsp;

                    <li><a href="${pageContext.request.contextPath}/question_all.mvc?pageNum=${pageInfo.pages}">尾页</a></li>
                </ul>
            </nav>
        </div>

      </div>
          </div>



        </div>

        <%-- <div class="col-md-4" >
          <h1>相似问题推荐列表</h1>
          <p class="lead">Use this document as a way to quickly start any new project.
              <br> All you get is this text and a mostly barebones HTML document.</p>
        </div> --%>
    </div>
    </div>

    <%-- <c:if test="${ USER_SESSION != null }" >
        <%  response.sendRedirect("/index2.mvc"); %>
    </c:if> --%>

    <%@ include file="/WEB-INF/page/footer.jsp"%>

    <script src="/js/jquery-3.3.1.slim.min.js"></script>
    <script src="/js/bootstrap.bundle.min.js" ></script>
    <%-- <script>
        $("#rgister-login-e").hide()
    </script> --%>
</body>


</html>
