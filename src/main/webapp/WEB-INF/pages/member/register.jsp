<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon"
	href="${contextRoot}/resources/frontstage/img/fav.png">
<!-- Author Meta -->
<meta name="author" content="CodePixar">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>Nice運動網</title>
<!--
		CSS
		============================================= -->

<link rel="stylesheet"
	href="${contextRoot}/resources/frontstage/css/linearicons.css">
<link rel="stylesheet"
	href="${contextRoot}/resources/frontstage/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${contextRoot}/resources/frontstage/css/themify-icons.css">
<link rel="stylesheet"
	href="${contextRoot}/resources/frontstage/css/bootstrap.css">
<link rel="stylesheet"
	href="${contextRoot}/resources/frontstage/css/owl.carousel.css">
<link rel="stylesheet"
	href="${contextRoot}/resources/frontstage/css/nice-select.css">
<link rel="stylesheet"
	href="${contextRoot}/resources/frontstage/css/nouislider.min.css">
<link rel="stylesheet"
	href="${contextRoot}/resources/frontstage/css/ion.rangeSlider.css" />
<link rel="stylesheet"
	href="${contextRoot}/resources/frontstage/css/ion.rangeSlider.skinFlat.css" />
<link rel="stylesheet"
	href="${contextRoot}/resources/frontstage/css/magnific-popup.css">
<link rel="stylesheet"
	href="${contextRoot}/resources/frontstage/css/main.css">
</head>

<body>
	<header class="header_area sticky-header">
		<div class="main_menu">
			<!-- 插入上導覽列 -->
			<jsp:directive.include
				file="/WEB-INF/pages/layout/frontstage/nav.jsp" />
		</div>
		<div class="search_input" id="search_input_box">
			<div class="container">
				<form class="d-flex justify-content-between">
					<input type="text" class="form-control" id="search_input"
						placeholder="Search Here">
					<button type="submit" class="btn"></button>
					<span class="lnr lnr-cross" id="close_search" title="Close Search"></span>
				</form>
			</div>
		</div>
	</header>

	<section class="banner-area">
		<div class="container">
			<div class="row fullscreen align-items-center justify-content-start">
				<div class="col-lg-12">
					<div class="active-banner-slider owl-carousel">
						<!-- single-slide -->
						<div class="row single-slide align-items-center d-flex">
							<div class="col-lg-5 col-md-6">
								<div class="banner-content">
									<h1>
										Nike New <br>Collection!
									</h1>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation.</p>
									<div class="add-bag d-flex align-items-center">
										<a class="add-btn" href=""><span class="lnr lnr-cross"></span></a>
										<span class="add-text text-uppercase">Add to Bag</span>
									</div>
								</div>
							</div>
							<div class="col-lg-7">
								<div class="banner-img">
									<img class="img-fluid"
										src="${contextRoot}/resources/frontstage/img/banner/banner-img.png"
										alt="">
								</div>
							</div>
						</div>
						<!-- single-slide -->
						<div class="row single-slide">
							<div class="col-lg-5">
								<div class="banner-content">
									<h1>
										Nike New <br>Collection!
									</h1>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation.</p>
									<div class="add-bag d-flex align-items-center">
										<a class="add-btn" href=""><span class="lnr lnr-cross"></span></a>
										<span class="add-text text-uppercase">Add to Bag</span>
									</div>
								</div>
							</div>
							<div class="col-lg-7">
								<div class="banner-img">
									<img class="img-fluid"
										src="${contextRoot}/resources/frontstage/img/banner/banner-img.png"
										alt="">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 核心內容標題 -->

	<!-- 原核心內容的 section 開始 -->
	<section class="checkout_area section_gap">
		<div class="container">
			<div class="returning_customer">
				<div class="check_title">
					<h2>
						你是忘記了還是害怕想起來? <a href="${contextRoot}/userLogin">要進來了喔</a>
					</h2>
				</div>
<!-- 				<p>如果你忘記了，那讓我們來新增你的記憶，如果你只是害怕想起來，那讓我們來幫助你吧!</p> -->
<%-- 	                <form class="row contact_form" action="${contextRoot}/userLoginAuthenticate" method="post" novalidate="novalidate"> --%>
<!-- 	                    <div class="col-md-6 form-group p_star"> -->
<!-- 	                        <input type="text" class="form-control" id="name" name="name"> -->
<!-- 	                        <span class="placeholder" data-placeholder="Username or Email"></span> -->
<!-- 	                    </div> -->
<!-- 	                    <div class="col-md-6 form-group p_star"> -->
<!-- 	                        <input type="password" class="form-control" id="password" name="password"> -->
<!-- 	                        <span class="placeholder" data-placeholder="Password"></span> -->
<!-- 	                    </div> -->
<!-- 	                    <div class="col-md-12 form-group"> -->
<!-- 	                        <button type="submit" value="submit" class="primary-btn">login</button> -->
<!-- 	                        <div class="creat_account"> -->
<!-- 	                            <input type="checkbox" id="f-option" name="selector"> -->
<!-- 	                            <label for="f-option">We will remember you</label> -->
<!-- 	                        </div> -->
	                        <a class="lost_pass" href="${contextRoot}/member/forget">忘記密碼?</a>
