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
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>
        众启
    </title>
    <link rel="Shortcut Icon" href="img/favicon.ico"/>
    <link rel="Bookmark" href="img/favicon.ico"/>
    <!--公用-->
    <script type="text/javascript" charset="UTF-8" src="./js/logb01.js"></script>
    <script src="./js/jquery-1.7.2.js" type="text/javascript"></script>
    <script src="./js/jquery.easing.js" type="text/javascript"></script>
    <link href="./css/beas.css" rel="stylesheet" type="text/css"/>
    <link href="./css/inof.css" rel="stylesheet" type="text/css"/>
    <link href="./css/JQstyle.css" rel="stylesheet" type="text/css"/>
    <script src="./js/back.js"></script>
    <script src="./js/nav.js" type="text/javascript"></script>

    <script src="./js/urlRewrit.js"></script>

    <link href="http://fonts.googleapis.com/css?family=News+Cycle" rel="stylesheet" type="text/css" />
    <!--公用-->
    <style type="text/css">
        @font-face {
            font-family: 'dd';
            src: url('font/Novecentowide-Normal.otf');
            src: local('dd'), url('Novecentowide-Normal.otf');
        }

        .num {
            font-family: miso-bold;
        }
    </style>
    <script src="./js/state.js"></script>
    <script id="hp_same_"></script>
    <script id="hp_done_"></script>
    <style>
        @-moz-keyframes nodeInserted {
            from {
                opacity: 0.99;
            }

            to {
                opacity: 1;
            }
        }

        @-webkit-keyframes nodeInserted {
            from {
                opacity: 0.99;
            }

            to {
                opacity: 1;
            }
        }

        @-o-keyframes nodeInserted {
            from {
                opacity: 0.99;
            }

            to {
                opacity: 1;
            }
        }

        @keyframes nodeInserted {
            from {
                opacity: 0.99;
            }

            to {
                opacity: 1;
            }
        }

        embed, object {
            animation-duration: .001s;
            -ms-animation-duration: .001s;
            -moz-animation-duration: .001s;
            -webkit-animation-duration: .001s;
            -o-animation-duration: .001s;
            animation-name: nodeInserted;
            -ms-animation-name: nodeInserted;
            -moz-animation-name: nodeInserted;
            -webkit-animation-name: nodeInserted;
            -o-animation-name: nodeInserted;
        }

        .title {
            font-family: 'Adobe Heiti Std';
            font-size: 25px;
        }

        #input {
            width: 70%;
            font-size: 15pt;
            font-family: 'Adobe Heiti Std';
        }

        #textarea {
            resize: none;
            width: 100%;
            height: 300px;
            font-size: 15pt;
            font-family: 'Adobe Heiti Std';
        }
    </style>
</head>
<body  style="float: left;">
        <jsp:include page="WEB-INF/view/home/header.jsp"></jsp:include>
        <div class="bread_bg"></div>
        <div class="box_bg">
            <div class="Details">

                <div class="Position">
                       <ul>
                           <li>
                              <span>
                              <a href="#"><img alt="跳过导航链接" height="0" width="0" src="./img/WebResource.axd" style="border-width:0px;"/></a>
                              <span><a href="#">首页</a></span>
                              <span> &gt; </span>
                              <span>网站地图</span><a></a>
                              </span>
                          </li>
                      </ul>
                    <h1>
                        <img src="./img/01.jpg" width="1000" height="128"/>
                    </h1>
                </div>
                <div class="Middle_box">
                    <div class="left_box">
                        <ul>
                            <li id="li10" class="hover"><a href="javascript:;">网站地图</a></li>
                        </ul>
                    </div>
                    <div class="right_box">
                        <div class="dit_dh">
                            <div></div>
                            <div class="dit_dal">
                                <h3>走进众启</h3>
                                <c:forEach var="catalog" items="${introCatalogs}">
                                  <div class="dit_lie">
                                    <h2><a href="<%=basePath%>Home?action=Page&catalog=Introduce&id=${catalog.id}">${catalog.pageName}</a></h2>
                                  </div>
                                </c:forEach>
                            </div>
                            <div class="dit_dal">
                                <h3>新闻中心</h3>
                                <c:forEach var="catalog" items="${blogCatalogs}">
                                    <div class="dit_lie">
                                       <h2><a href="<%=basePath%>Home?action=Blog&catalog=${catalog.id}"  >${catalog.name}</a></h2>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="dit_dal" style="padding-right:0;">
                                <h3>服务范围</h3>
                                <c:forEach var="catalog" items="${serviceCatalogs}">
                                   <div class="dit_lie">
                                    <h2><a href="<%=basePath%>Home?action=Page&catalog=Service&id=${catalog.id}">${catalog.pageName}</a></h2>
                                   </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="dit_dh">
                            <div></div>
                            <div class="dit_dal">
                                <h3>工程业绩</h3>
                                <c:forEach var="pcatalog" items="${projectCatalogs}">
                                   <div class="dit_lie">
                                    <h2><a href="<%=basePath%>Home?action=Project&catalog=${pcatalog.id}">${pcatalog.name}</a></h2>
                                   </div>
                                </c:forEach>
                            </div>
                            <div class="dit_dal">
                                <h3>人力资源</h3>                  
                                <c:forEach var="catalog" items="${personCatalogs}">
                                    <div class="dit_lie">
                                       <h2><a href="<%=basePath%>Home?action=Page&catalog=Person&id=${catalog.id}">${catalog.pageName}</a></h2>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="dit_dal" style="padding-right:0;">
                                <h3>联系我们</h3>
                                <div class="dit_lie">
                                    <h2><a href="<%=basePath%>Home?action=Contact&id=1">联系我们</a></h2>
                                </div>
                                <div class="dit_lie">
                                    <h2><a href="<%=basePath%>Home?action=Contact&id=2">客户留言</a></h2>
                                </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <jsp:include page="WEB-INF/view/home/footer.jsp"></jsp:include>
   </body>
</html>