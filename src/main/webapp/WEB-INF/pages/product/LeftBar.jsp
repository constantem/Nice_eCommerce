<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- ==================================================================================== -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

<!-- ==================================================================================== -->
<aside class="aside is-placed-left is-expanded">
	<div class="aside-tools">
		<div id="title">

			<!-- 標題 -->
			<a href="mainpage.controller">Nice _<b class="font-black">
					eCommerce</b></a>

		</div>
	</div>

	<!-- 選單 -->
	<div class="menu is-menu-main">
		<p class="menu-label">General</p>
		<ul class="menu-list">
			<li class="active"><a href="mainpage.controller"> <span
					class="icon"><i class="mdi mdi-desktop-mac"></i></span> <span
					class="menu-item-label">主頁</span>
			</a></li>
		</ul>
		<p class="menu-label">商品資料</p>
		<ul class="menu-list">

			<li><a class="dropdown"> <span class="icon"><i class="bi bi-box-seam"></i></span> <span class="menu-item-label">後台商品管理</span>
					<span class="icon"><i class="mdi mdi-plus"></i></span>
			</a>
				<ul>
					<li><a href="${contextRoot}/staff/pageSeperate"> <span>查詢所有商品</span>
					</a></li>
					<li><a href="${contextRoot}/staff/insertPdpage.controller"> <span>上架商品</span>
					</a></li>
					<li><a href="${contextRoot}/staff/searchProductAds.controller"> <span>商品廣告輪播配置</span>
					</a></li>
					

				</ul></li>
		</ul>
		
		<p class="menu-label">前台商品</p>
		<ul class="menu-list">

			<li><a class="dropdown"> <span class="icon"><i class="bi bi-cart4"></i></span> <span class="menu-item-label">前台商城頁面</span>
					<span class="icon"><i class="mdi mdi-plus"></i></span>
			</a>
				<ul>
					<li><a href="FrontpageSeperate"> <span>購物商城</span>
					</a></li>
					
				</ul></li>
		</ul>
		


	</div>
</aside>
