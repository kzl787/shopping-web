
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 78740
  Date: 2021/11/29
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>WeChatpay.jsp</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">


    <link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/order/payWechat.css'/>">
    <script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
</head>
<body>
<div class="divContent">
    <span class="spanPrice">支付金额：</span><span class="price_t">&yen;888.8</span>
    <span class="spanOid">编号：请打钱解锁内容</span>
</div>
<div>
    <a class="tishi">温馨提示，付款一时爽，一直付款一直爽，本订单将不会发货（付款有惊喜）</a>
    <div><img align="middle" src="<c:url value='/images/payWechat.jpg'/>"/></div>
</div>
</body>
</html>
