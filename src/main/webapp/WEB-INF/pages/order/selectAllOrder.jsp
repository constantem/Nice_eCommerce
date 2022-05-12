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
<title>Nice eCommerce Shopping Center</title>

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
<!-- 	======================================================================================================================== -->
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
<!-- 	======================================================================================================================== -->
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());
	gtag('config', 'UA-130795909-1');
</script>

<!-- 	======================================================================================================================== -->

</head>
<body>
	<div id="app">
		<!---------------------------------------------------載入上方與左側列---------------------------------------------------------------------------- -->
		<jsp:directive.include file="/WEB-INF/pages/layout/backstage/nav-and-aside.jsp" />
		<!---------------------------------------------------------------------- 中間大框框-------------------------------------------------------------------->
		<p />
		<section class="is-hero-bar">
			<div
				class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
				<h1 class="title">訂單資訊</h1>
<%-- 				<a href="${pageContext.request.contextPath}/staff/course/show/all"><button --%>
<!-- 						class="button light">返回課程列表</button></a> -->
			</div>
		</section>
		
		<div class="container">
			<p />
			<table>
				<thead>
					<tr>
						<th class="image-cell"></th>
						<th>訂單編號</th>
						<th>會員姓名</th>
						<th>下單日期</th>
						<th>訂單總價</th>					
						<th>訂單狀態</th>
						<th></th>
					</tr>
				</thead>
				<c:forEach var="OrdersBean" items="${page.content}">
					<tbody>
						<tr>
							<td class="checkbox-cell"><label class="checkbox"> <input
									type="checkbox"> <span class="check"></span>
							</label></td>
							<td data-label="orderId">${OrdersBean.orderId}</td>
							<td data-label="member_id">${OrdersBean.memberBean.username}</td>
							<td data-label="orderDate">${OrdersBean.orderDate}</td>
							<td data-label="totalPrice">${OrdersBean.totalPrice}</td>
<%-- 							<c:if test="${OrdersBean.orderStatus == 999}"> --%>
<!-- 								<td data-label="orderStatus">訂單已刪除</td> -->
<%-- 							<c:otherwise> --%>
<%-- 							</c:if> --%>
							
							<c:choose>
   								 <c:when test="${OrdersBean.orderStatus == 111}">
   								    <td data-label="orderStatus">未出貨</td>
 								 </c:when>
 								 <c:when test="${OrdersBean.orderStatus == 222}">
   								    <td data-label="orderStatus">已出貨</td>
 								 </c:when>
   								 <c:when test="${OrdersBean.orderStatus == 999}">
     								<td data-label="orderStatus">訂單已刪除</td>		  
  							     </c:when>
							     <c:otherwise>
    							    <td data-label="orderStatus">資料庫沒有訂單狀態</td>
   								 </c:otherwise>
							</c:choose>
							
							<td class="actions-cell">
								<div class="buttons right nowrap">

									
									<input type="hidden" value="${OrdersBean.orderId}">
