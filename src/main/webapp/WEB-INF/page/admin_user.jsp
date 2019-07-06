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
                <h2>用户管理</h2>
            </div>
        </div>


        <!--显示表格数据-->
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover">
                    <tr>
                        <th>#</th>
                        <th>用户id</th>
                        <th>密码</th>
                    </tr>


                    <c:forEach items="${pageInfo.list}" var="user">
                        <tr>
                            <th></th>

                            <th>
                                <a id="surf_user"
                                    href="/surf_user.mvc?uid=${user.user_id}">
                                    ${user.user_id}
                                </a>
                            </th>
                            <th>${user.password}</th>
                            <th>
                                <button  class="btn btn-primary"
                                        onclick="update_user('${user.user_id}')"
                                            >
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    更新
                                </button>

                                <button  onclick="delete_user('${user.user_id}')" class="btn btn-danger" >
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

        <%-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Open modal for @mdo</button>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@fat">Open modal for @fat</button>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@getbootstrap">Open modal for @getbootstrap</button> --%>

        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">更新用户信息</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <form>
                  <div class="form-group">
                    <label id="user_id_label" for="recipient-name" class="col-form-label"></label>
                    <%-- <input type="text" class="form-control" id="recipient-name"> --%>
                  </div>
                  <div class="form-group">
                    <label for="message-text" class="col-form-label">密码(密码必须包含大小写字母和数字的组合，可以使用特殊字符，长度在8-16之间):</label>
                    <input id="password_for_reset" type="password" class="form-control" id="message-text">
                  </div>
                </form>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                <button onclick="update_user2()"  type="button" class="btn btn-primary">更新</button>
              </div>
            </div>
          </div>
        </div>

        <button style="visibility:hidden" id="update_user_btn" type="button" class="btn btn-primary"
            data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Open modal for @mdo</button>


            <%-- 添加用户 form --%>
            <div class="modal fade" id="add_user_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">添加用户</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                    <form action="/add_user.mvc" method="post">
                      <div class="form-group">
                        <label for="recipient-name" class="col-form-label">用户id ( 字母开头，允许3-16字节，允许字母数字下划线)</label>
                        <input id="userid_for_add" name="user_id" type="text" class="form-control" id="recipient-name">
                      </div>
                      <div class="form-group">
                        <label for="message-text" class="col-form-label">密码(密码必须包含大小写字母和数字的组合，可以使用特殊字符，长度在8-16之间):</label>
                        <input id="password_for_add" name="password" type="password" class="form-control" id="message-text">
                      </div>
                      <button type="submit" class="btn btn-primary">更新</button>
                    </form>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>

                  </div>
                  <c:if test="${ register_success != null }" >
                      <div class="alert alert-success" role="alert">
                          <p>${requestScope.register_success}</p>
                      </div>
                  </c:if>
                  <c:if test="${ uid_exist != null }" >
                      <div class="alert alert-danger" role="alert">
                          <p>${requestScope.uid_exist}</p>
                      </div>
                  </c:if>
                </div>
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
              <li><a href="${pageContext.request.contextPath}/admin_findAllUsers.mvc?pageNum=1">首页</a></li>
              &nbsp;&nbsp;
              <!--上一页-->
              <li>
                  <c:if test="${pageInfo.hasPreviousPage}">
                      <a href="${pageContext.request.contextPath}/admin_findAllUsers.mvc?pageNum=${pageInfo.pageNum-1}" aria-label="Previous">
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
                      <li><a href="${pageContext.request.contextPath}/admin_findAllUsers.mvc?pageNum=${page_num}">${page_num}</a></li>
                      &nbsp;&nbsp;
                  </c:if>
              </c:forEach>

              <!--下一页-->
              <li>
                  <c:if test="${pageInfo.hasNextPage}">
                      <a href="${pageContext.request.contextPath}/admin_findAllUsers.mvc?pageNum=${pageInfo.pageNum+1}"
                         aria-label="Next">
                          <span aria-hidden="true">»</span>
                      </a>
                  </c:if>
              </li>
              &nbsp;&nbsp;

              <li><a href="${pageContext.request.contextPath}/admin_findAllUsers.mvc?pageNum=${pageInfo.pages}">尾页</a></li>
          </ul>
      </nav>
  </div>

