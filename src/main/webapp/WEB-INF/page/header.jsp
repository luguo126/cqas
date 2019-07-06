<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>


      <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="/index.mvc">CQAS</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a class="nav-link" href="/index.mvc">首页 <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">用户</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/question_all.mvc">问题</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">标签</a>
            </li>

            <%-- <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Dropdown
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="#">Action</a>
                <a class="dropdown-item" href="#">Another action</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#">Something else here</a>
              </div>
            </li> --%>

            <!-- <li class="nav-item">
              <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
            </li> -->
          </ul>

          <div>
              <form  class="form-inline my-2 my-lg-0" action="/search.mvc">
                <input  id="question" name="question" class="form-control mr-sm-2 input-group" type="search" placeholder="请输入要搜索的问题" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">搜索</button>
              </form>
          </div>

          <c:if test="${ sessionScope.USER_SESSION.user_id == null }" >
              <ul id="rgister-login-e" class="navbar-nav">
                  <li class="nav-item">
                    <a id="register" class="nav-link" href="/registerForm.mvc">注册</a>
                  </li>

                  <li class="nav-item">
                    <a id="login" class="nav-link" href="/loginForm.mvc">登录</a>
                  </li>
              </ul>
          </c:if>


          <c:if test="${sessionScope.USER_SESSION.user_id != null }" >
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  ${sessionScope.USER_SESSION.user_id}
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <a class="dropdown-item" href="/myaccount.mvc">我的账户</a>
                  <%-- <a class="dropdown-item" href="#">Another action</a> --%>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="/logout.mvc">退出</a>
                </div>
              </li>
          </c:if>




        </div>
      </nav>
