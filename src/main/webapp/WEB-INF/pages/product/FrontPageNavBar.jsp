<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//code.jquery.com/jquery-2.1.1.min.js"></script>
<title>Insert title here</title>
<link rel="icon" href="/favicon.ico" type="image/x-icon" />
</head>

<style>
#inputPrice {
	width: 40px;
	height: 20px;
}

.images {
	align-items: flex-start;
	transition: transform 0.5s;
	display: flex;
}

#img1 {
	width: 800px;
}

.window {
	margin: auto;
	margin-top: 50px;
	width: 800px;
	overflow: hidden;
}

button {
	width: 1px;
	height: 1px;
	border-radius: 500px;

}

.red {
	background: #EAC100;
}
</style>



<body id="category">

	<!-- Start Header Area -->
	<header class="header_area sticky-header">
		<div class="main_menu">
			<nav class="navbar navbar-expand-lg navbar-light main_box">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<a class="navbar-brand logo_h" href="mainpage.controller"><img
						src="img/LOGO5.png" alt=""></a>
					<!-- LOGO 圖片位置 -->
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse offset"
						id="navbarSupportedContent">
						<ul class="nav navbar-nav menu_nav ml-auto">
							<li class="nav-item"><a class="nav-link" href="index.html">主頁</a></li>
							<li class="nav-item submenu dropdown active"><a
								href="FrontpageSeperate	"
								class="nav-link dropdown-toggle" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false">購物中心</a>
								<ul class="dropdown-menu">
									<li class="nav-item active"><a class="nav-link"
										href="FrontpageSeperate	">前往商城</a></li>
									<li class="nav-item"><a class="nav-link"
										href="singleProductFrontpage.controller">產品詳細資訊</a></li>
									<li class="nav-item"><a class="nav-link"
										href="checkout.html">結帳</a></li>
									<li class="nav-item"><a class="nav-link" href="cart.html">購物車</a></li>
								</ul></li>


							<li class="nav-item submenu dropdown"><a href="#"
								class="nav-link dropdown-toggle" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false">會員中心</a>
								<ul class="dropdown-menu">
									<li class="nav-item"><a class="nav-link" href="login.html">登入</a></li>
									<li class="nav-item"><a class="nav-link"
										href="tracking.html">追蹤清單</a></li>
									<li class="nav-item"><a class="nav-link"
										href="elements.html">會員帳號管理</a></li>
								</ul></li>
							<li class="nav-item"><a class="nav-link" href="contact.html">聯絡我們</a></li>
						</ul>
					</div>
				</div>
			</nav>
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
	<!-- End Header Area -->


	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">



		<div class="window" align='Center'>
			<div class="images" id="images">
				<img id="img1" src="${contextRoot}/img/Nice_eCommerce_banner.png">
				<img id="img1" src="${contextRoot}/img/1.jpg">
				<img id="img1" src="${contextRoot}/img/2.jpg">	
			 	<img id="img1" src="${contextRoot}/img/3.jpg">
			</div>

			<span id="buttons">
				<button></button>
				<button></button>
				<button></button>
				<button></button>
			</span>
		</div>




	</section>
	<!-- End Banner Area -->


	<script>
						var allButtons = $('#buttons > button');
						for (let i = 0; i < allButtons.length; i++) {
							$(allButtons[i]).on('click', function (ev) {
								var index = $(ev.currentTarget).index();
								var npx = index * -800;
								$('#images').css({
									transform: 'translateX(' + npx + 'px)'
								});
								n = index;
								activeButton(allButtons.eq(n))
							});
						}
						var n = 0;
						var size = allButtons.length;
						var timerId = setTimer();
						$('.window').on('mouseenter', function () {
							window.clearInterval(timerId);
						})
						$('.window').on('mouseleave', function () {
							timerId = setTimer();
						})
						function setTimer() {
							return setInterval(() => {
								n++;
								playSlide(n % size);
							}, 2000)
						}
						function playSlide(index) {
							allButtons.eq(index).trigger('click');
						}
						function activeButton($button) {
							$button.addClass('red')
								.siblings('.red')
								.removeClass('red');
						}
					</script>

</body>
</html>