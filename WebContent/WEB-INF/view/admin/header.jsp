<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
    <header class="header white-bg">
          <div class="sidebar-toggle-box">
              <div data-original-title="Toggle Navigation" data-placement="right" class="icon-reorder tooltips"></div>
          </div>
          <!--logo start-->
          <a href="javascript:;" class="logo" >众启建筑</a>
          <!--logo end-->
          <div class="top-nav ">
              <ul class="nav pull-right top-menu">
                  <li>
                      <input type="text" class="form-control search" placeholder="Search">
                  </li>
                  <!-- user login dropdown start-->
                  <li class="dropdown">
                      <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                          
                          <span class="username">管理员</span>
                          <b class="caret"></b>
                      </a>
                      <ul class="dropdown-menu extended logout">
                          <div class="log-arrow-up"></div>
                          <li><a href="<%=basePath%>Admin/Account"><i class="icon-cog"></i> 账户管理</a></li>
                          <li><a href="<%=basePath%>Home"><i class="icon-home"></i>众启主页</a></li>
                          <li><a href="<%=basePath%>Admin/Account?action=Logout"><i class="icon-key"></i>注销</a></li>
                      </ul>
                  </li>
                  <!-- user login dropdown end -->
              </ul>
          </div>
      </header>
      <!--header end-->
      <!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
                  <li class="sub-menu">
                      <a href="javascript:;">
                          <span>首页</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="<%=basePath%>Admin/Home">首页图片</a></li>
                      </ul>
                  </li>

                  <li>
                      <a href="<%=basePath%>Admin/Page?catalog=introduce">
                          <span>走进众启</span>
                      </a>
                  </li>

                  <li class="sub-menu">
                      <a href="javascript:;">
                          <span>新闻中心</span>
                      </a>
                      <ul class="sub">
                          <li><a href="<%=basePath%>Admin/Blog">新闻列表</a></li>
                          <li><a href="<%=basePath%>Admin/Blog?action=AddBlog">添加新闻</a></li>
                      </ul>
                  </li>

                  <li class="sub-menu">
                      <a href="javascript:;">
                          <span>工程业绩</span>
                      </a>
                      <ul class="sub">
                          <li><a href="<%=basePath%>Admin/Project">项目管理</a></li>
                          <li><a href="<%=basePath%>Admin/Image">项目图片</a></li>
                      </ul>
                  </li>

                  <li>
                      <a href="<%=basePath%>Admin/Page?catalog=service">
                          <span>服务范围</span>
                      </a>
                  </li>

                  <li>
                      <a href="<%=basePath%>Admin/Page?catalog=person">
                          <span>人力资源</span>
                      </a>
                  </li>

                  <li class="sub-menu">
                      <a href="javascript:;">
                          <span>联系我们</span>
                      </a>
                      <ul class="sub">
                          <li><a href="<%=basePath%>Admin/Message">客户留言</a></li>
                      </ul>
                  </li>
                  <!--multi level menu end-->

              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->