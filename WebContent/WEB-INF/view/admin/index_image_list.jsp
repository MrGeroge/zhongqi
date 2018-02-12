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
    <base href="<%=basePath%>static/admin/">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>首页|首页图片管理</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/advanced-datatable/media/css/demo_page.css" rel="stylesheet" />
    <link href="assets/advanced-datatable/media/css/demo_table.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/kindeditor/themes/default/default.css" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
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
                              首页图片
                          </header>
                          <div class="panel-body">
                                <div class="adv-table">
                                    <div class="clearfix">
                                        <div class="btn-group">
                                            <button id="J_selectImage" class="btn green">
                                                添加图片(宽*高:1366*322)<i class="icon-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <table  class="display table table-bordered table-striped" id="example">
                                      <thead>
                                      <tr>
                                          <th>序号</th>
                                          <th>图片(点击放大)</th>
                                          <th>操作</th>
                                      </tr>
                                      </thead>
                                      <tbody>
                                      <c:forEach var="image" items="${images}">
											 <tr class="gradeA">
												<td>${image.id}</td>
												<td>
												    <a href="javascript:;" class="myModal">
                                                        <img src="${image.path}" style="width:64px;height:64px;" />
                                                    </a>
												</td>
												<td>
												    <button class="btn btn-danger btn-xs delete-btn"><i class="icon-trash "></i>&nbsp;删除</button>
												</td>
											 </tr>
						              </c:forEach>  
                                      </tbody>
                                      <tfoot>
                                      <tr>
                                          <th>序号</th>
                                          <th>图片(点击放大)</th>
                                          <th>操作</th>
                                      </tr>
                                      </tfoot>
                          </table>
                                </div>
                          </div>
                      </section>
                  </div>
              </div>
              <!-- page end-->
          </section>
      </section>
      <!--main content end-->
  </section>
     
    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                  <img src="#" id="modal-img"/>
            </div>
        </div>
    </div>
    <!-- js placed at the end of the document so the pages load faster -->
    <!--<script src="js/jquery.js"></script>-->
    <script type="text/javascript" language="javascript" src="assets/advanced-datatable/media/js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="js/jquery.scrollTo.min.js"></script>
    <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript" src="assets/advanced-datatable/media/js/jquery.dataTables.js"></script>
    <script src="js/respond.min.js" ></script>


    <!--common script for all pages-->
    <script src="js/common-scripts.js"></script>
    <script src="assets/kindeditor/kindeditor.js"></script>
    <script charset="utf-8" src="assets/kindeditor/lang/zh_CN.js"></script>

    <!--script for this page only-->
    <script>

          
      </script>

      <script type="text/javascript" charset="utf-8">
          $(document).ready(function() {
              $("a.myModal").live('click', function(event) {
                /* Act on the event */
                //获取文本内容
                var context=$(this).children("img").attr('src');
                $("#modal-img").attr('src',context);

                $('#myModal').modal('show');
              });

              var oTable = $('#example').dataTable({
                  "bPaginate": true, //开关，是否显示分页器
                  "bInfo": true, //开关，是否显示表格的一些信息
                  "bFilter": true, //开关，是否启用客户端过滤器
                  "oLanguage": {
                      "sProcessing": "正在加载中......",
                      "sLengthMenu": "每页显示 _MENU_ 条记录",
                      "sZeroRecords": "对不起，查询不到相关数据！",
                      "sEmptyTable": "表中无数据存在！",
                      "sInfo": "当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录",
                      "sInfoFiltered": "数据表中共为 _MAX_ 条记录",
                      "sSearch": "搜索",
                      "oPaginate": {
                          "sFirst": "首页",
                          "sPrevious": "上一页",
                          "sNext": "下一页",
                          "sLast": "末页"
                      }
                  }
              });
              
              //初始化图片上传组件
              KindEditor.ready(function (K) {
                  var editor = K.editor({
                      uploadJson: '<%=basePath%>upload',
                      fileManagerJson: 'bin/file_manager_json.jsp',
                      allowFileManager: true
                  });
                  K('#J_selectImage').click(function () {
                      editor.loadPlugin('multiimage', function () {
                          editor.plugin.multiImageDialog({
                              clickFn: function (urlList) {
                                  var Data = "";
                                  var number = 1;
                                  K.each(urlList, function (i, data) {
                                      Data += "name=" + data.url+"&";
                                  });
                                  
                                  $.ajax({
                                      url: '<%=basePath%>Admin/Home?'+Data,
                                      type: 'POST',
                                      data: {action: 'Add'},
                                      async:false
                                    })
                                    .done(function() {
                                      console.log("success");
                                      
                                      alert("添加成功");
                                    })
                                    .fail(function() {
                                      console.log("error");
                                    })
                                    .always(function() {
                                      console.log("complete");
                                    });
                                  
                                  
                                  editor.hideDialog();
                                  
                                  location.reload();
                              }
                          });
                      });
                  });
              });

              $('#example button.btn.btn-danger.btn-xs.delete-btn').live('click', function (e) {
                  e.preventDefault();

                  if (confirm("Are you sure to delete this row ?") == false) {
                      return;
                  }

                  $(this).attr("disabled","disabled");
                  $(this).html("&nbsp;正在删除<img src=\"img/ajax-loaders/ajax-loader-1.gif\"/>");

                  var nRow = $(this).parents('tr')[0];
                  //获取ID
                  console.log($(nRow).children("td:first").text());
                  
                  $.ajax({
                    url: '<%=basePath%>Admin/Home',
                    type: 'POST',
                    data: {action: 'Delete',id:$(nRow).children("td:first").text()},
                  })
                  .done(function() {
                    console.log("success");
                    //删除该行
                    oTable.fnDeleteRow(nRow);
                    $(this).html("&nbsp;删除");
                    alert("删除成功");
                  })
                  .fail(function() {
                    console.log("error");
                  })
                  .always(function() {
                    console.log("complete");
                  });
                  

                  $(this).attr("disabled",false);
              });
          } );
      </script>
  </body>
</html>
