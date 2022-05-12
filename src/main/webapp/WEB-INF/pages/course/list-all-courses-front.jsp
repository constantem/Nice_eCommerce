<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />



<!-- 這個檔案是給你給你複製貼上用的, 請創一個 jsp 檔, 將此檔全部內容複製貼在該 jsp 檔 -->



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
<title>Karma Shop</title>

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
</style>

<!--jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous">
</script>

<script>
$(document).ready(function () {
	
	// 請求 course list
	$.ajax({
		method: "GET", // api query
		url: $("#contextRoot").val() + "/api/course",
		success: function (courseDtoList) {
			$(courseDtoList).each(function (index, courseDto) {
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

				// 塞值給連結
				$("#bookingFormLink", articleClone).attr("href", $("#contextRoot").val()+"/user/courseBookingForm?courseId="+courseDto.courseId);

				// 插在樣板前面
				$( articleTemplate ).before( articleClone );
			})
		}
	}); // find all 請求結束
	
}); // document ready 結束
</script>

</head>

<body>

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
                        <a href="${contextRoot}/resources/frontstage/index.html">首頁<span class="lnr lnr-arrow-right"></span></a>
                        <a href="${contextRoot}/resources/frontstage/category.html">課程一覽</a>
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
                        <img src="${contextRoot}/resources/frontstage/img/blog/cat-post/cat-post-3.jpg" alt="post">
                        <div class="categories_details">
                            <div class="categories_text">
                                <a href="${contextRoot}/resources/frontstage/blog-details.html">
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
                        <img src="${contextRoot}/resources/frontstage/img/blog/cat-post/cat-post-2.jpg" alt="post">
                        <div class="categories_details">
                            <div class="categories_text">
                                <a href="${contextRoot}/resources/frontstage/blog-details.html">
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
                        <img src="${contextRoot}/resources/frontstage/img/blog/cat-post/cat-post-1.jpg" alt="post">
                        <div class="categories_details">
                            <div class="categories_text">
                                <a href="${contextRoot}/resources/frontstage/blog-details.html">
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
	                                        <a id="bookingFormLink" href="" class="white_bg_btn">
	                                        	我要報名
	                                        </a>
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
                                <li class="page-item"><a href="#" class="page-link">01</a></li>
                                <li class="page-item active"><a href="#" class="page-link">02</a></li>
                                <li class="page-item"><a href="#" class="page-link">03</a></li>
                                <li class="page-item"><a href="#" class="page-link">04</a></li>
                                <li class="page-item"><a href="#" class="page-link">09</a></li>
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
                                <input type="text" class="form-control" 
                                	placeholder="搜尋課程" 
                                	onfocus="this.placeholder = ''" 
                                	onblur="this.placeholder = '搜尋課程'">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button"><i class="lnr lnr-magnifier"></i></button>
                                </span>
                            </div><!-- /input-group -->
                            <div class="br"></div>
                        </aside>

                        <aside class="single_sidebar_widget post_category_widget">
                            <h4 class="widget_title">課程類別</h4>
                            <ul class="list cat-list">
                                <li>
                                    <a href="#" class="d-flex justify-content-between">
                                        <p>Technology</p>
                                        <p>7</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex justify-content-between">
                                        <p>Lifestyle</p>
                                        <p>4</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex justify-content-between">
                                        <p>Fashion</p>
                                        <p>9</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex justify-content-between">
                                        <p>Art</p>
                                        <p>9</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex justify-content-between">
                                        <p>Food</p>
                                        <p>5</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex justify-content-between">
                                        <p>Architecture</p>
                                        <p>9</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="d-flex justify-content-between">
                                        <p>Adventure</p>
                                        <p>4</p>
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