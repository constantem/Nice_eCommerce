<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="tw.nicesport.model.ProductBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
<!-- 			PayPal JavaScript SDK -->
<script
	src="https://www.paypal.com/sdk/js?client-id=AdkP7zPzzyI46msIQwuA9oW-Al5hw_Fd4AYKUElPP5hITvqVcIj9OXS3XsG11VqJb4ZuiaS5pysA7NzE&components=YOUR_COMPONENTS"></script>
<script
	src="https://www.paypal.com/sdk/js?client-id=AdkP7zPzzyI46msIQwuA9oW-Al5hw_Fd4AYKUElPP5hITvqVcIj9OXS3XsG11VqJb4ZuiaS5pysA7NzE&components=buttons"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 			  PayPal JavaScript SDK -->

<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
<title>結帳</title>

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
<!-- Favicon-->
<link rel="shortcut icon" href="${contextRoot}/resources/frontstageLogo/favicon.png">	

</head>
<style>
.cartImg {
	width: 100px;
	height: 90px;
}

#last {
	margin-top: 25px;
}

#first {
	margin-top: 25px;
}

#phone {
	margin-top: 25px;
}

#email {
	margin-top: 25px;
}

#address {
	margin-top: 25px;
}

#submitCheckOut {
	border-radius: 5px;
}

#ship {
	margin-left: 15px;
	margin-top: 10px;
	margin-bottom: 10px;
}

#shipCheck711 {
	margin-right: 5px;
	margin-left: 5px;
}

#shipCheckCat {
	margin-right: 5px;
	margin-left: 10px;
}

#shipCheckPost {
	margin-left: 5px;
	margin-right: 5px;
}
#shipCheckStore{
	
	margin-right:5px;
}

.middle1 {
	display: inline;
}

.middle2 {
	display: inline;
	position: absolute;
	right: 150px;
}

.middle3 {
	display: inline;
	position: absolute;
	right: 45px;
}

.truck {
	font-size: 140%;
	margin-right: 5px;
	color: orange;
}
</style>

<body>
	<!-- Start Header Area -->

	<!-- 	為了讓body內也能使用contextRoot的值 -->
	<input type="hidden" id="contextRoot"
		value="${pageContext.request.contextPath}">

	<!-- 上方導覽列 -->
	<%-- <%@include file="FrontPageNavBar.jsp" %> --%>
	<!-- Start Header Area -->
	<header class="header_area sticky-header">
		<div class="main_menu">
			<!-- 插入上導覽列 -->
			<jsp:directive.include
				file="/WEB-INF/pages/layout/frontstage/nav.jsp" />
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
			<div
				class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>結帳</h1>
					<nav class="d-flex align-items-center">
						<a href="${contextRoot}/user/myCart">購物車<span
							class="lnr lnr-arrow-right"></span></a> <a href="single-product.html">完成訂單</a>
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
							<h3>配送資訊</h3>

							<form id="orderForm" class="row contact_form"
								action="${contextRoot}/insertOrder" method="post"
								novalidate="novalidate">

								<input type="hidden" value="${member.memberid}" name="memberid">
								<input type="hidden" value="${discountAmount}" name="discountAmount">
								<input type="hidden" value="${memberDiscountDetailId}" name="memberDiscountDetailId">
								

								<div class="col-md-6 form-group p_star">
									姓<span class="placeholder" data-placeholder="必填"></span> <input
										type="text" class="form-control" value="${member.lastname}"
										id="last" name="lastname">

								</div>
								<div class="col-md-6 form-group p_star">
									名 <input type="text" class="form-control"
										value="${member.firstname}" id="first" name="firstname">
									<span class="placeholder" data-placeholder="必填"></span>
								</div>

								<div class="col-md-6 form-group p_star">
									連絡電話 <input type="text" class="form-control" id="phone"
										value="${member.phone}" name="phone"> <span
										class="placeholder" data-placeholder="必填"></span>
								</div>
								<div class="col-md-6 form-group p_star">
									電子郵件 <input type="text" class="form-control" id="email"
										value="${member.email}" name="email"> <span
										class="placeholder" data-placeholder="必填"></span>
								</div>
								<div class="col-md-12 form-group p_star">
									郵遞區號 <input type="text" class="form-control"
										id="shipPostalCode" name="shipPostalCode" value="">
								</div>
								<div class="col-md-12 form-group p_star">
									配送地址 <input type="text" class="form-control" id="address"
										name="address" value="${member.address}"> <span
										class="placeholder" data-placeholder="必填"></span>
								</div>



								<div id="ship">
									<i class="bi bi-truck truck"></i>
									<input id="shipCheckStore" type="checkbox" checked value="" name="">到店付款

									<input id="shipCheck711" type="checkbox" value="60" name="">711交貨便

									<input id="shipCheckCat" type="checkbox" value="120" name="">黑貓宅急便

									<input id="shipCheckPost" type="checkbox" value="180" name="">郵局
									
									<input id="shippingFee" hidden type="text" value="30"
										name="shippingFee">
								</div>




							</form>
