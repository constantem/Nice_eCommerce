<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<title>我的課程</title>

<!--
        原生 css
        ============================================= -->
<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/linearicons.css">
<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/owl.carousel.css">
<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/font-awesome.min.css">
<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/themify-icons.css">
<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/nice-select.css">
<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/nouislider.min.css">
<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/bootstrap.css">
<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/main.css">

<style>
	.imgContainer {
		width: 150px;
		overflow: hidden;
	}
	
	.imgFit {
		width:100%;
		height:100%; 
		object-fit: contain;  
	}

</style>

<!--jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous">
</script>

<script>
$(document).ready(function () {
	// 請求 courseBooking list
	$.ajax({
		method: "GET", // api query
		url: $("#contextRoot").val() + "/api/courseBooking/member/"+$("#memberId").val(),
		success: function (courseBookingDtoList) {
			$(courseBookingDtoList).each(function (index, courseBookingDto) {
				// 樣板
				const trTemplate = $("#tr-template");
				
				// 複製
				const trClone = $( $(trTemplate).html() );
				// 開始塞值
				if(courseBookingDto.coursePictureBase64) {
					$("#coursePictureBase64", trClone)
						.attr("src", "data:image/jpeg;base64, "+courseBookingDto.coursePictureBase64);
				}
				$("#courseName", trClone).text(courseBookingDto.courseName);
				$("#courseNameLink", trClone)
					.attr("href", $("#contextRoot").val()+"/course/detail/"+courseBookingDto.courseId);
				$("#coursePrice", trClone).text(courseBookingDto.coursePrice);
				$("#bookingStatus", trClone).text(courseBookingDto.bookingStatus);
				$("#paymentStatus", trClone).text(courseBookingDto.paymentStatus);
				$("#createdAt", trClone).text(courseBookingDto.createdAt);
				// 塞值給連結
// 				$("#editAnchor", trClone).attr("href", $("#contextRoot").val()+"/coach/detailPage/"+coach.id);
				// 插在樣板前面
				$( trTemplate ).before( trClone );
			})
		}
	}); // find all 請求結束
});
</script>

</head>

<body>

	<!-- 變數 -->
	<input type="hidden" id="contextRoot" value="${contextRoot}">
	<input type="hidden" id="memberId" value="${memberId}">
	
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
                    <h1>我的課程</h1>
                    <nav class="d-flex align-items-center">
                        <a href="">首頁<span class="lnr lnr-arrow-right"></span></a>
                        <a href="">我的課程</a>
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
                                <th scope="col">課程名稱</th>
                                <th scope="col">價格</th>
                                <th scope="col">報名狀態</th>
                                <th scope="col">繳費狀態</th>
                                <th scope="col">報名日期</th>
                            </tr>
                        </thead>
                        <tbody id="templateContainer">
                        	<!-- 清單 tr -->
                        	<template id="tr-template">
	                        	<tr>
	                                <td>
	                                    <div class="media">
	                                        <div class="d-flex imgContainer">
	                                        	<!-- 課程照片 -->
	                                            <img id="coursePictureBase64" class="imgFit" src="" alt="">
	                                        </div>
	                                        <div class="media-body">
	                                        	<!-- 課程名稱 -->
	                                        	<a id="courseNameLink" href="">
	                                            	<p id="courseName"></p>
	                                            </a>
	                                        </div>
	                                    </div>
	                                </td>
	                                <td>
	                                	<!-- 課程價格 -->
	                                    <h5 id="coursePrice"></h5>
	                                </td>
	                                <td>
	                                	<!-- 報名狀態 -->
	     								<h5 id="bookingStatus"></h5>
	                                </td>
	                                <td>
	                                	<!-- 報名狀態 -->
	     								<h5 id="paymentStatus"></h5>
	                                </td>
	                                <td>
	                                	<!-- 報名日期 -->
	                                    <h5 id="createdAt"></h5>
	                                </td>
	                            </tr>
                        	
                        	</template>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
    <!--================End Cart Area =================-->

	<!-- 插入頁腳 -->
	<jsp:directive.include file="/WEB-INF/pages/layout/frontstage/footer.jsp" />

    <!--
            原生 js
            ============================================= -->

    <script src="${contextRoot}/resources/frontstage/js/vendor/jquery-2.2.4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
	 crossorigin="anonymous"></script>
	<script src="${contextRoot}/resources/frontstage/js/vendor/bootstrap.min.js"></script>
	<script src="${contextRoot}/resources/frontstage/js/jquery.ajaxchimp.min.js"></script>
	<script src="${contextRoot}/resources/frontstage/js/jquery.nice-select.min.js"></script>
	<script src="${contextRoot}/resources/frontstage/js/jquery.sticky.js"></script>
    <script src="${contextRoot}/resources/frontstage/js/nouislider.min.js"></script>
	<script src="${contextRoot}/resources/frontstage/js/jquery.magnific-popup.min.js"></script>
	<script src="${contextRoot}/resources/frontstage/js/owl.carousel.min.js"></script>
	<!--gmaps Js-->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
	<script src="${contextRoot}/resources/frontstage/js/gmaps.min.js"></script>
	<script src="${contextRoot}/resources/frontstage/js/main.js"></script>
	
	
</body>

</html>