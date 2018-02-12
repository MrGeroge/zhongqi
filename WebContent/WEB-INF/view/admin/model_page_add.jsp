<%@ page language="java" contentType="text/html; charset=UTF-8"
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

    <title>添加页面</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/bootstrap-datepicker/css/datepicker.css" />
    <link rel="stylesheet" type="text/css" href="assets/bootstrap-colorpicker/css/colorpicker.css" />
    <link rel="stylesheet" type="text/css" href="assets/bootstrap-daterangepicker/daterangepicker.css" />
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/kindeditor/themes/default/default.css" />
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
    <style>
        .form-control {
        color:black;
        }
    </style>
  </head>

  <body>

  <section id="container" class="">
      <!--header start-->
      <jsp:include page="header.jsp"></jsp:include>
      <!--sidebar end-->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
              <!-- page start-->
              <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                                                                         添加页面
                          </header>
                          <div class="panel-body">
                              <form class="form-horizontal tasi-form" method="post" action="<%=basePath%>Admin/Page?action=Add">
							      <input value="${uid}" name="uid" type="hidden">
							      <input value="${catalog}" name="catalog" type="hidden">
                                  <div class="form-group">
                                      <label class="col-sm-2 col-sm-2 control-label">页名称:</label>
                                      <div class="col-sm-10">
                                          <input type="text" class="form-control" id="pageName" name="pageName">
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-sm-2 control-label col-sm-2">内容</label>
                                      <div class="col-sm-10">
                                          <textarea class="form-control" id="content1" name="content" style="width: 90%; height: 300px; visibility: hidden;"></textarea>
                                      </div>
                                  </div>
                                  <button type="submit" class="btn btn-info">提交</button>
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
    <script src="js/respond.min.js" ></script>


    <!--common script for all pages-->
    <script src="js/common-scripts.js"></script>

    <!--script for this page only-->
    <script src="assets/kindeditor/kindeditor.js"></script>
    <script charset="utf-8" src="assets/kindeditor/lang/zh_CN.js"></script>
    <script>
          KindEditor.ready(function (K) {
              K.create('#content1', {
                  uploadJson: '<%=basePath%>upload',
                  themeType: 'default'
              });
          });
    </script>

  </body>
</html>
