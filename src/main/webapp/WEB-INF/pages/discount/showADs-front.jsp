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
					<title>優惠券</title>

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

				</head>

				<style>
					.coupon {
						position: relative;
						width: 400px;
						height: 160px;
						margin: 30px auto;
						background-image: radial-gradient(circle at 1px 8px, transparent 6px, #ff9e6d 6px, #ff9e6d 0px), radial-gradient(circle at 199px 8px, transparent 6px, #ff9e6d 6px, #ff9e6d 0px);
						/* 優惠券長度 */
						background-size: 200px 18px;
						background-position: 0 0, 200px 0;
						background-repeat-x: no-repeat;
						font-size: 60px;
						color: #fff;
						font-weight: bold;
						line-height: 160px;
						padding-left: 60px;
						box-sizing: border-box;
						cursor: pointer;
					}

					/* 優惠券上的白色虛線 */
					.coupon::before {
						position: absolute;
						content: "";
						left: 300px;
						top: 0;
						bottom: 0;
						width: 0;
						border-left: 1px dashed #fff;
					}

					/* .take {
						position: relative;
						height: 100px;
						width: 100px;
						right: 0px;
						font-size: 20px;
						padding: 0 0 0 10px;
					} */

					.coupon::after {
						position: absolute;
						content: "立即領取";
						color: black;
						font-size: 26px;
						width: 70px;
						top: 50%;
						right: -6%;
						transform: translate(-50%, -50%);
						line-height: 40px;
						letter-spacing: 5px;
					}
				</style>

				<body>
					<!-- 為了讓body內也能使用contextRoot的值 -->
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
									<h1>超浮誇母親節獻禮</h1>
									<nav class="d-flex align-items-center">
										<a href="${contextRoot}/">首頁<span class="lnr lnr-arrow-right"></span></a>
										<a href="#">優惠券一覽</a>
									</nav>
								</div>
							</div>
						</div>
					</section>
					<!-- End Banner Area -->

					<!--================Single Product Area =================-->
					<div class="product_image_area">
						<div class="container">
							<div class="row s_product_inner">
								<div class="col-lg-7">
									<div class="s_Product_carousel">
										<div class="single-prd-item">
											<img class="img-fluid" src="${contextRoot}/img/mc.png" alt="">
										</div>
										<div class="single-prd-item">
											<img class="img-fluid" src="${contextRoot}/img/promotion.jpg" alt="">
										</div>
										<div class="single-prd-item">
											<img class="img-fluid" src="${contextRoot}/img/discount.png" alt="">
										</div>
									</div>

									<section class="login_box_area section_gap">
										<div class="container">
											<div class="row">
												<div class="col-lg-12">
													<div class="login_box_img">
														<img class="img-fluid" src="${contextRoot}/img/adidas.jpg"
															alt="">
														<div class="hover">
															<div>
																開始時間：<span id="start_pad"></span><br>
																結束時間：<span id="end_pad"></span><br>
															</div>
															<p>
																剩餘時間：<span id="pad"></span>
															</p>
															<h4>限時特價商品</h4>
															<p>別猶豫，趕緊</p>
															<a class="genric-btn success circle"
																href="${contextRoot}/FrontpageSeperate">
																前往察看
															</a>

														</div>

													</div>
												</div>

											</div>
										</div>
									</section>

								</div>

								<div class="col-lg-4 offset-lg-1">
									<a href="#">
										<div id="coupon1" class="coupon">
											50元
											<div class="hover-text">母親節特輯</div>
											<!-- <button class="take">領取</button> -->
										</div>
									</a>
									<a href="#">
										<div id="coupon2" class="coupon">
											150元
											<!-- <h3>母親節特輯</h3> -->
											<!-- <button class="take">領取</button>-->
										</div>
									</a>
									<a href="#">
										<div id="coupon3" class="coupon">
											250元

										</div>
									</a>

									<a href="#">
										<div id="coupon4" class="coupon">
											350元

										</div>
									</a>

									<a href="#">
										<div id="coupon5" class="coupon">
											45000元

										</div>
									</a>
								</div>

							</div>
						</div>
					</div>


					<SCRIPT language="javascript">
						var startDate = new Date();
						var endDate = new Date(2022, 3, 31, 12, 25);
						var spantime = (endDate - startDate) / 1000;

						function getString(dt) {
							return dt.getFullYear() + "年" + (dt.getMonth() + 1) + "月" + dt.getDate() + "日" + dt.getHours() + "時" + dt.getMinutes() + "分";
						}
						function cal() {
							spantime--;
							var d = Math.floor(spantime / (24 * 3600));
							var h = Math.floor((spantime % (24 * 3600)) / 3600);
							var m = Math.floor((spantime % 3600) / (60));
							var s = Math.floor(spantime % 60);
							str = d + "天 " + h + "時 " + m + "分 " + s + "秒 ";
							document.getElementById("pad").innerHTML = str;

							// if (spantime > 0) {
							// 	$("#hour").text(h + (d * 24));
							// 	$("#min").text(m);
							// 	$("#sec").text(s);
							// } else { // 避免倒數變成負的
							// 	$("#hour").text(0);
							// 	$("#min").text(0);
							// 	$("#sec").text(0);
							// }
						}

						window.onload = function () {
							document.getElementById("start_pad").innerHTML = getString(startDate);
							document.getElementById("end_pad").innerHTML = getString(endDate);
							setInterval(cal, 1000);
						}
					</SCRIPT>

				
					<!-- ====================================進入網頁後開始計時start================================= -->
					<!-- <div>
					<span id="Check_Txt" style="color:rgb(156, 92, 103)">時間計數：<span id="Check_i">0天0小時0分0秒</span></span>
					<script type="text/javascript">
						var SetMinute = 0;
						function Check_Time() {
							SetMinute += 1;
							var Check_i = document.getElementById("Check_i");

							var Cal_Day = Math.floor(SetMinute / 86400);
							var Cal_Hour = Math.floor(SetMinute / 3600);
							var Cal_Minute = Math.floor(Math.floor(SetMinute % 3600) / 60);
							var Cal_Second = SetMinute % 60;

							Check_i.innerHTML = Cal_Day + "天" + Cal_Hour + "小時" + Cal_Minute + "分" + Cal_Second + "秒";

						}
						var mm = window.setInterval("Check_Time()", 1000);

					</script>
					</div> -->
					<!-- ====================================進入網頁後開始計時over================================= -->



					<!--================End Single Product Area =================-->

					<!--================Login Box Area =================-->

					<!--================End Login Box Area =================-->

					<!-- 插入頁腳 -->
					<jsp:directive.include file="/WEB-INF/pages/layout/frontstage/footer.jsp" />


					<script src="${contextRoot}/resources/frontstage/js/vendor/jquery-2.2.4.min.js"></script>
					<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
						integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
						crossorigin="anonymous"></script>
					<script src="${contextRoot}/resources/frontstage/js/vendor/bootstrap.min.js"></script>
					<script src="${contextRoot}/resources/frontstage/js/jquery.ajaxchimp.min.js"></script>
					<script src="${contextRoot}/resources/frontstage/js/jquery.nice-select.min.js"></script>
					<script src="${contextRoot}/resources/frontstage/js/jquery.sticky.js"></script>
					<script src="${contextRoot}/resources/frontstage/js/nouislider.min.js"></script>
					<script src="${contextRoot}/resources/frontstage/js/jquery.countdown.js"></script>
					<script src="${contextRoot}/resources/frontstage/js/jquery.magnific-popup.min.js"></script>
					<script src="${contextRoot}/resources/frontstage/js/owl.carousel.min.js"></script>
					<!--gmaps Js-->
					<script
						src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
					<script src="${contextRoot}/resources/frontstage/js/gmaps.min.js"></script>
					<script src="${contextRoot}/resources/frontstage/js/main.js"></script>
				</body>

				</html>