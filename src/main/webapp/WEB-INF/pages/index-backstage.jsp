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

</head>

<body>

  <div id="app">

	<!-- 插入上導覽列與左導覽列 -->
	<jsp:directive.include file="/WEB-INF/pages/layout/backstage/nav-and-aside.jsp" />
	
    <section class="is-title-bar">
      <div class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
        <ul>
          <li>運動網</li>
          <li>後台首頁</li>
        </ul>
        <a href="https://justboil.me/" onclick="alert('Coming soon'); return false" target="_blank" class="button blue">
          <span class="icon"><i class="mdi mdi-credit-card-outline"></i></span>
          <span>Premium Demo</span>
        </a>
      </div>
    </section>

    <section class="is-hero-bar">
      <div class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
        <h1 class="title">
          後台首頁
        </h1>
        <button class="button light">Button</button>
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

    <div id="sample-modal" class="modal">
      <div class="modal-background --jb-modal-close"></div>
      <div class="modal-card">
        <header class="modal-card-head">
          <p class="modal-card-title">Sample modal</p>
        </header>
        <section class="modal-card-body">
          <p>Lorem ipsum dolor sit amet <b>adipiscing elit</b></p>
          <p>This is sample modal</p>
        </section>
        <footer class="modal-card-foot">
          <button class="button --jb-modal-close">Cancel</button>
          <button class="button red --jb-modal-close">Confirm</button>
        </footer>
      </div>
    </div>

    <div id="sample-modal-2" class="modal">
      <div class="modal-background --jb-modal-close"></div>
      <div class="modal-card">
        <header class="modal-card-head">
          <p class="modal-card-title">Sample modal</p>
        </header>
        <section class="modal-card-body">
          <p>Lorem ipsum dolor sit amet <b>adipiscing elit</b></p>
          <p>This is sample modal</p>
        </section>
        <footer class="modal-card-foot">
          <button class="button --jb-modal-close">Cancel</button>
          <button class="button blue --jb-modal-close">Confirm</button>
        </footer>
      </div>
    </div>

  </div>

  <!-- Scripts below are for demo only -->
  <script type="text/javascript" src="${contextRoot}/resources/backstage/js/main.min.js?v=1628755089081"></script>

  <script>
    !function (f, b, e, v, n, t, s) {
      if (f.fbq) return; n = f.fbq = function () {
        n.callMethod ?
          n.callMethod.apply(n, arguments) : n.queue.push(arguments)
      };
      if (!f._fbq) f._fbq = n; n.push = n; n.loaded = !0; n.version = '2.0';
      n.queue = []; t = b.createElement(e); t.async = !0;
      t.src = v; s = b.getElementsByTagName(e)[0];
      s.parentNode.insertBefore(t, s)
    }(window, document, 'script',
      'https://connect.facebook.net/en_US/fbevents.js');
    fbq('init', '658339141622648');
    fbq('track', 'PageView');
  </script>
  <noscript><img height="1" width="1" style="display:none" src="https://www.facebook.com/tr?id=658339141622648&ev=PageView&noscript=1" /></noscript>

  <!-- Icons below are for demo only. Feel free to use any icon pack. Docs: https://bulma.io/documentation/elements/icon/ -->
  <link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">

</body>

</html>