<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en" class="">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>標籤名</title>

<!-- Tailwind is included -->
<!--   <link rel="stylesheet" href="/WEB-INF/resources/css/main.css?v=1628755089081"> -->
<c:set var="contextRoot" value="${pageContext.request.contextPath}"></c:set>
<link href="${contextRoot}/resources/backstage/css/main.css"
	rel="stylesheet" />

<link rel="apple-touch-icon" sizes="180x180" href="apple-touch-icon.png" />
<link rel="icon" type="image/png" sizes="32x32" href="favicon-32x32.png" />
<link rel="icon" type="image/png" sizes="16x16" href="favicon-16x16.png" />
<link rel="mask-icon" href="safari-pinned-tab.svg" color="#00b4b6" />

<meta name="description" content="Admin One - free Tailwind dashboard">

<meta property="og:url"
	content="https://justboil.github.io/admin-one-tailwind/">
<meta property="og:site_name" content="JustBoil.me">
<meta property="og:title" content="Admin One HTML">
<meta property="og:description"
	content="Admin One - free Tailwind dashboard">
<meta property="og:image"
	content="https://justboil.me/images/one-tailwind/repository-preview-hi-res.png">
<meta property="og:image:type" content="image/png">
<meta property="og:image:width" content="1920">
<meta property="og:image:height" content="960">

<meta property="twitter:card" content="summary_large_image">
<meta property="twitter:title" content="Admin One HTML">
<meta property="twitter:description"
	content="Admin One - free Tailwind dashboard">
<meta property="twitter:image:src"
	content="https://justboil.me/images/one-tailwind/repository-preview-hi-res.png">
<meta property="twitter:image:width" content="1920">
<meta property="twitter:image:height" content="960">

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="sweetalert2.all.min.js"></script>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-130795909-1"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());
	gtag('config', 'UA-130795909-1');
</script>

<style>
#productTable{
width: 1340px;
margin-left: 150px;
margin-bottom: 100px;
margin-top: 50px;
/* border: 1px solid black; */
background-color: rgb(199, 222, 238);
}

#select {
	width: 250px;
}

#leftBOX {
	width: 600px;
	float: left;
	margin-left: 150px;
}

#rightBOX {
	width: 600px;
	margin-left: 900px;
}


</style>
</head>

