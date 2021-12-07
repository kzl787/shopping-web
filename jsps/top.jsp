<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>top</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
	body {
		background: rgba(255, 140, 0, 0.98);
		margin: 0px;
		color: #ffffff;
	}
	a {
		text-transform:none;
		text-decoration:none;
		color: #ffffff;
		font-weight: 900;
	} 
	a:hover {
		text-decoration:underline;
	}
</style>
  </head>
  
  <body>
<h1 style="text-align: center;">光速购物网站</h1>
<div style="font-size: 10pt; line-height: 10px;">
<c:choose>
	<c:when test="${empty sessionScope.sessionUser}">
		<a href="<c:url value='/jsps/user/login1.jsp'/>" target="_parent">账户登录</a> |&nbsp;
		<a href="<c:url value='/jsps/user/regist.jsp'/>" target="_parent">注册账户</a>
	</c:when>
	<c:otherwise>
		光速会员：${sessionScope.sessionUser.loginname}&nbsp;&nbsp;|&nbsp;&nbsp;
		<a href="<c:url value='/CartItemServlet?method=findbyUid'/>" target="body">购物车</a>&nbsp;&nbsp;|&nbsp;&nbsp;
		<a href="<c:url value='/OrderServlet?method=findbyUid'/>" target="body">我的订单</a>&nbsp;&nbsp;|&nbsp;&nbsp;
		<a href="<c:url value='/jsps/user/pwd.jsp'/>" target="body">修改密码</a>&nbsp;&nbsp;|&nbsp;&nbsp;
		<a href="<c:url value='/UserServlet?method=quit'/>" target="_parent">退出</a>
	</c:otherwise>
</c:choose>
</div>
  </body>
</html>
