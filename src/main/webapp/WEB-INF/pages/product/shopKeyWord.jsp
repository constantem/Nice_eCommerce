<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="tw.nicesport.model.ProductBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en" class="">

<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="/favicon.ico/">
<link rel="bookmark" href="/favicon.ico/">
<!-- Author Meta -->
<script src="//code.jquery.com/jquery-2.1.1.min.js"></script>
<meta name="author" content="CodePixar">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>Nice eCommerce Shopping Center</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<!--
            CSS
            ============================================= -->
<c:set var="contextRoot" value="${pageContext.request.contextPath}"></c:set>

<link rel="stylesheet"
	href="${contextRoot}/resources/frontstage/css/linearicons.css" />
<link rel="stylesheet"
	href="${contextRoot}/resources/frontstage/css/owl.carousel.css" />
<link rel="stylesheet"
	href="${contextRoot}/resources/frontstage/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="${contextRoot}/resources/frontstage/css/themify-icons.css" />
<link rel="stylesheet"
	href="${contextRoot}/resources/frontstage/css/nice-select.css" />
<link rel="stylesheet"
	href="${contextRoot}/resources/frontstage/css/nouislider.min.css" />
<link rel="stylesheet"
	href="${contextRoot}/resources/frontstage/css/bootstrap.css" />
<link rel="stylesheet"
	href="${contextRoot}/resources/frontstage/css/main.css" />
<link rel="icon" type="image/png" sizes="32x32"
	href="${contextRoot}/resources/backstage/favicon1-32x32.png" />
<link rel="shortcut icon" href="${contextRoot}/resources/frontstageLogo/favicon.png">	
</head>



<style>
.pageButton1{
	margin-left: 120px;
}

.inputPrice {
	width: 50px;
	height: 30px;
}

#Keyword {
	width: 100px;
	height: 30px;
}

.images {
	align-items: flex-start;
	transition: transform 0.5s;
	display: flex;
}

.pdimg:hover{
	/* width: 100%;
	height: 100%; */
	transition: 0.5s;
	filter: drop-shadow(4px 4px 4px #7B7B7B);
	border-radius: 5px;

}
.pdimg{
width:240px;
height:250px;
border-radius: 5px;
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

.btnAds{
	width: 8px;
	height: 8px;
	border-radius: 500px;
}

#btnPrice {
	background-color: orange;
	width: 40px;
	height: 30px;
	color: white;
	margin-left: 44px;
	border-radius: 5px;
	border: none;
}

#btnPrice:hover {
	background-color: #EA7500;
	transition: 0.2s;
}

#btnColor {
	background-color: orange;
	width: 37px;
	height: 30px;
	color: white;
	margin-left: 8px;
	border-radius: 5px;
	margin-left: 185px;
	border: none;
}
#btnKeyword{
	background-color: orange;
	width: 37px;
	height: 30px;
	color: white;
	margin-left: 8px;
	border-radius: 5px;
	margin-left: 185px;
	border: none;
}

#btnColor:hover {
	background-color: #EA7500;
	transition: 0.2s;
}

#btnSort1 {
	background-color:white;
	font-size: 85%;
	width: 110px;
	height: 22px;
	color: black;
	margin-left: 8px;
	border-radius: 5px;
	border: none;
	margin-bottom:10px;
	margin-right: 350px;
}
#btnSort1:hover{
	background-color: #EA7500;
	transition: 0.2s;
	color: white;
}

#btnSort2 {
	font-size: 85%;
	background-color:white;
	width: 110px;
	height: 22px;
	color: black;
	margin-left: 8px;
	border-radius: 5px;
	border: none;
}

#btnSort2:hover{
	background-color: #EA7500;
	transition: 0.2s;
	color: white;
}

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

#img2 {
	width: 800px;
}

#img3 {
	width: 800px;
}

#img4 {
	width: 800px;
}

.window {
	margin: auto;
	margin-top: 50px;
	width: 800px;
	overflow: hidden;
}

.btnAds{
	width: 12px;
	height: 12px;
	border-radius: 150%;
	margin: 0 3px;
	border: none;
}

