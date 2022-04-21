<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" class="form-screen">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Login - Admin One Tailwind CSS Admin Dashboard</title>

<!-- Icons below are for demo only. Feel free to use any icon pack. Docs: https://bulma.io/documentation/elements/icon/ -->
<link rel="stylesheet"
	href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">

  <!-- Tailwind is included -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/backstage/css/main.css?v=1628755089081">

  <link rel="apple-touch-icon" sizes="180x180" href="apple-touch-icon.png"/>
  <link rel="icon" type="image/png" sizes="32x32" href="favicon-32x32.png"/>
  <link rel="icon" type="image/png" sizes="16x16" href="favicon-16x16.png"/>
  <link rel="mask-icon" href="safari-pinned-tab.svg" color="#00b4b6"/>

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

  <section class="section main-section">
    <div class="card">
      <header class="card-header">
        <p class="card-header-title">
          <span class="icon"><i class="mdi mdi-lock"></i></span>
          會員登入<span style="color:red;">${error.notexist}</span>
        </p>
      </header>
      <div class="card-content">
        <form:form action="${pageContext.request.contextPath}/login/member/check" modelAttribute="member">

          <div class="field spaced">
            <form:label path="username" class="label">帳號</form:label>
            <div class="control icons-left">
              <form:input path="username" id="username" class="input" type="text" name="login" placeholder="" autocomplete="username"/>
              <span class="icon is-small left"><i class="mdi mdi-account"></i></span>
            </div>
            <p class="help" style="color:red">
              <form:errors path="username"/>
            </p>
          </div>

          <div class="field spaced">
            <form:label path="password" class="label">密碼</form:label>
            <p class="control icons-left">
              <form:input id="password" path="password" class="input" type="password" name="password" placeholder="" autocomplete="current-password"/>
              <span class="icon is-small left"><i class="mdi mdi-asterisk"></i></span>
            </p>
            <p class="help" style="color:red">
              <form:errors path="password"/>
            </p>
          </div>

          <div class="field spaced">
            <div class="control">
              <label class="checkbox"><input type="checkbox" name="remember" value="1" checked>
                <span class="check"></span>
                <span class="control-label">記得密碼(施工中)</span>
              </label>
            </div>
          </div>

          <hr>

          <div class="field grouped">
            <div class="control">
              <button type="submit" class="button blue">
                登入
              </button>
            </div>
            <div class="control">
              <a href="${pageContext.request.contextPath}/" class="button">
                返回
              </a>
            </div>
          </div>

        </form:form>
      </div>
    </div>

  </section>


</div>

<!-- Scripts below are for demo only -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/backstage/js/main.min.js?v=1628755089081"></script>


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