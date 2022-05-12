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
	<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
	<style type="text/css">
	.t1{
	margin:auto;
	width:400px;
	}

	.personalForm{
		margin: auto;
	}

	.personal{
		font-weight: bold;
	}
	</style>
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

	<!-- Start category Area -->
	
	<div class="container">
	<div class="billing_details">
	<div class="row">
	<div class="col-lg-8 personalForm">
		<h3 class="personal">個人資料</h3>
	<form class="row contact_form" action="${contextRoot}/member/editRegister" method="post">
	
	<!-- 欄位1 -->
	<div class="col-md-5 form-group p_star">
		<div class="mb-3 row">
    		<label class="col-sm-2 col-form-label">帳號:</label>
    	<div class="col-sm-10">
      		<input type="text" class="form-control"  name="username" value="${member.username}" disabled>
      		<input type="text" readonly class="form-control-plaintext" hidden name="id" value="${member.memberid}" >
    	</div>
 		</div>
 	</div>
	
	<!-- 欄位2 -->
	<div class="col-md-6 form-group p_star">
		<div class="mb-3 row">
    		<label class="col-sm-2 col-form-label">Email:</label>
    	<div class="col-sm-10">
      		<input type="text" id="email" class="form-control" disabled name="email" value="${member.email}" >
    	</div>
 		</div>
 	</div>
	
	<!-- 欄位3 -->
	<div class="col-md-5 form-group p_star">
		<div class="mb-3 row">
			<label class="col-sm-2 col-form-label">姓:</label>
		<div class="col-sm-10">
			<input id="lastname" type="text" class="form-control" name="lastname" value="${member.lastname}" disabled>
		</div>
 		</div>
    </div>
    
    <!-- 欄位4 -->
    <div class="col-md-6 form-group p_star">
    	<div class="mb-3 row">
			<label class="col-sm-2 col-form-label">名:</label>
		<div class="col-sm-10">
			<input id="firstname" type="text" class="form-control" name="firstname" value="${member.firstname}" disabled>
		</div>
 		</div>
    </div>
    
    <!-- 欄位5 -->
    <div class="col-md-5 form-group p_star">
    	<div class="mb-3 row">
			<label class="col-sm-2 col-form-label">生日:</label>
		<div class="col-sm-10">
			<input id="birthdate" type="text" class="form-control" name="birthdate" value="${member.birthdate}" disabled>
		</div>
 		</div>
    </div>
    
    <!-- 欄位6 -->
    <div class="col-md-6 form-group p_star">
    	<div class="mb-3 row">
			<label class="col-sm-2 col-form-label">電話:</label>
		<div class="col-sm-10">
			<input id="phone" type="text" class="form-control" name="phone" value="${member.phone}" disabled>
		</div>
	 	</div>
    </div>
    
    <!-- 欄位7 -->  
    <div class="col-md-5 form-group p_star">
    	<div class="mb-3 row">
			<label class="col-sm-2 col-form-label">性別:</label>
		<div class="col-sm-10">
			<input id="gender" type="text" class="form-control" name="gender" value="${member.gender}" disabled>
	 	</div>
	 	</div>
    </div>
    
    <!-- 欄位8 -->
    <div class="col-md-6 form-group p_star">
    	<div class="mb-3 row">
			<label class="col-sm-2 col-form-label">住址:</label>
		<div class="col-sm-10">
			<input id="address" type="text" class="form-control" name="address" value="${member.address}" disabled>
	 	</div>
	 	</div>
    </div>
    
    <!-- 按鈕們 -->
    <div class="col-md-12 form-group">
		<button id="editBtn" type="button" value="submit" class="primary-btn">修改</button>
		<button id="submitBtn" hidden type="submit" value="submit" class="primary-btn">送出</button>
	</div>
	</form>
	</div>
	</div>
	</div>
	
	<form action="${contextRoot}/member/editRegister?id=${member.memberid}" method="get">
		
	</form>

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
	
	
	<script>
	
		// 修改按鈕事件處理(按下修改才會show出送出按鈕)
		$("#editBtn").click(function(){
			$("#editBtn").prop("hidden",true);
			$("#submitBtn").prop("hidden",false);
			$("#address").removeAttr("disabled","disabled")
			$("#firstname").removeAttr("disabled","disabled")
			$("#lastname").removeAttr("disabled","disabled")
			$("#phone").removeAttr("disabled","disabled")
			$("#email").removeAttr("disabled","disabled")
			$("#birthdate").removeAttr("disabled","disabled")
			$("#gender").removeAttr("disabled","disabled")
		})
	
	</script>
</body>

</html>