.red {
	background: #babbbc;
}
</style>




<body id="category">

	<!-- 	為了讓body內也能使用contextRoot的值 -->
	<input type="hidden" id="contextRoot"
		value="${pageContext.request.contextPath}">

	<!-- 上方導覽列 -->
<%-- 	<%@include file="FrontPageNavBar.jsp"%> --%>

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

		<!-- photo size 1280 * 533 -->
		<div class="window" align='Center'>
		
			<div class="images" id="images">
				<img id="img1" src="">
				<img id="img2" src="">
				<img id="img3" src="">
				<img id="img4" src="">
			</div>
			

			<span id="buttons">
				<button class="btnAds"></button>
				<button class="btnAds"></button>
				<button class="btnAds"></button>
				<button class="btnAds"></button>
			</span>
			
		</div>

	</section>

	<!-- End Banner Area -->
	
	


	<!--=================================廣告輪播========================================== -->

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
	<!--================================= 廣告輪播 ========================================== -->


	<!-- =============================== 抓取圖片資料 =================================== -->
	<script>

		$(document).ready(function getAllPtoto(){
			
			$.ajax({
				url:$("#contextRoot").val() +"/shopCenterProductAds.controller",
				type:"post",
				success:function(productAds){

					$("#img1").attr("src", $("#contextRoot").val()+"/ProductTempImg/"+productAds.imgUrl_A);
					$("#img2").attr("src", $("#contextRoot").val()+"/ProductTempImg/"+productAds.imgUrl_B);
					$("#img3").attr("src", $("#contextRoot").val()+"/ProductTempImg/"+productAds.imgUrl_C);
					$("#img4").attr("src", $("#contextRoot").val()+"/ProductTempImg/"+productAds.imgUrl_D);

				}
			})
		}
	)
	</script>
	<!-- ================================================================================= -->



	<div class="container">
		<div class="row">
			<div class="col-xl-3 col-lg-4 col-md-5">
				<div class="sidebar-categories">
					<div class="head">商品分類</div>
					<ul class="main-categories">

						<li class="main-nav-list"><a data-toggle="collapse"
							href="#beProduct" aria-expanded="false"
							aria-controls="beProduct"><span
								class="lnr lnr-arrow-right"></span>上衣<span class="number"></span></a>
							<ul class="collapse" id="beProduct" data-toggle="collapse"
								aria-expanded="false" aria-controls="beProduct">
								<li class="main-nav-list child"><a href="${contextRoot}/FrontPageSearchBySubCategory?name=排汗衫">排汗衫<span
										class="number"></span></a></li>
								<li class="main-nav-list child"><a href="${contextRoot}/FrontPageSearchBySubCategory?name=緊身衣">緊身衣<span
										class="number"></span></a></li>
							</ul></li>

						<li class="main-nav-list"><a data-toggle="collapse"
							href="#beauttyProduct" aria-expanded="false"
							aria-controls="beauttyProduct"><span
								class="lnr lnr-arrow-right"></span>鞋類<span class="number"></span></a>
							<ul class="collapse" id="beauttyProduct" data-toggle="collapse"
								aria-expanded="false" aria-controls="beauttyProduct">
								<li class="main-nav-list child"><a href="${contextRoot}/FrontPageSearchBySubCategory?name=休閒鞋">休閒鞋<span
										class="number"></span></a></li>
								<li class="main-nav-list child"><a href="${contextRoot}/FrontPageSearchBySubCategory?name=慢跑鞋">慢跑鞋<span
										class="number"></span></a></li>
							</ul></li>


						<li class="main-nav-list"><a data-toggle="collapse"
							href="#healthProduct" aria-expanded="false"
							aria-controls="healthProduct"><span
								class="lnr lnr-arrow-right"></span>健身用品<span class="number"></span></a>
							<ul class="collapse" id="healthProduct" data-toggle="collapse"
								aria-expanded="false" aria-controls="healthProduct">
								<li class="main-nav-list child"><a href="${contextRoot}/FrontPageSearchBySubCategory?name=健身配件">健身配件<span
										class="number"></span></a></li>
								<li class="main-nav-list child"><a href="${contextRoot}/FrontPageSearchBySubCategory?name=健身器材">健身器材<span
										class="number"></span></a></li>
							</ul></li>

						<li class="main-nav-list"><a data-toggle="collapse"
							href="#homeAppliance" aria-expanded="false"
							aria-controls="homeAppliance"><span
								class="lnr lnr-arrow-right"></span>補充營養品<span class="number"></span></a>
							<ul class="collapse" id="homeAppliance" data-toggle="collapse"
								aria-expanded="false" aria-controls="homeAppliance">
								<li class="main-nav-list child"><a href="${contextRoot}/FrontPageSearchBySubCategory?name=乳清蛋白">乳清蛋白<span
										class="number"></span></a></li>
								<li class="main-nav-list child"><a href="${contextRoot}/FrontPageSearchBySubCategory?name=高蛋白點心">高蛋白點心<span
										class="number"></span></a></li>
							</ul></li>

					</ul>

				</div>
				<div class="sidebar-filter mt-50">
					<div class="top-filter-head">商品篩選</div>
					<div class="common-filter">
						<div class="head">品牌</div>

						<form id="keyWordForm" action="FrontpageSearchByKeyword">
							<ul>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="apple" name="brand" value="Nike"><label
									for="apple">Nike<span></span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="asus" name="brand" value="Addidas"><label
									for="asus">Addidas<span></span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="gionee" name="brand" value="Converse"><label
									for="gionee">Converse<span></span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="micromax" name="brand" value="New Balance"><label
									for="micromax">New Balance<span></span></label></li>

								<li class="filter-list">關鍵字:&nbsp<input class=""
									type="text" id="Keyword" name="brand"><label
									for="micromax"><span></span></label></li>
							</ul>

							<button id="btnKeyword" type="button" value="搜尋">
								<i class="bi bi-search"></i>
							</button>
						</form>


					</div>
					<div class="common-filter">
						<div class="head">顏色</div>

						<form  id="colorForm" action="FrontpageSeperateSortByColor?color=${color}">
							<ul>
								<li class="filter-list"><input checked=true class="pixel-radio"
									type="radio" id="black" name="color" value="黑"><label
									for="black">黑<span>(29)</span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="balckleather" name="color" value="白"><label
									for="balckleather">白<span>(29)</span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="blackred" name="color" value="藍"><label
									for="blackred">藍<span>(0)</span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="gold" name="color" value="綠"><label
									for="gold">綠<span>(19)</span></label></li>