<!-- 							<div class="cupon_area"> -->
<!-- 								<div class="check_title"> -->
<!-- 									<h2> -->
<!-- 										沒有優惠卷?? <a href="#">點這裡新增優惠</a> -->
<!-- 									</h2> -->
<!-- 								</div> -->
<!-- 								<input type="text" placeholder="輸入優惠碼"> <a -->
<!-- 									id="submitCheckOut" class="primary-btn" href="#">送出!</a> -->
<!-- 							</div> -->
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
										<li><span class="middle1">${cartProductList.productBean.productName}
										</span> <span class="middle2">x&nbsp;${cartProductList.quantity}</span>
											<span class="middle3">NT$&nbsp;${cartProductList.productBean.price}</span>
										</li>
										<c:set
											value="${cartProductList.quantity*cartProductList.productBean.price}"
											var="totalPrice" />
										<c:set value="${sum + totalPrice}" var="sum" />
									</c:forEach>
								</ul>

								<!-- <c:set value="${(sum + totalPrice)}" var="finalPrice"></c:set> -->
								<ul class="list list_2">
									<li><a href="#">折扣<span>NT$&nbsp;<span
										id="discountAmount">${discountAmount}</span></span></a></li>
									<li><a href="#">小計 <span>NT$&nbsp;<span
												id="sum">${sum-discountAmount}</span></span></a></li>
									<li><a id="" href="#">運費 <span class="shipFee"
											value="">NT$ 0</span> </a></li>
									<li><a href="#">總價 <span>NT$&nbsp;<span
												id="totalPrice">${sum}</span></span></a></li>
								</ul>
								<div class="payment_item">
<!-- 									<div class="radion_btn"> -->
<!-- 										<input type="radio" id="f-option5" name="selector"> <label -->
<!-- 											for="f-option5">到店付款</label> -->
<!-- 										<div class="check"></div> -->
<!-- 									</div> -->
									<a class="primary-btn" id="submitOrder" href="#"<c:if test="${order.orderStatus==111}"> selected </c:if>>到店付款</a>
								</div>
								<div class="payment_item active">
									<div class="radion_btn">
<!-- paypal按鈕 -->
										<!-- 設定收款帳戶與幣別 -->
										<script
											src="https://www.paypal.com/sdk/js?client-id=P3VYR89MY27BU&currency=USD">
										</script>
										<!-- Set up a container element for the button -->
										<div id="paypal-button-container"></div>
	<script>
	//開始PayPal交易
      paypal.Buttons({
        createOrder: (data, actions) => {
          return actions.order.create({
            purchase_units: [{
              amount: {
                value: "1598.6" //設定刷的錢
              }
            }]
          });
        },
        //完成交易
        onApprove: (data, actions) => {
          return actions.order.capture().then(function(orderData) {
            console.log('Capture result', orderData, JSON.stringify(orderData, null, 2));
            const transaction = orderData.purchase_units[0].payments.captures[0];

            let timerInterval
            Swal.fire({
              title: '訂單結帳完成!',
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
              if (result.dismiss === Swal.DismissReason.timer) {
                console.log('I was closed by the timer')
              }
            })
           
            setTimeout("submitForm()",2000)
          });
        }
      }).render('#paypal-button-container');
    </script>
    
    <script>
    
    	function submitForm(){
    		 $("#orderForm").submit();    		
    	}    
    </script>
