<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="tw.nicesport.model.ProductBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html lang="en" class="">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Nice_eCommerce_SearchAllProductPage</title>


<!----------------------------- CSS------------------------------------------ -->
<c:set var="contextRoot" value="${pageContext.request.contextPath}"></c:set>
<link href="${contextRoot}/resources/backstage/css/main.css"
	rel="stylesheet" />
<!--------------------------------------------------------------------------- -->




<!-- Tailwind is included -->

<link href="https://cdn.bootcss.com/sweetalert/1.1.3/sweetalert.min.css"
	rel="stylesheet">

<link rel="stylesheet" href="css/main.css?v=1628755089081">
<link rel="apple-touch-icon" sizes="180x180" href="apple-touch-icon.png" />
<link rel="icon" type="image/png" sizes="32x32" href="favicon-32x32.png" />
<link rel="icon" type="image/png" sizes="16x16" href="favicon-16x16.png" />
<link rel="mask-icon" href="safari-pinned-tab.svg" color="#00b4b6" />
<link rel="stylesheet"
	href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta name="description" content="Admin One - free Tailwind dashboard">

<!-- <meta property="og:url" -->
<!-- 	content="https://justboil.github.io/admin-one-tailwind/"> -->
<!-- <meta property="og:site_name" content="JustBoil.me"> -->
<!-- <meta property="og:title" content="Admin One HTML"> -->
<!-- <meta property="og:description" -->
<!-- 	content="Admin One - free Tailwind dashboard"> -->
<!-- <meta property="og:image" -->
<!-- 	content="https://justboil.me/images/one-tailwind/repository-preview-hi-res.png"> -->
<!-- <meta property="og:image:type" content="image/png"> -->
<!-- <meta property="og:image:width" content="1920"> -->
<!-- <meta property="og:image:height" content="960"> -->

<!-- <meta property="twitter:card" content="summary_large_image"> -->
<!-- <meta property="twitter:title" content="Admin One HTML"> -->
<!-- <meta property="twitter:description" -->
<!-- 	content="Admin One - free Tailwind dashboard"> -->
<!-- <meta property="twitter:image:src" -->
<!-- 	content="https://justboil.me/images/one-tailwind/repository-preview-hi-res.png"> -->
<!-- <meta property="twitter:image:width" content="1920"> -->
<!-- <meta property="twitter:image:height" content="960"> -->



<!-- <!-- Global site tag (gtag.js) - Google Analytics -->
<!-- <script async -->
<!-- 	src="https://www.googletagmanager.com/gtag/js?id=UA-130795909-1"></script> -->
<!-- </head> -->


<style>
#title {
	font-size: 140%;
}

