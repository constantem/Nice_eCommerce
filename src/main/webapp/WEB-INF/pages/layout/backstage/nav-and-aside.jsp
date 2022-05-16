<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!-- short style in second head tag in body tag -->

<!-- bootstrap icon -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

<head>
	<style>
		.hideIfNotAuthenticatedAsStaff {
			display: none;
		}
		
		.hideIfEmptyImg {
			display: none;
		}
    #logoImg{
      display: block;
      float: left;
      margin-right: 8px;
    }
	</style>
</head>

<input id="contextRoot" type="hidden" value="${pageContext.request.contextPath}">
<!-- 上導覽列開始 -->
<nav id="navbar-main" class="navbar is-fixed-top">
  <div class="navbar-brand">
    <a class="navbar-item mobile-aside-button">
      <span class="icon"><i class="mdi mdi-forwardburger mdi-24px"></i></span>
    </a>
    <div class="navbar-item">
      <div class="control"><input placeholder="Search everywhere..." class="input"></div>
    </div>
  </div>
  <div class="navbar-brand is-right">
    <a class="navbar-item --jb-navbar-menu-toggle" data-target="navbar-menu">
      <span class="icon"><i class="mdi mdi-dots-vertical mdi-24px"></i></span>
    </a>
  </div>
  <div class="navbar-menu" id="navbar-menu">
    <div class="navbar-end">
    
	  <!-- 下拉式選單1 -->	
      <div class="navbar-item dropdown has-divider has-user-avatar">
        <a class="navbar-link" 
        	href="#">
          <div id="staffImgContainer" class="user-avatar isAuthenticatedAsStaff hideIfNotAuthenticatedAsStaff">
            <img id="navStaffImg" src="" alt="" class="rounded-full">
          </div>
          <div id="navStaffNameContainer" class="is-user-name">
          	<span id="navStaffName">尚未登入</span>
          </div>
          <span class="icon"><i class="mdi mdi-chevron-down"></i></span>
        </a>
       
        <div class="navbar-dropdown">
        
          <!-- 登入 -->
          <a href="${contextRoot}/staffLogin" 
          	class="navbar-item active notAuthenticatedAsStaff">
            <span class="icon"><i class="mdi mdi-account"></i></span>
            <span>登入</span>
          </a>
          
          <!-- 員工個人資料 -->
          <a  
          	class="navbar-item active isAuthenticatedAsStaff hideIfNotAuthenticatedAsStaff">
            <span class="icon"><i class="mdi mdi-account"></i></span>
            <span>個人資料</span>
          </a>
          
          <!-- (擺設用) -->
          <a class="navbar-item isAuthenticatedAsStaff hideIfNotAuthenticatedAsStaff">
            <span class="icon"><i class="mdi mdi-settings"></i></span>
            <span>設定</span>
          </a>
          
          <!-- (擺設用) -->
          <a class="navbar-item isAuthenticatedAsStaff hideIfNotAuthenticatedAsStaff">
            <span class="icon"><i class="mdi mdi-email"></i></span>
            <span>信箱</span>
          </a>
          
          <hr class="navbar-divider">
          
          <!-- 登出 -->
          <form:form id="logoutForm" 
          	action="${contextRoot}/staffLogout" 
          	method="POST"
          	cssClass="isAuthenticatedAsStaff hideIfNotAuthenticatedAsStaff">
			  <a class="navbar-item" href="#" onclick="document.getElementById('logoutForm').submit();">
	            <span class="icon"><i class="mdi mdi-logout"></i></span>
	            <span>登出</span>
	          </a>
		  </form:form>
        </div>
      </div>
      <a href="https://github.com/constantem/Nice_eCommerce" class="navbar-item has-divider desktop-icon-only">
        <span class="icon"><i class="mdi mdi-github-circle"></i></span>
        <span>GitHub</span>
      </a>
      <div class="navbar-item isAuthenticatedAsStaff hideIfNotAuthenticatedAsStaff">
      <a href="#" title="Log out" 
      	class="desktop-icon-only --jb-modal" data-target="logout-modal">
        <span class="icon"><i class="mdi mdi-logout"></i></span>
        <span>登出</span>
      </a>
      </div>
      <!-- 加插連前台按鈕 -->
      <div class="navbar-item">
      	<button type="button" class="button blue --jb-modal" data-target="toFrontStage-modal">
      		運動網
      	</button>
      </div>

    </div>
  </div>
