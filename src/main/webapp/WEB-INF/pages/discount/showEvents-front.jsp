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
                                    <h1>活動</h1>
                                    <nav class="d-flex align-items-center">
                                        <a href="${contextRoot}/">首頁<span class="lnr lnr-arrow-right"></span></a>
                                        <a href="#">活動一覽</a>
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
                                        <img src="${contextRoot}/img/event/cat-post-1.png" alt="post">
                                        <div class="categories_details">
                                            <div class="categories_text">
                                                <a href="${contextRoot}/FrontPageSearchBySubCategory?name=休閒鞋">
                                                    <h5>新品到貨</h5>
                                                </a>
                                                <div class="border_line"></div>
                                                <p>Enjoy your social life together</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="categories_post">
                                        <img src="${contextRoot}/img/event/cat-post-2.png" alt="post">
                                        <div class="categories_details">
                                            <div class="categories_text">
                                                <a href="${contextRoot}/FrontPageSearchBySubCategory?name=慢跑鞋">
                                                    <h5>熱銷商品</h5>
                                                </a>
                                                <div class="border_line"></div>
                                                <p>Be a part of politics</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="categories_post">
                                        <img src="${contextRoot}/img/event/cat-post-3.jpg" alt="post">
                                        <div class="categories_details">
                                            <div class="categories_text">
                                                <a href="${contextRoot}/FrontPageSearchBySubCategory?name=高蛋白點心">
                                                    <h5>來根燕麥棒?</h5>
                                                </a>
                                                <div class="border_line"></div>
                                                <p>Let the food be finished</p>
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
                                <div class="col-lg-8">
                                    <div class="blog_left_sidebar">
                                        <!-- =====================================foreach活動(開始)================================= -->
                                        <c:forEach var="announcement" items="${announcements}">
                                            <article class="row blog_item">
                                                <div class="col-md-3">
                                                    <div class="blog_info text-right">
                                                        <!-- <div class="post_tag">
                                                            <a href="#">Food,</a>
                                                            <a class="active" href="#">Technology,</a>
                                                            <a href="#">Politics,</a>
                                                            <a href="#">Lifestyle</a>
                                                        </div> -->
                                                        <ul class="blog_meta list">
                                                            <li><a href="#">低消${announcement.discount.conditionPrice}<i
                                                                        class="lnr lnr-arrow-right-circle"></i></a>
                                                            </li>
                                                            <li><a href="#">活動到${announcement.discount.endDate}止<i
                                                                        class="lnr lnr-calendar-full"></i></a></li>
                                                            <li><a href="#">優惠券僅剩${announcement.discount.currentQuantity}張<i
                                                                        class="lnr lnr-eye"></i></a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="col-md-9">
                                                    <div class="blog_post">
                                                        <img src="data:image/png;base64,${announcement.eventPictureBase64}" alt="">
                                                        <!-- <ul>
                                                            <li><img id=""
                                                                src="data:image/png;base64,${announcement.eventPictureBase64}"
                                                                alt="picture" id="productImg" width="480" height="440"></li>
                                                        </ul> -->
                                                        <div class="blog_details">
                                                            <a href="${contextRoot}/announcement/showEventsDetails-front?id=${announcement.id}">
                                                                <h2>${announcement.title}</h2>
                                                                <h5>${announcement.discount.description}</h5>
                                                            </a>
                                                            <p>${announcement.description}</p>
                                                            <a href="single-blog.html" class="white_bg_btn">View
                                                                More</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </article>
                                        </c:forEach>
                                        <!-- =====================================foreach活動(結束)================================= -->

                                        <!-- =====================================一篇活動(開始)================================= -->
                                        <article class="row blog_item">
                                            <div class="col-md-3">
                                                <div class="blog_info text-right">
                                                    <div class="post_tag">
                                                        <a href="#">Food,</a>
                                                        <a class="active" href="#">Technology,</a>
                                                        <a href="#">Politics,</a>
                                                        <a href="#">Lifestyle</a>
                                                    </div>
                                                    <ul class="blog_meta list">
                                                        <li><a href="#">Mark wiens<i class="lnr lnr-user"></i></a></li>
                                                        <li><a href="#">12 Dec, 2018<i
                                                                    class="lnr lnr-calendar-full"></i></a></li>
                                                        <li><a href="#">1.2M Views<i class="lnr lnr-eye"></i></a></li>
                                                        <li><a href="#">06 Comments<i class="lnr lnr-bubble"></i></a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="col-md-9">
                                                <div class="blog_post">
                                                    <img src="${contextRoot}/img/event/valentine-4.jpg" alt="">
                                                    <div class="blog_details">
                                                        <a href="single-blog.html">
                                                            <h2>Astronomy Binoculars A Great Alternative</h2>
                                                        </a>
                                                        <p>MCSE boot camps have its supporters and its detractors. Some
                                                            people do not
                                                            understand why you should have to spend money on boot camp
                                                            when you can get
                                                            the MCSE study materials yourself at a fraction.</p>
                                                        <a href="single-blog.html" class="white_bg_btn">View More</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </article>
                                        <!-- =====================================一篇活動(結束)================================= -->
                                        
                                        <!-- ==================================頁面數字鈕(開始)============================== -->
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
                                        <!-- ==================================頁面數字鈕(結束)============================== -->
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
                                            <div class="br"></div>
                                        </aside>

                                        <aside class="single_sidebar_widget popular_post_widget">
                                            <h3 class="widget_title">您可能喜歡</h3>
                                            <div class="media post_item">
                                                <img src="${contextRoot}/img/event/popular-post-1 .png" alt="post">
                                                <div class="media-body">
                                                    <a href="blog-details.html">
                                                        <h3>Space The Final Frontier</h3>
                                                    </a>
                                                    <p>02 Hours ago</p>
                                                </div>
                                            </div>
                                            <div class="media post_item">
                                                <img src="${contextRoot}/img/event/popular-post-2.png" alt="post">
                                                <div class="media-body">
                                                    <a href="blog-details.html">
                                                        <h3>The Amazing Hubble</h3>
                                                    </a>
                                                    <p>02 Hours ago</p>
                                                </div>
                                            </div>
                                            <div class="media post_item">
                                                <img src="${contextRoot}/img/event/popular-post-3.png" alt="post">
                                                <div class="media-body">
                                                    <a href="blog-details.html">
                                                        <h3>Astronomy Or Astrology</h3>
                                                    </a>
                                                    <p>03 Hours ago</p>
                                                </div>
                                            </div>
                                            <div class="media post_item">
                                                <img src="${contextRoot}/img/event/popular-post-4.jpg" alt="post">
                                                <div class="media-body">
                                                    <a href="blog-details.html">
                                                        <h3>Asteroids telescope</h3>
                                                    </a>
                                                    <p>01 Hours ago</p>
                                                </div>
                                            </div>
                                            <div class="br"></div>
                                        </aside>
                                        <aside class="single_sidebar_widget ads_widget">
                                            <a href="#"><img class="img-fluid" src="img/blog/add.jpg" alt=""></a>
                                            <div class="br"></div>
                                        </aside>
                                        <aside class="single-sidebar-widget newsletter_widget">
                                            <h4 class="widget_title">優惠通知信件</h4>
                                            <p>
                                                不想錯過最新的優惠資訊?<br>
                                                輸入您的email<br>
                                                獲取即時的優惠資訊
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
                                            <p class="text-bottom">您可以隨時取消訂閱優惠信件</p>
                                            <div class="br"></div>
                                        </aside>
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


                    <button id="btn">click</button>
                    <button id="info">click</button>


                    <script>
                        $("#info").click(function () {
                            Swal.fire({
                                html: true,
                                title: 'Oops...',
                                text: '優惠<br>內容' + '數量有限，先用先贏！/n 折$100 低消$1, 000<br>有效期限 \n<br>2022.05.05 - 2022.05.05<br>商品<br>僅適用於指定商品',
                                // text: 'Something went wrong!',
                                footer: '<a href="">Why do I have this issue?</a>'
                            })
                        })
                    </script>

                    <!-- swal("Oops", "Line 1.\n line2.", "error"); -->
                    <script>

                    </script>

                    <script>
                        $("#btn").click(function () {
                            Swal.fire({
                                icon: 'error',
                                title: 'Oops...',
                                text: 'Something went wrong!',
                                footer: '<a href="">Why do I have this issue?</a>'
                            })
                        })
                    </script>


                    <script>
                        $("#submit").click(function () {
                            var json = $("#formDemo").serializeJSON();
                            var jsonString = JSON.stringify(json);;
                            $.ajax({
                                contentType: "application/json; charset=utf-8",
                                type: "post",
                                url: "additem",
                                data: jsonString,
                                success: function (data) {
                                    alert("success!!!");
                                },
                                error: function (e) {
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Oops...',
                                        text: 'Something went wrong!',
                                        footer: '<a href="">Why do I have this issue?</a>'
                                    })
                                },
                            }
                            )
                        });

                    </script>

                    <script>
                        Swal.fire({
                            icon: 'error',
                            title: 'Oops...',
                            text: 'Something went wrong!',
                            footer: '<a href="">Why do I have this issue?</a>'
                        })
                    </script>



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