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
<link rel="shortcut icon" href="${contextRoot}/resources/frontstageLogo/favicon.png">
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
<title>我的訂單</title>

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
.wishImg1 {
	width: 100px;
	height: 90px;
}

#deleteWishList {
	width: 120%;
}

#addToCart {
	margin-left: 0px;
}

.deleteFavor {
	font-size: 18px;
	color: #FF8C00;
}

.quantityStatus {
	width: 155px;
	text-align: center;
}

#keepShopping {
	border-radius: 5px;
}
#orderStatus {
	width:155PX;
}



</style>

<body>

	<!-- 	為了讓body內也能使用contextRoot的值 -->
	<input type="hidden" id="contextRoot"
		value="${pageContext.request.contextPath}">

	<!-- 	<!-- 上方導覽列 -->
	<%-- 	<%@include file="FrontPageNavBar.jsp"%> --%>

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
					<h1>${member.lastname}${member.firstname} 的歷史訂單</h1>
					<nav class="d-flex align-items-center">
						<a href="${contextRoot}/FrontpageSeperate">購物商城<span
							class="lnr lnr-arrow-right"></span></a> <a
							href="${contextRoot}/user/myCart">購物車</a>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->

	<!--================ WishList Area =================-->
	<section class="cart_area">
		<div class="container">
			<div class="cart_inner">
				<div class="table-responsive">
					<table id="orderTable" class="table">
						<thead>
							<tr>
								<th scope="col">訂單</th>
								<th scope="col"></th>
								<th scope="col">總價</th>
								<th scope="col"></th>
								<th scope="col">下單時間</th>
								<th scope="col"></th>
								<th id="orderStatus" scope="col">訂單狀態</th>
								<th scope="col"></th>
								<th scope="col"></th>

							</tr>
						</thead>

						<tbody>
							<c:forEach items="${ordersList}" var="ordersList"
								varStatus="status">
								<tr>
									<td>
										<div class="media">
											<div class="media-body">
												<p id="pdName1">${ordersList.orderId}</p>
											</div>
										</div>
									</td>
									<td>
										<h5></h5>
									</td>
									<td>
										<h5 id="">NT$ ${ordersList.totalPrice}</h5>
									</td>
									<td>
										<h5></h5>
									</td>
									<td>
										<h5 id="">${ordersList.orderDate}</h5>
									</td>
									<td>
										<h5></h5>
									</td>
									<c:choose>
   									 	<c:when test="${ordersList.orderStatus == 111}">
   								   			<td><h5 id="">未出貨</h5></td>
 										</c:when>
 										 <c:when test="${ordersList.orderStatus == 222}">
   								   			<td><h5 id="">已出貨</h5></td>
 										 </c:when>
   										 <c:when test="${ordersList.orderStatus == 999}">
     										<td><h5 id="">訂單已刪除</h5></td>		  
  							    		 </c:when>
							   		  <c:otherwise>
    							  		  <td><h5 id="">資料庫沒有訂單狀態</h5></td>
   									 </c:otherwise>
									</c:choose>
									<td></td>
									<td></td>
									<td></td>
								

									<td>
									<input type="hidden" value="${ordersList.orderId}">
										<button type="button" class="gray_btn" id="order_detail_btn"
											data-bs-toggle="modal" data-bs-target="#exampleModal"
											data-bs-whatever="@mdo"
											onclick="location.href='${contextRoot}/user/myOrdersDetailByMemberId?orderId=${ordersList.orderId}&memberId=${member.memberid}'">
											<span class="icon"><i class="mdi mdi-eye"></i></span>檢視訂單明細
										</button>
									</td>


									<!-- 								<td> -->
									<%-- 									<c:choose> --%>
									<%-- 										<c:when test="${pdWish.stock.quantity == 0}"> --%>
									<!-- 											<a class="gray_btn quantityStatus" style="color: red;">補貨中</a> -->
									<%-- 										</c:when> --%>
									<%-- 										<c:otherwise> --%>
									<%-- 											<a class="gray_btn quantityStatus" href="${contextRoot}/insertCartFromCartWishList?memberid=${member.memberid}&productid=${pdWish.id}&quantity=1">加入購物車</a> --%>
									<%-- 										</c:otherwise> --%>
									<%-- 									</c:choose> --%>
									<!-- 								</td> -->

									

								</tr>
							</c:forEach>
							<tr class="bottom_button">
							</tr>
							<!-- 		分頁頁數物件 -->

							<div class="pageButton">
								<div class="filter-bar d-flex flex-wrap align-items-center">
									<div class="sorting">
										<div class="pagination">
											<c:forEach var="pageNumber" begin="1" end="${totalPages}">
												<c:choose>
													<c:when test="${page.number != pageNumber-1}">
														<a href="${contextRoot}/user/myOrdersByMemberId?id=${member.memberid}&p=${pageNumber}"
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

							<tr class="out_button_area">
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td>
									<div style="padding-left: 100px" class="checkout_btn_inner d-flex align-items-center">
										<a  id="keepShopping" class="primary-btn"
											href="${contextRoot}/FrontpageSeperate"><i
											class="bi bi-cart3"></i>&nbsp 前往購物</a>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>
	<!--================ End WishList Area  =================-->

	<!-- start footer Area -->
	<!-- 插入頁腳 -->
	<jsp:directive.include file="/WEB-INF/pages/layout/frontstage/footer.jsp" />
	<!-- End footer Area -->

	<script src="js/vendor/jquery-2.2.4.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
		integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
		crossorigin="anonymous"></script>
	<script src="js/vendor/bootstrap.min.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery.sticky.js"></script>
	<script src="js/nouislider.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<!--gmaps Js-->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
	<script src="js/gmaps.min.js"></script>
	<script src="js/main.js"></script>








	<!-- ========================================== js ============================================== -->
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

	<!-- ========================================== js ============================================== -->

	<script>
		$(".deleteFavor").click(function() {
			var deleteFavor = $(this);
			$.ajax({
				url : $("#contextRoot").val() + "/deleteOneWishAjax",
				data : {
					wishId : $(this).data("wishid")
				},
				type : "get",
				success : function() {
					// console.log(deleteFavor.closest("tr"));
					deleteFavor.closest("tr").remove();
				}
			});
			return false;
		})
	</script>






</body>

</html>