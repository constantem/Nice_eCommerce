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
<!-- 	aaa -->
	<!-- start banner Area -->
	<section class="banner-area">
		<div class="container">
			<div class="row fullscreen align-items-center justify-content-start">
				<div class="col-lg-12">
					<div class="active-banner-slider owl-carousel">
						<!-- single-slide -->
						<c:forEach var="announcement" items="${announcements}">
						<div class="row single-slide align-items-center d-flex">
							<div class="col-lg-5 col-md-6">
								<div class="banner-content">									
									<h2>${announcement.discount.name}</h2>
									<h2>${announcement.discount.description}</h2>
									<p>活動期間：${announcement.discount.startDate}~${announcement.discount.endDate}</p>
									<div class="add-bag d-flex align-items-center">
										<a class="add-btn" href="${contextRoot}/announcement/showEvents-front"><span class="lnr lnr-location"></span></a>
										<a href="${contextRoot}/announcement/showEvents-front"><span class="add-text text-uppercase">前往察看</span></a>
									</div>
								</div>
							</div>
							<div class="col-lg-7">
								<div class="banner-img">
									<a href="${contextRoot}/announcement/showEvents-front">
										<img class="img-fluid" src="data:image/png;base64,${announcement.eventPictureBase64}" alt=""></img>
									</a>
								</div>
							</div>
						</div>	
					</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->

	<!-- start features Area -->
	<section class="features-area section_gap">
		<div class="container">
			<div class="row features-inner">
				<!-- single features -->
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="single-features">
						<div class="f-icon">
							<img src="${contextRoot}/resources/frontstage/img/features/f-icon1.png" alt="">
						</div>
						<p>免運促銷商品</p>
					</div>
				</div>
				<!-- single features -->
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="single-features">
						<div class="f-icon">
							<img src="${contextRoot}/resources/frontstage/img/features/f-icon2.png" alt="">
						</div>
						<h6>退貨規則</h6>
						<p>詳細退貨細節</p>
					</div>
				</div>
				<!-- single features -->
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="single-features">
						<div class="f-icon">
							<img src="${contextRoot}/resources/frontstage/img/features/f-icon3.png" alt="">
						</div>
						<h6>顧客常見問題</h6>
					</div>
				</div>
				<!-- single features -->
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="single-features">
						<div class="f-icon">
							<img src="${contextRoot}/resources/frontstage/img/features/f-icon4.png" alt="">
						</div>
						<h6>付款安全驗證</h6>
						
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- end features Area -->

	<!-- Start category Area -->
	<section class="category-area">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8 col-md-12">
					<div class="row">
						<div class="col-lg-8 col-md-8">
							<div class="single-deal">
								<div class="overlay"></div>
								<img class="img-fluid w-100" src="${contextRoot}/resources/frontstage/img/category/c1.jpg" alt="">
								<a href="${contextRoot}/resources/frontstage/img/category/c1.jpg" class="img-pop-up" target="_blank">
									<div class="deal-details">
										<h6 class="deal-title">運動鞋款</h6>
									</div>
								</a>
							</div>
						</div>
						<div class="col-lg-4 col-md-4">
							<div class="single-deal">
								<div class="overlay"></div>
								<img class="img-fluid w-100" src="${contextRoot}/resources/frontstage/img/category/c2.jpg" alt="">
								<a href="${contextRoot}/resources/frontstage/img/category/c2.jpg" class="img-pop-up" target="_blank">
									<div class="deal-details">
									
									</div>
								</a>
							</div>
						</div>
						<div class="col-lg-4 col-md-4">
							<div class="single-deal">
								<div class="overlay"></div>
								<img class="img-fluid w-100" src="${contextRoot}/resources/frontstage/img/category/c3.jpg" alt="">
								<a href="${contextRoot}/resources/frontstage/img/category/c3.jpg" class="img-pop-up" target="_blank">
									<div class="deal-details">
										<h6 class="deal-title">熱門鞋款</h6>
									</div>
								</a>
							</div>
						</div>
						<div class="col-lg-8 col-md-8">
							<div class="single-deal">
								<div class="overlay"></div>
								<img class="img-fluid w-100" src="${contextRoot}/resources/frontstage/img/category/c4.jpg" alt="">
								<a href="${contextRoot}/resources/frontstage/img/category/c4.jpg" class="img-pop-up" target="_blank">
									<div class="deal-details">
										<h6 class="deal-title">熱銷商品</h6>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="single-deal">
						<div class="overlay"></div>
						<img class="img-fluid w-100" src="${contextRoot}/resources/frontstage/img/category/c5.jpg" alt="">
						<a href="${contextRoot}/resources/frontstage/img/category/c5.jpg" class="img-pop-up" target="_blank">
							<div class="deal-details">
								<h6 class="deal-title">促銷活動</h6>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End category Area -->

	<!-- start product Area -->
	<section class="owl-carousel active-product-area section_gap">
		<!-- single product slide -->
	
	</section>
	<!-- End related-product Area -->

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