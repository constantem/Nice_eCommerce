<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 導覽列開始 -->
<nav class="navbar navbar-expand-lg navbar-light main_box">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<a class="navbar-brand logo_h" href="${contextRoot}/"><img src="${contextRoot}/resources/frontstage/img/logo.png" alt=""></a>
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
				<li class="nav-item"><a class="nav-link" href="">好康優惠</a></li>
				
				<!-- 3. 商城 -->
				<li class="nav-item submenu dropdown">
					<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
					 aria-expanded="false">購物商城</a>
					<ul class="dropdown-menu">
						<li class="nav-item"><a class="nav-link" href="${contextRoot}/FrontpageSeperate">前往商城</a></li>
						<li class="nav-item"><a class="nav-link" href="#">空白</a></li>
					</ul>
				</li>
				
				<!-- 4. 購物車 -->
				<li class="nav-item"><a class="nav-link" href="">購物車</a></li>
				
				<!-- 5. 課程 -->
				<li class="nav-item submenu dropdown">
					<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
					 aria-expanded="false">實體健身房</a>
					<ul class="dropdown-menu">
						<li class="nav-item"><a class="nav-link" href="${contextRoot}/course/list/all">課程一覽</a></li>
						<li class="nav-item"><a class="nav-link" href="${contextRoot}/resources/frontstage/blog.html">交通方式</a></li>
					</ul>
				</li>
				
				<!-- 6. 會員中心 -->
				<li class="nav-item submenu dropdown">
					<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
					 aria-expanded="false">會員中心</a>
					<ul class="dropdown-menu">
						<li class="nav-item"><a class="nav-link" href="">登入</a></li>
						<li class="nav-item"><a class="nav-link" href="">個人資料</a></li>
						<li class="nav-item"><a class="nav-link" href="">我的訂單</a></li>
						<li class="nav-item"><a class="nav-link" href="">我的收藏</a></li>
						<li class="nav-item"><a class="nav-link" href="">我的優惠券</a></li>
						<li class="nav-item"><a class="nav-link" href="">我的課程</a></li>
						<li class="nav-item"><a class="nav-link" href="">登出</a></li>
					</ul>
				</li>
				
				<!-- 7. 客服中心 -->
				<li class="nav-item"><a class="nav-link" href="${contextRoot}/message/form">客服中心</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="nav-item"><a href="#" class="cart"><span class="ti-bag"></span></a></li>
				<li class="nav-item">
					<button class="search"><span class="lnr lnr-magnifier" id="search"></span></button>
				</li>
			</ul>
			<!-- 加插連後台按鈕 -->
			<ul class="nav navbar-nav navbar-right">
				<li class="nav-item">
					<a href="${contextRoot}/backstage" class="genric-btn primary circle">後台</a>
				</li>
			</ul>
		</div>
	</div>
</nav>
