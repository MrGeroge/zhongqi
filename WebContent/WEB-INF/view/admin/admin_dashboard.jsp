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
        <style>
        .error {
            color:red;
        }
        .custom-header{
            text-align: center;
            padding: 3px;
            background: #000;
            color: #fff;
        }
    </style>
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
                  <div class="col-lg-4">
                      <section class="panel">
                          <header class="panel-heading">
                              用户信息
                          </header>
                          <div class="panel-body">
                             <div class="task-thumb-details">
                                  <h1>欢迎&nbsp;&nbsp;<a href="javascript:;">admin</a></h1>
                                  <p>权限级别: 最高权限</p>
                             </div>
                          </div> 
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
              <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                              用户列表
                          </header>
                          <div class="panel-body">
                                <form class="form-inline" role="form" id="form-addUser">
                                  <div class="form-group">
                                      <input type="text" class="form-control" id="newUsername" name="newUsername" placeholder="账户">
                                  </div>
                                  <div class="form-group">
                                      <input type="text" class="form-control" id="newPassword" name="newPassword" placeholder="密码">
                                  </div>
                                  <button type="submit" class="btn btn-info" id="btn-addUser">添加新用户</button>
                                </form>
                                <div class="adv-table">
                                    <table  class="display table table-bordered table-striped" id="example">
                                      <thead>
                                      <tr>
                                          <th>序号</th>
                                          <th>账户</th>
                                          <th>密码</th>
                                          <th>权限管理</th>
                                          <th>操作</th>
                                      </tr>
                                      </thead>
                                      <tbody>
                                      <c:forEach var="user" items="${users}">
                                      <tr class="gradeA">
                                          <td>${user.id}</td>
                                          <td>${user.username}</td>                                         
                                          <td>${user.password}</td>
                                          <td>
                                              <a href="javascript:;"  class="btn btn-xs btn-info myModal">
                                                                                                                              编辑权限
                                              </a>
                                          </td>
                                          <td>
                                              <button class="btn btn-danger btn-xs"><i class="icon-trash "></i>&nbsp;删除</button>
                                          </td>
                                      </tr>
                                      </c:forEach>
                                      </tbody>
                                      <tfoot>
                                      <tr>
                                          <th>序号</th>
                                          <th>账户</th>
                                          <th>密码</th>
                                          <th>权限管理</th>
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
                            <h4 class="modal-title">权限列表</h4>
                      </div>
                      <div class="modal-body" id="message-detail">
                             <form action="#" class="form-horizontal tasi-form">
                              <div class="form-group" id="access-list">

                              </div>
                           </form>
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
    <script type="text/javascript" src="js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="js/jquery.form.js"></script>
    <script type="text/javascript" language="javascript" src="assets/advanced-datatable/media/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="assets/jquery-multi-select/js/jquery.multi-select.js"></script>

    
    <!--common script for all pages-->
    <script src="js/respond.min.js" ></script>
    <script src="js/common-scripts.js"></script>

    <!--script for this page only-->

    <script type="text/javascript" charset="utf-8">
          $(document).ready(function() {
               jQuery.validator.addMethod("notEqualTo", function (value, element, param) {  
                              return value == $(param).val();  
               }, $.validator.format("两次输入不相同"));
               
               $("#form-addUser").validate({
                  rules: {
                	  newUsername: "required",
                	  newPassword: "required"
                  },
                  messages: {
                	  newUsername: "请输入账户名",
                      newPassword: "请输入密码"
                  },
                  submitHandler: function (form) {
                         
                      $(form).ajaxSubmit({
                          url:"<%=basePath%>Admin/Account?action=AddAccount",
                          success: function (data) {
                        	  if(data.status=='success')
                              {
                                alert("添加成功");
                                window.location="<%=basePath%>Admin/Account";
                              }
                          }
                      });
                  }
              });
               
               
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
   
              $("a.btn.btn-xs.btn-info.myModal").live('click', function(event) {
            	  var htmlNode="<div class='col-md-12'>\
				                      <select multiple='multiple' class='multi-select' id='my_multi_select1'>\
				                          <option value='1'>首页</option>\
				                          <option value='2'>走进众启</option>\
				                          <option value='3'>新闻中心</option>\
				                          <option value='4'>服务范围</option>\
				                          <option value='5'>工程业绩</option>\
				                          <option value='6'>人力资源</option>\
				                          <option value='7'>联系我们</option>\
				                      </select>\
              			        </div>";
                  $('#access-list').html(htmlNode);  //添加初始值
                  
                  //选中用户获取ID
                  var nRow = $(this).parents('tr')[0];
                  var userId=$(nRow).children("td:first").text();
                  
                  //获取权限列表
                  $.ajax({ 
				          type : "post", 
				          url : "<%=basePath%>Admin/Account", 
				          data : {
	                               action: 'ListAccess',
	                               id:userId
	                             }, 
				          async : false, 
				          success : function(data){ 
				        	  $.each(data, function(index, val) {
				        		     var option=$('#my_multi_select1').children("option")[val-1];
				        		     $(option).attr('selected', true);
				        		});
				          } 
				          }); 

                  $('#my_multi_select1').multiSelect({
                                    selectableHeader: "<div class='custom-header'>未赋予权限</div>",
                                    selectionHeader: "<div class='custom-header'>已拥有权限</div>",
                                    afterSelect:function(values){
                                    	 $.ajax({ 
                   				          type : "post", 
                   				          url : "<%=basePath%>Admin/Account", 
                   				          data : {
                   	                               action: 'AddAccess',
                   	                               id:userId,
                   	                               module:values[0]
                   	                             }, 
                   				          async : false
                                    	 });
                                                console.log("Select value: "+values+",UserId:"+userId);
                                    },
                                    afterDeselect: function(values){
                                    	$.ajax({ 
                     				          type : "post", 
                     				          url : "<%=basePath%>Admin/Account", 
                     				          data : {
                     	                               action: 'DeleteAccess',
                     	                               id:userId,
                     	                               module:values[0]
                     	                             }, 
                     				          async : false
                                      	 });
                                                console.log("Deselect value: "+values+",UserId:"+userId);
                                    }});

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

                  if (confirm("Are you sure to delete this row ?") == false) {
                      return;
                  }

                  $(this).html("<i class='icon-trash'></i>&nbsp;正在删除");

                  var nRow = $(this).parents('tr')[0];
         
                  $.post('<%=basePath%>Admin/Account', 
                          {
                            action: 'DeleteAccount',
                            id: $(nRow).children("td:first").text()
                          },
                          function(data){
                        	//删除该行
                            oTable.fnDeleteRow(nRow);
                          }  
                        );
              });
          } );
      </script>
  </body>
</html>