<!-- 								<input class="pixel-radio" hidden type="text" id="gold" name="color" value="金">		 -->
							</ul>

							<button id="btnColor" type="button" value="搜尋">
								<i class="bi bi-search"></i>
							</button>
						</form>



					</div>
					<!--=============================依照價格搜尋=================================== -->
					<form id="priceForm"
						action="${contextRoot}/FrontpageSeperateSortByPriceBetween?startPrice=${startPrice}&endPrice=${endPrice}">
						<div class="common-filter">
							<div class="head">價格範圍</div>
							<div class="">
								<div id=""></div>
								<div class="value-wrapper d-flex">

									<span><i class="bi bi-currency-dollar"></i></span> <input
										class="inputPrice" type="text" name="startPrice" value="0">
									<div id="lower-value"></div>
									<div class="to">~</div>
									<span><i class="bi bi-currency-dollar"></i></span><input
										name="endPrice" class="inputPrice" type="text">

									<button id="btnPrice" type="button" value="搜尋">
										<i class="bi bi-search"></i>
									</button>

									<div id="upper-value"></div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>


			<div class="col-xl-9 col-lg-8 col-md-7">
				<!-- Start Filter Bar -->
				<div class="filter-bar d-flex flex-wrap align-items-center">
					<div class="sorting">
