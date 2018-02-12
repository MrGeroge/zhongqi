<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE html>
<base href="<%=basePath%>">
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><title>
	众启
</title><link rel="Shortcut Icon" href="img/favicon.ico"><link rel="Bookmark" href="img/favicon.ico">
    <!--公用-->
    <script type="text/javascript" charset="UTF-8" src="./js/logb02.js"></script><script src="./js/jquery-1.7.2.js" type="text/javascript"></script>
    <script src="./js/jquery.easing.js" type="text/javascript"></script>
    <link href="./css/beas.css" rel="stylesheet" type="text/css"><link href="./css/inof.css" rel="stylesheet" type="text/css"><link href="./css/JQstyle.css" rel="stylesheet" type="text/css">
    <script src="./js/back.js"></script>
    <script src="./js/nav.js" type="text/javascript"></script>

     <script src="./js/urlRewrit.js"></script>

    <link href="http://fonts.googleapis.com/css?family=News+Cycle" rel="stylesheet" type="text/css">
    <!--公用-->
    <style type="text/css">
        @font-face { font-family: 'dd'; src: url('font/Novecentowide-Normal.otf'); src: local('dd'), url('Novecentowide-Normal.otf'); }

        .num { font-family: miso-bold; }
    </style>
    <script src="./js/state.js"></script>
    
    
<link href="http://fonts.googleapis.com/css?family=News+Cycle" rel="stylesheet" type="text/css">
<script></script><script id="hp_same_"></script><script id="hp_done_"></script><style>@-moz-keyframes nodeInserted{from{opacity:0.99;}to{opacity:1;}}@-webkit-keyframes nodeInserted{from{opacity:0.99;}to{opacity:1;}}@-o-keyframes nodeInserted{from{opacity:0.99;}to{opacity:1;}}@keyframes nodeInserted{from{opacity:0.99;}to{opacity:1;}}embed,object{animation-duration:.001s;-ms-animation-duration:.001s;-moz-animation-duration:.001s;-webkit-animation-duration:.001s;-o-animation-duration:.001s;animation-name:nodeInserted;-ms-animation-name:nodeInserted;-moz-animation-name:nodeInserted;-webkit-animation-name:nodeInserted;-o-animation-name:nodeInserted;}</style></head>
<body style="float: left;">
        <jsp:include page="header.jsp"></jsp:include>
        <div class="bread_bg"></div>
        <div class="box_bg">
            <div class="Details">
              <div class="Position">
                <ul>
                    <span><a href="<%=basePath%>Home">首页</a></span>
                    <span>&gt;</span><span>新闻中心</span>
                </ul>
                <h1>
                     <img src="./img/header/Blog.jpg" width="1000" height="128">
                </h1>
            </div>
            <div class="Middle_box">
                <div class="left_box">
                    <ul>
                         <c:forEach var="catalog" items="${catalogs}">
                            <li id="li${catalog.id}"><a href="Home?action=Blog&catalog=${catalog.id}">${catalog.name}</a></li>
                         </c:forEach>
                    </ul>
                    <script type="text/javascript">

                        $(document).ready(function () {
                        //设置当前左边状态
                           $("#li" + request("catalog")).addClass("hover");
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
                </div>
                <div class="right_box">
                    <div class="gy_Activities" style="padding-top: 18px;">
                          <ul>
                            <c:forEach var="blog" items="${blogs}">
                              <li >
                               <strong><em>${blog.day}</em>${blog.year}-${blog.month}</strong>
                               <a href="Home?action=BlogDetail&id=${blog.id}&catalog=${blog.blogCatalog.id}"  target="_blank">${blog.title}</a>
                               <p>
                                  <a href="Home?action=BlogDetail&id=${blog.id}"  target="_blank">
                                     ${blog.shortContent}...
                                  </a>
                               </p>
                              </li>
                            </c:forEach>
                          </ul>
                    </div>
                </div>       
    <!--分页public  begin-->
    <div class="fany">
       <ul>
	      <div class="pages" style="width:100%;text-align:left;">
               <a href="Home?action=Blog&catalog=${currentCata}&index=${page.prePage}" style="margin-right:5px;">&lt;&lt;</a>
                 <c:forEach var="i" begin="1" end="${page.totalCount/page.everyPage+1}">
                    <c:choose>
                       <c:when test="${page.currentPage ==i}" >
                          <span style="margin-right: 5px; font-weight: bold; color: rgb(255, 255, 255);">${i}</span>
                       </c:when>
                       <c:otherwise>
                          <a href="Home?action=Blog&catalog=${currentCata}&index=${i}" style="margin-right:5px;">${i}</a>
                       </c:otherwise>
                    </c:choose>
                 </c:forEach>           
               <a href="Home?action=Blog&catalog=${currentCata}&index=${page.nextPage}" >&gt;&gt;</a>
          </div>
       </ul>
    </div>
    <!--分页public  end-->

</div>





                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
					$(function(){
						$(".gy_Activities ul li").hover(function(){
							$(this).addClass("cur").siblings().removeClass("cur");
						},function(){
							$(".gy_Activities ul li").removeClass("cur");
						});
					});
				</script>

        <!--公用-->
        <jsp:include page="footer.jsp"></jsp:include>
        <!--公用-->
  </body></html>