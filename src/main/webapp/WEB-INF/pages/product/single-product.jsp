
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
<link rel="shortcut icon" href="img/fav.png">
<!-- Author Meta -->
<meta name="author" content="CodePixar">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>Nice eCommerce Shopping Center</title>
<!--
			CSS
			============================================= -->
<c:set var="contextRoot" value="${pageContext.request.contextPath}"></c:set>

<link rel="stylesheet"
	href="${contextRoot}/resources/frontstage/css/linearicons.css">
<link rel="stylesheet"
	href="${contextRoot}/resources/frontstage/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${contextRoot}/resources/frontstage/css/themify-icons.css">
<link rel="stylesheet"
	href="${contextRoot}/resources/frontstage/css/bootstrap.css">
<link rel="stylesheet"
	href="${contextRoot}/resources/frontstage/css/owl.carousel.css">
<link rel="stylesheet"
	href="${contextRoot}/resources/frontstage/css/nice-select.css">
<link rel="stylesheet"
	href="${contextRoot}/resources/frontstage/css/nouislider.min.css">
<link rel="stylesheet"
	href="${contextRoot}/resources/frontstage/css/ion.rangeSlider.css" />
<link rel="stylesheet"
	href="${contextRoot}/resources/frontstage/css/ion.rangeSlider.skinFlat.css" />
<link rel="stylesheet"
	href="${contextRoot}/resources/frontstage/css/main.css">
<link rel="icon" type="image/png" sizes="32x32"
	href="${contextRoot}/resources/backstage/favicon1-32x32.png" /><!-- css main1  -->

</head>

<style>
#star1:hover{
color: #ff8000;
}
#star2:hover{
color: #ff8000;
}
#star3:hover{
color: #ff8000;
}
#star4:hover{
color: #ff8000;
}
#star5:hover{
color: #ff8000;
}	
#yourScore{
color: #fa8d20;
font-size: 90%;
}
#stPoint1{
	color:	#6C6C6C ;
}	
#stPoint2{
	color:	#6C6C6C;
}	
#stPoint3{
	color:	#6C6C6C ;
}	
#stPoint4{
	color:	#6C6C6C ;
}
#stPoint5{
	color:	#6C6C6C ;
}	
#stPoint6{
	color:	#6C6C6C ;
}	
#stPoint7{
	color:	#6C6C6C ;
}	
#stPoint8{
	color:	#6C6C6C ;
}
#stPoint9{
	color:	#6C6C6C ;
}
#stPoint10{
	color:	#6C6C6C ;
}

#prodComment1{
	margin-left: 15px;
}
#prodComment2{
	margin-left: 15px;
}
#prodComment3{
	margin-left: 15px;
}


#row {
	margin-left: 250px;
}

#btnComment {
	border-radius: 5px;
	width: 150px;
	height: 40px;
	justify-items: center;
}

#btnCreate{
	border-radius: 5px;
	width: 100px;
	height: 40px;
	justify-items: center;
	margin-top: 30px;
}

#box {
	/* margin: 100px; */
	width: 400px;
	height: 400px;
	/* 	border: 1px solid black; */
}

#box img {
	width: 100%;
	height: 100%;
}

#box2 {
	width: 400px;
	height: 400px;
	/* 	border: 1px solid black; */
	position: absolute;
	top: 0;
	left: 400px;
	overflow: hidden;
}

#box2 img {
	width: 600px;
	height: 600px;
	position: absolute;
	/* left:-120px;
            top:-100px */
}

#small {
	width: 300px;
	height: 300px;
	background: rgba(0, 0, 0, 0.6);
	position: absolute;
	top: 0;
	left: 0;
}

figure {
	width: 20%;
	border: 4px transparent;
	margin: 4px;
	width: 120px;
	height: 120px;
}

figure.active {
	border: 3px solid #8E8E8E;
}

figure img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

#prodComment{
	margin-left: 15px;
}
#commentDate{
	margin-left: 15px;
}

.relimg{
	width: 70px;
	height: 70px;
}