<!-- 						<select id="sortPage"> -->
<!-- 							<option value="1">按價格排序</option> -->
<!-- 							<option value="2">按上架時間排序</option> -->
<!-- 						</select> -->
						<form id="sortByPrice" method="get" action="${contextRoot}/FrontpageSeperate">
							<button id="btnSort1" type="button" value="">按價格排序</button>
						</form>
						<form id="sortByDate" method="get" action="${contextRoot}/FrontpageSeperateSortByCreatedAt">
							<button  id="btnSort2" type="button" value="">按上架時間排序</button>
						</form>
					</div>
					
					<!-- <div class="sorting mr-auto">
						<select>
							<option value="1">顯示 6</option>
							<option value="2">顯示 10</option>
						</select>
					</div> -->
					<!-- <div class="pageButton1">
						<div class="filter-bar d-flex flex-wrap align-items-center">
							<div class="sorting">
								<div class="pagination">
									<c:forEach var="pageNumber" begin="1" end="${totalPages}">
										<c:choose>
											<c:when test="${page.number != pageNumber-1}">
												<a href="${contextRoot}/FrontpageSearchByKeyword?brand=${brand}&p=${pageNumber}"
													class="">${pageNumber}</a>
											</c:when>
											<c:otherwise>
												<c:out value="${pageNumber}"></c:out>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</div>
							</div>
						</div>
					</div> -->

					
				</div>
				<!-- End Filter Bar -->



				<!-- Start Best Seller -->
				<section class="lattest-product-area pb-40 category-list">
					<div class="row">

						<c:forEach items="${prodListOnePage}" var="prod">
							<!-- single product -->
													<div class="col-lg-4 col-md-6">
								<div class="single-product">
									<a href="${contextRoot}/getOneProductShop${prod.id}">
										<img class="pdimg" alt="picture" src="${contextRoot}/ProductTempImg/${prod.imgUrl}"  onmouseover="this.src=' ${contextRoot}/ProductTempImg/${prod.imgUrl_A} ';"
										  onmouseout="this.src=' ${contextRoot}/ProductTempImg/${prod.imgUrl} ';" width="112" />
									</a>
									<!-- 										ProductTempImg -->
									<div id="product-details" class="product-details">
										<a href="${contextRoot}/getOneProductShop${prod.id}"><h5 class="pdName">${prod.productName}</h5></a>
										<div class="price">
											<p class="pdPrice">
												價格: NT<i class="bi bi-currency-dollar"></i>${prod.price}</p>

											<!-- <h6 class="l-through">$210.00</h6> -->
										</div>
										<div class="prd-bottom">

											<c:choose>
												<c:when test="${prod.stock.quantity == 0}">
													<a class="social-info"> 
														<span style="font-size: 110%;" class="bi bi-cart-x"></span>
														<p class="hover-text" style="color: red;">補貨中</p>
													</a>
												</c:when>
												<c:otherwise>
													<a href="${contextRoot}/user/addMyCartFromShop?productId=${prod.id}" class="social-info addCart"> 
														<span  class="bi bi-cart4"></span>
														<p class="hover-text">加入購物車</p>
													</a>
												</c:otherwise>
											</c:choose>


											
											 <a class="social-info addWishList" href="${contextRoot}/user/addMyWishListFromShop?productId=${prod.id}" > 
											 	<span class="lnr lnr-heart"></span>
												<p class="hover-text">加入追蹤清單</p>
											</a>

											<a style="display:none" class="social-info removeWishList" href="#" > 
												<span style="color: #EA7500;" class="bi bi-heart-fill"></span>
											   <p class="hover-text">取消追蹤清單</p>
										   </a>
											
											 <a
												href="${contextRoot}/getOneProductShop${prod.id}"
												class="social-info"> <span class="bi bi-info-lg"></span>
												<p class="hover-text">更多商品資訊</p>
											</a>

										</div>
									</div>
								</div>
							</div>
						</c:forEach>
				</section>
				

				<div class="pageButton">
					<div class="filter-bar d-flex flex-wrap align-items-center">
						<div class="sorting">
							<div class="pagination">
								<c:forEach var="pageNumber" begin="1" end="${totalPages}">
									<c:choose>
										<c:when test="${page.number != pageNumber-1}">
											<a href="${contextRoot}/FrontpageSearchByKeyword?brand=${brand}&p=${pageNumber}"
												class="">${pageNumber}</a>
										</c:when>
										<c:otherwise>
											<c:out value="${pageNumber}"></c:out>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>



				<!-- End Best Seller -->



				<!-- Start Filter Bar -->
				<div class="filter-bar d-flex flex-wrap align-items-center">
