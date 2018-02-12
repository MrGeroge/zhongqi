<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><title>
    众启
</title><link rel="Shortcut Icon" href="img/favicon.ico"><link rel="Bookmark" href="img/favicon.ico">
    <!--公用-->
    <script type="text/javascript" charset="UTF-8" src="./宝能集团_files/logb01.js"></script><script src="./js/jquery-1.7.2.js" type="text/javascript"></script>
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
    <script type="text/javascript">

        $(document).ready(function () {
            //设置当前左边状态
            $("#li" + request("id")).addClass("hover");

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
    
<script></script><script id="hp_same_"></script><script id="hp_done_"></script><style>@-moz-keyframes nodeInserted{from{opacity:0.99;}to{opacity:1;}}@-webkit-keyframes nodeInserted{from{opacity:0.99;}to{opacity:1;}}@-o-keyframes nodeInserted{from{opacity:0.99;}to{opacity:1;}}@keyframes nodeInserted{from{opacity:0.99;}to{opacity:1;}}embed,object{animation-duration:.001s;-ms-animation-duration:.001s;-moz-animation-duration:.001s;-webkit-animation-duration:.001s;-o-animation-duration:.001s;animation-name:nodeInserted;-ms-animation-name:nodeInserted;-moz-animation-name:nodeInserted;-webkit-animation-name:nodeInserted;-o-animation-name:nodeInserted;}</style></head>
<body  style="float: left;">
    <jsp:include page="header.jsp"></jsp:include>
    <div class="bread_bg"></div>
    <div class="box_bg">
        <div class="Details">
            <div class="Position">
                <ul>
                    <span id="ctl00_ContentPlaceHolder1_SiteMapPath2"><a href="#"><img alt="跳过导航链接" height="0" width="0" src="./img/WebResource.axd" style="border-width:0px;"></a>
                    <span><a href="#">首页</a></span>
                    <span> &gt; </span>
                    <span>${navTitle}</span><a id="ctl00_ContentPlaceHolder1_SiteMapPath2_SkipLink"></a></span>
                </ul>
                <h1>
                   <% 
                    String current=request.getParameter("action");
                    if(current==null)
                    {
	                   current="Index";
	                }else{
		                  if(current.equals("Page"))
		                  {
			                 current=request.getParameter("catalog");
		                  }
	                }%>
                    <img src="./img/header/<%=current%>.jpg" width="1000" height="128">
                </h1>
            </div>
            <div class="Middle_box">
                <div class="left_box">
                    <ul>
                        <c:forEach var="page" items="${pages}">
                            <li id="li${page.id}"><a href="<%=basePath%>Home?action=Page&catalog=${catalog}&id=${page.id}">${page.pageName}</a></li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="right_box">
                    <div class="Content_main Advantage text">
                       <div class="Clist">
                            <h2>${webPage.title}</h2>
                            ${webPage.content}
                       </div>
                    </div>
               </div>
           </div>
         </div>
    </div>
    

        <!--公用-->
        <jsp:include page="footer.jsp"></jsp:include>
</body></html>