<body>
	<div id="app">
		<!---------------------------------------------------載入上方列---------------------------------------------------------------------------- -->
		<%@include file="topbar.jsp"%>
		<!---------------------------------------------------載入左側列 --------------------------------------------------------------------->
		<%@include file="leftbar.jsp"%>
		<!---------------------------------------------------------------------- 中間大框框-------------------------------------------------------------------->
		<p />
		<section class="is-hero-bar">
			<div
				class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
				<h1 class="title">訂單資訊</h1>
				<small class="text-gray-500"> 訂單編號：${order.orderStatus}
					 </small> <a
					href="${pageContext.request.contextPath}/orders/viewAllOrders"><button
						class="button light">返回訂單列表</button></a>
			</div>
		</section>
		<div class="container" id="tableDiv" >
			<table id="productTable">
				<thead>
					<tr>
						
						<th>產品圖片</th>
						<th>產品名稱</th>
						<th>數量</th>
						<th>商品單價</th>
						<th>商品小計</th>
						<th>修改時間</th>
					</tr>

				</thead>
				<c:set value="0" var="totalPrice" />
				<c:set value="0" var="sum" />
				<c:forEach var="OrderDetail" items="${OrderDetailSet}">
					<tbody>
						<tr>
												
							<td><img alt="picture"
								src="${contextRoot}/ProductTempImg/${OrderDetail.productBean.imgUrl}"
								width="112" /></td>
							<td id="productName" data-label="productName">${OrderDetail.productBean.productName}</td>
							<td id="quantity" class="quantity" data-label="quantity">${OrderDetail.quantity}</td>
							<td id="realPrice" class="realPrice" data-label="realPrice">${OrderDetail.realPrice}</td>
							<td id="totalPrice" data-label="totalPrice">${OrderDetail.quantity*OrderDetail.realPrice}</td>
							<c:set value="${OrderDetail.quantity*OrderDetail.realPrice}"
								var="totalPrice" />
							<c:set value="${sum + totalPrice}" var="sum" />
							<td data-label="modifiedAt" class="text-gray-500">${OrderDetail.modifiedAt}
								</td>
						</tr>
				</c:forEach>
			</table>
		</div>
		<!-- 		<div class="buttons right nowrap"> -->

		<%-- 			<input type="hidden" value="${OrdersBean.order_id}"> --%>

		<!-- 			<button type="button" class="button blue" data-bs-toggle="modal" -->
		<!-- 				data-bs-target="#exampleModal" data-bs-whatever="@mdo"> -->
		<%-- 				onclick = "findById('${OrdersBean.order_id}')"> --%>
		<%-- 				onclick="location.href='${contextRoot}/orders/OrderDetail/update?id=${OrdersBean.order_id}'"> --%>
		<!-- 				<span class="icon"><i class="mdi-update"></i></span>修改訂單明細 -->
		<!-- 			</button> -->
		<!-- 		</div> -->
		<!-- 		<hr> -->
		<!-- 		<div class="buttons right nowrap"> -->

		<%-- 			<input type="hidden" value="${OrdersBean.order_id}"> --%>

		<!-- 			<button type="button" class="button blue" data-bs-toggle="modal" -->
		<!-- 				data-bs-target="#exampleModal" data-bs-whatever="@mdo"> -->
		<%-- 				onclick = "findById('${OrdersBean.order_id}')"> --%>
		<%-- 				onclick="location.href='${contextRoot}/orders/OrderDetail/update?id=${OrdersBean.order_id}'"> --%>
		<!-- 				<span class="icon"><i class="mdi-update"></i></span>訂單出貨 -->
		<!-- 			</button> -->
		<!-- 		</div> -->
		<!-- 		<hr> -->
