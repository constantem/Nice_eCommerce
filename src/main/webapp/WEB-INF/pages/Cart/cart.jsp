<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="tw.nicesport.model.ProductBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

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
<link rel="shortcut icon" href="${contextRoot}/resources/frontstageLogo/favicon.png">
</head>
<style>
.cartImg{
	width: 100px;
	height: 90px;
}
.deleteCart{
	margin-left: 10px;
	font-size: 18px;
	color: 	#FF8C00;
}
#truck{
	font-size: 110%;
}
#keepShopping{
	border-radius:5px;
}
#checkOut{
	border-radius:5px;
}
.productName{
	color:#003060;
}
.productName:hover{
	color: #FF8C00;
	transition: 0.3s;
}
</style>

<body>

	
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
        <div class="container">
            <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                <div class="col-first">
                    <h1>${member.lastname} ${member.firstname} 購物車</h1>
                    <nav class="d-flex align-items-center">
                        <a href="${contextRoot}/FrontpageSeperate">購物商城<span class="lnr lnr-arrow-right"></span></a>
                        <a href="${contextRoot}/checkOut?memberid=${member.memberid}">前往結帳</a>
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
								<th scope="col">商品</th>
								<th scope="col">單價</th>
								<th scope="col">數量</th>
								<th scope="col">小計</th>
								<th scope="col">刪除</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${cartProductList}" var="cartProduct" >
							<tr>
								<td>
									<div class="media">
										<div class="d-flex">
											<img onerror="this.src='${contextRoot}/img/out.png'" class="cartImg" src="${contextRoot}/ProductTempImg/${cartProduct.productBean.imgUrl}" alt="">
										</div>
										<div class="media-body">
											<p  class="productName">${cartProduct.productBean.productName}</p>
										</div>
									</div>
								</td>
								<td>
									<h5 class="cartPrice">NT$ ${cartProduct.productBean.price}</h5>
								</td>
								<td>
									<div class="product_count">

										<!-- 修改商品數量 -->
										<form id="updateQuantity" action="${contextRoot}/updateQuantity" method="get">
											<input type="text" name="quantity" readonly  id="sst"  maxlength="12" value="${cartProduct.quantity}" title="Quantity:"
												class="input-text qty">
											<input type="text" name="quantity" hidden id="sst" maxlength="12" value="${cartProduct.quantity}" title="Quantity:"
												class="input-text qty">
											<input type="text" name="memberId" hidden value="${member.memberid}">	
											<input type="text" hidden name="cartProductId" value="${cartProduct.cartProductId}">
										</form>

						
                                        <button  onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst )) result.value++;return false;"
										
                                            class="increase items-count addQuantity" type="button"><i class="lnr lnr-chevron-up"></i></button>


                                        <button  onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst )) result.value--;return false;"
                                            class="reduced items-count addQuantity" type="button"><i class="lnr lnr-chevron-down"></i></button>

									</div>
								</td>
								<td>

									<h5>NT$ ${cartProduct.productBean.price * cartProduct.quantity}</h5>
									<c:set var="amount" value="${cartProduct.productBean.price * cartProduct.quantity}"/>
									<c:set var="total" value="${total + amount}" />
									
								</td>
								<td>
									<a class="deleteCart" 																	
										href="" data-memberid="${member.memberid}" data-cartproductid="${cartProduct.cartProductId}" >						
							
										<i id="trash" class="bi bi-trash"></i>
									</a>
								</td>
							</tr>
						</c:forEach>

							<tr class="bottom_button">
								<td>
								<div class="check_title">
									<h2>
										沒有優惠卷?? <a href="${contextRoot}/announcement/showEvents-front">點這裡新增優惠</a>
									</h2>
								</div>
								</td>								
								<td></td>
								<td></td>
								<td>
									<div class="cupon_text d-flex align-items-center">
										<input type="text" onchange="UseDiscount()" id="discountName" name="discountName" placeholder="優惠券代碼"> 
										<a class="primary-btn" onclick="UseDiscount()" href="#">使用</a> 
										<a style="color:rgb(255, 153, 0)" class="gray_btn"	href="#">更新優惠券代碼</a>
									</div>
								</td>
							</tr>
							<tr>
							
							<tr>
								<td></td>	
								<td></td>
								<td>
									<h5>折扣金額</h5>
								</td>		
								<td id="userdiscountAmount">
									<h5>NT$ 0</h5>
								</td>
							</tr>
							<tr>		
								<td></td>
								<td></td>				
								<td>
									<h5>總金額</h5>
								</td>
								<td id="subTotal">
									<h5>NT$<c:out value="${total}"/></h5>
								</td>
							</tr>
							<tr class="shipping_area">
								<td></td>
								<td></td>
								<td>
			
								</td>
			
								<td>
									<div class="shipping_box">

									</div>
								</td>
							</tr>
							<tr class="out_button_area">
								<!-- 準備傳後台的資料 -->
								<form action="${contextRoot}/checkOut?memberid=${member.memberid}"
									  method="post"
									  id="checkOutForm">
									  <input hidden name="memberid" value="${member.memberid}">
									  <input hidden id="discountAmount" name="discountAmount" value=0>
									  <input hidden id="memberDiscountDetailId" name="memberDiscountDetailId" value="">
								</form>
								<td></td>
								<td></td>
								<td></td>
								<td>
									<div class="checkout_btn_inner d-flex align-items-center">
										<a style="color:rgb(255, 153, 0)" id="keepShopping" class="gray_btn" href="${contextRoot}/FrontpageSeperate">繼續購物</a>
										<a style="color:rgb(255, 255, 255)" id="checkOut" class="primary-btn">前往結帳</a>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
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

	<script src="js/vendor/jquery-2.2.4.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
		integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
		crossorigin="anonymous"></script>
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

			<!-------------------------------- 新增購物車 ajax --------------------------------->
	<script>

		function UseDiscount(){
			var subTotal=${total};
			$.ajax({
				type: 'POST',
				url:"${contextRoot}/UseDiscount?memberid=${member.memberid}&total=${total}&DiscountName="+ $("#discountName").val(),
				success:function(map){
					console.log(memberDiscountDetailId);
					var discountamount;
					var memberDiscountDetailId;

					if(map == "") {
						discountamount = "";
						memberDiscountDetailId = "";
					} else {
						discountamount = map.discountamount;
						memberDiscountDetailId = map.memberDiscountDetailId;
					}
					
					console.log(discountamount);
					console.log(subTotal);

					if(discountamount == ""){
						Swal.fire(
  						'沒有這個折扣碼啊',
  						'是不是想被打?',
  						'question'
						)
						// alert("輸入錯誤或沒有此折扣碼 請檢查")
																	
						$("#userdiscountAmount").html(
							"<h5>NT$ 0</h5>");
						$("#subTotal h5").text(
							"NT$"+subTotal);
						$("#discountAmount").attr("value",0)
						// $("#checkOutForm").attr(action,"${contextRoot}/checkOut?memberid=${member.memberid}");  //修改form表單傳送的路徑
					}else{
						let timerInterval
						Swal.fire({
						title: '才...才沒有想幫你折價呢...',
						html: '†升天†下次再見唷†升天†',
						timer: 2000,
						timerProgressBar: true,
						didOpen: () => {
							Swal.showLoading()
							const b = Swal.getHtmlContainer().querySelector('b')
							timerInterval = setInterval(() => {
							b.textContent = Swal.getTimerLeft()
							}, 100)
						},
						willClose: () => {
							clearInterval(timerInterval)
						}
						}).then((result) => {
						/* Read more about handling dismissals below */
						if (result.dismiss === Swal.DismissReason.timer) {
							console.log('I was closed by the timer')
						}
						})									
						$("#userdiscountAmount").html(
							"<h5>NT$"+discountamount+"</h5>");
							//.text(要更改的"純文字")
						$("#subTotal h5").text(
							"NT$"+(subTotal-discountamount));
							//.attr(要更改的屬性,要更改的屬性值)
						$("#discountAmount").val(discountamount);
						$("#memberDiscountDetailId").val(memberDiscountDetailId);
						// $("#checkOutForm").attr(action,"${contextRoot}/checkOutHaveDiscount?memberid=${member.memberid}");  //修改form表單傳送的路徑
					}

			}
			})
		}
					//前往結帳按鈕 送出表單
					$("#checkOut").click(function() {

						if($(".productName").val()){

						}

						$("#checkOutForm").submit();
					});

	</script>

	<script>
		$(".addQuantity").click(function(){
			Swal.fire({
				title: '',
				text: '',
				backdrop:false,
				width:230,
				height:230,
				timer:1000,
				imageUrl: $("#contextRoot").val() + '/img/load.gif',
				imageWidth: 150,
				imageHeight: 150,
				showConfirmButton:false,		
		})
			setTimeout("submitAddQuantity()",1300)
			// submitAddQuantity();
		})
		function submitAddQuantity(){
			$("#updateQuantity").submit();
		}
	</script>

	<!-- 刪除購物車產品 -->
	<script>
		$(".deleteCart").click(function(){
			var deteteCart = $(this);
			$.ajax({
				url:$("#contextRoot").val() + "/DeleteCart",
				data: {
					memberid: $(this).data("memberid"),
					cartproductid: $(this).data("cartproductid")
				},
				success: function () {
					deteteCart.closest("tr").remove();
				}
			})
			return false;
		})
		varifyCart();
		function varifyCart (){
			var a = $(".cartPrice").text();
			var b = $(".productName").text();
		
			if(a==null || a==""){
				$("#checkOut").removeAttr("href","").text("無結帳商品").css("color","#E0E0E0").click(function(){
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