</nav>
<!-- 上導覽列結束 -->

<!-- 左導覽列開始 -->
<aside class="aside is-placed-left is-expanded">
  <div class="aside-tools">
    <div>
     <span>
       <img id="logoImg" width="25px" height="25px" src="${contextRoot}/resources/backstage/apple-touch-icon-removebg-preview.png"> 
       Nice運動網 
     </span>
       <b class="font-black">管理系統</b>
    </div>
  </div>
  <div class="menu is-menu-main">
    <p class="menu-label">總覽</p>
    <ul class="menu-list">
      <li class="--set-active-index-html">
        <a href="${contextRoot}/backstage">
          <span class="icon"><i class="mdi mdi-desktop-mac"></i></span>
          <span class="menu-item-label">儀表板</span>
        </a>
      </li>
    </ul>
    <p class="menu-label">分類</p>
    <ul class="menu-list">
         
      <!-- 下拉式選單1: 會員管理系統 -->
      <li>
        <a class="dropdown">
          <span class="icon"><i class="bi bi-person-circle"></i></span>
          <span class="menu-item-label">會員管理</span>
          <span class="icon"><i class="mdi mdi-plus"></i></span>
        </a>
        <ul>
          <li>
            <a href="${contextRoot}/staff/member/form">
              <span>新增會員</span>
            </a>
          </li>
          <li>
            <a href="${contextRoot}/staff/member/showAllResult">
              <span>會員列表</span>
            </a>
          </li>
        </ul>
      </li>
      
      <!-- 下拉式選單2: 優惠券管理系統 -->
      <li>
        <a class="dropdown">
          <span class="icon"><i class="bi bi-megaphone-fill"></i></span>
          <span class="menu-item-label">活動及優惠券管理</span>
          <span class="icon"><i class="mdi mdi-plus"></i></span>
        </a>
        <ul>
          <li>
            <a href="${contextRoot}/staff/announcement/addAnnouncement">
              <span>新增活動</span>
            </a>
          </li>
          <li>
            <a href="${contextRoot}/staff/announcement/viewAnnouncement">
              <span>活動列表</span>
            </a>
          </li>
          <li>
            <a href="${contextRoot}/staff/discount/form">
              <span>新增優惠券</span>
            </a>
          </li>
          <li>
            <a href="${contextRoot}/staff/discount/viewDiscount">
              <span>優惠券列表</span>
            </a>
          </li>
        </ul>
      </li>

      <!-- 下拉式選單3: 商品管理系統 -->
      <li>
        <a class="dropdown">
          <span class="icon"><i class="bi bi-cart4"></i></span>
          <span class="menu-item-label">商品管理</span>
          <span class="icon"><i class="mdi mdi-plus"></i></span>
        </a>
        <ul>
          <li>
            <a href="${contextRoot}/staff/insertPdpage.controller">
              <span>新增商品</span>
            </a>
          </li>
          <li>
            <a href="${contextRoot}/staff/pageSeperate">
              <span>商品列表</span>
            </a>
          </li>
          <li>
            <a href="${contextRoot}/staff/searchProductAds.controller">
              <span>商品廣告輪播配置</span>
            </a>
          </li>
        </ul>
      </li>
      
      <!-- 下拉式選單4: 訂單管理系統 -->
      <li>
        <a class="dropdown">
          <span class="icon"><i class="bi bi-file-earmark-break-fill"></i></span>
          <span class="menu-item-label">訂單管理</span>
          <span class="icon"><i class="mdi mdi-plus"></i></span>
        </a>
        <ul>
          <li>
            <a href="${contextRoot}/staff/orders/viewAllOrders">
              <span>訂單列表</span>
            </a>
          </li>
        </ul>
      </li>
      
      <!-- 下拉式選單5: 課程管理系統 -->
      <li <c:if test="${(activeLi == 'courseForm') || (activeLi == 'courseList') || (activeLi == 'coachList') || (activeLi == 'courseBookingList')}">class="active"</c:if> >
        <a class="dropdown">
          <span class="icon"><i class="bi bi-calendar-range"></i></span>
          <span class="menu-item-label">課程管理</span>
          <span class="icon">
          	<i 
          		<c:choose>
          			<c:when test="${(activeLi == 'courseForm') || (activeLi == 'courseList') || (activeLi == 'coachList') || (activeLi == 'courseBookingList')}">class="mdi mdi-minus"</c:when>
          			<c:otherwise>class="mdi mdi-plus"</c:otherwise>
          		</c:choose>
          	></i>
          </span>
        </a>
        <ul>
          <li <c:if test="${activeLi == 'courseForm'}">class="active"</c:if> >
            <a href="${contextRoot}/staff/course/form">
              <span>新增課程</span>
            </a>
          </li>
          <li <c:if test="${activeLi == 'courseList'}">class="active"</c:if> >
            <a href="${contextRoot}/staff/course/show/all">
              <span>課程列表</span>
            </a>
          </li>
          <li <c:if test="${activeLi == 'coachList'}">class="active"</c:if> >
            <a href="${contextRoot}/staff/coach/listPage">
              <span>教練列表</span>
            </a>
          </li>
          <li <c:if test="${activeLi == 'courseBookingList'}">class="active"</c:if> >
            <a href="${contextRoot}/staff/courseBooking/listPage">
              <span>課程訂單列表</span>
            </a>
          </li>
        </ul>
      </li>
      
      <!-- 下拉式選單6: 員工管理系統 -->
      <li>
        <a class="dropdown">
          <span class="icon"><i class="bi bi-person-badge-fill"></i></span>
          <span class="menu-item-label">員工管理</span>
          <span class="icon"><i class="mdi mdi-plus"></i></span>
        </a>
        <ul>
          <li>
            <a href="${contextRoot}/admin/employee/viewEmployee">
              <span>員工列表</span>
            </a>
          </li>
          <li>
            <a href="${contextRoot}/admin/employee/WorkSchedule">
              <span>排班系統</span>
            </a>
          </li>
           <li>
            <a href="${contextRoot}/staff/PunchCardSystem">
              <span>打卡系統</span>
            </a>
          </li>
        </ul>
      </li>
      
      <!-- 下拉式選單7: 客服系統 -->
      <li>
        <a class="dropdown">
          <span class="icon"><i class="bi bi-telephone-fill"></i></span>
          <span class="menu-item-label">客服系統</span>
          <span class="icon"><i class="mdi mdi-plus"></i></span>
        </a>
        <ul>
          <li>
            <a href="${contextRoot}/staff/message/selectAll">
              <span>客服管理</span>
            </a>
          </li>
        </ul>
      </li>
      
    </ul> <!-- 分類項目結束 -->
    
    
    <p class="menu-label">About</p>
    <ul class="menu-list">
      <li>
        <a href="https://tailwindcss.com/docs/installation" class="has-icon">
          <span class="icon"><i class="mdi mdi-help-circle"></i></span>
          <span class="menu-item-label">後台樣式官網</span>
        </a>
      </li>
      <li>
        <a href="https://github.com/constantem/Nice_eCommerce" class="has-icon">
          <span class="icon"><i class="mdi mdi-github-circle"></i></span>
          <span class="menu-item-label">本組GitHub</span>
        </a>
      </li>
      <li>
        <a href="https://drive.google.com/drive/folders/1lWzF6pWIafRzq4-vXgjpKAoj32DKLIblㄖㄛ" class="has-icon">
          <span class="icon"><i class="mdi mdi-credit-card-outline"></i></span>
          <span class="menu-item-label">本組sql檔雲端</span>
        </a>
      </li>
    </ul>
  </div>
