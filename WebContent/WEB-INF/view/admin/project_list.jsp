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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <base href="<%=basePath%>static/admin/">
    <title>工程案例</title>

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
                              案例列表
                          </header>
                          <div class="panel-body">
                              <div class="clearfix">
                                        <div class="btn-group">
                                            <a href="<%=basePath%>Admin/Project?action=AddProject" class="btn btn-primary">
                                                添加案例&nbsp;<i class="icon-plus"></i>
                                            </a>
                                        </div>
                              </div>
                              <table  class="display table table-bordered table-striped" id="project-list">
                                      <thead>
                                        <tr>
                                          <th>序号</th>
                                          <th>名称</th>
                                          <th>封面(点击放大)</th>
                                          <th>施工地址</th>
                                          <th>工程性质</th>
                                          <th>项目介绍</th>
                                          <th>完工时间</th>
                                          <th>所属分类</th>
                                          <th>操作</th>
                                          <th>其它</th>
                                      </tr>
                                      </thead>
                                      <tbody>
                                      <c:forEach var="project" items="${projects}">
		                                      <tr class="gradeA">
		                                          <td>${project.id}</td>
								                  <td>${project.name}</td>
		                                          <td>
		                                              <a href="javascript:;" class="myModal">
		                                                  <img src="${project.cover}" style="width:64px;height:64px;" />
		                                              </a>
		                                          </td>
		                                          <td>${project.address}</td>
								                  <td>${project.type}</td>
		                                          <td>
		                                              <a href="javascript:;"  class="btn btn-xs btn-info myModal2">
		                                                 	 详情
		                                                  <div style="display: none;">
		                                                    <p>
		                                                     	${project.description}
		                                                    </p>
		                                                  </div>
		                                              </a>
		                                          </td>
		                                          <td>${project.finishDate}</td>
								                  <td>${project.catalog.name}</td>
		                                          <td>
		                                              <button class="btn btn-danger btn-xs"><i class="icon-trash "></i>&nbsp;删除</button><br/><br/>
		                                              <button class="btn btn-primary btn-xs btn-edit"><i class="icon-pencil"></i>&nbsp;编辑</button> 
		                                          </td>
		                                          <td>
		                                              <button type="button" class="btn btn-primary btn-xs btn-search"><i class="icon-search"></i>&nbsp;查看图片</button><br/><br/>   
		                                              <button type="button" class="btn btn-info btn-xs selectImage"><i class="icon-cloud-upload"></i>&nbsp;添加图片</button>
		                                          </td>
		                                      </tr>
                                      </c:forEach>
                                      </tbody>
                                      <tfoot>
                                      <tr>
                                          <th>序号</th>
                                          <th>名称</th>
                                          <th>封面(点击放大)</th>
                                          <th>施工地址</th>
                                          <th>工程性质</th>
                                          <th>项目介绍</th>
                                          <th>完工时间</th>
                                          <th>所属分类</th>
                                          <th>操作</th>
                                          <th>其它</th>
                                      </tr>
                                      </tfoot>
                            </table>
                          </div>
                      </section>
                  </div>
              </div>

              <div class="row">
                  <div class="col-lg-8">
                      <section class="panel">
                          <header class="panel-heading">
                              分类列表
                          </header>
                          <div class="panel-body">
                                <div class="adv-table">
                                    <table  class="display table table-bordered table-striped" id="project-catalog">
                                      <thead>
                                         <tr>
                                          <th>序号</th>
                                          <th>名称</th>
                                          <th>图片(点击放大)</th>
                                          <th>操作</th>
                                      </tr>
                                      </thead>
                                      <tbody>
                                         <c:forEach var="catalog" items="${catalogs}">
		                                      <tr class="gradeA">
		                                          <td>${catalog.id}</td>
		                                          <td>${catalog.name}</td>
		                                          <td>
		                                              <a href="javascript:;" class="myModal">
		                                                  <img src="${catalog.cover}" style="width:64px;height:64px;" />
		                                              </a>
		                                          </td>
		                                          <td>
		                                              <button class="btn btn-danger btn-xs"><i class="icon-trash "></i>&nbsp;删除</button>
		                                          </td>
		                                      </tr>
		                                      
		                                      </tbody>
		                                      <tfoot>
		                                      <tr>
		                                          <th>序号</th>
		                                          <th>名称</th>
		                                          <th>图片(点击放大)</th>
		                                          <th>操作</th>
		                                      </tr>
                                         </c:forEach>
                                      </tfoot>
                                  </table>
                                </div>
                          </div>
                      </section>
                  </div>
                  <div class="col-lg-4">
                         <section class="panel">
                          <header class="panel-heading">
                               添加分类
                          </header>
                          <div class="panel-body">
                               <form class="form-horizontal tasi-form" method="post" action="<%=basePath%>Admin/Project?action=AddCatalog">
                                  <div class="form-group">
                                      <label class="col-sm-2 col-sm-2 control-label">名称</label>
                                      <div class="col-sm-10">
                                          <input type="text" class="form-control" name="catalog">
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-sm-2 col-sm-2 control-label">封面</label>
                                      <div class="col-sm-10">
                                          <input class="ke-input-text" type="text" id="url" value="" readonly="readonly" name="cover" class="form-control"/> <input type="button" id="uploadButton" value="Upload" />
                                          <p class="help-block">规格:952*384</p>
                                      </div>
                                  </div>
                                  <button type="submit" class="btn btn-info" >提交</button>
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
    
    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade" style="display: none;">
          <div class="modal-dialog">
              <div class="modal-content">
                    <img src="#" id="modal-img"/>
              </div>
          </div>
    </div>

    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal2" class="modal fade" style="display: none;">
          <div class="modal-dialog">
              <div class="modal-content">
                    <div class="modal-header">
                            <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                            <h4 class="modal-title">详细内容</h4>
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
    <script src="assets/kindeditor/kindeditor.js"></script>
    <script charset="utf-8" src="assets/kindeditor/lang/zh_CN.js"></script>

    <!--script for this page only-->
    <script>
      KindEditor.ready(function(K) {
        var uploadbutton = K.uploadbutton({
          button : K('#uploadButton')[0],
          fieldName : 'imgFile',
          url : '<%=basePath%>/upload',
          afterUpload : function(data) {
            if (data.error === 0) {
              K('#url').val(data.url);
            } else {
              alert(data.message);
            }
          },
          afterError : function(str) {
            alert('自定义错误信息: ' + str);
          }
        });
        uploadbutton.fileBox.change(function(e) {
          uploadbutton.submit();
        });
        
        var editor = K.editor({
          uploadJson : '<%=basePath%>/upload',
          fileManagerJson : 'bin/file_manager_json.jsp',
          allowFileManager : true
        });


        $("#project-list button.btn.btn-info.btn-xs.selectImage").live('click', function(event) {
          var nRow = $(this).parents('tr')[0];
          editor.loadPlugin('multiimage', function() {
            editor.plugin.multiImageDialog({
              clickFn : function(urlList) {
                var Data = "?action=AddImage&id="+$(nRow).children("td:first").text();

                K.each(urlList, function(i, data) {  
                                      Data+="&name="+data.url;
                                });
                  
                editor.hideDialog();
                
                window.location='<%=basePath%>Admin/Image'+Data; 
			         
              }
            });
          });
        });

      });
    </script>

    <script type="text/javascript" charset="utf-8">
          $(document).ready(function() {
              $("a.myModal").live('click', function(event) {
                /* Act on the event */
                var context=$(this).children("img").attr('src');
                $("#modal-img").attr('src',context);

                $('#myModal').modal('show');
              });
              
              $("a.btn.btn-xs.btn-info.myModal2").live('click', function(event) {
                /* Act on the event */
                //获取文本内容
                var context=$(this).children("div").html();
                $("#message-detail").html(context);

                $('#myModal2').modal('show');
              });



              var projectTable=  $('#project-list').dataTable({
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

              var catalogTable = $('#project-catalog').dataTable({
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

              $('#project-list buttonbtn.btn-danger.btn-xs').live('click', function () {

                  if (confirm("确定删除吗?") == false) {
                      return;
                  }

                  $(this).html("<i class='icon-trash'></i>&nbsp;正在删除");

                  var nRow = $(this).parents('tr')[0];
                  
                  $.post('<%=basePath%>Admin/Project', 
                          {
                            action: 'DeleteProject',
                            id: $(nRow).children("td:first").text()
                          },
                          function(data){
                        	//删除该行
                            projectTable.fnDeleteRow(nRow);
                          }  
                        );
              } );
              
              $('#project-list button.btn.btn-primary.btn-xs.btn-edit').live('click', function () {
           	  
            	  var nRow = $(this).parents('tr')[0];
            	  
            	  window.location="<%=basePath%>Admin/Project?action=UpdateProject&id="+$(nRow).children("td:first").text();
              } );
              
              
              $('#project-list button.btn.btn-primary.btn-xs.btn-search').live('click', function () {
               	  
            	  var nRow = $(this).parents('tr')[0];
            	  
            	  window.location="<%=basePath%>Admin/Image?id="+$(nRow).children("td:first").text();
              } );

             
              $('#project-catalog button.btn.btn-info.btn-xs').live('click', function () {

                  if (confirm("确定删除吗?") == false) {
                      return;
                  }

                  $(this).html("<i class='icon-trash'></i>&nbsp;正在删除");

                  var nRow = $(this).parents('tr')[0];
                  
                  $.post('<%=basePath%>Admin/Project', 
                          {
                            action: 'DeleteCatalog',
                            id: $(nRow).children("td:first").text()
                          },
                          function(data){
                        	//删除该行
                            projectTable.fnDeleteRow(nRow);
                          }  
                        );
              } );
              
          } );
      </script>
  </body>
</html>
