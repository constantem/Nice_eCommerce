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
</head>



<style>
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
	width: 8px;
	height: 8px;
	border-radius: 500px;
}

#btnPrice {
	background-color: orange;
	width: 40px;
	height: 30px;
	color: white;
	margin-left: 8px;
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

#btnColor:hover {
	background-color: #EA7500;
	transition: 0.2s;
}
</style>




<body id="category">

	<!-- 	為了讓body內也能使用contextRoot的值 -->
	<input type="hidden" id="contextRoot"
		value="${pageContext.request.contextPath}">

	<!-- 上方導覽列 -->
	<%@include file="FrontPageNavBar.jsp"%>



	<div class="container">
		<div class="row">
			<div class="col-xl-3 col-lg-4 col-md-5">
				<div class="sidebar-categories">
					<div class="head">商品分類</div>
					<ul class="main-categories">

						<li class="main-nav-list"><a data-toggle="collapse"
							href="#beauttyProduct" aria-expanded="false"
							aria-controls="beauttyProduct"><span
								class="lnr lnr-arrow-right"></span>運動服飾<span class="number">(65)</span></a>
							<ul class="collapse" id="beauttyProduct" data-toggle="collapse"
								aria-expanded="false" aria-controls="beauttyProduct">
								<li class="main-nav-list child"><a href="#">Frozen Fish<span
										class="number">(13)</span></a></li>
								<li class="main-nav-list child"><a href="#">Dried Fish<span
										class="number">(09)</span></a></li>
								<li class="main-nav-list child"><a href="#">Fresh Fish<span
										class="number">(17)</span></a></li>
								<li class="main-nav-list child"><a href="#">Meat
										Alternatives<span class="number">(01)</span>
								</a></li>
								<li class="main-nav-list child"><a href="#">Meat<span
										class="number">(11)</span></a></li>
							</ul></li>


						<li class="main-nav-list"><a data-toggle="collapse"
							href="#healthProduct" aria-expanded="false"
							aria-controls="healthProduct"><span
								class="lnr lnr-arrow-right"></span>健身器材<span class="number">(29)</span></a>
							<ul class="collapse" id="healthProduct" data-toggle="collapse"
								aria-expanded="false" aria-controls="healthProduct">
								<li class="main-nav-list child"><a href="#">Frozen Fish<span
										class="number">(13)</span></a></li>
								<li class="main-nav-list child"><a href="#">Dried Fish<span
										class="number">(09)</span></a></li>
								<li class="main-nav-list child"><a href="#">Fresh Fish<span
										class="number">(17)</span></a></li>
								<li class="main-nav-list child"><a href="#">Meat
										Alternatives<span class="number">(01)</span>
								</a></li>
								<li class="main-nav-list child"><a href="#">Meat<span
										class="number">(11)</span></a></li>
							</ul></li>

						<li class="main-nav-list"><a data-toggle="collapse"
							href="#homeAppliance" aria-expanded="false"
							aria-controls="homeAppliance"><span
								class="lnr lnr-arrow-right"></span>補充營養品<span class="number">(15)</span></a>
							<ul class="collapse" id="homeAppliance" data-toggle="collapse"
								aria-expanded="false" aria-controls="homeAppliance">
								<li class="main-nav-list child"><a href="#">Frozen Fish<span
										class="number">(13)</span></a></li>
								<li class="main-nav-list child"><a href="#">Dried Fish<span
										class="number">(09)</span></a></li>
								<li class="main-nav-list child"><a href="#">Fresh Fish<span
										class="number">(17)</span></a></li>
								<li class="main-nav-list child"><a href="#">Meat
										Alternatives<span class="number">(01)</span>
								</a></li>
								<li class="main-nav-list child"><a href="#">Meat<span
										class="number">(11)</span></a></li>
							</ul></li>

					</ul>

				</div>
				<div class="sidebar-filter mt-50">
					<div class="top-filter-head">商品篩選</div>
					<div class="common-filter">
						<div class="head">品牌</div>

						<form action="FrontpageSearchByKeyword">
							<ul>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="apple" name="brand" value="Nike"><label
									for="apple">Nike<span>(29)</span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="asus" name="brand" value="Addidas"><label
									for="asus">Addidas<span>(29)</span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="gionee" name="brand" value="Converse"><label
									for="gionee">Converse<span>(19)</span></label></li>
								<li class="filter-list"><input class="pixel-radio"
									type="radio" id="micromax" name="brand" value="New Balance"><label
									for="micromax">New Balance<span>(19)</span></label></li>

								<li class="filter-list">關鍵字:&nbsp<input class=""
									type="text" id="Keyword" name="brand"><label
									for="micromax"><span></span></label></li>
							</ul>

							<button id="btnColor" type="submit" value="搜尋">
								<i class="bi bi-search"></i>
							</button>
						</form>


					</div>
					<div class="common-filter">
						<div class="head">顏色</div>

						<form action="FrontpageSeperateSortByColor?color=${color}">
							<ul>
								<li class="filter-list"><input class="pixel-radio"
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
							</ul>

							<button id="btnColor" type="submit" value="搜尋">
								<i class="bi bi-search"></i>
							</button>
						</form>



					</div>
					<!--=============================依照價格搜尋=================================== -->
					<form
						action="/Nice_eCommerce/FrontpageSeperateSortByPriceBetween?startPrice=${startPrice}&endPrice=${endPrice}">
						<div class="common-filter">
							<div class="head">價格</div>
							<div class="price-range-area">
								<div id="price-range"></div>
								<span>價格範圍</span>
								<div class="value-wrapper d-flex">

									<span><i class="bi bi-currency-dollar"></i></span> <input
										class="inputPrice" type="text" name="startPrice" value="0">
									<div id="lower-value"></div>
									<div class="to">~</div>
									<span><i class="bi bi-currency-dollar"></i></span><input
										name="endPrice" class="inputPrice" type="text">
									<button id="btnPrice" type="submit" value="搜尋">
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
						<select id="sortPage" onchange="pageSort()">
							<option value="1">按價格排序</option>
							<option selected value="2">按上架時間排序</option>
						</select>
					</div>
					<div class="sorting mr-auto">
						<select>
							<option value="1">顯示 6</option>
							<option selected value="2">顯示 10</option>
						</select>
					</div>
					<div class="pagination">
						<a href="#" class="prev-arrow"><i
							class="fa fa-long-arrow-left" aria-hidden="true"></i></a> <a href="#"
							class="active">1</a> <a href="#">2</a> <a href="#">3</a> <a
							href="#" class="dot-dot"><i class="fa fa-ellipsis-h"
							aria-hidden="true"></i></a> <a href="#">6</a> <a href="#"
							class="next-arrow"><i class="fa fa-long-arrow-right"
							aria-hidden="true"></i></a>
					</div>
				</div>
				<!-- End Filter Bar -->




				<!-- Start Best Seller -->
				<section class="lattest-product-area pb-40 category-list">
					<div class="row">

						<c:forEach items="${prod}" var="prod">
							<!-- single product -->
							<div class="col-lg-4 col-md-6">
								<div class="single-product">
									<img alt="picture"
										src="${contextRoot}/ProductTempImg/${prod.imgUrl}" width="112" />
									<!-- 										ProductTempImg -->
									<div id="product-details" class="product-details">
										<h5 class="pdName">${prod.productName}</h5>
										<div class="price">
											<p class="pdPrice">
												價格: NT<i class="bi bi-currency-dollar"></i>${prod.price}</p>

											<!-- <h6 class="l-through">$210.00</h6> -->
										</div>
										<div class="prd-bottom">

											<a href="" class="social-info"> <span class="ti-bag"></span>
												<p class="hover-text">加入購物車</p>
											</a> <a href="" class="social-info"> <span
												class="lnr lnr-heart"></span>
												<p class="hover-text">加入願望清單</p>
											</a> <a href="" class="social-info"> <span
												class="lnr lnr-sync"></span>
												<p class="hover-text">比較</p>
											</a> <a
												href="/Nice_eCommerce/getOneProductShop${prod.product_id}"
												class="social-info"> <span class="lnr lnr-move"></span>
												<p class="hover-text">更多商品資訊</p>
											</a>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
				</section>

				<div class="">
					<div class="filter-bar d-flex flex-wrap align-items-center">
						<div class="sorting">
							<div class="pagination">
								<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
									<c:choose>
										<c:when test="${page.number != pageNumber-1}">
											<a href="${contextRoot}/FrontpageSeperate?p=${pageNumber}"
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
					<div class="sorting mr-auto">
						<select>
							<option value="1">顯示 6</option>
							<option selected value="2">顯示 10</option>
						</select>
					</div>
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










	<!-- 	======================================================================= -->






	<script src="/resources/frontstage/js/vendor/jquery-2.2.4.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
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
	<script
		src="${contextRoot}/resources/frontstage/js/jquery.magnific-popup.min.js"></script>
	<script
		src="${contextRoot}/resources/frontstage/js/owl.carousel.min.js"></script>
	<!--gmaps Js-->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
	<script src="js/gmaps.min.js"></script>
	<script src="js/main.js"></script>
</body>


</html>