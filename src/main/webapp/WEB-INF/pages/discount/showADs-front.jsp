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
	<link rel="shortcut icon" href="/Nice_eCommerce/resources/frontstage/img/fav.png">
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
	<link rel="stylesheet" href="/Nice_eCommerce/resources/frontstage/css/linearicons.css">
	<link rel="stylesheet" href="/Nice_eCommerce/resources/frontstage/css/owl.carousel.css">
	<link rel="stylesheet" href="/Nice_eCommerce/resources/frontstage/css/font-awesome.min.css">
	<link rel="stylesheet" href="/Nice_eCommerce/resources/frontstage/css/themify-icons.css">
	<link rel="stylesheet" href="/Nice_eCommerce/resources/frontstage/css/nice-select.css">
	<link rel="stylesheet" href="/Nice_eCommerce/resources/frontstage/css/nouislider.min.css">
	<link rel="stylesheet" href="/Nice_eCommerce/resources/frontstage/css/bootstrap.css">
	<link rel="stylesheet" href="/Nice_eCommerce/resources/frontstage/css/main.css">
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
<h1>aaa</h1>








	<!-- 所使用的 js -->	
	<script src="/Nice_eCommerce/resources/frontstage/js/vendor/jquery-2.2.4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
	 crossorigin="anonymous"></script>
	<script src="/Nice_eCommerce/resources/frontstage/js/vendor/bootstrap.min.js"></script>
	<script src="/Nice_eCommerce/resources/frontstage/js/jquery.ajaxchimp.min.js"></script>
	<script src="/Nice_eCommerce/resources/frontstage/js/jquery.nice-select.min.js"></script>
	<script src="/Nice_eCommerce/resources/frontstage/js/jquery.sticky.js"></script>
	<script src="/Nice_eCommerce/resources/frontstage/js/nouislider.min.js"></script>
	<script src="/Nice_eCommerce/resources/frontstage/js/jquery.magnific-popup.min.js"></script>
	<script src="/Nice_eCommerce/resources/frontstage/js/owl.carousel.min.js"></script>
	<!--gmaps Js-->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
	<script src="/Nice_eCommerce/resources/frontstage/js/gmaps.min.js"></script>
	<script src="/Nice_eCommerce/resources/frontstage/js/main.js"></script>
</body>

</html>