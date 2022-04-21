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
  <title>我頁標題(未更改)</title>

<!--   Tailwind is included -->
  <link rel="stylesheet" href="${contextRoot}/resources/backstage/css/main.css?v=1628755089081">
  <link rel="stylesheet" href="${contextRoot}/resources/backstage/css/main.css">
  <link rel="apple-touch-icon" sizes="180x180" href="${contextRoot}/resources/backstage/apple-touch-icon.png" />
  <link rel="icon" type="image/png" sizes="32x32" href="${contextRoot}/resources/backstage/favicon-32x32.png" />
  <link rel="icon" type="image/png" sizes="16x16" href="${contextRoot}/resources/backstage/favicon-16x16.png" />
  <link rel="mask-icon" href="${contextRoot}/resources/backstage/safari-pinned-tab.svg" color="#00b4b6" />

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

  Global site tag (gtag.js) - Google Analytics
  <script async src="https://www.googletagmanager.com/gtag/js?id=UA-130795909-1"></script>
  <script>
    window.dataLayer = window.dataLayer || [];
    function gtag() { dataLayer.push(arguments); }
    gtag('js', new Date());
    gtag('config', 'UA-130795909-1');
</script> 

</head>

<body>



	<div id="app">

<!-- 	插入上導覽列與左導覽列 -->
	<jsp:directive.include file="/WEB-INF/pages/layout/nav-and-aside.jsp" />
	
<!-- 	章節層級 -->
    <section class="is-title-bar">
      <div class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
        <ul>
          <li>Admin</li>
          <li>Profile</li>
        </ul>
        <a href="https://justboil.me/" onclick="alert('Coming soon'); return false" target="_blank" class="button blue">
          <span class="icon"><i class="mdi mdi-credit-card-outline"></i></span>
          <span>Premium Demo</span>
        </a>
      </div>
    </section>

<!-- 	核心內容標題 -->
    <section class="is-hero-bar">
      <div class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
        <h1 class="title">
          Profile
        </h1>
        <button class="button light">Button</button>
      </div>
    </section>

<!-- 	原核心內容的 section 開始 -->
	
	<h1>會員列表</h1>
			<table>
				<tr style="background-color: #FFFFCE">
					<th>會員編號
					<th>帳號
					<th>密碼
					<th>姓
					<th>名
					<th>生日
					<th>性別
					<th>電話
					<th>信箱
					<th>住址
					<th>建立時間
					<th>修改時間
				</tr>
				<c:forEach items="${page.content}" var="member">
					<tr>
						<td>${member.memberid}</td>
						<td>${member.username}</td>
						<td>${member.password}</td>
						<td>${member.lastname}${member.firstname}</td>
						<td>${member.birthdate}</td>
						<td>${member.gender}</td>
						<td>${member.phone}</td>
						<td>${member.email}</td>
						<td>${member.address}</td>
						<td>
							<a href="${contextRoot}/member/edit?id=${member.memberid}">
								<button class="button small green " type="button">
								  <span class="icon"><i class="mdi mdi-eye"></i></span>
                				</button>
                			</a>	
             			</td>
						<td>
							<a href="${contextRoot}/member/delete?id=${member.memberid}">
								<button class="button small red" type="button">
									<span class="icon"><i class="mdi mdi-trash-can"></i></span>
								</button>
							</a>
						</td>
						
					</tr>
				</c:forEach>
			</table>
	
<!-- 	原核心內容的 section 結束 -->

<!-- 	插入頁腳 -->
	<jsp:directive.include file="/WEB-INF/pages/layout/footer.jsp" />

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

<!--   Scripts below are for demo only -->
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

  Icons below are for demo only. Feel free to use any icon pack. Docs: https://bulma.io/documentation/elements/icon/
  <link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">

</body>

</html>