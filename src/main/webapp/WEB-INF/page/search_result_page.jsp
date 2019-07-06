<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>

        <link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <%@ include file="/WEB-INF/page/header.jsp"%>

        <div class="container">
            <h3>搜索结果</h3> <br>
            <div class="row">
                <div class="col-md-12" style="border-right:1px solid grey">
                    <!--显示表格数据-->
                    <div class="row">
                        <div class="col-md-12">
                            <table class="table table-hover table-sm">
                                <th>浏览</th>
                                <th>回答</th>
                                <th>获赞</th>
                                <th>用户</th>
                                <th>时间</th>
                                <th>问题</th>
                                <c:forEach items="${question_lst}" var="question">
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
                </div>

                <%-- <div class="col-md-4" >
                  <h1>相似问题推荐列表</h1>
                  <p class="lead">Use this document as a way to quickly start any new project.
                      <br> All you get is this text and a mostly barebones HTML document.</p>
                </div> --%>
            </div>
        </div>

        <script src="/js/jquery-3.3.1.slim.min.js"></script>
        <script src="/js/bootstrap.bundle.min.js" ></script>

    </body>
</html>
