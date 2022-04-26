<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en" class="form-screen">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>後台登入</title>

<!-- Icons below are for demo only. Feel free to use any icon pack. Docs: https://bulma.io/documentation/elements/icon/ -->
<link rel="stylesheet"
	href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">

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

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
	<script>
		$(document).ready(function() {
			$("#first").click(function() {
				$.ajax({
					url: $("#contextRoot").val() + "/staffLoginAutoInputFirst",
					success: function (employee) {
						$("#username").val(employee.employee_id);
						$("#password").val(employee.password);
					}
				});
			});
		});
	</script>
</head>
<body>
<!-- variable -->
<input type="hidden" id="contextRoot" value="${pageContext.request.contextPath}">
<div id="app">

  <section class="section main-section">
    <div class="card">
      <header class="card-header">
        <p class="card-header-title">
          <span class="icon"><i class="mdi mdi-lock"></i></span>
          員工登入<span style="color:red;">${error.notexist}</span>
        </p>
      </header>
      <div class="card-content">
        <form
        	action="${contextRoot}/staffLoginAuthenticate" 
        	method="post" >

          <div class="field spaced">
            <label for="username" class="label">
            	員工編號
            </label>
            <div class="control icons-left">
              <input id="username" class="input" type="text" name="username" placeholder=""/>
              <span class="icon is-small left"><i class="mdi mdi-account"></i></span>
            </div>
            <p class="help" style="color:red">
<%--               <form:errors path="username"/> --%>
            </p>
          </div>

          <div class="field spaced">
            <label for="password" class="label">
            	密碼
            </label>
            <p class="control icons-left">
              <input id="password" class="input" type="password" name="password" placeholder=""/>
              <span class="icon is-small left"><i class="mdi mdi-asterisk"></i></span>
            </p>
            <p class="help" style="color:red">
<%--               <form:errors path="password"/> --%>
            </p>
          </div>

          <div class="field spaced">
            <div class="control">
              <label class="checkbox">
<!--               	<input type="checkbox" name="remember" value="1" checked> -->
                <span class="check"></span>
                <span class="control-label">記得密碼(施工中)</span>
              </label>
            </div>
          </div>

          <hr>
          <div class="field grouped">
            <div class="control">
              <input name="submit" type="submit" value="登入" class="button blue"/>
            </div>
            <div class="control">
              <a href="${contextRoot}/backstage" class="button">
                返回
              </a>
            </div>
            <!-- 一鍵輸入 -->
            <div class="control">
             <button id="first" name="first" type="button" class="button green">員工一</button>
          </div>
          </div>

        </form>
      </div>
    </div>

  </section>


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