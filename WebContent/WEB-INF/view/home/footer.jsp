<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <div class="bottom_02">
            <div class="foot_bottom">
                <div class="record">
                    <div class="dbu">
                        <h1>上海众启装饰有限公司   版权所有</h1>
                        <ul>

                            <li id="li118"><a href="#">联络我们</a></li>
                            <li><a href="<%=basePath%>law.jsp">法律声明</a></li>
                            <li><a href="<%=basePath%>map.jsp">网站地图</a></li>
                            <li><a href="http://www.zhongqi-sh.mingdao.com" target="_blank">办公平台</a></li>
                        </ul>
                        <p>
                            <a>
                                沪ICP备13007606号
                            </a>
                        </p>
                        <br/>
                        <p style="margin-left:10px;">
                            <a>
                                STrival 设计支持
                            </a>
                        </p>
                    </div>
                </div>
                <div class="xian_bg"></div>
            </div>
        </div>
    