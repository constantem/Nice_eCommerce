<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="tw.nicesport.model.ProductBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en" class="">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MainPage</title>

<!----------------------------- CSS------------------------------------------ -->
<c:set var="contextRoot" value="${pageContext.request.contextPath}"></c:set>
<link href="${contextRoot}/resources/backstage/css/main.css"
	rel="stylesheet" />
<link rel="apple-touch-icon" sizes="180x180"
	href="${contextRoot}/resources/backstage/apple-touch-icon.png" />
<link rel="icon" type="image/png" sizes="32x32"
	href="${contextRoot}/resources/backstage/favicon-32x32.png" />
<link rel="icon" type="image/png" sizes="16x16"
	href="${contextRoot}/resources/backstage/favicon-16x16.png" />
<!--------------------------------------------------------------------------- -->




<!-- Tailwind is included -->
<!-- <link rel="stylesheet" href="css/main.css?v=1628755089081"> -->
<!-- <link rel="stylesheet" href="css/main.css"> -->
<!-- <link rel="stylesheet" href="js/main.js"> -->


<link rel="apple-touch-icon" sizes="180x180" href="apple-touch-icon.png" />
<link rel="icon" type="image/png" sizes="32x32" href="favicon1-32x32.png" />
<link rel="icon" type="image/png" sizes="16x16" href="favicon-16x16.png" />
<link rel="mask-icon" href="safari-pinned-tab.svg" color="#00b4b6" />
<link rel="stylesheet"
	href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">

<meta name="description" content="Admin One - free Tailwind dashboard">


<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-130795909-1"></script>


</head>
<style>
#title {
	font-size: 140%;
}

#functionTitle {
	margin-left: 420px;
}
</style>
<body>

	<!--主要外層Div -->
	<div id="app">


		<!-- 上方導覽列 -->
		<jsp:include page="TopBar.jsp" />

		<!-- 左側導覽列 -->
		<jsp:include page="LeftBar.jsp" />



		<!-- Blank Block -->

		<section class="is-hero-bar">
			<div
				class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
				<h1 id="functionTitle" align="center" class="title"></h1>
				<button class="button light">Button</button>
			</div>

		<!-- Performance block -->
			<div class="card mb-6">
				<header class="card-header">
					<p class="card-header-title">
						<span class="icon"><i class="mdi mdi-finance"></i></span>
						Performance
					</p>
					<a href="#" class="card-header-icon"> <span class="icon"><i
							class="mdi mdi-reload"></i></span>
					</a>
				</header>
				<div class="card-content">
					<div class="chart-area">
						<div class="h-full">
							<div class="chartjs-size-monitor">
								<div class="chartjs-size-monitor-expand">
									<div></div>
								</div>
								<div class="chartjs-size-monitor-shrink">
									<div></div>
								</div>
							</div>
							<canvas id="big-line-chart" width="2992" height="1000"
								class="chartjs-render-monitor block"
								style="height: 400px; width: 1197px;"></canvas>
						</div>
					</div>
				</div>
			</div>
			<!--End Performance block -->

		</section>
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



	<!-- Scripts below are for demo only -->


	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
	<script type="text/javascript" src="js/chart.sample.min.js"></script>



	<noscript>
		<img height="1" width="1" style="display: none"
			src="https://www.facebook.com/tr?id=658339141622648&ev=PageView&noscript=1" />
	</noscript>

	<!-- Icons below are for demo only. Feel free to use any icon pack. Docs: https://bulma.io/documentation/elements/icon/ -->



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
