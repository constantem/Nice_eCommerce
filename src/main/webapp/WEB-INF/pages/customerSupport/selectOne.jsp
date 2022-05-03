<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    <c:set var="contextRoot" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
	<!-- Mobile Specific Meta -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- Favicon-->
	<link rel="shortcut icon" href="${contextRoot}/resources/frontstage/img/fav.png">
	<!-- Author Meta -->
	<meta name="author" content="CodePixar">
	<!-- Meta Description -->
	<meta name="description" content="">
	<!-- Meta Keyword -->
	<meta name="keywords" content="">
	<!-- meta character set -->
	<meta charset="UTF-8">
	<!-- Site Title -->
	<title>運動網</title>
	<!--
		CSS
		============================================= -->
	<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/linearicons.css">
	<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/font-awesome.min.css">
	<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/themify-icons.css">
	<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/bootstrap.css">
	<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/owl.carousel.css">
	<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/nice-select.css">
	<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/nouislider.min.css">
	<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/ion.rangeSlider.css" />
	<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/ion.rangeSlider.skinFlat.css" />
	<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/magnific-popup.css">
	<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/main.css">
</head>

<body>
<!-- Start Header Area -->
	<header class="header_area sticky-header">
		<div class="main_menu">
			<!-- 插入上導覽列 -->
			<jsp:directive.include file="/WEB-INF/pages/layout/frontstage/nav.jsp" />
		</div>
		<div class="search_input" id="search_input_box">
			<div class="container">
				<form class="d-flex justify-content-between">
					<input type="text" class="form-control" id="search_input" placeholder="Search Here">
					<button type="submit" class="btn"></button>
					<span class="lnr lnr-cross" id="close_search" title="Close Search"></span>
				</form>
			</div>
		</div>
	</header>
	<!-- End Header Area -->

	<!-- start banner Area -->
	<section class="banner-area">
		<div class="container">
			<div class="row fullscreen align-items-center justify-content-start">
				<div class="col-lg-12">
					<div class="active-banner-slider owl-carousel">
						<!-- single-slide -->
						<div class="row single-slide align-items-center d-flex">
							<div class="col-lg-5 col-md-6">
								<div class="banner-content">
									<h1>Nike New <br>Collection!</h1>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
										dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.</p>
									<div class="add-bag d-flex align-items-center">
										<a class="add-btn" href=""><span class="lnr lnr-cross"></span></a>
										<span class="add-text text-uppercase">Add to Bag</span>
									</div>
								</div>
							</div>
							<div class="col-lg-7">
								<div class="banner-img">
									<img class="img-fluid" src="${contextRoot}/resources/frontstage/img/banner/banner-img.png" alt="">
								</div>
							</div>
						</div>
						<!-- single-slide -->
						<div class="row single-slide">
							<div class="col-lg-5">
								<div class="banner-content">
									<h1>Nike New <br>Collection!</h1>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
										dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.</p>
									<div class="add-bag d-flex align-items-center">
										<a class="add-btn" href=""><span class="lnr lnr-cross"></span></a>
										<span class="add-text text-uppercase">Add to Bag</span>
									</div>
								</div>
							</div>
							<div class="col-lg-7">
								<div class="banner-img">
									<img class="img-fluid" src="${contextRoot}/resources/frontstage/img/banner/banner-img.png" alt="">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->
<div class="container">
<p/>
<div class="row justify-content-left">
<div class="col-12">
<div class="card">

<div class="card-body">
<h1>以下是您的表單紀錄，請妥善保存</h1>
	<table border="1">
		<tr style="background-color: orange" class="col-12">
			<th style="text-align: center">Id
			<th style="text-align: center">ServiceInfo
			<th style="text-align: center">Description
			<th style="text-align: center">Name
			<th style="text-align: center">Phone
			<th style="text-align: center">Email
			<th style="text-align: center">PreferedContactTime
			<th style="text-align: center">ProcessStatus
			<th style="text-align: center">Remark
			<th style="text-align: center">CreatedAt
		<tr>
			<td>
				<input type="text" name="id" value="${csResult.id}" disabled  style="text-align: center">
				<input type="hidden" name="id" value="${csResult.id}">
				<br>
			<td><input type="text" name="serviceInfo" value="${csResult.serviceInfo}" disabled  style="text-align: center"><br>
				<input type="hidden" name="serviceInfo" value="${csResult.serviceInfo}">
			<td><input type="text" name="description" value="${csResult.description}" disabled  style="text-align: center"><br>
				<input type="hidden" name="description" value="${csResult.description}">
			<td><input type="text" name="name" value="${csResult.name}" disabled  style="text-align: center"><br>
				<input type="hidden" name="name" value="${csResult.name}">
			<td><input type="text" name="phone" value="${csResult.phone}" disabled  style="text-align: center"><br>
				<input type="hidden" name="phone" value="${csResult.phone}">
			<td><input type="text" name="email" value="${csResult.email}" disabled  style="text-align: center"><br>
				<input type="hidden" name="email" value="${csResult.email}">	
			<td><input type="text" name="preferedContactTime" value="${csResult.preferedContactTime}" disabled  style="text-align: center"><br>
				<input type="hidden" name="preferedContactTime" value="${csResult.preferedContactTime}">
			<td><input type="text" name="processStatus" value="${csResult.processStatus}" disabled  style="text-align: center"><br>
				<input type="hidden" name="processStatus" value="${csResult.processStatus}">
			<td><input type="text" name="remark" value="${csResult.remark}" disabled  style="text-align: center"><br>
				<input type="hidden" name="remark" value="${csResult.remark}">
			<td><input type="text" name="createdAt" value="${csResult.createdAt}" disabled  style="text-align: center"><br>
				<input type="hidden" name="createdAt" value="${csResult.createdAt}">
	</table>
</div>
</div>
</div>
</div>
</div>
<!-- 插入頁腳 -->
	<jsp:directive.include file="/WEB-INF/pages/layout/frontstage/footer.jsp" />

	<script src="${contextRoot}/resources/frontstage/js/vendor/jquery-2.2.4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
	 crossorigin="anonymous"></script>
	<script src="${contextRoot}/resources/frontstage/js/vendor/bootstrap.min.js"></script>
	<script src="${contextRoot}/resources/frontstage/js/jquery.ajaxchimp.min.js"></script>
	<script src="${contextRoot}/resources/frontstage/js/jquery.nice-select.min.js"></script>
	<script src="${contextRoot}/resources/frontstage/js/jquery.sticky.js"></script>
	<script src="${contextRoot}/resources/frontstage/js/nouislider.min.js"></script>
	<script src="${contextRoot}/resources/frontstage/js/countdown.js"></script>
	<script src="${contextRoot}/resources/frontstage/js/jquery.magnific-popup.min.js"></script>
	<script src="${contextRoot}/resources/frontstage/js/owl.carousel.min.js"></script>
	<!--gmaps Js-->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
	<script src="${contextRoot}/resources/frontstage/js/gmaps.min.js"></script>
	<script src="${contextRoot}/resources/frontstage/js/main.js"></script>
</body>
</html>