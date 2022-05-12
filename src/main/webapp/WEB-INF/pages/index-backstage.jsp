<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en" class="">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>後台首頁</title>

<!-- 原生 icon -->
<link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">

<!-- 使用原生 Tailwind css -->
<link rel="stylesheet" href="${contextRoot}/resources/backstage/css/main.css">

<!-- 網站頁籤 logo -->
<link rel="icon" type="image/png" sizes="32x32" href="${contextRoot}/resources/backstage/favicon-32x32.png" />
<link rel="icon" type="image/png" sizes="16x16" href="${contextRoot}/resources/backstage/favicon-16x16.png" />

<!-- local style -->
<style>
	.grid-cols-4 {
		grid-template-columns:repeat(4,minmax(0,1fr))
	}
	@media (min-width:768px){
	/* 原 global 內容 */
	.md\:space-y-0>:not([hidden])~:not([hidden]){
		--tw-space-y-reverse:0;margin-top:calc(0px * calc(1 - var(--tw-space-y-reverse)));margin-bottom:calc(0px * var(--tw-space-y-reverse))
	}
	.md\:flex-row{
		flex-direction:row
	}
	.md\:grid-cols-3{
		grid-template-columns:repeat(3,minmax(0,1fr))
	}
	
	/* local 客製內容 */
	.md\:grid-cols-4{
	grid-template-columns:repeat(4,minmax(0,1fr))
	}
}
</style>

<!-- 原生 js -->
<script type="text/javascript" 
	src="${contextRoot}/resources/backstage/js/main.min.js?v=1628755089081"
	defer>
</script>
  
<!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous">
</script>

<!-- sweat alert 2 CDN -->	
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
$(document).ready(function () {
	if( $("#hasError").val() == "泛用錯誤" ) {
		Swal.fire({
			text: "抱歉，網頁發生錯誤。",
			icon: "error",
			confirmButtonText: "回後台首頁"
		});
	} else if( $("#hasError").val() == "staffInfrontstage" ) {
		Swal.fire({
			text: "後台權限登入中，切回後台。",
			icon: "error",
			confirmButtonText: "回首頁"
		});
	} else if( $("#hasError").val() == "adminDeny" ) {
		Swal.fire({
			text: "你沒有超級管理員權限",
			icon: "error",
			confirmButtonText: "回後台首頁"
		});
	} else if( $("#hasError").val() == "employeeDeny" ) {
		Swal.fire({
			text: "你沒有員工權限",
			icon: "error",
			confirmButtonText: "回後台首頁"
		});
	} else if( $("#hasError").val() == "userDeny" ) {
		Swal.fire({
			text: "後台權限登入中，切回後台。",
			icon: "error",
			confirmButtonText: "回後台首頁"
		});
	}
});
</script>
  
</head>

<body>
	<input type="hidden" id="hasError" value="${hasError}">
  <div id="app">

	<!-- 插入上導覽列與左導覽列 -->
	<jsp:directive.include file="/WEB-INF/pages/layout/backstage/nav-and-aside.jsp" />
	
    <section class="is-title-bar">
      <div class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
        <ul>
          <li>運動網</li>
          <li>後台首頁</li>
        </ul>
      </div>
    </section>

    <section class="is-hero-bar">
      <div class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
        <h1 class="title">
          後台首頁
        </h1>
      </div>
    </section>

	<!-- 原核心內容的 section 開始 -->
	<section class="section main-section">
      <div class="grid grid-cols-1 gap-6 md:grid-cols-4 mb-6">
      	
      	<!-- 管理系統1 -->
        <div class="card">
          <header class="card-header">
            <p class="card-header-title">
              <span class="icon"><i class="mdi mdi-account-circle"></i></span>
              會員管理
            </p>
          </header>
          <div class="card-content">
          </div>
        </div>
        
        <!-- 管理系統2 -->
        <div class="card">
          <header class="card-header">
            <p class="card-header-title">
              <span class="icon"><i class="mdi mdi-account-circle"></i></span>
              優惠券管理
            </p>
          </header>
          <div class="card-content">
          </div>
        </div>
        
        <!-- 管理系統3 -->
        <div class="card">
          <header class="card-header">
            <p class="card-header-title">
              <span class="icon"><i class="mdi mdi-account-circle"></i></span>
              商品管理
            </p>
          </header>
          <div class="card-content">
          </div>
        </div>

        <!-- 管理系統4 -->
        <div class="card">
          <header class="card-header">
            <p class="card-header-title">
              <span class="icon"><i class="mdi mdi-account-circle"></i></span>
              訂單管理
            </p>
          </header>
          <div class="card-content">
          </div>
        </div>

        <!-- 管理系統5 -->
        <div class="card">
          <header class="card-header">
            <p class="card-header-title">
              <span class="icon"><i class="mdi mdi-account-circle"></i></span>
              課程管理
            </p>
          </header>
          <div class="card-content">
          </div>
        </div>

        <!-- 管理系統6 -->
        <div class="card">
          <header class="card-header">
            <p class="card-header-title">
              <span class="icon"><i class="mdi mdi-account-circle"></i></span>
              員工管理
            </p>
          </header>
          <div class="card-content">
          </div>
        </div>

        <!-- 管理系統7 -->
        <div class="card">
          <header class="card-header">
            <p class="card-header-title">
              <span class="icon"><i class="mdi mdi-account-circle"></i></span>
              客服系統
            </p>
          </header>
          <div class="card-content">
          </div>
        </div>   
        
        <!-- 管理系統8 -->
        <div class="card">
          <header class="card-header">
            <p class="card-header-title">
              <span class="icon"><i class="mdi mdi-account-circle"></i></span>
              活動管理
            </p>
          </header>
          <div class="card-content">
          </div>
        </div>
      </div>

    </section>
	<!-- 原核心內容的 section 結束 -->

	<!-- 插入頁腳 -->
	<jsp:directive.include file="/WEB-INF/pages/layout/backstage/footer.jsp" />

  </div>

</body>

</html>