.commentDate{
	margin-left: 280px;
}
</style>

<body>

	

	<!-- 上方導覽列 -->
	<%@include file="FrontPageNavBar.jsp"%>


		<!-- 	為了讓body內也能使用contextRoot的值 -->
		<input type="hidden" id="contextRoot"
		value="${pageContext.request.contextPath}">




	<!--================Single Product Area =================-->
	<div class="product_image_area">
		<div class="container">
			<div class="row s_product_inner">
				<!-- ======================== 商品圖 ============================== -->
				
				<div class="col-lg-6">
					<!-- class="s_Product_carousel" -->
					<div class="">

						<div id="" class="single-prd-item ">
							<!-- 圖片尺寸 width="480" height="440" -->
							<ul>
								<li><img id="mainPic"
									src="${contextRoot}/ProductTempImg/${pdVal.imgUrl}"
									alt="picture" id="productImg" width="480" height="440"></li>
							</ul>
						</div>

						<br>

						<div class="d-flex justify-content-center">
							<figure>
								<img src="${contextRoot}/ProductTempImg/${pdVal.imgUrl_A}">
							</figure>

							<figure>
								<img src="${contextRoot}/ProductTempImg/${pdVal.imgUrl_B}">
							</figure>

							<figure>
								<img src="${contextRoot}/ProductTempImg/${pdVal.imgUrl_C}">
							</figure>

							<figure>
								<img src="${contextRoot}/ProductTempImg/${pdVal.imgUrl}">
							</figure>

						</div>

					</div>
				</div>
				<!-- ======================================================= -->

				<div class="col-lg-5 offset-lg-1">
					<div class="s_product_text">
						<h3>${pdVal.productName}</h3>
						<h2 id="pdPrice">
							NT $ <i class="bi bi-currency-dollar"></i>${pdVal.price}</h2>
						<ul class="list">
							<li class="status"><a class="active" href="#"><span>商品類別</span>${pdVal.subCategory.name}</a></li>
							<li class="status"><a href="#" id="stockStatus">${pdVal.stock.quantity}</a></li>
						</ul>

						<!-- 						商品描述 -->
						<p>${pdVal.productDiscription}</p>

						<div class="product_count">
							 數量:<input type="text" name="qty"
								id="sst" maxlength="12" value="1" title="Quantity:"
								class="input-text qty">

							<button
								id="upPrice"
								onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst )) result.value++;return false;"
								class="increase items-count" type="button">
								<i class="lnr lnr-chevron-up"></i>
							</button>

							<button
								id="downPrice"
								onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst ) &amp;&amp; sst > 0 ) result.value--;return false;"
								class="reduced items-count" type="button">
								<i class="lnr lnr-chevron-down"></i>
							</button>


							總價:<input type="text" name="qty"
								id="orderPrice" maxlength="12" value="" title="Quantity:"
								class="input-text qty">

								<input type="hidden" name="qty"
								id="totalPrice" maxlength="12" value="${pdVal.price}" title="Quantity:"
								class="input-text qty">

							
						</div>
						<div class="card_area d-flex align-items-center">
							<a class="primary-btn" id="btnCart" href="#">加入購物車</a> <a
								class="icon_btn" href="#"><i class="lnr lnr lnr-heart"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--================End Single Product Area =================-->





	<!--================Product Description Area =================-->
	<section class="product_description_area">
		<div class="container">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item"><a class="nav-link" id="home-tab"
					data-toggle="tab" href="#home" role="tab" aria-controls="home"
					aria-selected="true">商品描述</a></li>
				<li class="nav-item"><a class="nav-link" id="profile-tab"
					data-toggle="tab" href="#profile" role="tab"
					aria-controls="profile" aria-selected="false">特色</a></li>
				<li class="nav-item"><a class="nav-link active" id="review-tab"
					data-toggle="tab" href="#review" role="tab" aria-controls="review"
					aria-selected="false">評論</a></li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade" id="home" role="tabpanel"
					aria-labelledby="home-tab">
					<p>${pdVal.productDiscription}</p>

				</div>
				<div class="tab-pane fade" id="profile" role="tabpanel"
					aria-labelledby="profile-tab">
					<div class="table-responsive">
						<table class="table">
							<tbody>
								<tr>
									<td>
										<h5>品牌</h5>
									</td>
									<td>
										<h5>${pdVal.supplier}</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>顏色</h5>
									</td>
									<td>
										<h5>${pdVal.color}</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>重量</h5>
									</td>
									<td>
										<h5>${pdVal.weight}</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>尺寸</h5>
									</td>
									<td>
										<h5>${pdVal.size}</h5>
									</td>
								</tr>
								<tr>
									<td>
										<h5>庫存量</h5>
									</td>
									<td>
										<h5>${pdVal.stock.quantity}</h5>
									</td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>

						