<!-- 	                    </div> -->
<%-- 	                </form> --%>
			</div>

			<!-- 註冊表單 -->
			<div class="billing_details">
				<div class="row">
					<div class="col-lg-8">
						<h3>加入我們</h3>
						<form id="registerForm"
							class="row contact_form"
							action="${contextRoot}/member/registerAdd"
							method="post" novalidate="novalidate">

							<div class="col-md-6 form-group p_star">
								<input type="text" class="form-control" id="username"
									name="username" placeholder="Username" required> 
								<span class="placeholder"></span>
							</div>

							<div class="col-md-6 form-group p_star">
								<input type="password" class="form-control" id="password"
									name="password" placeholder="Password" required> 
								<span class="placeholder"></span>
							</div>

							<div class="col-md-6 form-group p_star">
								<input type="text" class="form-control" id="lastname"
									name="lastname" placeholder="Last name" required>
								<span class="placeholder"></span>
							</div>

							<div class="col-md-6 form-group p_star">
								<input type="text" class="form-control" id="firstname"
									name="firstname" placeholder="First name" required> 
								<span class="placeholder"></span>
							</div>

							<div class="col-md-6 form-group p_star">
								<input type="text" class="form-control" id="phone" 
									name="phone" placeholder="Phone" pattern="09\d{2}\-?\d{3}\-?\d{3}" required>
							</div>

							<div class="col-md-6 form-group p_star">
								<input type="email" class="form-control" id="email" 
									name="email" placeholder="Email" required>
							    <span class="placeholder"></span>
							</div>

							<div class="col-md-12 form-group p_star">
								<input type="text" class="form-control" id="gender"
									name="gender" placeholder="Gender">
							</div>

							<div class="col-md-12 form-group p_star">
								<input type="text" class="form-control" id="address"
									name="address" placeholder="Address" required>
								<span class="placeholder"></span>
							</div>

							<div class="col-md-6 form-group">
								<input type="date" class="form-control" id="birthdate"
									name="birthdate" placeholder="Birthdate">
							</div>

							<hr>

							<!-- 按鍵 -->

						<div class="col-md-12 form-group">
							<button id="sendBtn" type="button" value="submit" class="primary-btn">註冊</button>
							<button type="button" class="primary-btn" id="register">
								一鍵輸入</button>
							<div class="creat_account"></div>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- 原核心內容的 section 結束 -->

	<!-- 插入頁腳 -->
	<!-- Scripts below are for demo only -->
	<jsp:directive.include
		file="/WEB-INF/pages/layout/frontstage/footer.jsp" />

	<script
		src="${contextRoot}/resources/frontstage/js/vendor/jquery-2.2.4.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
		integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
		crossorigin="anonymous"></script>
	<script
		src="${contextRoot}/resources/frontstage/js/vendor/bootstrap.min.js"></script>
	<script
		src="${contextRoot}/resources/frontstage/js/jquery.ajaxchimp.min.js"></script>
	<script
		src="${contextRoot}/resources/frontstage/js/jquery.nice-select.min.js"></script>
	<script src="${contextRoot}/resources/frontstage/js/jquery.sticky.js"></script>
	<script src="${contextRoot}/resources/frontstage/js/nouislider.min.js"></script>
	<script src="${contextRoot}/resources/frontstage/js/countdown.js"></script>
	<script
		src="${contextRoot}/resources/frontstage/js/jquery.magnific-popup.min.js"></script>
	<script
		src="${contextRoot}/resources/frontstage/js/owl.carousel.min.js"></script>
	<!--gmaps Js-->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
	<script src="${contextRoot}/resources/frontstage/js/gmaps.min.js"></script>
	<script src="${contextRoot}/resources/frontstage/js/main.js"></script>

<!-- sweet alert CDN -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	<!-- 一鍵註冊 -->
	<script type="text/javascript">
		$("#register").click(function() {
			$("#username").attr("value", "diamond123");
			$("#password").attr("value", "testtest");
			$("#lastname").attr("value", "安安");
			$("#firstname").attr("value", "你好");
			$("#birthdate").attr("value", "1994-11-28");
			$("#gender").attr("value", "女");
			$("#phone").attr("value", "0986153274");
			$("#email").attr("value", "zxcvb@gmail.com");
			$("#address").attr("value", "台北市大安區信義路2段");
		});
	</script>
	
	<script>
		$("#sendBtn").click(function () {
			console.log($("#registerForm"));
			console.log($("#registerForm")[0]);
			console.log( new FormData($("#registerForm")[0]) );
			$.ajax({
				method: "POST",
				url: "${contextRoot}/member/registerAdd",
				data: new FormData($("#registerForm")[0]),
				contentType:false,
				processData:false,
				success: function (status) {
					if(status=="註冊成功") {
						Swal.fire({
							icon: 'success',
							title: "註冊成功", 
						}).then(function (result) {
							if(result.isConfirmed) {
								window.location.href = "${contextRoot}/";
							}
						});
					} else if(status=="註冊失敗") {
						// 顯現紅字
					}
				}
				
			});
		});
	</script>
</body>
</html>