<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="net.zypro.zq.bean.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="ch">
  <head>
    <meta charset="utf-8">
    <base href="<%=basePath%>static/admin/">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>管理员列表</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/advanced-datatable/media/css/demo_page.css" rel="stylesheet" />
    <link href="assets/advanced-datatable/media/css/demo_table.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/jquery-multi-select/css/multi-select.css" />
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
    <style>
        .error {
            color:red;
        }
    </style>
  </head>

  <body>

  <section id="container" class="">
      <!--header start-->
      <jsp:include page="header.jsp"></jsp:include>
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
              <!-- page start-->
              <div class="row">
                  <div class="col-lg-4">
                      <section class="panel">
                          <header class="panel-heading">
                              用户信息
                          </header>
                          <div class="panel-body">
                             <div class="task-thumb-details">
                                  <h1>欢迎&nbsp;&nbsp;<a href="javascript:;">${username}</a></h1>
                                  <p>权限级别:受限制</p>
                             </div>
                          </div>
                          <table class="table table-hover personal-task">
                              <caption align="top">可访问的模块</caption>
                              <tbody>
                                <c:forEach var="access" items="${accesses}">
                                    <%
                                       Access access=(Access)pageContext.getAttribute("access");
                                    %>
                                   <tr>
                                    <td>${access.id}</td>
                                    <td><%=ModuleValue.getModule(access.getModule())%></td>
                                   <tr>
                                </c:forEach> 
                              </tbody>
                          </table> 
                      </section>
                  </div>
                  <div class="col-lg-8">
                      <section class="panel">
                          <header class="panel-heading">
                              密码重置
                          </header>
                          <div class="panel-body">
                              <form class="form-horizontal" role="form" id="form-changePwd">
                                  <div class="form-group">
                                      <label class="col-sm-2 col-sm-2 control-label">新密码</label>
                                      <div class="col-sm-10">
                                          <input type="password" class="form-control" id="password" name="password">
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-sm-2 col-sm-2 control-label">再次输入</label>
                                      <div class="col-sm-10">
                                          <input type="password" class="form-control" id="rePassword" name="rePassword">
                                      </div>
                                  </div>
                                  <button type="submit" class="btn btn-info" id="btn-changePwd">提交</button>
                              </form>
                          </div>
                      </section>
                  </div>
              </div>
              <!-- page end-->
          </section>
      </section>
      <!--main content end-->
  </section>
     
    <!-- js placed at the end of the document so the pages load faster -->
    <!--<script src="js/jquery.js"></script>-->
    <script type="text/javascript" language="javascript" src="assets/advanced-datatable/media/js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="js/jquery.scrollTo.min.js"></script>
    <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="js/jquery.form.js"></script>


    
    <!--common script for all pages-->
    <script src="js/respond.min.js" ></script>
    <script src="js/common-scripts.js"></script>

    <!--script for this page only-->

    <script type="text/javascript" charset="utf-8">
          $(document).ready(function() {
               jQuery.validator.addMethod("notEqualTo", function (value, element, param) {  
                              return value == $(param).val();  
               }, $.validator.format("两次输入不相同"));

               $("#form-changePwd").validate({
                  rules: {
                      password: "required",
                      rePassword:{
                                required:true,
                                notEqualTo:"#password"
                    }
                  },
                  messages: {
                      password: "请输入密码",
                      rePassword:{
                                required:"请再次输入密码",
                                notEqualTo: "两次输入不相同"
                              }
                  },
                  submitHandler: function (form) {

                      $(form).ajaxSubmit({
                    	  url:"<%=basePath%>Admin/Account?action=ChangePwd",
                          success: function (data) {
                        	  if(data.status=='success')
                              {
                                alert("修改密码成功");
                              }
                          }
                      });
                  }
              });
 
          } );
      </script>
  </body>
</html>
