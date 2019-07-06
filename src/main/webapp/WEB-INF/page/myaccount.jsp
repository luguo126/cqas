<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>


<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <%-- <link rel="icon" href="/favicon.ico"> --%>

    <title>个人信息</title>

    <!-- Bootstrap core CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <%-- <link href="dashboard.css" rel="stylesheet"> --%>
  </head>

  <body>
      <%@ include file="/WEB-INF/page/settings_left.jsp"%>


          <%-- <canvas class="my-4" id="myChart" width="900" height="380"></canvas> --%>

          <%-- <h2>Section title</h2> --%>
          <%-- <div class="table-responsive">
              table
          </div> --%>

          <div id="mydiv">
              设置
          </div>

        </main>
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <%-- <script src="/js/jquery-1.12.4.js"></script> --%>
    <script src="/js/jquery-3.3.1.min.js"></script>
    <script src="/js/popper.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <!-- Icons -->
    <script src="/js/feather.min.js"></script>
    <script>
      feather.replace()
    </script>

    <!-- Graphs -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
  </body>
</html>