<!-- paypal按鈕 -->
										
									</div>
								</div>
								<script>
									$("#submitOrder").click(function () {
										if($("#shippingFee").val()==""||$("#shippingFee").val()==null){
							
											Swal.fire({
												icon: 'warning',
												title: '請選擇運送方式',
												})
											return false;
										}
										else{
										// confirm(" 即將送出修改!! ");
										$("#orderForm").submit();
										}
									
									});
								</script>

							</div>


						</div>
					</div>
	</section>

	<!--================左邊框框 =================-->

	<!-- start footer Area -->
		<!-- 插入頁腳 -->
		<jsp:directive.include file="/WEB-INF/pages/layout/frontstage/footer.jsp" />
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

	<script>
						
						$("#shipCheck711").click(function(){
							$(".shipFee").text("NT$ 60");
							$("#shippingFee").val(60);
							if($("#shipCheck711").prop('checked')){
								$("#shipCheckCat").prop('checked',false)
								$("#shipCheckPost").prop('checked',false)
								$("#shipCheckStore").prop('checked',false)
							}
							var a = $("#sum").text();
							var b = parseInt(a)
							var shipFee = $("#shippingFee").val();
							var shipNum = parseInt(shipFee)
							var totalPrice = (b + shipNum)
							$("#totalPrice").text(" " +totalPrice )
						})

						$("#shipCheckCat").click(function(){
							$(".shipFee").text("NT$ 120");
							$("#shippingFee").val(120);
							if($("#shipCheckCat").prop('checked')){
								$("#shipCheck711").prop('checked',false)
								$("#shipCheckPost").prop('checked',false)
								$("#shipCheckStore").prop('checked',false)
							}
							var a = $("#sum").text();
							var b = parseInt(a)
							var shipFee = $("#shippingFee").val();
							var shipNum = parseInt(shipFee)
							var totalPrice = (b + shipNum)
							$("#totalPrice").text(" " +totalPrice )
						})

						$("#shipCheckPost").click(function(){
							$(".shipFee").text("NT$ 160");
							$("#shippingFee").val(160);
							if($("#shipCheckPost").prop('checked')){
								$("#shipCheck711").prop('checked',false)
								$("#shipCheckCat").prop('checked',false)
								$("#shipCheckStore").prop('checked',false)
							}
							var a = $("#sum").text();
							var b = parseInt(a)
							var shipFee = $("#shippingFee").val();
							var shipNum = parseInt(shipFee)
							var totalPrice = (b + shipNum)
							$("#totalPrice").text(" " +totalPrice )
						})

						$("#shipCheckStore").click(function(){
							$(".shipFee").text("NT$ 0");
							$("#shippingFee").val(0);
							if($("#shipCheckStore").prop('checked')){
								$("#shipCheck711").prop('checked',false)
								$("#shipCheckCat").prop('checked',false)
								$("#shipCheckPost").prop('checked',false)
							}
							var a = $("#sum").text();
							var b = parseInt(a)
							var shipFee = $("#shippingFee").val();
							var shipNum = parseInt(shipFee)
							var totalPrice = (b + shipNum)
							$("#totalPrice").text(" " +totalPrice )
						})

					</script>

	<script
		src="${contextRoot}/resources/frontstage/js/vendor/jquery-2.2.4.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
		integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
		crossorigin="anonymous"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
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
	<script src="${contextRoot}/resources/frontstage/js/gmaps.min.js"></script>
	<script src="${contextRoot}/resources/frontstage/js/main.js"></script>
	<script src="${contextRoot}/resources/frontstage/js/vendor/popper.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>

</html>