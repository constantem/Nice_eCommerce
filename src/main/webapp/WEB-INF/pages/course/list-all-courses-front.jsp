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
<title>課程一覽</title>

<!--
CSS
============================================= -->
<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/linearicons.css">
<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/font-awesome.min.css">
<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/themify-icons.css">
<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/bootstrap.css">
<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/owl.carousel.css">
<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/nice-select.css">
<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/nouislider.min.css">
<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/ion.rangeSlider.css" />
<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/ion.rangeSlider.skinFlat.css" />
<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/main.css">

<style>
	.coursePictureContainer {
		width: 100%;
		height: 300px;     
		overflow: hidden;
	}
	
	.coursePictureFit {
		width:100%;
		height:100%; 
		object-fit: cover; 
	}
	
	.disableIfRegistered {
    	pointer-events: none;
    	color: green !important;
    	border-color: green !important;
    }
    
    .aboutToFull {
    	color: red;
    }
    
    .categories_post {
  position: relative;
  text-align: center;
  cursor: pointer; 
   width: 350px; 
   height: 213.887px; 
  }
    
    .categories_post img {
/*    	    position: absolute; */
        width:100%;
        height:100%; 
        object-fit: cover;    
    }
    
</style>

<!--jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous">
</script>
<!-- sweat alert 2 CDN -->	
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
$(document).ready(function () {
	
	// 報名錯誤訊息
	if( $("#bookingErrorCourseName").val() ) {
		Swal.fire({
			text: "你已報名"+$("#bookingErrorCourseName").val(),
			showConfirmButton: true,
			buttonsStyling: false,
			customClass: {
				confirmButton: 'genric-btn success'
			},
		}).then(function (result) {
			if(result.isConfirmed) {
				location.href=$("#contextRoot").val()+"/info/course/list/all";
			}
		});
	}
	
	// 請求 current member id
	let getCoursesUrl; // 請求 course list 的 url, 由有沒有登入 USER 來決定
	$.ajax({
		url: $("#contextRoot").val() + "/user/memberId",
		success: function (memberId) {
			if(memberId) { // 若 USER 登入中, 有 member id
				getCoursesUrl = $("#contextRoot").val() + "/api/course/member/" + memberId;
			} else { // 若非 USER 登入中, 為 null
				getCoursesUrl = $("#contextRoot").val() + "/api/course/";
			}
			requestCourseList(getCoursesUrl);
		}
	});
	
	// 請求並製造 course list
	function requestCourseList(getCoursesUrl) {
		$.ajax({
			method: "GET", // api query
			url: getCoursesUrl,
			success: function (courseDtoList) {
				$(courseDtoList).each(function (index, courseDto) {
					
					// 若無餘額, 則下一筆
					if(courseDto.courseRemainingPlaces == 0) {
						return; // 等效於 continue, (cf return false 等效於 break)
					}
					
					// 樣板
					const articleTemplate = $("#article-template");
					
					// 複製
					const articleClone = $( $(articleTemplate).html() );
					// 開始塞值
					$("#courseId", articleClone).text(courseDto.courseId);
					$("#courseName", articleClone).text(courseDto.courseName);
					if(courseDto.coursePictureBase64) {
						$("#coursePictureBase64", articleClone).attr("src",
							"data:image/jpeg;base64, "+courseDto.coursePictureBase64
						);
					}
					$("#coachFullName", articleClone).text(courseDto.coachFullName);
					if(courseDto.coursePictureBase64) {
						$("#coachProfileBase64", articleClone).attr("src",
							"data:image/jpeg;base64, "+courseDto.coachProfileBase64
						);
					}
					$("#roomName", articleClone).text(courseDto.roomName);
					$("#courseDescription", articleClone).text(courseDto.courseDescription);
					$("#courseStartDate", articleClone).text(courseDto.courseStartDate);
					$("#courseClassAmount", articleClone).text(courseDto.courseClassAmount);
					$("#coursePeriod", articleClone).text(courseDto.coursePeriod);
					$("#coursePrice", articleClone).text(courseDto.coursePrice);

					// 若有會員登入，且此課程有報名了，則我要報名改已報名
					console.log(courseDto.courseName);
					console.log(courseDto.isRegisteredByThisMember);
					if(courseDto.isRegisteredByThisMember) { // 為 true
						$("#bookingFormLink", articleClone)
							.addClass("disableIfRegistered")
							.text("已報名");
					// 若會員沒登入
					} else { // 為 null 或 false
						// 塞值給連結
						$("#bookingFormLink", articleClone).attr("href", $("#contextRoot").val()+"/user/courseBookingForm?courseId="+courseDto.courseId);
						// 即將額滿提醒
						if(courseDto.courseRemainingPlaces <= 3) {
							$("#warn", articleClone)
								.text("(即將額滿)")
								.addClass("aboutToFull");
						}
					}
					
					// 插在樣板前面
					$( articleTemplate ).before( articleClone );
				})
			}
		}); // find all 請求結束
	} // generate course list function 結束

	// 搜尋input的change事件處理
	$("#courseNameSearchBtn").click(function () {
		
		// 請求 current member id
		let getCoursesByNameUrl; // 請求 course list 的 url, 由有沒有登入 USER 來決定
		$.ajax({
			url: $("#contextRoot").val() + "/user/memberId",
			success: function (memberId) {
				if(memberId) { // 若 USER 登入中, 有 member id
					getCoursesByNameUrl = $("#contextRoot").val() + "/api/course/member/" + memberId + "/name/" + $("#courseNameSearchInput").val();
				} else { // 若非 USER 登入中, 為 null
					getCoursesByNameUrl = $("#contextRoot").val() + "/api/course/name/" + $("#courseNameSearchInput").val();
				}
				requestCourseListByName(getCoursesByNameUrl);
			}
		});
	});
	
	function requestCourseListByName(getCoursesByNameUrl) {
		
		$.ajax({
			method: "GET", // api query
			url: getCoursesByNameUrl,
			success: function (courseDtoList) {
				console.log(courseDtoList);
				
				// 先清除舊有 article
				$("#templateContainer article").not('#article-template article').remove();
				// 重新生城 article
				
				$(courseDtoList).each(function (index, courseDto) {
				
					// 若無餘額, 則下一筆
					if(courseDto.courseRemainingPlaces == 0) {
						return; // 等效於 continue, (cf return false 等效於 break)
					}
					
					// 樣板
					const articleTemplate = $("#article-template");
					
					// 複製
					const articleClone = $( $(articleTemplate).html() );
					// 開始塞值
					$("#courseId", articleClone).text(courseDto.courseId);
					$("#courseName", articleClone).text(courseDto.courseName);
					if(courseDto.coursePictureBase64) {
						$("#coursePictureBase64", articleClone).attr("src",
							"data:image/jpeg;base64, "+courseDto.coursePictureBase64
						);
					}
					$("#coachFullName", articleClone).text(courseDto.coachFullName);
					if(courseDto.coursePictureBase64) {
						$("#coachProfileBase64", articleClone).attr("src",
							"data:image/jpeg;base64, "+courseDto.coachProfileBase64
						);
					}
					$("#roomName", articleClone).text(courseDto.roomName);
					$("#courseDescription", articleClone).text(courseDto.courseDescription);
					$("#courseStartDate", articleClone).text(courseDto.courseStartDate);
					$("#courseClassAmount", articleClone).text(courseDto.courseClassAmount);
					$("#coursePeriod", articleClone).text(courseDto.coursePeriod);
					$("#coursePrice", articleClone).text(courseDto.coursePrice);

					// 若有會員登入，且此課程有報名了，則我要報名改已報名
					console.log(courseDto.courseName);
					console.log(courseDto.isRegisteredByThisMember);
					if(courseDto.isRegisteredByThisMember) { // 為 true
						$("#bookingFormLink", articleClone)
							.addClass("disableIfRegistered")
							.text("已報名");
					// 若會員沒登入
					} else { // 為 null 或 false
						// 塞值給連結
						$("#bookingFormLink", articleClone).attr("href", $("#contextRoot").val()+"/user/courseBookingForm?courseId="+courseDto.courseId);
						// 即將額滿提醒
						if(courseDto.courseRemainingPlaces <= 3) {
							$("#warn", articleClone)
								.text("(即將額滿)")
								.addClass("aboutToFull");
						}
					}
					
					// 插在樣板前面
					$( articleTemplate ).before( articleClone );
				}); // for each 結束
			}
		});
	}
	
}); // document ready 結束
</script>

