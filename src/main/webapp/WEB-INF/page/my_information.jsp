<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <%-- <link rel="icon" href="/favicon.ico"> --%>

    <title>我的信息</title>

    <!-- Bootstrap core CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="dashboard.css" rel="stylesheet">
    <style>
      .head {
           width:180px;
           height:260px;
      }

    </style>

  </head>

<body>
      <%@ include file="/WEB-INF/page/settings_left.jsp"%>


    <%-- <canvas class="my-4" id="myChart" width="900" height="380"></canvas> --%>

    <%-- <h2>Section title</h2> --%>
    <%-- <div class="table-responsive">
      table
    </div> --%>

    <div class="container border-bottom">
        <div class="row">
        <div class="col-md-4 border-right">
            <img src="${user_detail.head_img}" class="head rounded float-left"  alt="">
            <form  method="POST" action="/upload_headimg.mvc" enctype="multipart/form-data">
                <input type="file" name="file" accept="image/jpg,image/png">
                <%-- <input type="text" name="username" > --%>
                <button  type="submit" >上传</button>
            </form>
        </div>

        <div class="col-md-8">
            自我介绍：
            ${user_detail.intro}
        </div>
        </div>
    </div>


        <br><br>
        <p >姓名：${user_detail.username}</p>
        <p >邮箱：${user_detail.email}</p>
        <p >兴趣：${user_detail.intrests}</p>

        <button type="button"  data-toggle="modal" data-target="#exampleModal" data-whatever="@getbootstrap">修改密码</button>


        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">${user_detail.user_id} 修改密码</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <form>
                  <div class="form-group">
                    <label id="user_id_label" for="recipient-name" class="col-form-label"></label>
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



        <script type="text/javascript">

            function update_user2() {

                var password_pattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}$/;
                var userid = '${user_detail.user_id}'
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
                        alert("更新失败!");
                    }
                });

            }
        </script>





    <script src="/js/jquery-3.3.1.min.js"></script>
    <script src="/js/popper.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>

    <!-- Icons -->
    <script src="/js/feather.js"></script>
    <script>
      feather.replace()
    </script>

  </body>
</html>
