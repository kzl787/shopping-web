<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>pay.jsp</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/order/pay.css'/>">
	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>

<script type="text/javascript">
$(function() {
	$("img").click(function() {
		$("#" + $(this).attr("name")).attr("checked", true);
	});
	alert("֧���ɹ���");
});
</script>
  </head>
  
  <body>
<div class="divContent">
	<span class="spanPrice">֧����</span><span class="price_t">&yen;888.8</span>
	<span class="spanOid">��ţ������������</span>
</div>
<form action="<c:url value='/OrderServlet'/>" method="post" id="form1" target="_top">
<input type="hidden" name="method" value=""/>
<input type="hidden" name="oid" value=""/>
<div class="divBank">
	<div class="divText">΢��֧��</div>
	<div style="margin-left: 20px;">
	  <div style="margin-bottom: 20px;">
		  <div><a class="spanPrice">��ܰ��ʾ������һʱˬ��һֱ����һֱˬ�������������ᷢ���������о�ϲ��</a></div>
		  <div >
			  <img src="<c:url value="/bank_img/payWechat.bmp"/>" border="0" style="width:276px;height:380px;" alt="ͼƬ�޷�����ʱ֧��0Ԫ��"/>
			  <span><img src="<c:url value="/images/success.png"/> " ></span>
		  </div>
	  </div>
	</div>
<%--	<div style="margin: 40px;">--%>
<%--		<a href="javascript:alert('֧���ɹ���');" class="linkNext">��һ��</a>--%>
<%--	</div>--%>
</div>
</form>
  </body>
</html>
