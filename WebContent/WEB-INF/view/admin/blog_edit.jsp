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

    <title>编辑新闻</title>

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
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
              <!-- page start-->
              <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                              添加新闻
                          </header>
                          <div class="panel-body">
                              <form class="form-horizontal tasi-form" method="post" action="<%=basePath%>Admin/Blog?action=UpdateBlog">
                                  <input value="${uid}" name="uid" type="hidden">
                                  <input value="${blog.id}" name="id" type="hidden">
                                  <input value="${blog.clickNumber}" name="clickNumber" type="hidden">
                                  <div class="form-group">
                                      <label class="col-sm-2 col-sm-2 control-label">标题</label>
                                      <div class="col-sm-10">
                                          <input type="text" class="form-control" id="title" name="title"  value="${blog.title}">
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-sm-2 col-sm-2 control-label">关键字</label>
                                      <div class="col-sm-10">
                                          <input type="text" class="form-control" id="keywords" name="keywords" value="${blog.keywords}">
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label for="author" class="col-sm-2 col-sm-2 control-label">作者</label>
                                      <div class="col-sm-10">
                                          <input type="text" name="author" class="form-control" id="author" value="${blog.source}"/>
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label for="catalog" class="col-sm-2 col-sm-2 control-label">分类</label>
                                      <div class="col-sm-8">
                                          <select class="form-control m-bot15" id="catalog" name="catalog">
                                              <c:forEach var="catalog" items="${catalogs}">
                                                    <option value="${catalog.id}" ${catalog.id==blog.blogCatalog.id?"selected='selected'":""}>${catalog.name}</option>
                                              </c:forEach>
                                          </select>
                                      </div>
                                      <div class="col-sm-2">
                                          <a href="javascript:;" class="btn btn-xs btn-success" id="addCatalog">
                                                                                                                        添加分类
                                          </a>
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-sm-2 control-label col-sm-2">内容</label>
                                      <div class="col-sm-10">
                                          <textarea class="form-control" id="content1" name="content" style="width: 90%; height: 300px; visibility: hidden;">
                                                 ${blog.content}
                                          </textarea>
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
                  uploadJson:'<%=basePath%>upload',
                  themeType: 'default'
              });
          });
          $("#addCatalog").click(function () {
              var context = prompt("请输入要添加的分类");
              
              $(this).attr("disabled","disabled");
              $(this).html("正在添加<img src=\"img/ajax-loaders/ajax-loader-1.gif\"/>");
              
              $.post('<%=basePath%>Admin/Blog', 
                    {
                      action: 'AddCatalog',
                      catalog:context
                    }, function(data) {

                    $("#catalog").append("<option value='"+data['message']+"'>"+context+"</option>");
                    $("#addCatalog").html("添加分类");
                    $("#addCatalog").attr("disabled",false);
                    alert("添加成功");
              });
          });
    </script>

  </body>
</html>
