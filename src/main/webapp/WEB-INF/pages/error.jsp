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
<title>運動網</title>

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
.breadcrumb-banner {
  padding: 90px 0 100px 0; }
  .breadcrumb-banner h2 {
    font-weight: 600;
    color: #fff; }
  .breadcrumb-banner a {
    font-weight: 600;
    color: #fff; 
    text-decoration: underline;}
    @media (max-width: 767px) {
      .breadcrumb-banner h2 {
        font-size: 30px; } }
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
	if( $("#hasError").val() == "泛用錯誤" ) {
		Swal.fire({
			text: "抱歉，網頁發生錯誤。",
			icon: "error",
			confirmButtonText: "回首頁"
		});
	} else if( $("#hasError").val() == "userInBackstage" ) {
		Swal.fire({
			text: "前台權限登入中，切回前台。",
			icon: "error",
			confirmButtonText: "回首頁"
		});
	} 
});
</script>

</head>

<body>
	<input type="hidden" id="hasError" value="${hasError}">
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
					<h2 class="errorMessage">抱歉，網頁發生錯誤，</h2>
					<h2 class="errorMessage">請<a href="${contextRoot}/">按此</a>返回首頁。</h2>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->

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