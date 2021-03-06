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
	<title>修改個人資料</title>
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
	
	 <div class="card-content">
		    
	      <form action="${contextRoot}/member/editRegister" method="post">
	      
	      	<!-- 欄位1 -->
	       <div class="field">
	         <label class="label">編號</label>
	
	         <div class="control">
	         	${member.memberid}
			<input type="hidden" name="memberid" id="memberid" value="${member.memberid}">
	         </div>
	         <p class="help">
	           
	         </p>
	       </div>
	
	      	<!-- 欄位2 -->
	       <div class="field">
	         <label class="label">帳號</label>
	
	         <div class="control">
	         	${member.username}
			<input type="hidden" name="username" id="username" value="${member.username}">
	         </div>
	         <p class="help">
	           
	         </p>
	       </div>
	       
	      	<!-- 欄位3 -->
	       <div class="field">
	         <label class="label">密碼</label>
	         <div class="control">
	           <input class="input" type="text" name="password" id="password" value="${member.password}">
	         </div>
	         <p class="help">
	           
	         </p>
	       </div>
	       
	      	<!-- 欄位4 -->
	       <div class="field">
	         <label class="label">姓</label>
	
	         <div class="control">
	           <input class="input" type="text" name="lastname" id="lastname" value="${member.lastname}">
	         </div>
	         <p class="help">
	           
	         </p>
	       </div>
	       
	      	<!-- 欄位5 -->
	       <div class="field">
	         <label class="label">名</label>
	
	         <div class="control">
	           <input class="input" type="text" name="firstname" id="firstname" value="${member.firstname}">
	         </div>
	         <p class="help">
	           
	         </p>
	       </div>
	          
	      	<!-- 欄位6 -->
	       <div class="field">
	         <label class="label">生日</label>
	
	         <div class="control">
	           <input class="input" type="text" name="birthdate" id="birthdate" value="${member.birthdate}">
	         </div>
	         <p class="help">
	           
	         </p>
	       </div>
	       
	      	<!-- 欄位7 -->
	       <div class="field">
	         <label class="label">性別</label>
	
	         <div class="control">
	           <input class="input" type="text" name="gender" id="gender" value="${member.gender}">
	         </div>
	         <p class="help">
	           
	         </p>
	       </div>
	       
	      	<!-- 欄位8 -->
	       <div class="field">
	         <label class="label">電話</label>
	
	         <div class="control">
	           <input class="input" type="text" name="phone" id="phone" value="${member.phone}">
	         </div>
	         <p class="help">
	           
	         </p>
	       </div>
	       
	      	<!-- 欄位9 -->
	       <div class="field">
	         <label class="label">email</label>
	
	         <div class="control">
	           <input class="input" type="text" name="email" id="email" value="${member.email}">
	         </div>
	         <p class="help">
	           
	         </p>
	       </div>
	       
	      	<!-- 欄位10 -->
	       <div class="field">
	         <label class="label">住址</label>
	
	         <div class="control">
	           <input class="input" type="text" name="address" id="address" value="${member.address}">
	         </div>
	         <p class="help">
	           
	         </p>
	       </div>
	       
	        <hr>
	
	        <div class="field grouped">
	          <div class="control">
	            <button type="submit" class="button green">
	              確認
	            </button>
	          </div>
	          <div class="control">
	            <button type="reset" class="button red" id="reset">
	              清除
	            </button>
	          </div>
	          <div class="field grouped">
	          <div class="control">
	            <button type="submit" class="button green">
	              返回
	            </button>
	          </div>
	        </div>
	        </div>
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
</body>
</html>