<!-- 									檢視訂單明細按鈕 -->
									<button type="button" class="button blue"
										id="order_detail_btn" data-bs-toggle="modal"
										data-bs-target="#exampleModal" data-bs-whatever="@mdo"
										<%-- onclick = "findById('${OrdersBean.order_id}')"> --%>
										onclick="location.href='${contextRoot}/orders/OrderDetail?id=${OrdersBean.orderId}'">
										<span class="icon"><i class="mdi mdi-eye"></i></span>檢視訂單明細
									</button>
								</div>
							</td>
						</tr>
				</c:forEach>
			</table>


		</div>
		<!-- 		分頁頁數物件 -->
		<div id="page" align="center">
			<div class="table-pagination">
				<div class="flex items-center ">
					<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
						<c:choose>
							<c:when test="${page.number != pageNumber-1}">
								<div class="buttons">
									<a href="${contextRoot}/staff/orders/viewAllOrders?p=${pageNumber}"><button
											type="button" class="button active">${pageNumber}</button></a>
									&nbsp&nbsp
								</div>
							</c:when>
							<c:otherwise>
								<c:out value="${pageNumber}"></c:out>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
			</div>
		</div>

		<!-- 		分頁物件 -->
		<!-- 	<!-- 測試模態框 -->
		<!-- 	<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">訂單明細</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form>
							<div class="mb-3">
								<label for="recipient-name" class="col-form-label">產品名:</label>
								<input type="text" disabled="disabled" class="form-control"
									id="productName">
							</div>
							<div class="mb-3">
								<label for="recipient-name" class="col-form-label">收件資訊:</label>
								<input type="text" disabled="disabled" class="form-control"
									id="shipAddress">
							</div>
							<div class="mb-3">
								<label for="recipient-name" class="col-form-label">商品金額:</label>
								<input type="text" disabled="disabled" class="form-control"
									id="realPrice">
							</div>
							<div class="mb-3">
								<label for="recipient-name" class="col-form-label">運費:</label> <input
									type="text" disabled="disabled" class="form-control"
									id="shippingFee">
							</div>
							<div class="mb-3">
								<label for="recipient-name" class="col-form-label">付款方式:</label>
								<input type="text" disabled="disabled" class="form-control"
									id="recipient-name">
							</div>
							<div class="mb-3">
								<label for="recipient-name" class="col-form-label">訂單總金額:</label>
								<input type="text" disabled="disabled" class="form-control"
									id="totalPrice">
							</div>
							<div class="mb-3">
								<label for="message-text" class="col-form-label">Message:</label>
								<textarea class="form-control" id="message-text"></textarea>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">關閉</button>
						<button type="button" class="btn btn-primary">Send
							message</button>
					</div>
				</div>
			</div>
		</div>


		<!------------------------------------------------------------ -------------------------------------------------------------->
		<div id="sample-modal" class="modal">
			<div class="modal-background --jb-modal-close"></div>
			<div class="modal-card">
				<header class="modal-card-head">
					<p class="modal-card-title">測試</p>
				</header>
				<section class="modal-card-body">
					<p>
						測試2 <b>${OrderDetail.productBean.productName}</b>
					</p>
					<p>測試3</p>
				</section>
				<footer class="modal-card-foot">
					<button class="button --jb-modal-close">Cancel</button>
					<button class="button red --jb-modal-close">Confirm</button>
				</footer>
			</div>
		</div>

		<div id="sample-modal-2" class="modal">
			<div class="modal-background --jb-modal-close"></div>
			<div class="modal-card">
				<header class="modal-card-head">
					<p class="modal-card-title">測試</p>
				</header>
				<section class="modal-card-body">
					<p>
						測試 <b>adipiscing elit</b>
					</p>
					<p>This is sample modal</p>
				</section>
				<footer class="modal-card-foot">
					<button class="button --jb-modal-close">Cancel</button>
					<button class="button blue --jb-modal-close">Confirm</button>
				</footer>
			</div>
		</div>

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
	<!-- 	==========================================AJAX============================================ -->
<!-- 	<script> -->
<!-- // 		$('#order_detail_btn').click( -->
<!-- // 				function(evt) { -->
<!-- // 					var orderId = $(this).siblings("input").val(); -->

<!-- // 					$.ajax({ -->
<!-- // 						type : "GET", -->
<!-- // 						url : "/Nice_eCommerce/orders/OrderDetail?id=" -->
<!-- // 								+ orderId, -->
<!-- // 						success : function(orderdetails) { -->
<!-- // 							orderdetails[0] -->
<!-- // 							orderdetails[1] -->
<!-- // 							$.each(orderdetails, function(index, orderdetail) { -->
<!-- // 								console.log(index); -->
<!-- // 								console.log(orderdetail); -->
<!-- // 								$('#productName').val( -->
<!-- // 										orderdetail.productBean.productName); -->
<!-- // 							}); -->
<!-- // 							// 					console.log(orderdetail); -->
<!-- // 							// 					console.log(orderdetail.productBean.productName); -->

<!-- // 						} -->
<!-- // 					}) -->
<!-- // 				}) -->
<!-- 	</script> -->



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
		href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css" />

</body>
</html>
