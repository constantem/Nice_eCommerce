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
                    <title>活動詳情</title>

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
                        width: 280px;
                        height: 120px;
                        margin: 30px auto;
                        background-image: radial-gradient(circle at 1px 8px, transparent 6px, #ff9e6d 6px, #ff9e6d 0px), radial-gradient(circle at 80px 8px, transparent 6px, #ff9e6d 6px, #ff9e6d 0px);
                        /* 優惠券長度 */
                        background-size: 200px 18px;
                        background-position: 0 0, 200px 0;
                        background-repeat-x: no-repeat;
                        font-size: 40px;
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
                        left: 170px;
                        top: 0;
                        bottom: 0;
                        width: 0;
                        border-left: 1px dashed #fff;
                    }

                    .takeCoupon {
                        position: absolute;
                        color: black;
                        font-size: 15px;
                        width: 90px;
                        top: 50%;
                        right: -12%;
                        transform: translate(-50%, -50%);
                        line-height: 40px;
                        letter-spacing: 5px;
                        /* border: 1px solid #aaa; */
                        font-size: 30px
                    }

                    .coupon::after {
                        position: absolute;
                        /* content: "立即領取"; */
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
                                    <h1>${announcement.title}</h1>
                                    <nav class="d-flex align-items-center">
                                        <a href="${contextRoot}/">首頁<span class="lnr lnr-arrow-right"></span></a>
                                        <a href="#">優惠活動一覽</a>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- End Banner Area -->


                    <!--================Blog Area =================-->
                    <section class="blog_area single-post-area section_gap">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-8 posts-list">
                                    <div class="single-post row">
                                        <div class="col-lg-12">
                                            <div class="feature-img">
                                                <img class="img-fluid"
                                                    src="data:image/png;base64,${announcement.eventPictureBase64}"
                                                    alt="" width="750" height="350">
                                            </div>
                                        </div>
                                        <div class="col-lg-3  col-md-3">
                                            <div class="blog_info text-right">
                                                <!-- <div class="post_tag">
                                                    <a href="#">Food,</a>
                                                    <a class="active" href="#">Technology,</a>
                                                    <a href="#">Politics,</a>
                                                    <a href="#">Lifestyle</a>
                                                </div> -->
                                                <ul class="blog_meta list">
                                                    <li><a href="#">低消${announcement.discount.conditionPrice}元<i
                                                                class="lnr lnr-user"></i></a></li>
                                                    <li><a href="#">活動到${announcement.discount.endDate}止<i
                                                                class="lnr lnr-calendar-full"></i></a></li>
                                                    <li><a href="#">優惠券僅剩${announcement.discount.currentQuantity}張<i
                                                                class="lnr lnr-eye"></i></a></li>
                                                    <li><a href="#">06 Comments<i class="lnr lnr-bubble"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="col-lg-9 col-md-9 blog_details">
                                            <h2>${announcement.title}</h2>
                                            <p class="excert">
                                                ${announcement.description}
                                            </p>
                                        </div>
                                    </div>
                                    <div class="navigation-area">
                                        <div class="row">
                                            <div
                                                class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
                                                <div class="thumb">
                                                    <a
                                                        href="${contextRoot}/announcement/showEventsDetails-front?id=${announcement.id-1}"><img
                                                            class="img-fluid" src="img/blog/prev.jpg" alt=""></a>
                                                </div>
                                                <div class="arrow">
                                                    <a
                                                        href="${contextRoot}/announcement/showEventsDetails-front?id=${announcement.id-1}"><span
                                                            class="lnr text-white lnr-arrow-left"></span></a>
                                                </div>
                                                <div class="detials">
                                                    <p>上一則活動</p>
                                                    <a
                                                        href="${contextRoot}/announcement/showEventsDetails-front?id=${announcement.id-1}">
                                                        <h4>第${announcement.id-1}頁</h4>
                                                    </a>
                                                </div>
                                            </div>
                                            <div
                                                class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
                                                <div class="detials">
                                                    <p>下一則活動</p>
                                                    <a
                                                        href="${contextRoot}/announcement/showEventsDetails-front?id=${announcement.id+1}">
                                                        <h4>第${announcement.id+1}頁</h4>
                                                    </a>
                                                </div>
                                                <div class="arrow">
                                                    <a
                                                        href="${contextRoot}/announcement/showEventsDetails-front?id=${announcement.id+1}"><span
                                                            class="lnr text-white lnr-arrow-right"></span></a>
                                                </div>
                                                <div class="thumb">
                                                    <a
                                                        href="${contextRoot}/announcement/showEventsDetails-front?id=${announcement.id+1}"><img
                                                            class="img-fluid" src="img/blog/next.jpg" alt=""></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="blog_right_sidebar">
                                        <aside class="single_sidebar_widget search_widget">
                                            <div class="input-group">
                                                <input type="text" class="form-control" placeholder="Search Posts"
                                                    onfocus="this.placeholder = ''"
                                                    onblur="this.placeholder = 'Search Posts'">
                                                <span class="input-group-btn">
                                                    <button class="btn btn-default" type="button"><i
                                                            class="lnr lnr-magnifier"></i></button>
                                                </span>
                                            </div><!-- /input-group -->
                                        </aside>
                                        <aside class="single_sidebar_widget author_widget">
                                            <h4>優惠券有效期間</h4>
                                            <div hidden>
                                                開始時間：<span id="start_pad"></span><br>
                                                結束時間：<span id="end_pad"></span><br>
                                            </div>
                                            <p>
                                                剩餘時間：<span id="pad"></span>

                                            </p>
                                            <div class="social_icon">
                                                <div id="coupon1" class="coupon">
                                                    <!-- 50元 -->
                                                    <div style="position:absolute;right:200px;bottom:55px;width:-800px;height: 130px;
                                                                                 color:rgb(0, 0, 0);font-size:15px">
                                                        活動限定</div>
                                                    <!--======================================== 定額折扣或是比例折扣選一個================================ -->
                                                    <div style="position:absolute;right:140px;bottom:38px;width:-600px;height: 100px;
                                                    color:rgb(0, 0, 0);font-size:40px">

                                                        <!-- <c:if test="discount.discountPercent/10 == 0">
                                                            <c:out value="${discount.discountAmount}" />
                                                        </c:if>
                                                        <c:if test="discount.discountPercent ! = 0 ">
                                                            <c:out value="${discount.discountPercent/10}" />
                                                        </c:if> -->
                                                        <!-- 50元 -->
                                                        <c:if test="${announcement.discount.discountPercent==null}">
                                                            ${announcement.discount.discountAmount}元
                                                        </c:if>
                                                        <c:if test="${announcement.discount.discountPercent!=null}">
																<c:if test="${announcement.discount.discountPercent%10==0}">
																	<fmt:formatNumber value="${announcement.discount.discountPercent/10}" maxFractionDigits="0"/>
																	折
																</c:if>
																<c:if test="${announcement.discount.discountPercent%10!=0}">
																	${announcement.discount.discountPercent}折
																</c:if>
														</c:if>
                                                    </div>
                                                    <!-- ========================================定額折扣或是比例折扣END======================================= -->
                                                    <!-- <a href="${contextRoot}/">
                                                        　　<div style="position:absolute;right:100px;bottom:-60px;width:-800px;
                                                                                 color:rgb(0, 0, 0);font-size:20px">詳細資訊</div>
                                                    </a> -->

                                                    <div class="takeCoupon">立即領取</div>

                                                </div>
                                            </div>
                                            <p>本章優惠券僅限用於<span style="color: #F75000;">${announcement.title}</span>之活動
                                                <br>不適用於他項相關優惠活動，單次購物限用一張活動限定優惠券，數量有限，兌完為止。（此折扣代碼為Nice運動網提供，請在購物車/結帳頁內全站折價券入口輸入或選用)
                                            </p>
                                            <div class="br"></div>
                                        </aside>
                                        <!-- ============================================Popular Posts======================================== -->
                                        <!-- <aside class="single_sidebar_widget popular_post_widget">
                                            <h3 class="widget_title">Popular Posts</h3>
                                            <div class="media post_item">
                                                <img src="img/blog/popular-post/post1.jpg" alt="post">
                                                <div class="media-body">
                                                    <a href="blog-details.html">
                                                        <h3>Space The Final Frontier</h3>
                                                    </a>
                                                    <p>02 Hours ago</p>
                                                </div>
                                            </div>
                                            <div class="media post_item">
                                                <img src="img/blog/popular-post/post2.jpg" alt="post">
                                                <div class="media-body">
                                                    <a href="blog-details.html">
                                                        <h3>The Amazing Hubble</h3>
                                                    </a>
                                                    <p>02 Hours ago</p>
                                                </div>
                                            </div>
                                            <div class="media post_item">
                                                <img src="img/blog/popular-post/post3.jpg" alt="post">
                                                <div class="media-body">
                                                    <a href="blog-details.html">
                                                        <h3>Astronomy Or Astrology</h3>
                                                    </a>
                                                    <p>03 Hours ago</p>
                                                </div>
                                            </div>
                                            <div class="media post_item">
                                                <img src="img/blog/popular-post/post4.jpg" alt="post">
                                                <div class="media-body">
                                                    <a href="blog-details.html">
                                                        <h3>Asteroids telescope</h3>
                                                    </a>
                                                    <p>01 Hours ago</p>
                                                </div>
                                            </div>
                                            <div class="br"></div>
                                        </aside> -->

                                        <!-- ===============================================Post Catgories=============================================
                                        <aside class="single_sidebar_widget ads_widget">
                                            <a href="#"><img class="img-fluid" src="img/blog/add.jpg" alt=""></a>
                                            <div class="br"></div>
                                        </aside>
                                        <aside class="single_sidebar_widget post_category_widget">
                                            <h4 class="widget_title">Post Catgories</h4>
                                            <ul class="list cat-list">
                                                <li>
                                                    <a href="#" class="d-flex justify-content-between">
                                                        <p>Technology</p>
                                                        <p>37</p>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#" class="d-flex justify-content-between">
                                                        <p>Lifestyle</p>
                                                        <p>24</p>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#" class="d-flex justify-content-between">
                                                        <p>Fashion</p>
                                                        <p>59</p>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#" class="d-flex justify-content-between">
                                                        <p>Art</p>
                                                        <p>29</p>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#" class="d-flex justify-content-between">
                                                        <p>Food</p>
                                                        <p>15</p>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#" class="d-flex justify-content-between">
                                                        <p>Architecture</p>
                                                        <p>09</p>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#" class="d-flex justify-content-between">
                                                        <p>Adventure</p>
                                                        <p>44</p>
                                                    </a>
                                                </li>
                                            </ul>
                                            <div class="br"></div>
                                        </aside> -->

                                        <!-- =========================================Newsletter======================================= -->
                                        <!-- <aside class="single-sidebar-widget newsletter_widget">
                                            <h4 class="widget_title">Newsletter</h4>
                                            <p>
                                                Here, I focus on a range of items and features that we use in life
                                                without
                                                giving them a second thought.
                                            </p>
                                            <div class="form-group d-flex flex-row">
                                                <div class="input-group">
                                                    <div class="input-group-prepend">
                                                        <div class="input-group-text"><i class="fa fa-envelope"
                                                                aria-hidden="true"></i></div>
                                                    </div>
                                                    <input type="text" class="form-control" id="inlineFormInputGroup"
                                                        placeholder="Enter email" onfocus="this.placeholder = ''"
                                                        onblur="this.placeholder = 'Enter email'">
                                                </div>
                                                <a href="#" class="bbtns">Subcribe</a>
                                            </div>
                                            <p class="text-bottom">You can unsubscribe at any time</p>
                                            <div class="br"></div>
                                        </aside> -->


                                        <aside class="single-sidebar-widget tag_cloud_widget">
                                            <h4 class="widget_title">Tag Clouds</h4>
                                            <ul class="list">
                                                <li><a href="#">Technology</a></li>
                                                <li><a href="#">Fashion</a></li>
                                                <li><a href="#">Architecture</a></li>
                                                <li><a href="#">Fashion</a></li>
                                                <li><a href="#">Food</a></li>
                                                <li><a href="#">Technology</a></li>
                                                <li><a href="#">Lifestyle</a></li>
                                                <li><a href="#">Art</a></li>
                                                <li><a href="#">Adventure</a></li>
                                                <li><a href="#">Food</a></li>
                                                <li><a href="#">Lifestyle</a></li>
                                                <li><a href="#">Adventure</a></li>
                                            </ul>
                                        </aside>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!--================Blog Area =================-->

                    <script>
                        $(".takeCoupon").click(function () {
                            Swal.fire({
                                icon: 'success',
                                title: '領取成功',
                                text: '優惠券已存入個人帳戶!',
                                footer: '<a href="#">前往察看</a>'
                            })

                        })
                    </script>

                    <SCRIPT language="javascript">
                        var startDate = new Date();
                        // var endDate = new Date(2022, 4, 31, 12, 25);
                        var endDate = new Date("${announcement.discount.endDate}");
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
                    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
                    <!--gmaps Js-->
                    <script
                        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
                    <script src="${contextRoot}/resources/frontstage/js/gmaps.min.js"></script>
                    <script src="${contextRoot}/resources/frontstage/js/main.js"></script>
                </body>

                </html>