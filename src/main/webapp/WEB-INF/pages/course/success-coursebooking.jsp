<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
<!-- Mobile Specific Meta -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="${contextRoot}/resources/frontstageLogo/favicon.png">
<!-- Author Meta -->
<meta name="author" content="CodePixar">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>報名成功</title>

<!--
	CSS
	============================================= -->
<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/linearicons.css">
<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/owl.carousel.css">
<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/themify-icons.css">
<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/font-awesome.min.css">
<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/nice-select.css">
<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/nouislider.min.css">
<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/bootstrap.css">
<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/main.css">
	
<style>
	.order_d_inner .details_item .list li a span.result-display {
		color: black;
	}
</style>
	
<!-- jQuery CDN -->	
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous">
</script>

<!-- sweat alert 2 CDN -->	
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	
<script>
$(document).ready(function () {
	$.ajax({
		method: "GET",
		url: $("#contextRoot").val()+"/api/courseBooking/"+$("#courseBookingId").val(),
		success: function (courseBookingDto) {
			$("#memberFullName").text(courseBookingDto.memberFullName);
			$("#courseName").text(courseBookingDto.courseName);
			$("#coachFullName").text(courseBookingDto.coachFullName);
			$("#coursePrice").text(courseBookingDto.coursePrice);
			$("#createdAt").text(courseBookingDto.createdAt);
		}
	});
});
</script>
	
</head>

<body>

	<input type="hidden" id="contextRoot" value="${contextRoot}">
	<!-- 新增後的 courseBooking id -->
	<input type="hidden" id="courseBookingId" value="${courseBookingId}">
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

	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>報名結果</h1>
					<nav class="d-flex align-items-center">
						<a href="${contextRoot}/resources/frontstage/index.html">首頁<span class="lnr lnr-arrow-right"></span></a>
						<a href="${contextRoot}/resources/frontstage/category.html">報名結果</a>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->

	<!--================Order Details Area =================-->
	<section class="order_details section_gap">
		<div class="container">
			<h3 class="title_confirmation">報名成功，請<a href="">點此</a>繳費</h3>
			<div class="row order_d_inner">
				<div class="col-lg-4">
					<div class="details_item">
						<h4>會員資訊</h4>
						<ul class="list">
							<li><a href="#"><span>姓名</span> : <span id="memberFullName" class="result-display"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="details_item">
						<h4>課程資訊</h4>
						<ul class="list">
							<li><a href="#"><span>課程名稱</span> : <span id="courseName" class="result-display"></span></a></li>
							<li><a href="#"><span>教練姓名</span> : <span id="coachFullName" class="result-display"></span></a></li>
							<li><a href="#"><span>報名時間</span> : <span id="createdAt" class="result-display"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="details_item">
						<h4>繳費資訊</h4>
						<ul class="list">
							<li><a href="#"><span>費用</span> : <span id="coursePrice" class="result-display"></span></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Order Details Area =================-->

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
	<script src="${contextRoot}/resources/frontstage/js/jquery.magnific-popup.min.js"></script>
	<script src="${contextRoot}/resources/frontstage/js/owl.carousel.min.js"></script>
	<!--gmaps Js-->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
	<script src="${contextRoot}/resources/frontstage/js/gmaps.min.js"></script>
	<script src="${contextRoot}/resources/frontstage/js/main.js"></script>
</body>

</html>