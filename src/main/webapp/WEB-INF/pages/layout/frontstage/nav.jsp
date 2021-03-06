<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!------------------ link for icon -------------------->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<!----------------------------------------------------->	

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<input id="contextRoot" type="hidden" value="${pageContext.request.contextPath}">
<!-- 導覽列開始 -->
<nav class="navbar navbar-expand-lg navbar-light main_box">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<a class="navbar-brand logo_h" href="${contextRoot}/"><img
						src="${contextRoot}/img/shorten.png" alt=""></a>

		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
		 aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse offset" id="navbarSupportedContent">
			<ul class="nav navbar-nav menu_nav ml-auto">
				
				<!-- 1. 首頁 -->
				<li class="nav-item active"><a class="nav-link" href="${contextRoot}/">首頁</a></li>
				
				<!-- 2. 活動 -->
				<li class="nav-item submenu dropdown">
				<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
					 aria-expanded="false">好康優惠</a>
					<ul class="dropdown-menu">
						<li class="nav-item"><a class="nav-link" href="${contextRoot}/announcement/showEvents-front">活動一覽</a></li>
					</ul>
				</li>
				
				<!-- 3. 商城 -->
				<li class="nav-item submenu dropdown">
					<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
					 aria-expanded="false">購物商城</a>
					<ul class="dropdown-menu">
						<li class="nav-item"><a class="nav-link" href="${contextRoot}/FrontpageSeperate">前往商城</a></li>
					</ul>
				</li>
			
				<!-- 5. 課程 -->
				<li class="nav-item submenu dropdown">
					<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
					 aria-expanded="false">實體健身房</a>
					<ul class="dropdown-menu">
						<li class="nav-item"><a class="nav-link" href="${contextRoot}/info/course/list/all">課程一覽</a></li>
						<li class="nav-item"><a class="nav-link" href="${contextRoot}/info/course/gymContact">交通方式</a></li>
					</ul>
				</li>
				
				<!-- 6. 會員中心 -->
				<li class="nav-item submenu dropdown">
					<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
					 aria-expanded="false">會員中心</a>
					<ul class="dropdown-menu">
<%-- 						<sec:authorize access="!isAuthenticated()"> --%>
							<li class="nav-item notAuthenticatedAsUser">
								<a class="nav-link" href="${contextRoot}/userLogin">
									註冊/登入
								</a>
							</li>
<%-- 						</sec:authorize> --%>

<%-- 						<sec:authorize access="isAuthenticated()"> --%>
							<li class="nav-item isAuthenticatedAsUser">
								<a class="nav-link" 
									href="${contextRoot}/user/myProfile">
									個人資料
								</a>
							</li>
							<li class="nav-item isAuthenticatedAsUser">
								<a class="nav-link" 
									href="${contextRoot}/user/myOrders">
									我的訂單
								</a>
							</li>
							<li class="nav-item isAuthenticatedAsUser">
								<a class="nav-link" 
									href="${contextRoot}/user/myWishList">
									我的追蹤清單
								</a>
							</li>
							<li class="nav-item isAuthenticatedAsUser">
								<a class="nav-link" 
									href="${contextRoot}/user/myDiscount">
									我的優惠券
								</a>
							</li>
							<li class="nav-item isAuthenticatedAsUser">
								<a class="nav-link" 
									href="${contextRoot}/user/myCoursebooking">
									我的課程
								</a>
							</li>
							<li class="nav-item isAuthenticatedAsUser">
								<form 
									id="logoutForm" 
									action="${contextRoot}/userLogout" 
									method="POST">
									
									<a class="nav-link" href="#" onclick="document.getElementById('logoutForm').submit();">
										登出
									</a>
								</form>
							</li>
<%-- 						</sec:authorize> --%>

					</ul>
				</li>
				
				<!-- 7. 客服中心 -->
				<li class="nav-item submenu dropdown">
					<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
					 aria-expanded="false">客服中心</a>
					<ul class="dropdown-menu">
						<li class="nav-item"><a class="nav-link" href="${contextRoot}/ai">智慧客服</a></li>
						<li class="nav-item"><a class="nav-link" href="${contextRoot}/message/form">客服表單</a></li>
					</ul>
				</li>
				
			</ul> <!-- 上導覽列 ul 結束 -->
		
			<ul class="nav navbar-nav navbar-right">
				<!-- 購物車 -->
				<li class="nav-item"><a href="${contextRoot}/user/myCart" class="cart"><span class=""><i style="font-size:120%; transition:0.4s"
				  onMouseOver="this.style.color='orange'" onMouseOut="this.style.color='black'" class="bi bi-cart4"></i></span></a></li>
				  
				<li class="nav-item">
					<button class="search"><span class="lnr lnr-magnifier" id="search"></span></button>
				</li>
			</ul>
			
			<!-- 加插連後台按鈕 -->
			<ul class="nav navbar-nav navbar-right">
				<li class="nav-item">
					<button type="button" id="toBackstageBtn" class="genric-btn primary circle">管理系統</button>
<%-- 					<a  href="${contextRoot}/backstage" class="genric-btn primary circle">後台</a> --%>
				</li>
			</ul>
		</div>
	</div>
</nav>
<!-- jQuery CDN -->	
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous">
</script>
<!-- sweat alert 2 CDN -->	
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
	//會員中心在登入中與非登入中不一樣
	$.ajax({
		url: $("#contextRoot").val() + "/user/role",
		success: function (roles) {
			console.log("roles.length======>|"+roles.length+"|");
			console.log("roles[0]======>|"+roles[0]+"|");
			if(roles.length===1 && roles[0]=="ROLE_USER") {
				$(".isAuthenticatedAsUser").show();
				$(".notAuthenticatedAsUser").hide();
			} else {
				$(".isAuthenticatedAsUser").hide();
				$(".notAuthenticatedAsUser").show();
			}
		}
	});
	
	// 前往後台的彈窗
	$("#toBackstageBtn").click(function () {
		Swal.fire({
			title: "(Dev Only)",
			html: "即將<span style='font-weight:bold;'>登出</b>並前往管理系統",
			showConfirmButton: true,
			confirmButtonText: "登出並前往",
			showCancelButton: true,
			cancelButtonText: "取消",
			buttonsStyling: false,
			customClass: {
				confirmButton: 'genric-btn success',
				cancelButton: 'genric-btn default'
			},
		}).then(function (result) {
			if(result.isConfirmed) {
				location.href = "${contextRoot}/userLogoutAndToBackstage";
			}
		});
	});
</script>