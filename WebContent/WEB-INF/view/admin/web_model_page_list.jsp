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
    <meta name="description" content="">
    <meta name="author" content="Mosaddek">
    <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>${navTitle}</title>

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
                             ${navTitle} 
                          </header>
                          <div class="panel-body">
                                <div class="adv-table">
                                    <div class="clearfix">
			                          <div class="btn-group">
			                                 <a href="<%=basePath%>Admin/Page?action=Add&catalog=${catalog}" class="btn btn-primary">
			                                                添加页面&nbsp;<i class="icon-plus"></i>
			                                 </a>
			                          </div>
                                    </div>
                                    <table  class="display table table-bordered table-striped" id="example">
                                      <thead>
                                      <tr>
                                          <th>序号</th>
                                          <th>页名称</th>
                                          <th>内容</th>
                                          <th>操作</th>
                                      </tr>
                                      </thead>
                                      <tbody>
                                      <c:forEach var="page" items="${webPages}">
	                                      <tr class="gradeA">
	                                          <td>${page.id}</td>
								              <td>${page.pageName}</td>
	                                          <td>
	                                              <a href="javascript:;"  class="btn btn-xs btn-info myModal">
	                                                                                                                                          详情
	                                                  <div style="display: none;">
	                                                    <p>
	                                                    ${page.content}
	                                                    </p>
	                                                  </div>
	                                              </a>
	                                          </td>
	                                          <td>
	                                              <button class="btn btn-danger btn-xs"><i class="icon-trash "></i>&nbsp;删除</button>
	                                              <button class="btn btn-info btn-xs"><i class="icon-pencil"></i>&nbsp;编辑</button>
	                                          </td>
	                                      </tr>
	                                  </c:forEach>
                                      </tbody>
                                      <tfoot>
                                      <tr>
                                          <th>序号</th>
                                          <th>页名称</th>
                                          <th>内容</th>
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
                      <div class="modal-header">
                            <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                            <h4 class="modal-title">页面内容</h4>
                      </div>
                      <div class="modal-body" id="message-detail">
                                                                                                  
                      </div>
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

    <!--script for this page only-->

    <script type="text/javascript" charset="utf-8">
          $(document).ready(function() {
              $("a.btn.btn-xs.btn-info.myModal").live('click', function(event) {
                /* Act on the event */
                //获取文本内容
                var context=$(this).children("div").html();
                $("#message-detail").html(context);

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

              $('#example button.btn.btn-danger.btn-xs').live('click', function (e) {
                  e.preventDefault();

                  if (confirm("确认删除?") == false) {
                      return;
                  }

                  $(this).html("<i class='icon-trash'></i>&nbsp;正在删除");

                  var nRow = $(this).parents('tr')[0];
         
                  $.post('<%=basePath%>Admin/Page', 
                          {
                            action: 'Delete',
                            id: $(nRow).children("td:first").text()
                          },
                          function(data){
                        	//删除该行
                            oTable.fnDeleteRow(nRow);
                          }  
                        );
              });
          
              $('#example button.btn.btn-info.btn-xs').live('click', function (e) {
                  e.preventDefault();
                  var nRow = $(this).parents('tr')[0];
                  var id=$(nRow).children("td:first").text();
                  var catalog="${catalog}";
                  
                  window.location.href="<%=basePath%>Admin/Page?action=Update&id="+id+"&catalog="+catalog;

                  
              });
          } );
      </script>
  </body>
</html>
