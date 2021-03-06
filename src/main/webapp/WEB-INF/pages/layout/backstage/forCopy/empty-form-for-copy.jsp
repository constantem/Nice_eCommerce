<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />



<!-- 複製用, 核心內容留一個表單 -->



<!DOCTYPE html>
<html lang="en" class="">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Forms - Admin One Tailwind CSS Admin Dashboard</title>

  <!-- Icons below are for demo only. Feel free to use any icon pack. Docs: https://bulma.io/documentation/elements/icon/ -->
  <link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">

  <!-- Tailwind is included -->
  <link rel="stylesheet" href="${contextRoot}/resources/backstage/css/main.css?v=1628755089081">

  <link rel="apple-touch-icon" sizes="180x180" href="${contextRoot}/resources/backstage/apple-touch-icon.png"/>
  <link rel="icon" type="image/png" sizes="32x32" href="${contextRoot}/resources/backstage/favicon-32x32.png"/>
  <link rel="icon" type="image/png" sizes="16x16" href="${contextRoot}/resources/backstage/favicon-16x16.png"/>
  <link rel="mask-icon" href="${contextRoot}/resources/backstage/safari-pinned-tab.svg" color="#00b4b6"/>

  <meta name="description" content="Admin One - free Tailwind dashboard">

  <meta property="og:url" content="https://justboil.github.io/admin-one-tailwind/">
  <meta property="og:site_name" content="JustBoil.me">
  <meta property="og:title" content="Admin One HTML">
  <meta property="og:description" content="Admin One - free Tailwind dashboard">
  <meta property="og:image" content="https://justboil.me/images/one-tailwind/repository-preview-hi-res.png">
  <meta property="og:image:type" content="image/png">
  <meta property="og:image:width" content="1920">
  <meta property="og:image:height" content="960">

  <meta property="twitter:card" content="summary_large_image">
  <meta property="twitter:title" content="Admin One HTML">
  <meta property="twitter:description" content="Admin One - free Tailwind dashboard">
  <meta property="twitter:image:src" content="https://justboil.me/images/one-tailwind/repository-preview-hi-res.png">
  <meta property="twitter:image:width" content="1920">
  <meta property="twitter:image:height" content="960">

  <!-- Global site tag (gtag.js) - Google Analytics -->
  <script async src="https://www.googletagmanager.com/gtag/js?id=UA-130795909-1"></script>
  <script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
    gtag('config', 'UA-130795909-1');
  </script>

</head>
<body>

<div id="app">

<!-- 插入上導覽列與左導覽列 -->
<jsp:directive.include file="/WEB-INF/pages/layout/backstage/nav-and-aside.jsp" />

<!-- 章節層級 -->
<section class="is-title-bar">
  <div class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
    <ul>
      <li>Admin</li>
      <li>Forms</li>
    </ul>
    <a href="https://justboil.me/" onclick="alert('Coming soon'); return false" target="_blank" class="button blue">
      <span class="icon"><i class="mdi mdi-credit-card-outline"></i></span>
      <span>Premium Demo</span>
    </a>
  </div>
</section>

<!-- 標題 -->
<section class="is-hero-bar">
  <div class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
    <h1 class="title">
      Forms
    </h1>
    <button class="button light">Button</button>
  </div>
</section>

<!-- 核心內容的 section 開始 -->
<section class="section main-section">
  <!-- 資訊卡1 -->
  <div class="card mb-6">
    <header class="card-header">
      <p class="card-header-title">
        <span class="icon"><i class="mdi mdi-ballot"></i></span>
        Forms
      </p>
    </header>
    <div class="card-content">
      <form method="get">
        <div class="field">
          <label class="label">From</label>
          <div class="field-body">
            <div class="field">
              <div class="control icons-left">
                <input class="input" type="text" placeholder="Name">
                <span class="icon left"><i class="mdi mdi-account"></i></span>
              </div>
            </div>
            <div class="field">
              <div class="control icons-left icons-right">
                <input class="input" type="email" placeholder="Email" value="alex@smith.com">
                <span class="icon left"><i class="mdi mdi-mail"></i></span>
                <span class="icon right"><i class="mdi mdi-check"></i></span>
              </div>
            </div>
          </div>
        </div>
        <div class="field">
          <div class="field-body">
            <div class="field">
              <div class="field addons">
                <div class="control">
                  <input class="input" value="+44" size="3" readonly>
                </div>
                <div class="control expanded">
                  <input class="input" type="tel" placeholder="Your phone number">
                </div>
              </div>
              <p class="help">Do not enter the first zero</p>
            </div>
          </div>
        </div>
        <div class="field">
          <label class="label">Department</label>
          <div class="control">
            <div class="select">
              <select>
                <option>Business development</option>
                <option>Marketing</option>
                <option>Sales</option>
              </select>
            </div>
          </div>
        </div>
        <hr>
        <div class="field">
          <label class="label">Subject</label>

          <div class="control">
            <input class="input" type="text" placeholder="e.g. Partnership opportunity">
          </div>
          <p class="help">
            This field is required
          </p>
        </div>

        <div class="field">
          <label class="label">Question</label>
          <div class="control">
            <textarea class="textarea" placeholder="Explain how we can help you"></textarea>
          </div>
        </div>
        <hr>

        <div class="field grouped">
          <div class="control">
            <button type="submit" class="button green">
              Submit
            </button>
          </div>
          <div class="control">
            <button type="reset" class="button red">
              Reset
            </button>
          </div>
        </div>
      </form>
    </div>
  </div>

</section>
<!-- 核心內容的 section 結束 -->

<!-- 插入頁腳 -->
<jsp:directive.include file="/WEB-INF/pages/layout/backstage/footer.jsp" />

<!-- 彈窗1 -->
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

<!-- 彈窗2 -->
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
  !function(f,b,e,v,n,t,s)
  {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
    n.callMethod.apply(n,arguments):n.queue.push(arguments)};
    if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
    n.queue=[];t=b.createElement(e);t.async=!0;
    t.src=v;s=b.getElementsByTagName(e)[0];
    s.parentNode.insertBefore(t,s)}(window, document,'script',
    'https://connect.facebook.net/en_US/fbevents.js');
  fbq('init', '658339141622648');
  fbq('track', 'PageView');
</script>
<noscript><img height="1" width="1" style="display:none" src="https://www.facebook.com/tr?id=658339141622648&ev=PageView&noscript=1"/></noscript>


</body>
</html>
