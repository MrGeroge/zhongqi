<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="net.zypro.zq.service.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
UserManager uManager=ServiceFactory.getUserManager();
pageContext.setAttribute("introCatalogs", uManager.findHeaders("introduce"));
pageContext.setAttribute("serviceCatalogs", uManager.findHeaders("service"));
pageContext.setAttribute("personCatalogs", uManager.findHeaders("person"));
//pageContext.setAttribute("contactCatalogs", uManager.findHeaders("contact"));
pageContext.setAttribute("blogCatalogs",uManager.findAllBlogCatalogs());
pageContext.setAttribute("projectCatalogs", uManager.findAllProjectCatalogs());

String current=request.getParameter("action");

if(current==null)
{
	current="Index";
	}else{
		if(current.equals("Page"))
		{
			current=request.getParameter("catalog");
		}
	}

Map<String,Integer> navMap=new HashMap<String,Integer>();
navMap.put("Index", new Integer(1));
navMap.put("Introduce", new Integer(2));
navMap.put("Blog", new Integer(3));
navMap.put("BlogDetail", new Integer(3));
navMap.put("Service", new Integer(4));
navMap.put("Project", new Integer(5));
navMap.put("ProjectDetail", new Integer(5));
navMap.put("Person", new Integer(8));
navMap.put("Contact", new Integer(9));

int id=navMap.get(current).intValue();
%>
<div class="topmina">
            <div class="top">
                <h1>
                    <a href="#">
                        <img src="./img/logo.jpg" width="123" height="33">
                    </a>
                </h1>
                <div class="nav">
                    <ul>
                        <li id="nav_1"><a href="#" ></a></li>
                        <li id="nav_2"><a href="<%=basePath%>Home?action=Page&catalog=Introduce&id=${introCatalogs[0].id}" ></a></li>
                        <li id="nav_3"><a href="<%=basePath%>Home?action=Blog&catalog=${blogCatalogs[0].id}"></a></li>
                        <li id="nav_4"><a href="<%=basePath%>Home?action=Page&catalog=Service&id=${serviceCatalogs[0].id}"></a></li>
                        <li id="nav_5"><a href="<%=basePath%>Home?action=Project&catalog=${projectCatalogs[0].id}" ></a></li>
                        <li id="nav_8"><a href="<%=basePath%>Home?action=Page&catalog=Person&id=${personCatalogs[0].id}" ></a></li>
                        <li id="nav_9"><a href="<%=basePath%>Home?action=Contact&id=1" ></a></li>
                    </ul>
                </div>
                <script type="text/javascript">
                     $(function () {
                        nav(<%=id%>);//设置菜单状态
                      });
                 </script>
                
                <!--二级导航-->
                <div class="subnav" style="display: none;">
                    <div class="mune" style="display: none;">&nbsp;</div>
                    <div class="s1 mune" style="display: block;">
                        <div class="title">
                            <img src="./img/s1.jpg">
                        </div>
                        <c:forEach var="catalog" items="${introCatalogs}">
                            <span><a href="<%=basePath%>Home?action=Page&catalog=Introduce&id=${catalog.id}">${catalog.pageName}</a></span>
                        </c:forEach>
                    </div>
                    <div class="s2 mune" style="display: none;">
                        <div class="title">
                            <img src="./img/s2.jpg">
                        </div>
                        <c:forEach var="catalog" items="${blogCatalogs}">
                            <span><a href="<%=basePath%>Home?action=Blog&catalog=${catalog.id}"  >${catalog.name}</a></span>
                        </c:forEach>
                    </div>
                    <div class="s3 mune" style="display: none;">
                        <div class="title">
                            <img src="./img/s3.jpg">
                        </div>
                        <c:forEach var="catalog" items="${serviceCatalogs}">
                            <span><a href="<%=basePath%>Home?action=Page&catalog=Service&id=${catalog.id}">${catalog.pageName}</a></span>
                        </c:forEach>
                    </div>
                    <div class="s4 mune" style="display: none;">
                        <div class="title">
                            <img src="./img/s4.jpg">
                        </div>
                        <c:forEach var="pcatalog" items="${projectCatalogs}">
                            <span><a href="<%=basePath%>Home?action=Project&catalog=${pcatalog.id}">${pcatalog.name}</a></span>
                        </c:forEach>
                    </div>
                    <div class="s5 mune" style="display: none;">
                        <div class="title">
                            <img src="./img/s5.jpg">
                        </div>
                        <c:forEach var="catalog" items="${personCatalogs}">
                            <span><a href="<%=basePath%>Home?action=Page&catalog=Person&id=${catalog.id}">${catalog.pageName}</a></span>
                        </c:forEach>
                    </div>
                    <div class="s6 mune" style="display: none;">
                        <div class="title">
                            <img src="./img/s6.jpg">
                        </div>
                        <span><a href="<%=basePath%>Home?action=Contact&id=1">联系我们</a></span>
                        <span><a href="<%=basePath%>Home?action=Contact&id=2">客户留言</a></span>
                    </div>
                </div>

                <div class="t_sou">
                    <h2>
                        <div class="child">
                            <h3>众启相关企业</h3>
                            <ul style="display: none;">
                                <li><a href="#">众奇设计</a></li>
                                <li><a href="http://www.zenithlock.com">臻典科技</a></li>
                            </ul>
                        </div>
                        <img src="./img/icon-ser.jpg" class="button">
                    </h2>
                    <p>
                        <input name="name" type="text" id="Text1"><span><img src="./img/closebtn.jpg"></span>
                    </p>
                    <script type="text/javascript">
                        $(function () {
                            $(".child").hover(function () {
                                $(this).find("ul").show();
                            }, function () {
                                $(this).find("ul").hide();
                            }).trigger("mouseleave");
                            $(".t_sou .button").click(function () {
                                $(".t_sou").animate({ width: 353 }, "fast");
                                $(".t_sou p").animate({ width: 158 }, 500, function () {
                                    $(".t_sou p span").show();
                                }).show();
                            });
                            $(".t_sou p span").click(function () {
                                $(this).hide();
                                $(".t_sou p").hide().animate({ width: 0 }, 500);
                                $(".t_sou").animate({ width: 192 }, "fast");
                            });
                        });
                    </script>
                </div>
            </div>
            <!--二级导航背景-->
            <div class="menu_bj"></div>
            <!--二级导航背景-->
        </div>
    