#functionTitle {
	margin: auto;
}
</style>
<body>




	<!--主要外層Div -->
	<div id="app">


		<!-- 上方導覽列 -->
		<%@include file="TopBar.jsp"%>

		<!-- 左側導覽列 -->
		<%@include file="LeftBar.jsp"%>




		<section class="is-title-bar">
			<div
				class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">

			</div>
		</section>

		<section class="is-hero-bar">
			<div
				class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
				<h1 id="functionTitle" align="center" class="title">所有商品</h1>
				<button class="button light">Button</button>
			</div>
		</section>


		<div class="card-content">
			<table>

				<thead>
					<tr>
						<th>商品編號</th>
						<th>商品名稱</th>
						<th>商品類別</th>
						<th>供應商</th>
						<th>商品圖片</th>
						<th>商品顏色</th>
						<th>商品尺寸</th>
						<th>商品價格</th>
						<th>庫存數量</th>
						<th>新增日期</th>
						<th>修改日期</th>
						<th></th>
						<th></th>
					</tr>
				</thead>


				<tbody>
					<tr>
						<c:forEach items="${page.content}" var="prod">
							<tr>
								<td data-label="product_id">${prod.product_id}</td>
								<td data-label="productName">${prod.productName}</td>
								<td data-label="productName">${prod.subCategory.name}</td>
								<td data-label="City">${prod.supplier}</td>
								<td data-label="City"><img alt="picture"
									src="${contextRoot}/ProductTempImg/${prod.imgUrl}" width="112" /></td>
								<!-- 照片欄位 -->
								<td data-label="Created">${prod.color}</td>
								<td data-label="Created">${prod.size}</td>
								<td data-label="Created">${prod.price}</td>
								<td class="quantity" data-label="Created">${prod.stock.quantity}</td>
								<td data-label="Created">${prod.createdAt}</td>
								<td data-label="Created">${prod.modifiedAt}</td>

								<td class="actions-cell">
									<div class="buttons right nowrap">

										<!-- 修改 -->
										<form method="get"
											action="/Nice_eCommerce/getOneProduct${prod.product_id}">
											<button class="button small green --jb-modal"
												data-target="sample-modal-2" type="submit">
												<span class="icon"><i class="mdi mdi-eye"></i></span>
											</button>
										</form>

										<!-- 刪除 -->
										<form method="get"
											action="/Nice_eCommerce/deleteOneProduct${prod.product_id}">
											<button onclick="return confirm('確認刪除')" id="delete"
												class="button small red --jb-modal"
												data-target="sample-modal" type="submit">
												<span class="icon"><i class="mdi mdi-trash-can"></i></span>
											</button>
										</form>

									</div>
								</td>
						</c:forEach>
					</tr>
				</tbody>
			</table>

			<div id="page" align="center">
				<div class="table-pagination">
					<div class="flex items-center ">
						<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
							<c:choose>
								<c:when test="${page.number != pageNumber-1}">
									<div class="buttons">
										<a href="${contextRoot}/pageSeperate?p=${pageNumber}"><button
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


			<footer class="footer">
				<div
					class="flex flex-col md:flex-row items-center justify-between space-y-3 md:space-y-0">
					<div class="flex items-center justify-start space-x-3">
						<div>Nice eCommerce</div>

						<div>
							<p>
								, All Right Reserved.<a href="" target="_blank"></a>
							</p>
						</div>
					</div>
				</div>
			</footer>




		</div>
	</div>



	<!-- Scripts below are for demo only -->
	<script type="text/javascript" src="js/main.min.js?v=1628755089081"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
	<script type="text/javascript" src="js/chart.sample.min.js"></script>
	<script
		src="https://cdn.bootcss.com/sweetalert/1.1.3/sweetalert.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	<noscript>
		<img height="1" width="1" style="display: none"
			src="https://www.facebook.com/tr?id=658339141622648&ev=PageView&noscript=1" />
	</noscript>
	<!-- Icons below are for demo only. Feel free to use any icon pack. Docs: https://bulma.io/documentation/elements/icon/ -->



	<!-- ================================================================================ -->

	<script>
		$(window).load(function() {
			var a = $(".quantity");
			console.log(a);
			$(".quantity").each(function() {

				console.log($(this).text());

				if ($(this).text() < 50) {
					$(this).css("color", "#FF3333").text("低庫存量警示");
				} else {

				}
			});
		});
	</script>

	<!-- ================================================================================ -->



	<!------------------------------ JS------------------------------------------------ -->
	<script src="${contextRoot}/resources/js/main.min.js?v=1628755089081"></script>
	<script src="${contextRoot}/resources/js/chart.sample.js"></script>
	<script src="${contextRoot}/resources/js/chart.sample.min.js"></script>
	<script src="${contextRoot}/resources/js/main.js"></script>
	<script src="${contextRoot}/resources/js/main.min.js"></script>
	<script src="${contextRoot}/resources/js/jquery-3.6.0.js"></script>
	<script src="${contextRoot}/resources/js/bootstrap.bundle.min.js"></script>
	<!------------------------------ JS------------------------------------------------ -->


</body>

</html>