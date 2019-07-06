
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>



<nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0">
  <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="/index.mvc">CQAS</a>
  <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">
  <%-- <input class="form-control form-control-dark" type="text" placeholder="Search" aria-label="Search"> --%>


  <ul class="navbar-nav px-3">
    <li class="nav-item text-nowrap">
      <a class="nav-link" href="/admin_logout.mvc">${sessionScope.ADMIN_SESSION.admin_id} &nbsp;&nbsp; 退出</a>
    </li>
  </ul>


  <%-- <c:if test="${sessionScope.USER_SESSION.user_id == null }" >
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          ${sessionScope.USER_SESSION.user_id}
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="/myaccount.mvc">我的账户</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="/logout.mvc">退出</a>
        </div>
      </li>
  </c:if> --%>


</nav>

<div class="container-fluid">
  <div class="row">
      <nav class="col-md-2 d-none d-md-block bg-light sidebar">
        <div class="sidebar-sticky">
          <ul class="nav flex-column">
            <li class="nav-item">
              <a class="nav-link active" href="/admin_board.mvc">
                <span data-feather="home"></span>
                Dashboard <span class="sr-only">(current)</span>
              </a>
            </li>
            <%-- <li class="nav-item">
              <a class="nav-link" href="#">
                <span data-feather="file"></span>
                Orders
              </a>
            </li> --%>


            <%-- <li class="nav-item">
              <a class="nav-link" href="/admin_findAllQuestions.mvc">
                <span data-feather="help-circle"></span>
                问题管理
              </a>
            </li> --%>

            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                问题管理
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="/admin_findAllQuestions.mvc">删除和更新问题</a>
                <a class="dropdown-item" href="/ask_question.mvc">添加问题</a>
                <%-- <div class="dropdown-divider"></div> --%>
                <%-- <a class="dropdown-item" href="#">Something else here</a> --%>
              </div>
            </li>

            <li class="nav-item">
              <a class="nav-link" href="/admin_findAllUsers.mvc">
                <span data-feather="users"></span>
                用户管理
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">
                <span data-feather="bar-chart-2"></span>
                统计与报告
              </a>
            </li>
            <%-- <li class="nav-item">
              <a class="nav-link" href="#">
                <span data-feather="layers"></span>
                Integrations
              </a>
            </li> --%>
          </ul>

          <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
            <span>Saved reports</span>
            <a class="d-flex align-items-center text-muted" href="#">
              <span data-feather="plus-circle"></span>
            </a>
          </h6>
          <ul class="nav flex-column mb-2">
            <li class="nav-item">
              <a class="nav-link" href="#">
                <span data-feather="file-text"></span>
                Current month
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">
                <span data-feather="file-text"></span>
                Last quarter
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">
                <span data-feather="file-text"></span>
                Social engagement
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">
                <span data-feather="file-text"></span>
                Year-end sale
              </a>
            </li>
          </ul>
        </div>
      </nav>

    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
        <h1 class="h2">Dashboard</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          <div class="btn-group mr-2">
            <button class="btn btn-sm btn-outline-secondary">Share</button>
            <button class="btn btn-sm btn-outline-secondary">Export</button>
          </div>
          <button class="btn btn-sm btn-outline-secondary dropdown-toggle">
            <span data-feather="calendar"></span>
            This week
          </button>
        </div>

      </div>
