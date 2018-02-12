﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

    <title>登录</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
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

  <body class="login-body">

    <div class="container">
      
        <form class="form-signin" id="formSignin" action="<%=basePath%>login" method="post">
            <h2 class="form-signin-heading">管理员登录</h2>
            <div class="login-wrap">
                <input type="text" class="form-control" placeholder="账户" autofocus name="username" id="username"/>
                <input type="password" class="form-control" placeholder="密码" name="password" id="password"/>
                <button class="btn btn-lg btn-login btn-block" >登录</button>
            </div>
        </form>

    </div>



    <!-- js placed at the end of the document so the pages load faster -->
    <script src="js/jquery-1.8.3.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="js/jquery.form.js"></script>

    <script>
          $().ready(function () {
              $("#formSignin").validate({
                  rules: {
                      username: "required",
                      password: "required"
                  },
                  messages: {
                      username: "请输入账户",
                      password: "请输入密码"
                  },
                  submitHandler: function (form) {
                      
                      $("#formSignin button.btn.btn-lg.btn-login.btn-block").attr("disabled","disabled");
                      
                      $(form).ajaxSubmit({
                          url:"<%=basePath%>login",
                          success: function (data) {
                        	  if(data.status=="success")
                        	  {
                        		  alert("登陆成功");
                        		  window.location="<%=basePath%>Admin/Account";
                        	  }else
                              {
                        		  alert("登陆失败,原因:"+data.info);
                              }
                        	  
                        	  $("#formSignin button.btn.btn-lg.btn-login.btn-block").attr("disabled",false);
                          }
                      });
                  }
              });
          });
     </script>
  </body>
</html>