<!-- ==================================================================配送資料確認區================================================================== -->


		<div class="card" id="leftBOX">
			<header class="card-header">
				<p class="card-header-title">
					<span class="icon"><i class="mdi mdi-account"></i></span> 配送資訊
			</header>
			<div class="card-content">
				<!-- ==================form表單開始================== -->
				<!-- 				modelAttribute 就是JavaBean-->

				<form:form id="springForm"
					action="${pageContext.request.contextPath}/orders/UpdateOrderShipInfo/"
					modelAttribute="order" method="POST">

					<form:input hidden="hidden" path="orderId"
						value="${order.orderId}" />

					<!-- input 收件人 -->
					<div class="field">
						<form:label class="label" path="shipName">收件人</form:label>

						<div class="control">
							<span class="displayable">${order.shipName}</span>
							<form:input id="shipName" class="input inputable" hidden="hidden"
								type="text" path="shipName" required=""
								value="${order.shipName}" />
						</div>
						<p class="help">*必填</p>
						<p class="help">
							<form:errors style="color: red;" path="shipName" cssClass="error" />
						</p>
					</div>
					<!-- input 郵遞區號 -->
					<div class="field">
						<form:label class="label" path="shipPostalCode">郵遞區號</form:label>

						<div class="control">
							<span class="displayable">${order.shipPostalCode}</span>
							<form:input id="shipPostalCode" class="input inputable"
								hidden="hidden" type="text" path="shipPostalCode"
								value="${order.shipPostalCode}" />
						</div>
						<form:errors style="color: red;" path="shipPostalCode"
							cssClass="error" />
					</div>

					<!-- input 地址 -->
					<div class="field">
						<form:label class="label" path="shipAddress">配送地址</form:label>

						<div class="control">
							<span class="displayable">${order.shipAddress}</span>
							<form:input id="shipAddress" class="input inputable"
								hidden="hidden" type="text" path="shipAddress"
								value="${order.shipAddress}" />
						</div>
						<p class="help">*必填</p>
						<p class="help">
							<form:errors style="color: red;" path="shipAddress"
								cssClass="error" />
						</p>
					</div>


					<div class="field">
						<label class="label">訂單狀態</label>
							<c:choose>
   								 <c:when test="${order.orderStatus == 111}">
   								    <div class="control">
									<small class="text-gray-500">未出貨</small>
									</div>
 								 </c:when>
 								 <c:when test="${order.orderStatus == 222}">
   								    <div class="control">
									<small class="text-gray-500">已出貨</small>
									</div>
 								 </c:when>
   								 <c:when test="${order.orderStatus == 999}">
   								    <div class="control">
									<small class="text-gray-500">訂單已刪除</small>
									</div>  
  							     </c:when>
							     <c:otherwise>
   								    <div class="control">
									<small class="text-gray-500">資料庫沒有訂單狀態</small>
									</div>
   								 </c:otherwise>
							</c:choose>
					</div>
					<div class="field">
						<label class="label">時間戳記</label>
						<div class="control">
							<small class="text-gray-500"> ${order.orderDate}
								</p> 修改於 ${order.modifiedAt} 
							</small>
						</div>

						<!-- 						修改配送資訊 -->
						<!-- 						判斷是否開按鈕 -->
						<div class="buttons right nowrap">

							<input type="hidden" value="${OrdersBean.orderId}">
						<div  <c:if test="${order.orderStatus==999||order.orderStatus==222}">hidden</c:if>>
							<button type="button" class="button blue"
								id="order_UpdateShipInfo_btn" data-bs-toggle="modal"
								data-bs-target="#exampleModal" data-bs-whatever="@mdo"
								onclick="updateShipInformation()">
								<%--onclick="location.href='${contextRoot}/orders/OrderDetail/update?id=${OrdersBean.order_id}'"> --%>
								<span class="icon"><i class="mdi-message-outline"></i></span>修改配送資訊
							</button>
							</div>
						</div>

						<!-- 						修改配送資訊 -->
					</div>
					<hr hidden="hidden" class="forEdit">
					<!-- 					確認與取消修改按鈕 -->
					<div hidden="hidden" class="field grouped forEdit">
						<div hidden="hidden" class="control forEdit">
							<button id="sendUpdateInfo" type="button" id="submit" class="button green">確認修改</button>
						</div>

						<div hidden="hidden" class="control forEdit">
							<button id="cancelUpdateInfo" type="button" class="button red">取消</button>
						</div>
					</div>
					<!-- 					確認與取消修改按鈕 -->
				</form:form>
			</div>
		</div>
	</div>

