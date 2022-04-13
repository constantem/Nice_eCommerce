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


</head>
<body>
	<div id="app">
		<!---------------------------------------------------載入上方列---------------------------------------------------------------------------- -->
		<%@include file="topbar.jsp"%>
		<!---------------------------------------------------載入左側列 --------------------------------------------------------------------->
		<%@include file="leftbar.jsp"%>
		<!---------------------------------------------------------------------- 中間大框框-------------------------------------------------------------------->
		<p />
		<div class="container">
			<p />
			<table>
				<thead>
					<tr>
						<th class="checkbox-cell"><label class="checkbox"> <input
								type="checkbox"> <span class="check"></span>
						</label></th>
						<th class="image-cell"></th>
						<th>訂單編號</th>
						<th>會員編號</th>
						<th>下單日期</th>
						<th>出貨日期</th>
						<th>運費</th>
						<th>最終總價</th>
						<th>收貨人姓名</th>
						<th>收貨人住址</th>
						<th>郵遞區號</th>
						<th>付款狀態</th>
						<th>出貨狀態</th>
						<th>刪除狀態</th>
						<th>建立日期</th>
						<th>修改日期</th>
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
							<td class="image-cell">
								<div class="image">
									<img
										src="https://avatars.dicebear.com/v2/initials/rebecca-bauch.svg"
										class="rounded-full">
								</div>
							</td>
							<td data-label="order_id">${OrdersBean.order_id}</td>
							<td data-label="member_id">${OrdersBean.member_id}</td>
							<td data-label="orderDate">${OrdersBean.orderDate}</td>
							<td data-label="shippingDate">${OrdersBean.shippingDate}</td>
							<td data-label="shippingFee">${OrdersBean.shippingFee}</td>
							<td data-label="totalPrice">${OrdersBean.totalPrice}</td>
							<td data-label="shipName">${OrdersBean.shipName}</td>
							<td data-label="shipAddress">${OrdersBean.shipAddress}</td>
							<td data-label="shipPostalCode">${OrdersBean.shipPostalCode}</td>
							<td data-label="paymentStatus">${OrdersBean.paymentStatus}</td>
							<td data-label="shipStatus">${OrdersBean.shipStatus}</td>
							<td class="deleteStatus" data-label="deleteStatus">${OrdersBean.deleteStatus}</td>
							<td data-label="createdAt">${OrdersBean.createdAt}</td>
							<td data-label="modifiedAt">${OrdersBean.modifiedAt}</td>
							<td class="actions-cell">
								<div class="buttons right nowrap">
									<button class="button small green --jb-modal"
										data-target="sample-modal-2" type="button"
										onclick="location.href='${contextRoot}/orders/OrderDetail?id=${OrdersBean.order_id}'">
										<span class="icon"><i class="mdi mdi-eye"></i></span>
									</button>

									<button class="button small red --jb-modal"
										data-target="sample-modal" type="button">
										<span class="icon"><i class="mdi mdi-trash-can"></i></span>
									</button>
								</div>
							</td>
						</tr>
				</c:forEach>
			</table>


		</div>




		<!------------------------------------------------------------ -------------------------------------------------------------->
		<div id="sample-modal" class="modal">
			<div class="modal-background --jb-modal-close"></div>
			<div class="modal-card">
				<header class="modal-card-head">
					<p class="modal-card-title">Sample modal</p>
				</header>
				<section class="modal-card-body">
					<p>
						Lorem ipsum dolor sit amet <b>adipiscing elit</b>
					</p>
					<p>This is sample modal</p>
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
					<p class="modal-card-title">Sample modal</p>
				</header>
				<section class="modal-card-body">
					<p>
						Lorem ipsum dolor sit amet <b>adipiscing elit</b>
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
<%-- 	<script src="${contextRoot}/resources/js/bootstrap.bundle.min.js"></script> --%>
	<!------------------------------ JS------------------------------------------------ -->
	<!-- 	==========================================判斷狀態============================================ -->
	<script>
// 			$(window).load(function() {
				var orderstate = $(".deleteStatus").text();
				console.log(orderstate);
// 			});
	</script>
	
	
	
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
