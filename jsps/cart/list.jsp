<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>cartlist.jsp</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<script src="<c:url value='/js/round.js'/>"></script>
	
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/cart/list.css'/>">
<script type="text/javascript">
$(function() {
	showTotal();//计算总计


	$("#selectAll").click(function() {

		var bool = $("#selectAll").attr("checked");
		setItemCheckBox(bool);
		setJieSuan(bool);
		showTotal();
	});
	$(":checkbox[name=checkboxBtn]").click(function() {
		var all = $(":checkbox[name=checkboxBtn]").length;//所有条目的个数
		var select = $(":checkbox[name=checkboxBtn][checked=true]").length;//获取所有被选择条目的个数
		if(all == select) {//全都选中了
			$("#selectAll").attr("checked", true);//勾选全选复选框
			setJieSuan(true);//让结算按钮有效
		} else if(select == 0) {//谁都没有选中
			$("#selectAll").attr("checked", false);//取消全选
			setJieSuan(false);//让结算失效
		} else {
			$("#selectAll").attr("checked", false);//取消全选
			setJieSuan(true);//让结算有效
		}
		showTotal();//重新计算总计
	});

	$(".jian").click(function() {
		// 获取cartItemId
		var id = $(this).attr("id").substring(0, 32);
		// 获取输入框中的数量
		var quantity = $("#" + id + "Quantity").val();
		// 判断当前数量是否为1，如果为1,那就不是修改数量了，而是要删除了。
		if(quantity == 1) {
			if(confirm("您是否真要删除该条目？")) {
				location = "/CartItemServlet?method=deleteGoods&itemsId=" + id;
			}
		} else {
			sendUpdateQuantity(id, Number(quantity) - 1);
		}
	});

	// 给加号添加click事件
	$(".jia").click(function() {
		// 获取cartItemId
		var id = $(this).attr("id").substring(0, 32);
		// 获取输入框中的数量
		var quantity = $("#" + id + "Quantity").val();
		sendUpdateQuantity(id, Number(quantity) + 1);
	});
});

// 请求服务器，修改数量。
function sendUpdateQuantity(id, number) {
	$.ajax({
		async:false,
		cache:false,
		url:"/CartItemServlet",
		data:{method:"updateNumber",cartItemId:id,number:number},
		type:"POST",
		dataType:"json",
		success:function(result) {
			//1. 修改数量
			$("#" + id + "Quantity").val(result.number);
			//2. 修改小计
			$("#" + id + "Subtotal").text(result.totalPrice);
			//3. 重新计算总计
			showTotal();
		}
	});
}

function showTotal() {
	var total = 0;
	$(":checkbox[name=checkboxBtn][checked=true]").each(function() {
		//2. 获取复选框的值，即其他元素的前缀
		var id = $(this).val();
		//3. 再通过前缀找到小计元素，获取其文本
		var text = $("#" + id + "Subtotal").text();
		//4. 累加计算
		total += Number(text);
	});
	// 5. 把总计显示在总计元素上
	$("#total").text(round(total, 2));//round()函数的作用是把total保留2位
}

function setItemCheckBox(bool) {
	$(":checkbox[name=checkboxBtn]").attr("checked", bool);
}

function setJieSuan(bool) {
	if(bool) {
		$("#jiesuan").removeClass("kill").addClass("jiesuan");
		$("#jiesuan").unbind("click");//撤消当前元素止所有click事件
	} else {
		$("#jiesuan").removeClass("jiesuan").addClass("kill");
		$("#jiesuan").click(function() {return false;});
	}

}

function Delete() {
	// 1. 获取所有被选中条目的复选框
	// 2. 创建一数组，把所有被选中的复选框的值添加到数组中
	// 3. 指定location为CartItemServlet，参数method=batchDelete，参数cartItemIds=数组的toString()
	var cartItemIdArray = new Array();
	$(":checkbox[name=checkboxBtn][checked=true]").each(function() {
		cartItemIdArray.push($(this).val());//把复选框的值添加到数组中
	});
	location = "/CartItemServlet?method=deleteGoods&itemsId=" + cartItemIdArray;
}

function jiesuan() {
	// 1. 获取所有被选择的条目的id，放到数组中
	var cartItemIdArray = new Array();
	$(":checkbox[name=checkboxBtn][checked=true]").each(function() {
		cartItemIdArray.push($(this).val());//把复选框的值添加到数组中
	});
	// 2. 把数组的值toString()，然后赋给表单的cartItemIds这个hidden
	$("#cartItemIds").val(cartItemIdArray.toString());
	// 把总计的值，也保存到表单中
	$("#hiddenTotal").val($("#total").text());
	$("#form1").submit();
}




</script>
  </head>
  <body>
  <c:if test="${cartItems eq null}">

	<table width="95%" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td align="right">
				<img align="top" src="<c:url value='/images/icon_empty.png'/>"/>
			</td>
			<td>

				<span class="spanEmpty">您的购物车中暂时没有商品</span>

			</td>
		</tr>
	</table>
  </c:if>
<br/>
<br/>


<table width="95%" align="center" cellpadding="0" cellspacing="0">
	<tr align="center" bgcolor="#efeae5">
		<td align="left" width="50px">
			<input type="checkbox" id="selectAll" checked="checked"/><label for="selectAll">全选</label>
		</td>
		<td colspan="2">商品名称</td>
		<td>单价</td>
		<td>数量</td>
		<td>小计</td>
		<td>操作</td>
	</tr>



<c:forEach items="${cartItems}" var="good">
	<tr align="center">
		<td align="left">
			<input value="${good.cartItemId}" type="checkbox" name="checkboxBtn" checked="checked"/>
		</td>
		<td align="left" width="70px">
			<a class="linkImage" href="<c:url value='/BookServlet?method=findbyBid&bid=${good.book.bid}'/>"><img border="0" width="54" align="top" src="<c:url value='/${good.book.image_b}'/>"/></a>
		</td>
		<td align="left" width="400px">
			<a href="<c:url value='/BookServlet?method=findbyBid&bid=${good.book.bid}'/>"><span>${good.book.bname}</span></a>
		</td>
		<td><span>&yen;<span class="currPrice" >${good.book.currPrice}</span></span></td>
		<td>
			<a class="jian" id="${good.cartItemId}Jian"></a><input class="quantity" readonly="readonly" id="${good.cartItemId}Quantity" type="text" value="${good.number}"/><a class="jia" id="${good.cartItemId}Jia"></a>
		</td>
		<td width="100px">
			<span class="price_n">&yen;<span class="subTotal" id="${good.cartItemId}Subtotal">${good.totalPrice}</span></span>
		</td>
		<td>
			<a href="<c:url value='/CartItemServlet?method=deleteGoods&itemsId=${good.cartItemId}'/>">删除</a>
		</td>
	</tr>
</c:forEach>
	
	<tr>
		<td colspan="4" class="tdBatchDelete">
			<a href="javascript:Delete();">批量删除</a>
		</td>
		<td colspan="3" align="right" class="tdTotal">
			<span>总计：</span><span class="price_t">&yen;<span id="total"></span></span>
		</td>
	</tr>
	<tr>
		<td colspan="7" align="right">
			<a href="javascript:jiesuan();" id="jiesuan" class="jiesuan"></a>
		</td>
	</tr>
</table>
	<form id="form1" action="<c:url value='/CartItemServlet'/>" method="post">
		<input type="hidden" name="cartItemIds" id="cartItemIds"/>
		<input type="hidden" name="total" id="hiddenTotal"/>
		<input type="hidden" name="method" value="jiesuan"/>
	</form>


  </body>
</html>