</aside>
<!-- 左導覽列結束 -->

<!-- 確認登出彈窗 -->
<div id="logout-modal" class="modal">
  <div class="modal-background --jb-modal-close"></div>
  <div class="modal-card" style="width:300px">
    <header class="modal-card-head">
      <p class="modal-card-title">登出</p>
    </header>
    <section class="modal-card-body">
      <p>即將<b>登出</b></p>
    </section>
    <footer class="modal-card-foot">
	  <button class="button blue --jb-modal-close" onclick="document.getElementById('logoutForm').submit();">登出</button>
      <button class="button --jb-modal-close">取消</button>
    </footer>
  </div>
</div>

<!-- 前往前台彈窗 -->
<div id="toFrontStage-modal" class="modal">
  <div class="modal-background --jb-modal-close"></div>
  <div class="modal-card" style="width:300px">
    <header class="modal-card-head">
      <p class="modal-card-title">(Dev Only)</p>
    </header>
    <section class="modal-card-body">
      <p>即將<b>登出</b>並前往運動網</p>
    </section>
    <footer class="modal-card-foot">
	  <button class="button green --jb-modal-close" onclick="location.href='${contextRoot}/staffLogoutAndToFrontstage'">登出並前往</button>
      <button class="button --jb-modal-close">取消</button>
    </footer>
  </div>