<!-- 					<div class="sorting mr-auto"> -->
<!-- 						<select> -->
<!-- 							<option value="1">顯示 6</option> -->
<!-- 							<option selected value="2">顯示 10</option> -->
<!-- 						</select> -->
<!-- 					</div> -->
				</div>
				<!-- End Filter Bar -->
			</div>
		</div>
	</div>

	<!-- Start related-product Area -->

	<!-- End related-product Area -->

	<!-- start footer Area -->
	<footer class="footer-area section_gap">
		<div class="container">
			<div class="row">
				<div class="col-lg-3  col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h6>About Us</h6>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
							sed do eiusmod tempor incididunt ut labore dolore magna aliqua.</p>
					</div>
				</div>
				<div class="col-lg-4  col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h6>Newsletter</h6>
						<p>Stay update with our latest</p>
						<div class="" id="mc_embed_signup">

							<form target="_blank" novalidate="true"
								action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
								method="get" class="form-inline">

								<div class="d-flex flex-row">

									<input class="form-control" name="EMAIL"
										placeholder="Enter Email" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Enter Email '" required=""
										type="email">


									<button class="click-btn btn btn-default">
										<i class="fa fa-long-arrow-right" aria-hidden="true"></i>
									</button>
									<div style="position: absolute; left: -5000px;">
										<input name="b_36c4fd991d266f23781ded980_aefe40901a"
											tabindex="-1" value="" type="text">
									</div>

									<!-- <div class="col-lg-4 col-md-4">
													<button class="bb-btn btn"><span class="lnr lnr-arrow-right"></span></button>
												</div>  -->
								</div>
								<div class="info"></div>
							</form>
						</div>
					</div>
				</div>
				<div class="col-lg-3  col-md-6 col-sm-6">
					<div class="single-footer-widget mail-chimp">
						<h6 class="mb-20">Instragram Feed</h6>
						<ul class="instafeed d-flex flex-wrap">
							<li><img src="img/i1.jpg" alt=""></li>
							<li><img src="img/i2.jpg" alt=""></li>
							<li><img src="img/i3.jpg" alt=""></li>
							<li><img src="img/i4.jpg" alt=""></li>
							<li><img src="img/i5.jpg" alt=""></li>
							<li><img src="img/i6.jpg" alt=""></li>
							<li><img src="img/i7.jpg" alt=""></li>
							<li><img src="img/i8.jpg" alt=""></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-2 col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h6>Follow Us</h6>
						<p>Let us be social</p>
						<div class="footer-social d-flex align-items-center">
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
								class="fa fa-twitter"></i></a> <a href="#"><i
								class="fa fa-dribbble"></i></a> <a href="#"><i
								class="fa fa-behance"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div
				class="footer-bottom d-flex justify-content-center align-items-center flex-wrap">
				<p class="footer-text m-0">
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					Copyright &copy;
					<script>
						document.write(new Date().getFullYear());
					</script>
					All rights reserved | This template is made with <i
						class="fa fa-heart-o" aria-hidden="true"></i> by <a
						href="https://colorlib.com" target="_blank">Colorlib</a>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				</p>
			</div>
		</div>
	</footer>
	<!-- End footer Area -->

	<!-- Modal Quick Product View -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="container relative">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<div class="product-quick-view">
					<div class="row align-items-center">
						<div class="col-lg-6">
							<div class="quick-view-carousel">
								<div class="item"
									style="background: url(img/organic-food/q1.jpg);"></div>
								<div class="item"
									style="background: url(img/organic-food/q1.jpg);"></div>
								<div class="item"
									style="background: url(img/organic-food/q1.jpg);"></div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="quick-view-content">
								<div class="top">
									<h3 class="head">Mill Oil 1000W Heater, White</h3>
									<div class="price d-flex align-items-center">
										<span class="lnr lnr-tag"></span> <span class="ml-10">$149.99</span>
									</div>
									<div class="category">
										Category: <span>Household</span>
									</div>
									<div class="available">
										Availibility: <span>In Stock</span>
									</div>
								</div>
								<div class="middle">
									<p class="content">Mill Oil is an innovative oil filled
										radiator with the most modern technology. If you are looking
										for something that can make your interior look awesome, and at
										the same time give you the pleasant warm feeling during the
										winter.</p>
									<a href="#" class="view-full">View full Details <span
										class="lnr lnr-arrow-right"></span></a>
								</div>
								<div class="bottom">
									<div class="color-picker d-flex align-items-center">
										Color: <span class="single-pick"></span> <span
											class="single-pick"></span> <span class="single-pick"></span>
										<span class="single-pick"></span> <span class="single-pick"></span>
									</div>
									<div class="quantity-container d-flex align-items-center mt-15">
										Quantity: <input type="text" class="quantity-amount ml-15"
											value="1" />
										<div class="arrow-btn d-inline-flex flex-column">
											<button class="increase arrow" type="button"
												title="Increase Quantity">
												<span class="lnr lnr-chevron-up"></span>
											</button>
											<button class="decrease arrow" type="button"
												title="Decrease Quantity">
												<span class="lnr lnr-chevron-down"></span>
											</button>
										</div>

									</div>
									<div class="d-flex mt-20">
										<a href="#" class="view-btn color-2"><span>Add to
												Cart</span></a> <a href="#" class="like-btn"><span
											class="lnr lnr-layers"></span></a> <a href="#" class="like-btn"><span
											class="lnr lnr-heart"></span></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- 	======================================================================= -->

	<script>
		// function pageSort() {
		// 	var option = $("#sortPage option").val();
		// 	// document.getElementById("#sortPage").val();

		// 	if (option == 1) {
		// 		$.ajax({
		// 			url : $("#contextRoot").val() + 'FrontpageSeperate1',
		// 			type : 'post',
		// 			success : function(page) {
		// 				return page;
		// 				console.log('success');
		// 			}
		// 		})
		// 	} else if (option == 2) {
		// 		$.ajax({
		// 			url : $("#contextRoot").val()
		// 					+ 'FrontpageSeperateSortByCreatedAt',
		// 			type : 'post',
		// 			success : function() {

		// 				console.log('success');
		// 			}
		// 		})
		// 	}
		// }
	</script>

	<script>
		// $("#btnPrice").click(function priceBetween(){
		// 	$.ajax({
		// 		url:$("#contextRoot").val()
		// 					+ 'FrontpageSeperateSortByPriceBetween',
		// 		type:'Get',
		// 		success:function(products){
		// 			$("#forEach").html("items","${prod}")
		// 			$.each(products, function(index, prod){
		// 				console.log(prod.productName)
		// 			})
		// 		}
		// 	})
		// })
	</script>
	
	<script>
		
		console.log("準備開始抓");

		$.ajax({
			url: $("#contextRoot").val() + "/user/role",
			success: function(roles) {
				console.log("有抓到東西");
				console.log(roles);
				if(roles.includes("ROLE_USER")) {
					console.log("USER 登入中");
					$.ajax({
						url: $("#contextRoot").val() + "/user/memberId",
						success: function (memberId) {
							console.log("USER 登入中且拿到 member id");
							$.each( $(".productId"),function (index, productIdInput) {
								$.ajax({
									url: $("#contextRoot").val() + "/user/myWishListByMemberIdForAjax",
									data: {
										"memberId": memberId,
										"productId": $(productIdInput).val()},
									success: function(status) {
										let singleProductDiv = $(productIdInput).closest(".single-product");
										if(status) { // 若已在 wishList
											// 未加入
											singleProductDiv.find(".addWishList").hide(); 
											// 已加入
											singleProductDiv.find(".removeWishList").show();
										} else { // 尚未在 wishList
											// 未加入
											singleProductDiv.find(".addWishList").show();
											// 已加入
											singleProductDiv.find(".removeWishList").hide();
										}
									}
								});
							})
						}
					});
				}
			}
		});

	</script>

	<!-- 轉場效果 -->
	<script>

		$(".addWishList").click(function(){
			Swal.fire({
				title: '',
				text: '',
				width:200,
				height:200,
				timer:1800,
				imageUrl: $("#contextRoot").val() + '/img/load.gif',
				imageWidth: 120,
				imageHeight: 120,
				showConfirmButton:false,		
			})
		})

		$(".addCart").click(function(){
			Swal.fire({
				title: '',
				text: '',
				width:200,
				height:200,
				timer:1800,
				imageUrl: $("#contextRoot").val() + '/img/load.gif',
				imageWidth: 120,
				imageHeight: 120,
				showConfirmButton:false,		
			})
		})

		$("#btnPrice").click(function(){
			Swal.fire({
				title: '',
				text: '',
				width:200,
				height:200,
				timer:1800,
				imageUrl: $("#contextRoot").val() + '/img/load.gif',
				imageWidth: 120,
				imageHeight: 120,
				showConfirmButton:false,		
			})

			setTimeout("submitPriceForm()",1000)
		})

		function submitPriceForm(){
			$("#priceForm").submit();
		}

		$("#btnColor").click(function(){
			Swal.fire({
				title: '',
				text: '',
				width:200,
				height:200,
				timer:1800,
				imageUrl: $("#contextRoot").val() + '/img/load.gif',
				imageWidth: 120,
				imageHeight: 120,
				showConfirmButton:false,		
			})
			setTimeout("submitColorForm()",1000)

		})

		function submitColorForm(){
			$("#colorForm").submit();
		}

		$("#btnKeyword").click(function(){
			Swal.fire({
				title: '',
				text: '',
				width:200,
				height:200,
				timer:1800,
				imageUrl: $("#contextRoot").val() + '/img/load.gif',
				imageWidth: 120,
				imageHeight: 120,
				showConfirmButton:false,		
			})
			setTimeout("submitKeyWordForm()",1000)

		})

		function submitKeyWordForm(){
			$("#keyWordForm").submit();
		}

		$("#btnSort1").click(function(){
			Swal.fire({
				title: '',
				text: '',
				width:200,
				height:200,
				timer:1800,
				imageUrl: $("#contextRoot").val() + '/img/load.gif',
				imageWidth: 120,
				imageHeight: 120,
				showConfirmButton:false,		
			})
			setTimeout("sortByPrice()",1000)

		})

		function sortByPrice(){
			$("#sortByPrice").submit();
		}

		$("#btnSort2").click(function(){
			Swal.fire({
				title: '',
				text: '',
				width:200,
				height:200,
				timer:1800,
				imageUrl: $("#contextRoot").val() + '/img/load.gif',
				imageWidth: 120,
				imageHeight: 120,
				showConfirmButton:false,		
			})
			setTimeout("sortByDate()",1000)

		})

		function sortByDate(){
			$("#sortByDate").submit();
		}






	</script>










	<!-- 	======================================================================= -->






	<script src="${contextRoot}/resources/frontstage/js/vendor/jquery-2.2.4.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
	
	<script src="${contextRoot}/resources/frontstage/js/vendor/bootstrap.min.js"></script>
	<script src="${contextRoot}/resources/frontstage/js/jquery.ajaxchimp.min.js"></script>
	<script src="${contextRoot}/resources/frontstage/js/jquery.nice-select.min.js"></script>
	<script src="${contextRoot}/resources/frontstage/js/jquery.sticky.js"></script>
	<script src="${contextRoot}/resources/frontstage/js/nouislider.min.js"></script>
	<script src="${contextRoot}/resources/frontstage/js/jquery.magnific-popup.min.js"></script>
	<script src="${contextRoot}/resources/frontstage/js/owl.carousel.min.js"></script>
	<script src="${contextRoot}/resources/frontstage/js/gmaps.min.js"></script>
	<script src="${contextRoot}/resources/frontstage/js/main.js"></script>
	<script src="${contextRoot}/resources/frontstage/js/vendor/popper.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	
</body>


</html>