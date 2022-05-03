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
	<title>忘記密碼</title>

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
	
	<style type="text/css">
	.t1{
	-ms-flex: 0 0 50%;
        flex: 0 0 50%;
        max-width: 50%;
        display: flex;
    	justify-content: center; 
    	align-items: center;
    	margin: auto;
	}
	</style>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
	<script>
		$(document).ready(function() {
			$("#first").click(function() {
				$.ajax({
					url: $("#contextRoot").val() + "/userLoginAutoInputFirst",
					success: function (member) {
						$("#username").val(member.username);
						$("#password").val(member.password);
					}
				});
			});
		});
	</script>
</head>
<body>

<!-- variable -->
	<input type="hidden" id="contextRoot" value="${contextRoot}">
	
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
	
	<div class="t1">
		<div class="login_form_inner">
			<h3>請輸入註冊信箱</h3>
			<form class="row contact_form"
				action="${contextRoot}/userLogin" method="get" novalidate="novalidate">
<!-- 			<div class="col-md-12 form-group"> -->
				
<!-- 				<input type="text" class="form-control" id="username" name="username" placeholder="帳號" onfocus="this.placeholder = ''" onblur="this.placeholder = '帳號'"> -->
<!-- 			</div> -->

			<div class="col-md-12 form-group">
				
				<input type="text" class="form-control" id="customerEmail" name="customerEmail" placeholder="註冊信箱" onfocus="this.placeholder = ''" onblur="this.placeholder = '密碼'">
			</div>
			<div class="col-md-12 form-group">
				<button type="button" value="確認" class="primary-btn" id="forget" onclick="sendMail()">確認</button>
			<div class="creat_account"></div>
			</div>
			</form>
		</div>
	</div>
	
	<!--================End Login Box Area =================-->
	
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
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	
	<script>
		function sendMail() {
			$.ajax({
				url: "${contextRoot}/member/sendMail",
				data: { "customerEmail": $("#customerEmail").val() },
				type: "GET",
				success: function(message) {
					console.log("準備彈窗");
					Swal.fire({
						  title: '寄送成功拉拉拉~',
						  showDenyButton: true,
						  confirmButtonText: '將發送驗證信至信箱',
						}).then((result) => {
						  /* Read more about isConfirmed, isDenied below */
						  if (result.isConfirmed) {
						    Swal.fire({
						    	title: '已發送!', 
						    	text: '', 
						    	confirmButtonText: 'OK',
						    	icon: 'success'
						    }).then( function(result){
						    	if(result.isConfirmed) {
						    		window.location.href='${contextRoot}/userLogin';
						    	}
						    });
						    
						  } else if (result.isDenied) {
						    Swal.fire('Changes are not saved', '', 'info')
						  }
						})
				}
			});
		}
	
// 		$(.forget).click(function){
// 			Swal.fire({
// 				  title: '寄送成功拉拉拉~',
// 			  showDenyButton: true,
// 			  confirmButtonText: '將發送驗證信至信箱',
// 			}).then((result) => {
// 			  /* Read more about isConfirmed, isDenied below */
// 			  if (result.isConfirmed) {
// 			    Swal.fire('已發送!', '', 'success')
// 			  } 
			  
// 			})
// 		}
		
// 		function sendMail(){
// 			$("#forgetMember").click();
// 		}
	</script>
</body>
</html>