</div>

<!-- 客製開啟彈窗的JS -->
<script>

</script>

<!-- 請求當下登入狀態的JS -->
<script>
	fetch("${contextRoot}/staff/role", {method: "GET"})
	.then(function (response) {
		return response.json();
	})
	.then(function (roles) {
		console.log("staff roles 前端 ========>|" + roles);
		
		const protectedItems = document.querySelectorAll(".isAuthenticatedAsStaff");
		const openedItems = document.querySelectorAll(".notAuthenticatedAsStaff");
		
		// 若後台角色登入
		if(roles.includes("ROLE_EMPLOYEE")) { // admin 也有 ROLE_EMPLOYEE, 所以這樣寫就可以
				
			fetch("${contextRoot}/staff/fullName", {method: "GET"})
			.then(function (response) {
				return response.json();
			})
			.then(function (profile) {
				if(profile.fullName) {
					document.getElementById("navStaffName").textContent = profile.fullName;
				} else {
					document.getElementById("navStaffName").textContent = "";
				}
				// 若有照片(的檔案)
				if(profile.imgSrc) { // 不為 null, 已測試 imgSrc 若空, 為 null type (不是空字串或null string)
					document.getElementById("navStaffImg").classList.remove("hideIfEmptyImg");
					document.getElementById("navStaffImg").src = "${contextRoot}/upload/"+profile.imgSrc;
				// 若無照片(的檔案)
				} else {
					document.getElementById("navStaffImg").classList.add("hideIfEmptyImg");
					document.getElementById("navStaffImg").src = "";
				}
				
			});
			
			// protected
			protectedItems.forEach( (item)=>
				// show
				item.classList.remove("hideIfNotAuthenticatedAsStaff") 
			); 
			
			// opened
			openedItems.forEach( (item)=>
				// show
				item.classList.add("hideIfNotAuthenticatedAsStaff") 
			); 
			
		// 若後台角色未登入
		} else {
			
			// 尚未登入狀態
			document.getElementById("navStaffName").textContent = "尚未登入";
			// 一定沒照片, 隱藏
			document.getElementById("navStaffImg").classList.add("hideIfEmptyImg");
			
			// protected
			protectedItems.forEach( (item)=>
				// show
				item.classList.add("hideIfNotAuthenticatedAsStaff") 
			); 
			// opened
			openedItems.forEach( (item)=>
				// show
				item.classList.remove("hideIfNotAuthenticatedAsStaff")
			); 
		}
	});

</script>
