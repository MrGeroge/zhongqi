<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>
<%@ page import="net.zypro.zq.bean.*" %>
<%@ page import="net.zypro.zq.service.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
UserManager uManager=ServiceFactory.getUserManager();
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>
	众启
</title><link rel="Shortcut Icon" href="img/favicon.ico"><link rel="Bookmark" href="img/favicon.ico">
    <!--公用-->
    <script type="text/javascript" charset="UTF-8" src="./js/logb01.js"></script><script src="./js/jquery-1.7.2.js" type="text/javascript"></script>
    <script src="./js/jquery.easing.js" type="text/javascript"></script>
    <link href="./css/beas.css" rel="stylesheet" type="text/css"><link href="./css/inof.css" rel="stylesheet" type="text/css"><link href="./css/JQstyle.css" rel="stylesheet" type="text/css">
    <script src="./js/back.js"></script>
    <script src="./js/nav.js" type="text/javascript"></script>

     <script src="./js/urlRewrit.js"></script>

    <link href="./css/css" rel="stylesheet" type="text/css">
    <!--公用-->
    <style type="text/css">
        @font-face { font-family: 'dd'; src: url('font/Novecentowide-Normal.otf'); src: local('dd'), url('Novecentowide-Normal.otf'); }

        .num { font-family: miso-bold; }
    </style>
    <script src="./js/state.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            //设置当前左边状态
            $("#li" + request("typeid")).addClass("hover");

            //取得当前地址参数对应的值

        });
        function request(paras) {
            var url = location.href;
            var paraString = url.substring(url.indexOf("?") + 1, url.length).split("&");
            var paraObj = {}
            for (i = 0; j = paraString[i]; i++) {
                paraObj[j.substring(0, j.indexOf("=")).toLowerCase()] = j.substring(j.indexOf("=") + 1, j.length);
            }
            var returnValue = paraObj[paras.toLowerCase()];
            if (typeof (returnValue) == "undefined") {
                return "";
            } else {
                return returnValue;
            }
        }
    </script>
    
