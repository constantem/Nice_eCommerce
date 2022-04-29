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

                    <div>
                        <form id="formDemo">
                            <p>用户名: <input name="username" type="text" /> </p>
                            <p>密码: <input name="password" type="text" /> </p>
                            <p>邮箱: <input name="mail" type="text" /> </p>
                        </form>

                        <input type="button" value="提交" id="submit">
                    </div>
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
                                    alert("error!!!");
                                },
                            }
                            )
                        });

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
                    <!--gmaps Js-->
                    <script
                        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
                    <script src="${contextRoot}/resources/frontstage/js/gmaps.min.js"></script>
                    <script src="${contextRoot}/resources/frontstage/js/main.js"></script>
                </body>

                </html>