<!-- 		======================================== 評論商品 =================================================	 -->

				<div class="tab-pane fade" id="contact" role="tabpanel"
					aria-labelledby="contact-tab">
					<div class="row">
						<div class="col-lg-6">
							<div class="comment_list">
							
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/review-1.png" alt="">
										</div>
										<div class="media-body">
											<h4>Blake Ruiz</h4>
											<h5>12th Feb, 2018 at 05:56 pm</h5>
											<a class="reply_btn" href="#">Reply</a>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
								</div>
							</div>
						</div>
						
						
						<div class="col-lg-6">
							<div class="review_box">
								<h4>新增評論</h4>
								<form class="row contact_form" action="contact_process.php"
									method="post" id="contactForm" novalidate="novalidate">
									<div class="col-md-12">
										<div class="form-group">
											<input type="text" class="form-control" id="name1" name="name"
												placeholder="Your Full name">
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<input type="email" class="form-control" id="email1"
												name="email" placeholder="Email Address">
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<input type="text" class="form-control" id="number1"
												name="number" placeholder="Phone Number">
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<textarea class="form-control" name="message" id="message"
												rows="1" placeholder="Message"></textarea>
										</div>
									</div>
									<div class="col-md-12 text-right">
										<button type="submit" value="submit" class="btn primary-btn">Submit
											Now</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane fade show active" id="review" role="tabpanel"
					aria-labelledby="review-tab">
					<div class="row">
						<div class="col-lg-6">
							<div class="row total_rate">
								<div class="col-6">
									<div class="box_total">
										<h5>顧客評論</h5>
										<h4>5.0</h4>
										<h6>(03 則評論)</h6>
									</div>
								</div>
								<div class="col-6">
									<div class="rating_list">
										<h3>評分</h3>

										<ul class="list">
											<li><a href="#">5 Star
												<i  class="fa fa-star"></i>
												<i  class="fa fa-star"></i>
												<i  class="fa fa-star"></i>
												<i  class="fa fa-star"></i>
												<i  class="fa fa-star"></i> 
											</a></li>

											<li><a href="#">4 Star
												<i  class="fa fa-star"></i>
												<i  class="fa fa-star"></i>
												<i  class="fa fa-star"></i>
												<i  class="fa fa-star"></i>
											</a></li>

											<li><a href="#">3 Star
												<i  class="fa fa-star"></i>
												<i  class="fa fa-star"></i>
												<i  class="fa fa-star"></i>
											</a></li>

											<li><a href="#">2 Star
												<i  class="fa fa-star"></i>
												<i  class="fa fa-star"></i>
											</a></li>

											<li><a href="#">1 Star
												 <i class="fa fa-star"></i>
											</a></li>
										</ul>
									</div>
								</div>
							</div>
							
							<!-- ================================第一筆評論============================== -->
							<div class="review_list">
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/review-1.png" alt="">
										</div>
										<div class="media-body">
											<!--評論人姓名-->
											<h4 id="cusName1"></h4>
											<span hidden id="score1"></span>

											<div id="scoreBox">
								
											</div>
											
										</div>
									</div>

									<!--評論內容-->
									<p id="prodComment1"></p>
									<!--評論時間-->
									<span class="commentDate" id="commentDate1"></span>
								</div>
							</div>
							<!-- ================================第二筆評論============================== -->
							<div class="review_list">
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/review-1.png" alt="">
										</div>
										<div class="media-body">
											<!--評論人姓名-->
											<h4 id="cusName2"></h4>
											<span hidden id="score2"></span>

											<div id="scoreBox1">
												
											</div>

										</div>
									</div>

									<!--評論內容-->
									<p id="prodComment2"></p>
									<!--評論時間-->
									<span class="commentDate" id="commentDate2"></span>
								</div>
							</div>
							<!-- ================================第三筆評論============================== -->
							<div class="review_list">
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/review-1.png" alt="">
										</div>
										<div class="media-body">
											<!--評論人姓名-->	
											<h4 id="cusName3"></h4>
											<span hidden id="score3"></span>

											<div id="scoreBox2">
												
											</div>

										</div>
									</div>

									<!--評論內容-->
									<p id="prodComment3"></p>
									<!--評論時間-->
									<span class="commentDate" id="commentDate3"></span>
								</div>
							</div>
						</div>
						
						
						
						
						
