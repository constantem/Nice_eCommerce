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
<link rel="shortcut icon" href="${contextRoot}/resources/frontstageLogo/favicon.png">
<!-- Author Meta -->
<meta name="author" content="CodePixar">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>課程報名</title>

<style>
</style>

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

<!--jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous">
</script>

<script>
$(document).ready(function () {
	// 請求會員資訊與課程資訊
	const memberAndCourseUrl = $("#contextRoot").val()+"/api/courseBooking/member/"+$("#memberId").val()+"/course/"+$("#courseId").val();
	$.ajax({
		method: "GET",
		url: memberAndCourseUrl,
		success: function (courseBookingDto) {
			console.log(courseBookingDto.memberFullName);
			$("#memberFullName").text(courseBookingDto.memberFullName);
			$("#courseName").text(courseBookingDto.courseName);
			$("#coachFullName").text(courseBookingDto.coachFullName);
			$("#coursePrice").text(courseBookingDto.coursePrice);
		}
	});
	
	// 報名按鈕綁定事件處理, 報名課程(新增課程訂單)
	console.log(new FormData( $("#courseBookingForm")[0] ));
	$("#bookingBtn").click(function () {
		$.ajax({
			method: "POST",
			url: $("#contextRoot").val()+"/api/courseBooking",
			data: new FormData( $("#courseBookingForm")[0] ),
			processData: false,
			contentType: false,
			success: function (courseBookingId) {
				location.href = $("#contextRoot").val() + "/courseBooking/successPage"+"?courseBookingId="+courseBookingId;
			}
		});
	}); // 報名按鈕綁定事件處理結束

});
</script>

</head>

<body>

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
                    <h1>課程報名</h1>
                    <nav class="d-flex align-items-center">
                        <a href="${contextRoot}/resources/frontstage/index.html">首頁<span class="lnr lnr-arrow-right"></span></a>
                        <a href="${contextRoot}/resources/frontstage/single-product.html">課程報名</a>
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <!-- End Banner Area -->

    <!--================Checkout Area =================-->
    <section class="checkout_area section_gap">
        <div class="container">

            <div class="billing_details">
                <div class="row">
                    <div class="col-lg-6">
                        <h3>報名資訊</h3>
                        <form id="courseBookingForm" 
                        	class="row contact_form"  novalidate="novalidate">
                        	
                        	<!-- 隱藏 input 區 -->
                        	<input type="hidden" id="memberId" name="memberId" value="${memberId}">
                        	<input type="hidden" id="courseId" name="courseId" value="${courseId}">
                        	
                        	<!-- 姓名 -->
                            <div class="col-md-6 form-group p_star">
                                姓名：<span id="memberFullName"></span>
                            </div>
                            <!-- 課程名稱 -->
                            <div class="col-md-6 form-group p_star">
                                課程名稱：<span id="courseName"></span>
                            </div>
                            <!-- 教練姓名 -->
                            <div class="col-md-6 form-group p_star">
                                教練姓名：<span id="coachFullName"></span>
                            </div>
                            <!-- 價錢 -->
                            <div class="col-md-6 form-group p_star">
                                價錢：<span id="coursePrice"></span>
                            </div>
                            <div class="col-md-12 form-group">
                            	<button id="bookingBtn" type="button" class="primary-btn">報名</button>
<!--                                 <a id="bookingBtn" class="primary-btn" href="javascript:void(0)">報名</a> -->
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </section>
    <!--================End Checkout Area =================-->

	<!-- 插入頁腳 -->
	<jsp:directive.include file="/WEB-INF/pages/layout/frontstage/footer.jsp" />

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