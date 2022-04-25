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


<!-- <!-- CSS only -->
<!-- <link -->
<!-- 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" -->
<!-- 	rel="stylesheet" -->
<!-- 	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" -->
<!-- 	crossorigin="anonymous"> -->
<!-- <!-- JavaScript Bundle with Popper -->
<!-- <script -->
<!-- 	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" -->
<!-- 	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" -->
<!-- 	crossorigin="anonymous"></script> -->
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
#select {
	width: 250px;
}

#leftBOX {
	width: 800px;
	float: left;
}

#rightBOX {
	width: 800px;
	margin-left: 800px;
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
				<small class="text-gray-500"> 訂單編號：${order.orderStatus} 目前資料庫沒有資料 </small>
				<a href="${pageContext.request.contextPath}/orders/viewAllOrders"><button
						class="button light">返回訂單列表</button></a>
			</div>
		</section>
		<div class="container">
				<table>
				<thead>
					<tr>
						<th class="checkbox-cell"><label class="checkbox"> <input
								type="checkbox"> <span class="check"></span>
						</label></th>
						<th>產品圖片</th>
						<th>產品名稱</th>
						<th>數量</th>
						<th>商品單價</th>
						<th>商品總價</th>
						<th>修改時間</th>
						<th></th>
					</tr>
					
				</thead>
				<hr>

				<c:forEach var="OrderDetail" items="${OrderDetailSet}">
					<tbody>
						<tr>
							<td class="checkbox-cell"><label class="checkbox"> <input
									type="checkbox"> <span class="check"></span>
							</label>
							<td>
							<img alt="picture"
									src="${contextRoot}/ProductTempImg/${OrderDetail.productBean.imgUrl}" width="112" /></td>
							<td id="productName" data-label="productName" >${OrderDetail.productBean.productName}</td>
							<td id="quantity" class="quantity" data-label="quantity">${OrderDetail.quantity}</td>
							<td id="realPrice" class="realPrice" data-label="realPrice">${OrderDetail.realPrice}</td>
							<td id="totalPrice" data-label="totalPrice">${order.totalPrice}</td>
							<td data-label="shippingFee" class="text-gray-500">${OrderDetail.modifiedAt} 目前資料庫沒有資料</td>
						</tr>
						
				</c:forEach>
			</table>
		</div>
		<div class="buttons right nowrap">

			<input type="hidden" value="${OrdersBean.order_id}">
 
			<button type="button" class="button blue" id="order_detail_btn"
				data-bs-toggle="modal" data-bs-target="#exampleModal"
				data-bs-whatever="@mdo">
				<%--onclick = "findById('${OrdersBean.order_id}')"> --%>
				<%--onclick="location.href='${contextRoot}/orders/OrderDetail/update?id=${OrdersBean.order_id}'"> --%>
				<span class="icon"><i class="mdi-update"></i></span>修改訂單明細
			</button>
		</div>
		<hr>
		<div class="buttons right nowrap">

			<input type="hidden" value="${OrdersBean.order_id}">

			<button type="button" class="button blue" id="order_detail_btn"
				data-bs-toggle="modal" data-bs-target="#exampleModal"
				data-bs-whatever="@mdo">
				<%--onclick = "findById('${OrdersBean.order_id}')"> --%>
				<%--onclick="location.href='${contextRoot}/orders/OrderDetail/update?id=${OrdersBean.order_id}'"> --%>
				<span class="icon"><i class="mdi-update"></i></span>訂單出貨
			</button>
		</div>
		<hr>
		<!-- ==================================================================配送資料確認區================================================================== -->
		
		<div class="card" id="leftBOX">
			<header class="card-header">
				<p class="card-header-title">
					<span class="icon"><i class="mdi mdi-account"></i></span> 配送資訊
			</header>
			<div class="card-content">				
				<div class="field">
					<label class="label">收件人</label>
					<div class="control">
						<small class="text-gray-900"> ${order.shipName}</small>
					</div>
				<div class="field">
						<label class="label">配送地址</label>
						<div class="control">
							<small class="text-gray-900"> ${order.shipPostalCode} ${order.shipAddress} </small>
						</div>
					</div>
				<div class="field">
					<label class="label">訂單狀態</label>
					<div class="control">
						<small class="text-gray-500"> ${order.orderStatus} 目前資料庫沒有資料 </small>
					</div>
				</div>
				<div class="field">
					<label class="label">時間戳記</label>
					<div class="control">
						<small class="text-gray-500"> ${order.orderDate}
							</p> 修改於 ${order.modifiedAt} 目前資料庫沒有資料
						</small>
					</div>
					<div class="buttons right nowrap">

						<input type="hidden" value="${OrdersBean.order_id}">
	
						<button type="button" class="button blue" id="order_detail_btn"
							data-bs-toggle="modal" data-bs-target="#exampleModal"
							data-bs-whatever="@mdo"
							onclick = "updateShipInformation()">
							<%--onclick="location.href='${contextRoot}/orders/OrderDetail/update?id=${OrdersBean.order_id}'"> --%>
							<span class="icon"><i class="mdi-update"></i></span>修改配送資訊
						</button>
					</div>
				</div>
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
			<!-- 修改配送資訊按鈕 -->
			<div class="buttons right nowrap">
				<input type="hidden" value="${OrdersBean.order_id}">
				<button type="button" class="button blue" id="order_detail_btn"
					data-bs-toggle="modal" data-bs-target="#exampleModal"
					data-bs-whatever="@mdo">
					<%--onclick = "update(this.value)> 
					<%--onclick="location.href='${contextRoot}/orders/OrderDetail/update?id=${OrdersBean.order_id}'"> --%>
					<span class="icon"><i class="mdi-update"></i></span>修改配送資訊
				</button>
			</div>
			<!-- 修改配送資訊按鈕 -->
			<!-- 運費輸入text -->
			<div class="field">
				<label class="label">運費</label>
				<div class="control">
					<input type="text" value="${order.shippingFee}" class="input is-static">
				</div>
			</div>
			<!-- 運費輸入text -->
			<!-- 總價輸入text -->
			<div class="field">
				<label class="label">總價</label>
				<div class="control">
					<input type="text" id="totalPrice" value="${order.totalPrice}" class="input is-static">
				</div>
			</div>
			<!-- 總價輸入text -->
			<hr>
			<!-- 訂單出貨 -->
			<div class="field">
				<label class="label">訂單出貨</label>
				<div class="control">
					<select id="orderStatus">
						<option value="">訂單狀態</option>
						<option value="等待付款">等待付款</option>
						<option value="已出貨">已出貨</option>

					</select>
				</div>
			</div>
			<!-- 訂單出貨 -->
		</div>
	</div>
	<!-- ==================================================================訂單確認區================================================================== -->
	</div>
	<!------------------------------ JS------------------------------------------------ -->
	<script src="${contextRoot}/resources/js/main.min.js?v=1628755089081"></script>
	<script src="${contextRoot}/resources/js/chart.sample.js"></script>
	<script src="${contextRoot}/resources/js/chart.sample.min.js"></script>
	<script src="${contextRoot}/resources/js/main.js"></script>
	<script src="${contextRoot}/resources/js/main.min.js"></script>
	<script src="${contextRoot}/resources/js/jquery-3.6.0.js"></script>
	<script src="${contextRoot}/resources/js/bootstrap.bundle.min.js"></script>
	<!------------------------------ JS------------------------------------------------ -->
	<!-- 		==========================================JavaScript============================================ -->
	<script>
		function updateShipInformation()
		{
			alert("你好，我是一个警告框！");
		}
	</script>
	<!-- 		==========================================計算總價============================================ -->
	<script>
		totalPrice();
		function totalPrice(){
			alert($("#quantity").val())  
			
		}
	</script>


	<!-- 		==========================================JavaScript============================================ -->
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