<!-- ==================================================================配送資料確認區================================================================== -->
<!-- ==================================================================訂單確認區================================================================== -->
	<div class="card" id="rightBOX">
		<header class="card-header">
			<p class="card-header-title">
				<span class="icon"><i class="mdi mdi-account"></i></span> 訂單確認
			</p>
		</header>

		<div class="card-content">
			<!-- ==================form:form表單開始================== -->
			<!-- 				modelAttribute 就是JavaBean-->
			<form:form id="orderStatusForm"
				action="${pageContext.request.contextPath}/orders/UpdateOrderState/"
				modelAttribute="order" method="POST">

				<form:input hidden="hidden" path="orderId"
					value="${order.orderId}" />

				<!-- 								商品小計 -->
				<div class="field">
					<label class="label">商品小計</label>
					<div style="text-align: right" class="control">NT$ ${sum}</div>
				</div>
				<!-- 							input 運費 -->
				<div class="field">
					<form:label class="label" path="shippingFee">運費</form:label>

					<div class="control">
						<div style="text-align: right" class="displayable">NT$
							${order.shippingFee}</div>
						<form:input id="shippingFee" class="input inputable"
							hidden="hidden" type="text" path="shippingFee"
							value="${order.shippingFee}" />
					</div>
					<p class="help">*必填</p>
					<p class="help">
						<form:errors style="color: red;" path="shippingFee"
							cssClass="error" />
				</div>
				<!-- 							訂單總價 -->
				<div class="field">
					<label class="label">訂單總價</label>
					<div style="text-align: right" class="control">NT$
						${sum+order.shippingFee}</div>
				</div>

				<hr>
				<!-- 				訂單出貨 -->
				<div class="field">
					<label class="label">訂單狀態</label>
					<div  style="text-align: right" class="control">
						<select name="orderStatus" disabled style="width:450px;height:40px" id="orderStatus" class="button green">
							<option value="111" <c:if test="${order.orderStatus==111}"> selected </c:if>>未出貨</option>
							<option value="222" <c:if test="${order.orderStatus==222}"> selected </c:if>>已出貨</option>
							<option value="666" <c:if test="${order.orderStatus==666}"> selected </c:if>>顧客提出修改</option>
							<option value="999" <c:if test="${order.orderStatus==999}"> selected </c:if>>已刪除</option>
						</select>
					</div>
				</div>
				<div class="field">
					<label class="label">時間戳記</label>
					<div class="control">
						<small class="text-gray-500"> ${order.orderDate}
							</p> 修改於 ${order.modifiedAt} 
						</small>
					</div>
				</div>
				<!-- 							按鈕 -->
				<div class="buttons right nowrap">

					<input type="hidden" value="${OrdersBean.orderId}">
					<div  <c:if test="${order.orderStatus==999||order.orderStatus==222}">hidden</c:if>>
					<button type="button" class="button blue" id="order_ship_btn"
						data-bs-toggle="modal" data-bs-target="#exampleModal"
						data-bs-whatever="@mdo" >
						<!-- onclick="updateShipInformation()"> -->
						<%-- onclick="location.href='${contextRoot}/orders/OrderDetail/update?id=${OrdersBean.order_id}'"> --%>
						<span class="icon"><i class="mdi-update"></i></span>商品出貨！！
					</button>
					</div>
				</div>
				<hr hidden="hidden" class="forEdit">
				<!-- 												確認與取消修改按鈕 -->
				<div hidden="hidden" class="field grouped forEdit">
					<div hidden="hidden" class="control forEdit">
						<button id="sendUpdateStatus" type="button" id="submit" class="button green">確認修改</button>
					</div>

					<div hidden="hidden" class="control forEdit">
						<button id="cancelUpdateStatus" type="button" class="button red">取消</button>
					</div>
				</div>
				<!-- 												確認與取消修改按鈕 -->
			</form:form>
		</div>
	</div>

	<!-- ==================================================================訂單確認區================================================================== -->

	<!------------------------------ JS------------------------------------------------ -->
	<script src="${contextRoot}/resources/js/main.min.js?v=1628755089081"></script>
	<script src="${contextRoot}/resources/js/chart.sample.js"></script>
	<script src="${contextRoot}/resources/js/chart.sample.min.js"></script>
	<script src="${contextRoot}/resources/js/main.js"></script>
	<script src="${contextRoot}/resources/js/main.min.js"></script>
	<script src="${contextRoot}/resources/js/jquery-3.6.0.js"></script>
	<script src="${contextRoot}/resources/js/bootstrap.bundle.min.js"></script>
	
	<!------------------------------ JS------------------------------------------------ -->


	<!-- 		==========================================JavaScript區============================================ -->
	<script>
		function updateShipInformation() {
			Swal.fire(
					  '請注意!',
					  '擅自修改可能發生不可預期的錯誤!',
					  'warning'
					)
		}
	</script>
	<!-- 		==========================================開放修改Info============================================ -->
	<script>
		$(document).ready(
				function() { // Document is ready
					
					$("#order_UpdateShipInfo_btn").click(function() {
						let thisForm = $(this).closest("form");
						$("#order_UpdateShipInfo_btn").hide();
						$(".forEdit", thisForm).show();

						$("span.displayable", thisForm).hide();
						$(".inputable", thisForm).show();
						$("select", thisForm).show();
						$("option", thisForm).show();
					});
					// 送出
					$("#sendUpdateInfo").click(function() {
						confirm(" 即將送出修改!! ");
						$("#springForm").submit();
					});
					// 取消
					$("#cancelUpdateInfo").click(function() {
						let thisForm = $(this).closest("form");
						$("#order_UpdateShipInfo_btn").show();
						$(".forEdit", thisForm).hide();

						$.each($("input.inputable"),
								function(index, thisInput) {
									$(thisInput).val(
											$(thisInput).siblings(
													"span.displayable")
													.text());
								});

						$.each($("select.inputable", thisForm), function(index,
								thisSelect) {
							const originalOption = $(thisSelect)
									.siblings("span.displayable")
									.text();
							$(thisSelect).find(
									"option:contains(" + originalOption
											+ ")").prop("selected",
									true).siblings().prop("selected",
									false);
						});

						$("span.displayable", thisForm).show();
						$(".inputable", thisForm).hide();
						$("select", thisForm).hide();
						$("option", thisForm).hide();

					}); // end of 取消 event
				}); // end of document ready
		</script>

	<!-- 		==========================================開放修改Info============================================ -->
	<!-- 		==========================================開放修改Ship============================================ -->
	<script>
		$(document).ready(
				function() { // Document is ready

					$("#order_ship_btn").click(function() {
						let thisForm = $(this).closest("form");
						$("#order_ship_btn").hide();
						$(".forEdit", thisForm).show();
						
						$("#orderStatus").removeAttr("disabled");
						$("span.displayable", thisForm).hide();
						$(".inputable", thisForm).show();
						$("select", thisForm).show();
						$("option", thisForm).show();
					});
					//送出
					$("#sendUpdateStatus").click(function() {
						confirm(" 即將送出修改!! ");
						$("#orderStatusForm").submit();
					});
					// 取消
					$("#cancelUpdateStatus").click(function() {
						let thisForm = $(this).closest("form");
						$("#order_ship_btn").show();
						$(".forEdit", thisForm).hide();

						$.each($("input.inputable", thisForm),
								function(index, thisInput) {
									$(thisInput).val(
											$(thisInput).siblings(
													"span.displayable")
													.text());
								});

						$.each($("select.inputable", thisForm), function(index,
								thisSelect) {
							const originalOption = $(thisSelect)
									.siblings("span.displayable")
									.text();
							$(thisSelect).find(
									"option:contains(" + originalOption
											+ ")").prop("selected",
									true).siblings().prop("selected",
									false);
						});
							
						$("span.displayable", thisForm).show();
						$(".inputable", thisForm).hide();
						$("option", thisForm).hide();

					}); // end of 取消 event
				}); // end of document ready
	</script>
	<!-- 		==========================================開放修改Ship============================================ -->

	<!-- 		==========================================JavaScript區============================================ -->
	<!-- 		==========================================AJAX============================================ -->




	<script>
		!function(f, b, e, v, n, t, s) {
			if (f.fbq)
				return;
			n = f.fbq = function() {
				n.callMethod ? n.callMethod.apply(n, arguments) : n.queue
						.push(arguments)
			};
			if (!f._fbq)
				f._fbq = n;
			n.push = n;
			n.loaded = !0;
			n.version = '2.0';
			n.queue = [];
			t = b.createElement(e);
			t.async = !0;
			t.src = v;
			s = b.getElementsByTagName(e)[0];
			s.parentNode.insertBefore(t, s)
		}(window, document, 'script',
				'https://connect.facebook.net/en_US/fbevents.js');
		fbq('init', '658339141622648');
		fbq('track', 'PageView');
	</script>

	<noscript>
		<img height="1" width="1" style="display: none"
			src="https://www.facebook.com/tr?id=658339141622648&ev=PageView&noscript=1" />
	</noscript>

	<!-- Icons below are for demo only. Feel free to use any icon pack. Docs: https://bulma.io/documentation/elements/icon/ -->
	<link rel="stylesheet"
		href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">
</body>
</html>
