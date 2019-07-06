<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>

        <script type="text/javascript" language="javascript">
            function goPage(page){
                location.href="search.mvc?currentPage="+page;
            }
        </script>
<link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    </head>
    <body>

        <h3>搜索结果</h3>
        <div>
        <table width="100%" border="0" align="center" cellspacing="1" >
        <c:forEach items="${paging.dataList }" var="upl">
            <tr>
            <td align="center">${upl.title }</td>
            <%-- <td align="center">${upl.name2 }</td> --%>
            <%-- <td align="center">${upl.name3 }</td> --%>
            </tr>
            </c:forEach>
        </table>
        </div>


         <div style="text-align:center; margin-top:40px" id="venderfen">
                当前第${paging.currentPage }页/共${paging.totalPage }页
                <c:choose>
                    <c:when test="${paging.currentPage==1 && paging.totalPage==0}">

                    </c:when>
                    <c:when test="${paging.currentPage==1 && paging.totalPage==1}">
                        
                    </c:when>

                    <c:when test="${paging.currentPage==2&&paging.totalPage==2}">
                        <input type="button" value="首页" onclick="goPage(1)" />
                        <input type="button" value="上一页"
                            onclick="goPage(${paging.currentPage-1})" />
                    </c:when>

                    <c:when test="${paging.currentPage==1 }">
                        <input type="button" value="上一页" >
                        <input type="button" value="下一页"
                            onclick="goPage(${paging.currentPage+1})" />
                        <input type="button" value="末页"
                            onclick="goPage(${paging.totalPage})" />
                    </c:when>

                    <c:when test="${paging.currentPage==paging.totalPage }">
                        <input type="button" value="首页" onclick="goPage(1)" />
                        <input type="button" value="上一页"
                            onclick="goPage(${paging.currentPage-1})" />
                    </c:when>

                    <c:otherwise>
                        <input type="button" value="首页" onclick="goPage(1)" />
                        <input type="button" value="上一页"
                            onclick="goPage(${paging.currentPage-1})" />
                        <input type="button" value="下一页"
                            onclick="goPage(${paging.currentPage+1})" />
                        <input type="button" value="末页"
                            onclick="goPage(${paging.totalPage})" />
                    </c:otherwise>
                </c:choose>

            </div>

            <script src="/js/jquery-3.3.1.slim.min.js"></script>
            <script src="/js/bootstrap.bundle.min.js" ></script>

    </body>
</html>
