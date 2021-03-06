<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'bookdesc.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="<c:url value='/adminjsps/admin/css/book/add.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/jquery/jquery.datepick.css'/>">
<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jquery/jquery.datepick.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jquery/jquery.datepick-zh-CN.js'/>"></script>
<script type="text/javascript">
$(function () {
	$("#publishtime").datepick({dateFormat:"yy-mm-dd"});
	$("#printtime").datepick({dateFormat:"yy-mm-dd"});
	
	$("#btn").addClass("btn1");
	$("#btn").hover(
		function() {
			$("#btn").removeClass("btn1");
			$("#btn").addClass("btn2");
		},
		function() {
			$("#btn").removeClass("btn2");
			$("#btn").addClass("btn1");
		}
	);
	
	$("#btn").click(function() {
		var bname = $("#bname").val();
		var currPrice = $("#currPrice").val();
		var price = $("#price").val();
		var discount = $("#discount").val();
		var author = $("#author").val();
		var press = $("#press").val();
		var pid = $("#pid").val();
		var cid = $("#cid").val();
		var image_w = $("#image_w").val();
		var image_b = $("#image_b").val();
		
		if(!bname || !currPrice || !price || !discount || !author || !press || !pid || !cid || !image_w || !image_b) {
			alert("????????????????????????????????????????????????????????????1????????????2?????????????????????????????????????????????");
			return false;
		}
		
		if(isNaN(currPrice) || isNaN(price) || isNaN(discount)) {
			alert("???????????????????????????????????????????????????");
			return false;
		}
		$("#form").submit();
	});
	$("#pid").change(function() {
		var pid = $("#pid").val();
		$.ajax({
			async:true,
			cache:false,
			url:"/AdminBookServlet",
			data: {method:"ajxfindChid", pid:pid},
			type:"POST",
			dataType:"json",
			success:function (result){
				$("#cid").empty();
				$("#cid").append($("<option>====?????????????????????===</option>"));
				for(var i = 0; i < result.length; i++){
					$("#cid").append("<option value='"+result[i].cid+"'>"+result[i].cname+"</option>");
				}
			}
		});
	});
});


</script>
  </head>
  
  <body>
  <div>
   <p style="font-weight: 900; color: red;">${msg }</p>
   <form action="<c:url value='/AddBookServlet'/>" enctype="multipart/form-data" method="post" id="form">
    <div>
	    <ul>
	    	<li>????????????<input id="bname" type="text" name="bname" value="????????????" style="width:500px;"/></li>
			<div>??????????????????????????????350*350</div>
	    	<li>?????????????????????<input id="image_w" type="file" name="image_w"/></li>
	    	<li>???    ???????????????<input id="image_b" type="file" name="image_b"/></li>
	    	<li>????????????<input id="price" type="text" name="currPrice" value="999" style="width:50px;"/></li>
	    	<li>????????????<input id="currPrice" type="text" name="price" value="999" style="width:50px;"/>
	    	?????????<input id="discount" type="text" name="discount" value="9" style="width:30px;"/>???</li>
	    </ul>
		<hr style="margin-left: 50px; height: 1px; color: #dcdcdc"/>
		<table>
			<tr>
				<td colspan="3">
					???????????????<input type="text" id="author" name="author" value="author" style="width:150px;"/>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					???????????????<input type="text" name="press" id="press" value="?????????????????????" style="width:200px;"/>
				</td>
			</tr>
			<tr>
				<td colspan="3">???????????????<input type="text" id="publishtime" name="publishtime" value="2021-11-30" style="width:100px;"/></td>
			</tr>
			<tr>
				<td>???????????????<input type="text" name="edition" id="edition" value="1" style="width:40px;"/></td>
				<td>???????????????<input type="text" name="pageNum" id="pageNum" value="100" style="width:50px;"/></td>
				<td>???????????????<input type="text" name="wordNum" id="wordNum" value="1000" style="width:80px;"/></td>
			</tr>
			<tr>
				<td width="250">???????????????<input type="text" name="printtime" id="printtime" value="2021-11-30" style="width:100px;"/></td>
				<td width="250">???????????????<input type="text" name="booksize" id="booksize" value="1" style="width:30px;"/></td>
				<td>???????????????<input type="text" name="paper" id="paper" value="?????????" style="width:80px;"/></td>
			</tr>
			<tr>
				<td>
					???????????????<select name="pid" id="pid" >
						<option value="">==?????????1?????????==</option>
					<c:forEach items="${parentList}" var="parent">
			    		<option value="${parent.cid}">${parent.cname}</option>
					</c:forEach>
					</select>
				</td>
				<td>
					???????????????<select name="cid" id="cid">
						<option value="">==?????????2?????????==</option>
					</select>
				</td>
				<td></td>
			</tr>
			<tr>
				<td>
					<input type="button" id="btn" class="btn1" value="????????????">
				</td>
				<td></td>
				<td></td>
			</tr>
		</table>
	</div>
   </form>
  </div>

  </body>
</html>
