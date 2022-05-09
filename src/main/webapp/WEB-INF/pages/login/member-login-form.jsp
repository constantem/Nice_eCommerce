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
<title>登入</title>

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

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
crossorigin="anonymous"></script>
<script>
$(document).ready(function() {
	//
	$(".autoInputBtn").click(function() {
		const numOneBased = $(this).data("num") ;
		$.ajax({
			url: $("#contextRoot").val() + "/userLoginAutoInput",
			data: { number: numOneBased },
			success: function (userAndPass) {
				$("#username").val(userAndPass.username);
				$("#password").val(userAndPass.password);
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

	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>登入/註冊</h1>
					<nav class="d-flex align-items-center">
						<a href="${contextRoot}/">首頁<span class="lnr lnr-arrow-right"></span></a>
						<a href="#">登入/註冊</a>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->

	<!--================Login Box Area =================-->
	<section class="login_box_area section_gap">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="login_box_img">
						<img class="img-fluid" src="${contextRoot}/resources/frontstage/img/login.jpg" alt="">
						<div class="hover">
							<h4>還不是會員嗎?</h4>
							<p>別再猶豫了，趕緊手刀</p>
							<a class="primary-btn" href="${contextRoot}/member/register">
								會員註冊
							</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_form_inner">
						<h3>已是會員</h3>
						<c:if test="${param.error!=null}">
							<span style="color:red;">查無帳號或密碼</span>
						</c:if>
						<c:if test="${param.logout!=null}">
							<span style="color:orange;">登出狀態</span>
						</c:if>
						<!-- form:form 以支援 security defense -->
						<form class="row login_form" 
							action="${contextRoot}/userLoginAuthenticate" 
							method="post">
							
							<div class="col-md-12 form-group">
								<!-- name="username" 以搭配 spring security -->
								<input type="text" class="form-control" id="username" name="username" placeholder="帳號" onfocus="this.placeholder = ''" onblur="this.placeholder = '帳號'">
							</div>
							<div class="col-md-12 form-group">
								<!-- name="password" 以搭配 spring security -->
								<input type="password" class="form-control" id="password" name="password" placeholder="密碼" onfocus="this.placeholder = ''" onblur="this.placeholder = '密碼'">
							</div>
							<div class="col-md-12 form-group">
								<div class="creat_account">
									<input type="checkbox" id="f-option2" name="selector">
									<label for="f-option2">記住登入</label>
								</div>
							</div>
							
							
							<c:forEach items="${oauthAuthUrls}" var="oauthAuthUrl">
							<div class="col-md-12 form-group">
								<a href="${oauthAuthUrl.value}">
									<button type="button" class="primary-btn">${oauthAuthUrl.key}(壞掉)</button>
								</a>
							</div>
							</c:forEach>
								
							<!-- 登入一鍵輸入 -->
							<div class="col-md-12 form-group">
								<button type="button"
									data-num="1" 
									class="genric-btn success circle autoInputBtn"
									style="width:100px">
									會員一
								</button>
								<button type="button"
									data-num="2" 
									class="genric-btn success circle autoInputBtn"
									style="width:100px">
									會員二
								</button>
								<button type="button" 
									data-num="3" 
									class="genric-btn success circle autoInputBtn"
									style="width:100px">
									會員三
								</button>	
							</div>
							
							<div class="col-md-12 form-group">
								<button type="submit" value="submit" class="primary-btn">登入</button>
							</div>	
							
							</form>
							
							<!-- 忘記密碼 -->
							<div class="col-md-12 form-group">
							<form method="get" action="${contextRoot}/member/forget">
								<button type="submit" value="忘記密碼？" class="primary-btn">忘記密碼？</button>
							</form>
							</div>		
					</div>
				</div>
			</div>
		</div>
	</section>
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
	

</body>

</html>