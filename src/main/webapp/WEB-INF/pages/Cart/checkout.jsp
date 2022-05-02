<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="tw.nicesport.model.ProductBean" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
			<style>
				.cartImg {
					width: 100px;
					height: 90px;
				}
				#last{
					margin-top:25px;				
				}
				#first{
					margin-top:25px;	
				}
				#phone{
					margin-top:25px;	
				}
				#email{
					margin-top:25px;	
				}
				#address{
					margin-top:25px;	
				}
				#submitCheckOut{
					border-radius:5px;															
				}
				
				
			</style>

			<body>
				<!-- Start Header Area -->

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
									<h1>結帳</h1>
									<nav class="d-flex align-items-center">
										<a href="index.html">購物車<span class="lnr lnr-arrow-right"></span></a>
										<a href="single-product.html">完成訂單</a>
									</nav>
								</div>
							</div>
						</div>
					</section>
					<!-- End Banner Area -->

					<!--================右邊框框 =================-->
					<section class="checkout_area section_gap">
						<div class="container">
							<div class="returning_customer">							
									<div class="billing_details">
										<div class="row">
											<div class="col-lg-8">
												<h3>通訊地址</h3>
											
												<form id="orderForm" class="row contact_form"
													action="${contextRoot}/insertOrder" method="post"
													novalidate="novalidate">

													<input type="hidden" value="${member.memberid}" name="memberid">
													<input type="hidden" value="60" name="shippingFee">

													<div class="col-md-6 form-group p_star">姓<span class="placeholder"
															data-placeholder="必填"></span>
														<input type="text" class="form-control"
															value="${member.lastname}" id="last" name="lastname">

													</div>
													<div class="col-md-6 form-group p_star">名
														<input type="text" class="form-control"
															value="${member.firstname}" id="first" name="firstname">
														<span class="placeholder" data-placeholder="必填"></span>
													</div>

													<div class="col-md-6 form-group p_star">連絡電話
														<input type="text" class="form-control" id="phone"
															value="${member.phone}" name="phone">
														<span class="placeholder" data-placeholder="必填"></span>
													</div>
													<div class="col-md-6 form-group p_star">電子郵件
														<input type="text" class="form-control" id="email"
															value="${member.email}" name="email"> <span
															class="placeholder" data-placeholder="必填"></span>
													</div>
													<div class="col-md-12 form-group p_star">郵遞區號
														<input type="text" class="form-control" id="shipPostalCode"
															name="shipPostalCode" value="">
													</div>
													<div class="col-md-12 form-group p_star">配送地址
														<input type="text" class="form-control" id="address"
															name="address" value="${member.address}">
														<span class="placeholder" data-placeholder="必填"></span>
													</div>
													</form>
												<div class="cupon_area">
													<div class="check_title">
														<h2>
															有優惠卷?? <a href="#">點這裡新增優惠</a>
														</h2>
													</div>
													<input  type="text" placeholder="輸入優惠碼"> <a id="submitCheckOut" class="primary-btn" href="#">送出!</a>
												</div>
											</div>
											<div class="col-lg-4">
												<div class="order_box">
													<h2>您的訂單</h2>
													<ul class="list">
														<!-- 取資料開始 -->
														<li><a href="#">產品 <span>Total</span></a></li>
														<c:set value="0" var="totalPrice" />
														<c:set value="0" var="sum" />
														<c:forEach var="cartProductList" items="${cartProductList}">
															<li><a id="pdName" href="#">${cartProductList.productBean.productName} 
																<span class="middle">x${cartProductList.quantity}
																	</span> <span class="middle">$
																		${cartProductList.productBean.price}</span></a>
															</li>
														<c:set value="${cartProductList.quantity*cartProductList.productBean.price}"
															var="totalPrice" />
														<c:set value="${sum + totalPrice}" var="sum" />	
														</c:forEach>
													</ul>
													<ul class="list list_2">
														<li><a href="#">小計 <span>$${sum}</span></a></li>
														<li><a href="#">運費 <span value="60">$60</span></a></li>
														<li><a href="#">總價 <span>$${sum+60}</span></a></li>
													</ul>
													<div class="payment_item">
														<div class="radion_btn">
															<input type="radio" id="f-option5" name="selector"> <label
																for="f-option5">到店付款</label>
															<div class="check"></div>
														</div>
														<p>到店付款 沒想好怎麼做</p>
													</div>
													<div class="payment_item active">
														<div class="radion_btn">
															<input type="radio" id="f-option6" name="selector"> <label
																for="f-option6">某個金流PayPal或綠界 </label> <img
																src="img/product/card.jpg" alt="">
															<div class="check"></div>
														</div>
														<p>Pay via PayPal; you can pay with your credit card if
															you donât have a PayPal account.</p>
													</div>
													<div class="creat_account">
														<input type="checkbox" id="f-option4" name="selector">
														<label for="f-option4">我已閱讀並接受 </label> <a href="#">使用者協議</a>
													</div>
													<a class="primary-btn" id="submitOrder" href="#">前往支付(目前直接接訂單新增)</a>
												</div>
											</div>
											

	<!-- 							右方訂單瀏覽區 -->
					<!-- <section class="checkout_area section_gap">
						<div class="container">
							<div class="returning_customer">
								<div class="cupon_area">
									<div class="check_title">
										
									</div>
								</div>
							</div>
						</div>

					</section> -->
								<script>
									$("#submitOrder").click(function () {
										// confirm(" 即將送出修改!! ");
										$("#orderForm").submit();
									});
								</script>
							</div>
						</div>
						</div>
					</section>
				
					<!--================左邊框框 =================-->

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

													<input class="form-control" name="EMAIL" placeholder="Enter Email"
														onfocus="this.placeholder = ''"
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
					<script>
						$(document).ready(
							function () { // Document is ready
								//送出
								$("#send").click(function () {
									confirm(" 即將送出修改!! ");
									$("#springForm").submit();
								}); // end of 取消 event
							}); // end of document ready
					</script>

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
			</body>
			<>

			</html>