<script></script><style>@-moz-keyframes nodeInserted{from{opacity:0.99;}to{opacity:1;}}@-webkit-keyframes nodeInserted{from{opacity:0.99;}to{opacity:1;}}@-o-keyframes nodeInserted{from{opacity:0.99;}to{opacity:1;}}@keyframes nodeInserted{from{opacity:0.99;}to{opacity:1;}}embed,object{animation-duration:.001s;-ms-animation-duration:.001s;-moz-animation-duration:.001s;-webkit-animation-duration:.001s;-o-animation-duration:.001s;animation-name:nodeInserted;-ms-animation-name:nodeInserted;-moz-animation-name:nodeInserted;-webkit-animation-name:nodeInserted;-o-animation-name:nodeInserted;}</style><script id="hp_same_"></script><script id="hp_done_"></script></head>
<body style="float: left;">

        <jsp:include page="header.jsp"></jsp:include>

        <!--漂浮广告 strat-->
        <!--<div id="img1" style="position:absolute; z-index:9999999"><h1 style="width:330px; text-align:right;"><span style="cursor:pointer"><img src="images/btnClose.png"></span></h1>    <a href="#://companyadc.51job.com/companyads/2014/shzh/baoneng0223_8829wh/index.htm" target="_blank"><img src="images/float.gif" border="0" width="317" /></a></div>-->
        <script src="./js/float.js"></script>
        <script type="text/javascript">
            var ad1 = new AdMove("img1", true);
            ad1.Run();
            $(function () {

                $("#img1 > h1 > span").click(function () {
                    $("#img1").hide();
                });
            });
        </script>

        <!--漂浮广告 and-->
        <!--页面-->
        <script src="./js/focus_01.js" type="text/javascript"></script>
        <script type="text/javascript" src="./js/lrscroll.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#demo-03").jCarouselLite({
                    btnPrev: "#prev-03",
                    btnNext: "#next-03",
                    //easing: "bounceout",//动画接口
                    //vertical: true,//上下切换参数
                    circular: true,
                    auto: 800,
                    speed: 3000,
                    visible: 3
                });
            });
        </script>
        <!--页面-->
        <div class="foc_bg">
            <div id="focus" class="bread">
                <ul>
                    <%
                      List<IndexImage> images=(List<IndexImage>)request.getAttribute("images");
                      
                      if(images!=null)
                      {
                         Iterator<IndexImage> it=images.iterator();
                         int count=1;
                         while(it.hasNext())
                         {
                        	pageContext.setAttribute("count", count);
                        	IndexImage image=it.next();
                        	%>
                        	 <c:choose>
                        	  <c:when test="${count==1}">
                        	    <li style="background-image: url(<%=image.getPath()%>); z-index: ${count}; display: list-item; background-position: 50% 0%; background-repeat: no-repeat no-repeat;"></li>
                        	  </c:when>
                        	  <c:otherwise>
                        	     <li style="background-image: url(<%=image.getPath()%>); z-index: ${count}; background-position: 50% 0%; background-repeat: no-repeat no-repeat; "></li>
                        	  </c:otherwise>
                        	 </c:choose>
                        	<%
                    	    count--;
                         }
                      }
                    %>
                </ul>
            </div>
            <div class="box">
                <div class="span">
                    <ul>
                        <dl>
                            <a class="hover"></a>
                            <a></a>
                            <a></a>
                            <a></a>
                            <a></a>
                        </dl>
                        <li id="next" class="next"></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="Intr_box">
            <div class="jian_Intr">
                <div class="bg_01"></div>
                <div class="bg_02"></div>
                <div class="intr_top">
                    <script type="text/javascript" src="./js/marquee.js"></script>
                    <script type="text/javascript">
                        $(function () {
                            $("#marqee").kxbdSuperMarquee({
                                distance: 40,
                                time: 3,
                                direction: 'up'
                            });
                        });
                    </script>
                </div>
                <div class="intr_left">
                    <h1>
                        <%
                          pageContext.setAttribute("blogCatalogs",uManager.findAllBlogCatalogs());
                        pageContext.setAttribute("projectCatalogs", uManager.findAllProjectCatalogs());
                        %>
                        <img src="./img/h1_01.jpg"><a href="<%=basePath%>Home?action=Blog&catalog=${blogCatalogs[0].id}"></a>
                    </h1>
                    <h2></h2>
                    <ul>
                        <c:forEach var="blog" items="${news}">
                           <li><a href="<%=basePath%>Home?action=BlogDetail&id=${blog.id}&catalog=${blog.blogCatalog.id}">${blog.title}</a></li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="intr_right">
                    <h1>
                        <img src="./img/h1_02.jpg"><a href="<%=basePath%>Home?action=Project&catalog=${projectCatalogs[0].id}"></a>
                    </h1>
                    <div class="gu_z">
                        <div class="carousel">
                            <a href="javascript:void(0);" id="prev-03" class="prev_1"></a>
                            <div class="jCarouselLite_1" id="demo-03" style="visibility: visible; overflow: hidden; position: relative; z-index: 2; left: 0px; width: 597px;">
                                <ul style="margin: 0px; padding: 0px; position: relative; list-style-type: none; z-index: 1; width: 2985px; left: -1989.7324555555556px;">
                                    <c:forEach var="project" items="${projects}">
                                        <li style="overflow: hidden; float: left; width: 192px; height: 145px;">
                                           <a href="#">
                                            <img src="${project.cover}" width="192" height="121">
                                           </a><p>${project.name}</p>
                                         </li>  
                                    </c:forEach>
                                </ul>
                            </div>
                            <a href="javascript:void(0);" id="next-03" class="prev_2"></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="wenh">
                <div class="wen_bg">
                    <div class="gony_jin">
                    </div>
                    <div class="Layout">
                        <h1 style="margin-left:100px;">

                            <img src="./img/sy_h2.jpg">
                        </h1>
                        <ul style="margin-left:100px;">

                            <li><a href="#">上海</a></li>

                            <li><a href="# ">天津</a></li>

                            <li><a href="#">沈阳</a></li>

                            <li><a href="#">大连</a></li>

                            <li><a href="#">重庆</a></li>

                            <li><a href="#">昆明</a></li>

                            <li><a href="#">太原</a></li>

                            <li><a href="#">温州</a></li>

                            <li><a href="#">盘锦</a></li>

                            <li><a href="#">建湖</a></li>

                            <li class="tb"><a href="javascript:void">更多城市 &gt;</a></li>
                        </ul>
                    </div>
                    <!--新加--->
                    <div class="cs_gd">
                        <ul>

                            <li><a href="#">上海</a></li>

                            <li><a href="# ">天津</a></li>

                            <li><a href="#">沈阳</a></li>

                            <li><a href="#">大连</a></li>

                            <li><a href="#">重庆</a></li>

                            <li><a href="#">昆明</a></li>

                            <li><a href="#">太原</a></li>

                            <li><a href="#">温州</a></li>

                            <li><a href="#">盘锦</a></li>

                            <li><a href="#">建湖</a></li>

                            <li><a href="#">石家庄</a></li>

                            <li><a href="#">葫芦岛</a></li>

                            <li><a href="#">阜宁</a></li>

                            <li><a href="#">本溪</a></li>
                        </ul>
                        <p></p>
                    </div>
                    <script type="text/javascript">
                        $(document).ready(function () {
                            $(".cs_gd p").click(function () {
                                $(".cs_gd").slideToggle();
                                //$(".cs_gd").hide();
                            });
                            $(".tb").click(function () {
                                $(".cs_gd").slideToggle();
                                //$(".cs_gd").show();
                            });
                        });
                    </script>
                    <!--新加-->
                </div>
            </div>
        </div>
        <!--公用-->
       <jsp:include page="footer.jsp"></jsp:include>

</body></html>