</div>


<div class="container">
    <button onclick="show_add_user_modal()" class="btn btn-primary">
        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
        添加用户
    </button>

    <c:if test="${ register_success != null }" >
        <div class="alert alert-success" role="alert">
            <p>${requestScope.register_success}</p>
        </div>
    </c:if>
    <c:if test="${ uid_exist != null }" >
        <div class="alert alert-danger" role="alert">
            <p>${requestScope.uid_exist}</p>
        </div>
    </c:if>
    <c:if test="${ reasonable != null }" >
        <div class="alert alert-danger" role="alert">
            <p>${requestScope.reasonable}</p>
        </div>
    </c:if>
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
        function delete_user(uid) {
            var url = "/delete_user_by_uid.mvc?uid=" + uid;
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


<script type="text/javascript">
    var uid_global;
    function update_user(uid) {
        this.uid_global = uid;
        $('#user_id_label').html('用户: ' + uid);
        $('#update_user_btn').click();
    }


    function update_user2() {
        // var userid_pattern = /^[a-zA-Z][a-zA-Z0-9_]{2,15}$/;
        var password_pattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}$/;

        var userid = this.uid_global;
        var password = $('#password_for_reset').val();
        var url = "/update_user.mvc";


        if ( password_pattern.test(password) != true ) {
            alert("密码不合要求");
            return ;
        }

        $.ajax({
            url: url,
            type: "POST",
            data: JSON.stringify(
                {user_id: userid,
                    password: password}
            ),
            /* dataType: "json", */
            contentType: "application/json;charset=UTF-8",
            success: function(data) {
                alert("更新成功");
                window.location.reload();

            },
            error: function(XMLHttpResponse, textStatus, errorThrown) {
                // console.log("1 异步调用返回失败,XMLHttpResponse.readyState:"+XMLHttpResponse.readyState);
                // console.log("2 异步调用返回失败,XMLHttpResponse.status:"+XMLHttpResponse.status);
                // console.log("3 异步调用返回失败,textStatus:"+textStatus);
                // console.log("4 异步调用返回失败,errorThrown:"+errorThrown);
                alert("更新失败!");
            }
        });

    }
</script>



<script type="text/javascript">
    function show_add_user_modal() {
        $('#add_user_modal').modal('show');
        $('#userid_for_add').val("");
        $('#password_for_add').val("");
    }


    function refresh_add_user_modal() {
        // $('#add_user_modal').modal('hide');
        // $('#add_user_modal').modal('show');
    }

    // function add_user() {
    //     var userid_pattern = /^[a-zA-Z][a-zA-Z0-9_]{2,15}$/;
    //     var password_pattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}$/;
    //     var userid = $('#userid_for_add').val();
    //     var password = $('#password_for_add').val();
    //     var url = "/add_user.mvc";
    //
    //     if ( password_pattern.test(password) != true ) {
    //         alert("用户名和密码不合要求");
    //         return ;
    //     }
    //
    //     $.ajax({
    //         url: url,
    //         type: "POST",
    //         data: JSON.stringify(
    //             {user_id: userid,
    //                 password: password}
    //         ),
    //         contentType: "application/json;charset=UTF-8",
    //         success: function(data) {
    //             refresh_add_user_modal();
    //             alert("添加成功");
    //             // window.location.reload();
    //
    //         },
    //         error: function(XMLHttpResponse, textStatus, errorThrown) {
    //             alert("添加失败");
    //         }
    //     });
    //
    // }
</script>

  </body>
</html>