</head>

<body>
	<!-- 變數 -->
	<input type="hidden" id="contextRoot" value="${contextRoot}">
	<input type="hidden" id="memberId" value="${memberId}">
	<input type="hidden" id="bookingErrorCourseName" value="${bookingErrorCourseName}">
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
                    <h1>課程一覽</h1>
                    <nav class="d-flex align-items-center">
                        <a href="">首頁<span class="lnr lnr-arrow-right"></span></a>
                        <a href="">課程一覽</a>
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <!-- End Banner Area -->

    <!--================Blog Categorie Area =================-->
    <section class="blog_categorie_area">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="categories_post">
                        <img src="${contextRoot}/resources/frontstageCourseImage/ox.jpg" alt="post">
                        <div class="categories_details">
                            <div class="categories_text">
                                <a href="">
                                    <h5>有氧</h5>
                                </a>
                                <div class="border_line"></div>
                                <p>展現你最美的體態</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="categories_post">
                        <img src="${contextRoot}/resources/frontstageCourseImage/yoga_1.jpg" alt="post">
                        <div class="categories_details">
                            <div class="categories_text">
                                <a href="">
                                    <h5>瑜珈</h5>
                                </a>
                                <div class="border_line"></div>
                                <p>一段身心靈合一之旅</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="categories_post">
                        <img src="${contextRoot}/resources/frontstageCourseImage/stretch.png" alt="post">
                        <div class="categories_details">
                            <div class="categories_text">
                                <a href="">
                                    <h5>伸展</h5>
                                </a>
                                <div class="border_line"></div>
                                <p>聆聽您的身體，給您的身體久違的自由</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================Blog Categorie Area =================-->

    <!--================Blog Area =================-->
    <section class="blog_area">
        <div class="container">
            <div class="row">
            	<!-- 左課程列表 -->
                <div class="col-lg-8">
                    <div id="templateContainer" class="blog_left_sidebar">
                    
                    	<!-- article 開始 -->
                    	<template id="article-template">
	                        <article class="row blog_item">
	                        	<!-- 左小資訊欄 -->
	                            <div class="col-md-3">
	                                <div class="blog_info text-right">
	                                    <ul class="blog_meta list">
	                                        <li><a href="#"><span id="coachFullName"></span><i class="lnr lnr-user"></i></a></li>
	                                        <li><a href="#"><span id="courseStartDate"></span>開課<i class="lnr lnr-calendar-full"></i></a></li>
	                                        <li><a href="#"><span id="courseClassAmount"></span>堂<i class="lnr lnr-eye"></i></a></li>
	                                        <li><a href="#">費用 <span id="coursePrice"></span><i class="lnr lnr-bubble"></i></a></li>
	                                    </ul>
	                                </div>
	                            </div>
	                            <!-- 右主資訊欄 -->
	                            <div class="col-md-9">
	                                <div class="blog_post">
	                                	<div class="coursePictureContainer">
	                                		<img class="coursePictureFit" id="coursePictureBase64" src="" alt="">
	                                	</div>
	                                    <div class="blog_details">
	                                        <a href="${contextRoot}/resources/frontstage/single-blog.html">
	                                            <h2 id="courseName"></h2>
	                                        </a>
	                                        <p id="courseDescription"></p>
	                                        <a id="bookingFormLink" href="" class="white_bg_btn bookingFormLinkClass">
	                                        	我要報名
	                                        </a>
	                                        <span id="warn"></span>
	                                    </div>
	                                </div>
	                            </div>
	                        </article>
						</template>
						<!-- 頁碼 -->
                        <nav class="blog-pagination justify-content-center d-flex">
                            <ul class="pagination">
                                <li class="page-item">
                                    <a href="#" class="page-link" aria-label="Previous">
                                        <span aria-hidden="true">
                                            <span class="lnr lnr-chevron-left"></span>
                                        </span>
                                    </a>
                                </li>
                                <li class="page-item active"><a href="#" class="page-link">01</a></li>
                                <li class="page-item">
                                    <a href="#" class="page-link" aria-label="Next">
                                        <span aria-hidden="true">
                                            <span class="lnr lnr-chevron-right"></span>
                                        </span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
                
                <!-- 右搜尋、課程類別 -->
                <div class="col-lg-4">
                    <div class="blog_right_sidebar">
                    	<!-- 搜尋 -->
                        <aside class="single_sidebar_widget search_widget">
                            <div class="input-group">
                                <input id="courseNameSearchInput" type="text" class="form-control" 
                                	placeholder="搜尋課程" 
                                	onfocus="this.placeholder = ''" 
                                	onblur="this.placeholder = '搜尋課程'">
                                <span class="input-group-btn">
                                    <button id="courseNameSearchBtn" class="btn btn-default" type="button"><i class="lnr lnr-magnifier"></i></button>
                                </span>
                            </div><!-- /input-group -->
                            <div class="br"></div>
                        </aside>

                        <aside class="single_sidebar_widget post_category_widget">
                            <h4 class="widget_title">課程類別</h4>
                            <ul class="list cat-list">
                                <li>
                                    <a href="#" class="d-flex justify-content-between">
                                        <p>有氧</p>
                                        <p>6</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex justify-content-between">
                                        <p>瑜珈</p>
                                        <p>3</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex justify-content-between">
                                        <p>伸展</p>
                                        <p>2</p>
                                    </a>
                                </li>
                            </ul>
                            <div class="br"></div>
                        </aside>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================Blog Area =================-->

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