<!-- 		======================================== 評論商品 ===========================================	 -->
						<div class="col-lg-6">
							<div class="review_box">
								<h4>評論商品</h4>
								<p>您的評分:</p>
								
								<ul class="list">
									<li><a ><i id="star1" class="fa fa-star"></i></a></li>
									<li><a ><i id="star2" class="fa fa-star"></i></a></li>
									<li><a ><i id="star3" class="fa fa-star"></i></a></li>
									<li><a ><i id="star4" class="fa fa-star"></i></a></li>
									<li><a ><i id="star5" class="fa fa-star"></i></a></li>
								</ul>
								<span id="yourScore">(點擊評分)</span>

								
								
								
								<form  class="row contact_form" action="${contextRoot}/insertComment"
									method="get" id="commentForm" novalidate="novalidate">
									
									<input type="hidden" name="id" value="${pdVal.id}">

									<input type="hidden" class="form-control" id="score" name="score"
												placeholder="評分" onfocus="this.placeholder = ''"
												onblur="this.placeholder = '您的姓名'">

									<div class="col-md-12">
										<div class="form-group">
											<input type="text" class="form-control" id="name" name="name"
												placeholder="姓名" onfocus="this.placeholder = ''"
												onblur="this.placeholder = '您的姓名'">
										</div>
									</div>
									
									<div class="col-md-12">
										<div class="form-group">

											<input type="text" class="form-control" id="email"
												name="email" placeholder="Email"
												onfocus="this.placeholder = ''"
												onblur="this.placeholder = 'Email'">
										</div>
									</div>
									
									<div class="col-md-12">
										<div class="form-group">
											<input type="text" class="form-control" id="phone"
												name="phone" placeholder="聯絡方式"
												onfocus="this.placeholder = ''"
												onblur="this.placeholder = '聯絡方式'">
										</div>
									</div>
									
									<div class="col-md-12">
										<div class="form-group">
											<textarea class="form-control" name="productComment" id="productComment"
												rows="1" placeholder="評論描述" onfocus="this.placeholder = ''"
												onblur="this.placeholder = '評論商品'"></textarea>
										</div>
									</div>
									
										<input id="" name="createdAt" class="input"
											type="hidden" value="">
									
									<div class="col-md-12 text-center">
										<button  id="btnComment" type="button" class="primary-btn">送出評論</button>
									</div>
								</form>
								<div class="col-md-12 text-center">
									<button  id="btnCreate" type="submit" class="">一鍵輸入</button>
								</div>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Product Description Area =================-->


	<!-- Start related-product Area -->
	<section class="related-product-area section_gap_bottom">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-6 text-center">
					<div class="section-title">
						<h1>推薦商品</h1>
						<p></p>
					</div>
				</div>
			</div>
			
			
			<div class="row" id="row">
				<div class="col-lg-9">
					<div class="row">
						<div class="col-lg-4 col-md-4 col-sm-6 mb-20">
							<div class="single-related-product d-flex">
								<a id="ref1" href="">
								<!--商品照-->	
								<img class="relimg" id="relImg1" src="" alt=""></a>
								<div class="desc">
									<!--品名-->
									<a id="pdName1" href="#" class="title">Black lace Heels</a>
									<div class="price">
										<h6 id="price1">$189.00</h6>
										<h6 class="l-through">$210.00</h6>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-6 mb-20">
							<div class="single-related-product d-flex">
								<a id="ref2" href="#">
								<img class="relimg" id="relImg2" src="" alt=""></a>
								<div class="desc">
									<!--商品照-->	
									<a id="pdName2" href="#" class="title">Black lace Heels</a>
									<div class="price">
										<h6 id="price2">$189.00</h6>
										<h6 class="l-through">$210.00</h6>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-6 mb-20">
							<div class="single-related-product d-flex">
								<a id="ref3" href="#">
								<img class="relimg" id="relImg3" src="" alt=""></a>
								<div class="desc">
									<a id="pdName3" href="#" class="title">Black lace Heels</a>
									<div class="price">
										<h6 id="price3">$189.00</h6>
										<h6 class="l-through">$210.00</h6>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-6 mb-20">
							<div class="single-related-product d-flex">
								<a id="ref4" href="#">
								<img class="relimg" id="relImg4" src="" alt=""></a>
								<div class="desc">
									<a id="pdName4" href="#" class="title">Black lace Heels</a>
									<div class="price">
										<h6 id="price4">$189.00</h6>
										<h6 class="l-through">$210.00</h6>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-6 mb-20">
							<div class="single-related-product d-flex">
								<a id="ref5" href="#">
								<img class="relimg" id="relImg5" src="" alt=""></a>
								<div class="desc">
									<a id="pdName5" href="#" class="title">Black lace Heels</a>
									<div class="price">
										<h6 id="price5" >$189.00</h6>
										<h6 class="l-through">$210.00</h6>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-4 col-sm-6 mb-20">
							<div class="single-related-product d-flex">
								<a id="ref6" href="#">
								<img class="relimg" id="relImg6" src="" alt=""></a>
								<div class="desc">
									<a id="pdName6" href="#" class="title">Black lace Heels</a>
									<div class="price">
										<h6 id="price6">$189.00</h6>
										<h6 class="l-through">$210.00</h6>
									</div>
								</div>
							</div>
						</div>


				<div class="col-lg-3">
					<div class="ctg-right">
						<a href="#" target="_blank"> <img
							class="img-fluid d-block mx-auto" src="img/category/c5.jpg"
							alt="">
						</a>
					</div>
				</div>
			</div>
		</div>
	</section>
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
				<script>document.write(new Date().getFullYear());</script>
				All rights reserved | This template is made with <i
					class="fa fa-heart-o" aria-hidden="true"></i> by <a
					href="https://colorlib.com" target="_blank">Colorlib</a>
				<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
			</p>
		</div>


	</footer>
	<!-- End footer Area -->


	<!-- ======================================================================================= -->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="/resources/frontstage/js/vendor/jquery-2.2.4.min.js"></script>
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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="sweetalert2.all.min.js"></script>





	<!-- ======================================================= -->

				<script>
						$("figure").mouseover(function () {
							console.log($(this));
							let pic = $(this).find("img").attr("src")
							console.log(pic);

							$("#mainPic").attr("src", pic)

							$(this).addClass("active").siblings().removeClass("active")

						})
					</script>



				<script>
								
							console.log($("#stockStatus").text());

							$("#stockStatus").each(function(){
								var a = $(this).text();	

								if(a === "0"){
									$(this).css("color", "#FF3333").text("無庫存");
									$("#btnCart").attr("disabled", true);
									$("#btnCart").removeAttr('href');
									$("#btnCart").text('目前無庫存');
									
								}if(a !== "0"){
									$(this).css("color", "#0080FF").text("有庫存");

								}else{

								}
							})
	
					</script>

				<!--========================= 算出此筆購買金額 ==============================-->
					<script>

						$("#upPrice").click(function(){
							var a = $("#sst").val();
							var b = $("#totalPrice").val();
							var tPrice = ((parseFloat(a))*(parseFloat(b)))

							$("#orderPrice").val(tPrice)
							// console.log(tPrice)
						})

						
						$("#downPrice").click(function(){
							var a = $("#sst").val();
							var b = $("#totalPrice").val();
							var tPrice = ((parseFloat(a))*(parseFloat(b)))

							$("#orderPrice").val(tPrice)
							// console.log(tPrice)
						})

					</script>
				<!--=======================================================================-->

					

					<!--sweetalert 商品評論-->
					<script>

						$("#btnComment").click(function(){
							
							Swal.fire({
								position: 'center',
								icon: 'success',
								title: '感謝您的意見',
								showConfirmButton: false,
								timer: 2000
								})
									setTimeout(sentComment,1500)	
									})

								function sentComment(){
									$("#commentForm").submit();
								}
							
					</script>

				
			<!--================================= ajax 取得評論/顯示分數及對應顯示星號 ==================================-->

					<script>

						getAllComment();

						function getAllComment(){
							$.ajax({

								url:$("#contextRoot").val() + "/findTopCommentById",
								type:'post',
								success:function(list){
									$.each(list,function(index,pdComment){

										if(index===3){
											return false;
										}
										$("#score"+(index+1)).text(pdComment.productScore)
										$("#cusName" + (index+1)).text(pdComment.customerFullName)
										$("#prodComment"+ (index+1)).text(pdComment.productComment)
										$("#commentDate"+ (index+1)).text(pdComment.createdAt)

					
										//第一則評論
											$('#scoreBox').empty();
											var sc1 = $("#score1").text();
											

											if(sc1 === "5"){
												let getScore1 =  '<i class="fa fa-star"></i>'
																+'<i class="fa fa-star"></i>'
																+'<i class="fa fa-star"></i>'
																+'<i class="fa fa-star"></i>'
																+'<i class="fa fa-star"></i>';
												$("#scoreBox").append(getScore1);
											}else if(sc1 === "4"){
												let getScore1 =  '<i class="fa fa-star"></i>'
																+'<i class="fa fa-star"></i>'
																+'<i class="fa fa-star"></i>'
																+'<i class="fa fa-star"></i>';
												$("#scoreBox").append(getScore1);
											}else if(sc1 === "3"){
												let getScore1 =  '<i class="fa fa-star"></i>'
																+'<i class="fa fa-star"></i>'
																+'<i class="fa fa-star"></i>';
												$("#scoreBox").append(getScore1);
											}else if(sc1 === "2"){
												let getScore1 =  '<i class="fa fa-star"></i>'
																+'<i class="fa fa-star"></i>';
												$("#scoreBox").append(getScore1);		
											}else if(sc1 === "1"){
												let getScore1 =  '<i class="fa fa-star"></i>';
																
												$("#scoreBox").append(getScore1);		
											}
											

										//第二則評論	
											$('#scoreBox1').empty();
											var sc2 = $("#score2").text();
											
											if(sc2 === "5"){
												let getScore2 =  '<i class="fa fa-star"></i>'
																+'<i class="fa fa-star"></i>'
																+'<i class="fa fa-star"></i>'
																+'<i class="fa fa-star"></i>'
																+'<i class="fa fa-star"></i>';
												$("#scoreBox1").append(getScore2);
											}else if(sc2 === "4"){
												let getScore2 =  '<i class="fa fa-star"></i>'
																+'<i class="fa fa-star"></i>'
																+'<i class="fa fa-star"></i>'
																+'<i class="fa fa-star"></i>';
												$("#scoreBox1").append(getScore2);
											}else if(sc2 === "3"){
												let getScore2 =  '<i class="fa fa-star"></i>'
																+'<i class="fa fa-star"></i>'
																+'<i class="fa fa-star"></i>';
												$("#scoreBox1").append(getScore2);
											}else if(sc2 === "2"){
												let getScore2 =  '<i class="fa fa-star"></i>'
																+'<i class="fa fa-star"></i>';
												$("#scoreBox1").append(getScore2);		
											}else if(sc2 === "1"){
												let getScore2 =  '<i class="fa fa-star"></i>';
																
												$("#scoreBox1").append(getScore2);		
											}


										//第三則評論
											$('#scoreBox2').empty();
											var sc3 = $("#score3").text();

											if(sc3 === "5"){
												let getScore3 =  '<i class="fa fa-star"></i>'
																+'<i class="fa fa-star"></i>'
																+'<i class="fa fa-star"></i>'
																+'<i class="fa fa-star"></i>'
																+'<i class="fa fa-star"></i>';
												$("#scoreBox2").append(getScore3);
											}else if(sc3 === "4"){
												let getScore3 =  '<i class="fa fa-star"></i>'
																+'<i class="fa fa-star"></i>'
																+'<i class="fa fa-star"></i>'
																+'<i class="fa fa-star"></i>';
												$("#scoreBox2").append(getScore3);
											}else if(sc3 === "3"){
												let getScore3 =  '<i class="fa fa-star"></i>'
																+'<i class="fa fa-star"></i>'
																+'<i class="fa fa-star"></i>';
												$("#scoreBox2").append(getScore3);
											}else if(sc3 === "2"){
												let getScore3 =  '<i class="fa fa-star"></i>'
																+'<i class="fa fa-star"></i>';
												$("#scoreBox2").append(getScore3);		
											}else if(sc3 === "1"){
												let getScore3 =  '<i class="fa fa-star"></i>';		
												$("#scoreBox2").append(getScore3);		
											}
									})
								}
							})
						}
					</script>

						<!--=========================================================================-->

					<script>

						getProduct();
						function getProduct(){
							$.ajax({

								url:$("#contextRoot").val() + "/queryTopSixProduct.controller",
								type:"post",
								success:function(list){
									
									$.each(list,function(index,product){
										if(index===6) {
											return false;
										}
										$("#pdName"+(index+1)).text(product.productName);
										$("#pdName"+(index+1)).attr("href", $("#contextRoot").val()+"/getOneProductShop"+product.id)
										$("#relImg"+(index+1)).attr("src", $("#contextRoot").val()+"/ProductTempImg/"+product.imgUrl)
										$("#price"+(index+1)).text("NT$ " + product.price);
										$("#ref"+(index+1)).attr("href", $("#contextRoot").val()+"/getOneProductShop"+product.id)
									
									})
								}
							})
						}

					</script>

					<script>
							$("#btnCreate").click(function(){
							$("#name").val("Renee")
							$("#phone").val("0911111111")
							$("#email").val("Renee@gmail.com")
							$("#productComment").text("五顆星商品 推薦給大家~~~")

						})
					</script>

					<!--========================== 商品評分 ===============================-->

					<script>

						$("#star1").click(function(){
							$("#yourScore").text("評分1顆星");
						})
						$("#star2").click(function(){
							$("#yourScore").text("評分2顆星");
						})
						$("#star3").click(function(){
							$("#yourScore").text("評分3顆星");
						})
						$("#star4").click(function(){
							$("#yourScore").text("評分4顆星");
						})
						$("#star5").click(function(){
							$("#yourScore").text("評分5顆星");
						})

					</script>

					<script>
						$("#star1").click(function(){
							$("#score").val("1")
						})
						$("#star2").click(function(){
							$("#score").val("2")
						})
						$("#star3").click(function(){
							$("#score").val("3")
						})
						$("#star4").click(function(){
							$("#score").val("4")
						})
						$("#star5").click(function(){
							$("#score").val("5")
						})

						
					</script>

					<script>

						


					</script>

					<!--======================================================================-->


	<!-- ========================================================================================================= -->


</body>

</html>