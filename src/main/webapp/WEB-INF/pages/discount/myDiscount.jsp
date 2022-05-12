<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
			<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
				<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

				<!DOCTYPE html>
				<html lang="zxx" class="no-js">

				<head>
					<!-- Mobile Specific Meta -->
					<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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

					<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/linearicons.css" />
					<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/owl.carousel.css" />
					<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/font-awesome.min.css" />
					<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/themify-icons.css" />
					<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/nice-select.css" />
					<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/nouislider.min.css" />
					<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/bootstrap.css" />
					<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/main.css" />
					<link rel="icon" type="image/png" sizes="32x32"
						href="${contextRoot}/resources/backstage/favicon1-32x32.png" />
				</head>


				<body>


					<!-- 	為了讓body內也能使用contextRoot的值 -->
					<input type="hidden" id="contextRoot" value="${pageContext.request.contextPath}">

					<!-- 上方導覽列 -->
					<%-- <%@include file="FrontPageNavBar.jsp" %> --%>
						<!-- Start Header Area -->
						<header class="header_area sticky-header">
							<div class="main_menu">
								<!-- 插入上導覽列 -->
								<jsp:directive.include file="/WEB-INF/pages/layout/frontstage/nav.jsp" />
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
							<div class="container">
								<div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
									<div class="col-first">
										<h1>我的優惠券</h1>
										<nav class="d-flex align-items-center">
											<a href="${contextRoot}/">首頁<span class="lnr lnr-arrow-right"></span></a>
											<a href="${contextRoot}/discount/showADs-front">領取優惠券<span
													class="lnr lnr-arrow-right"></span></a>
											<a href="">我的優惠券</a>
										</nav>
									</div>
								</div>
							</div>
						</section>
						<!-- End Banner Area -->

						<!--================Cart Area =================-->
						<section class="cart_area">
							<div class="container">
								<div class="cart_inner">
									<div class="table-responsive">
										<table class="table">
											<thead>
												<tr>
													<!-- <tr hidden> -->
													<!-- <th scope="col"></th> -->
													<th scope="col">優惠券名稱/代碼</th>
													<th scope="col">抵用門檻</th>
													<th scope="col">折抵面額</th>
													<th scope="col">折抵折數</th>
													<th scope="col">有效期限</th>
												</tr>
											</thead>
											<tbody>

												<tr>
													<c:forEach items="${discounts}" var="discount">
														<td data-label="id" hidden>${discount.id}</td>
														<td data-label="title">${discount.name}</td>
														<td data-label="conditionPrice">${discount.conditionPrice}</td>
														<td data-label="discountAmount">${discount.discountAmount}</td>
														<td data-label="discountPercent">
															<c:if test="${discount.discountPercent==null}">
																
															</c:if>
															<c:if test="${discount.discountPercent!=null}">
																<c:if test="${discount.discountPercent%10==0}">
																	<fmt:formatNumber value="${discount.discountPercent/10}" maxFractionDigits="0"/>
																	折
																</c:if>
																<c:if test="${discount.discountPercent%10!=0}">
																	${discount.discountPercent}折
																</c:if>
															</c:if>
														</td>
														<td data-label="validDate">${discount.startDate}~<span
																style="color: #F75000;">${discount.endDate}</span></td>

												</tr>
												</c:forEach>
											</tbody>

										</table>
										<ol style="list-style-type: circle">
											<li>優惠券名稱/代碼：即是您輸入優惠券代碼的名稱</li>
											<li>請留意使用期限，逾期失效!</li>
											<li>更多相關優惠，請查閱<a href="${contextRoot}/announcement/showEvents-front">活動公告</a>
											</li>
										</ol>
									</div>
								</div>
							</div>
						</section>
						<!--================End Cart Area =================-->


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
								<div class="footer-bottom d-flex justify-content-center align-items-center flex-wrap">
									<p class="footer-text m-0">
										<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
										Copyright &copy;
										<script>
											document.write(new Date().getFullYear());
										</script>
										All rights reserved | This template is made with <i class="fa fa-heart-o"
											aria-hidden="true"></i> by <a href="https://colorlib.com"
											target="_blank">Colorlib</a>
										<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
									</p>
								</div>
							</div>
						</footer>
						<!-- End footer Area -->

						<script src="js/vendor/jquery-2.2.4.min.js"></script>
						<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
							integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
							crossorigin="anonymous"></script>
						<script src="${contextRoot}/resources/frontstage/js/vendor/jquery-2.2.4.min.js"></script>
						<script type="text/javascript"
							src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
						<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
							integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
							crossorigin="anonymous"></script>
						<script
							src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>

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
						<script src="js/vendor/bootstrap.min.js"></script>
						<script src="js/jquery.ajaxchimp.min.js"></script>
						<script src="js/jquery.nice-select.min.js"></script>
						<script src="js/jquery.sticky.js"></script>
						<script src="js/nouislider.min.js"></script>
						<script src="js/jquery.magnific-popup.min.js"></script>
						<script src="js/owl.carousel.min.js"></script>
						<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
						<!--gmaps Js-->
						<script
							src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
						<script src="js/gmaps.min.js"></script>
						<script src="js/main.js"></script>

						<!-------------------------------- 抓取購物車資料 --------------------------------->
						<script>

							function getCartProduct() {
								$.ajax({

									url: $("#contextRoot").val() + "/findMyWishList?memberId=101",
									type: "post",
									success: function () {

									}
								})
							}

						</script>


						<script>

							$(".deleteCart").click(function () {
								var deteteCart = $(this);
								$.ajax({
									url: $("#contextRoot").val() + "/DeleteCart",
									data: {
										memberid: $(this).data("memberid"),
										productid: $(this).data("productid")
									},
									success: function () {
										deteteCart.closest("tr").remove();
									}
								})
								return false;
							})

							varifyCart();

							function varifyCart() {
								var a = $(".cartPrice").text();

								if (a == null || a == "") {
									$("#checkOut").removeAttr("href", "").text("無結帳商品").css("color", "	#E0E0E0").click(function () {
										Swal.fire({
											icon: 'warning',
											title: '目前購物車是空的喔!',
											text: '去逛逛吧',
											footer: '<a href="${contextRoot}/FrontpageSeperate"><i class="bi bi-arrow-right"></i>&nbsp前往購物商城</a>'
										})
									})
								}
							}





						</script>


				</body>

				</html>