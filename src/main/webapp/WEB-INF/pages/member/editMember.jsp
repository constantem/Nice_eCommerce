<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>修改會員	</title>

<!-- Tailwind is included -->
<!-- <link rel="stylesheet" href="${contextRoot}/resources/backstage/css/main.css?v=1628755089081"> -->
<link rel="stylesheet"
	href="${contextRoot}/resources/backstage/css/main.css">
<link rel="apple-touch-icon" sizes="180x180"
	href="${contextRoot}/resources/backstage/apple-touch-icon.png" />
<link rel="icon" type="image/png" sizes="32x32"
	href="${contextRoot}/resources/backstage/favicon-32x32.png" />
<link rel="icon" type="image/png" sizes="16x16"
	href="${contextRoot}/resources/backstage/favicon-16x16.png" />
<link rel="mask-icon"
	href="${contextRoot}/resources/backstage/safari-pinned-tab.svg"
	color="#00b4b6" />

<meta name="description" content="Admin One - free Tailwind dashboard">

<meta property="og:url"
	content="https://justboil.github.io/admin-one-tailwind/">
<meta property="og:site_name" content="JustBoil.me">
<meta property="og:title" content="Admin One HTML">
<meta property="og:description"
	content="Admin One - free Tailwind dashboard">
<meta property="og:image"
	content="https://justboil.me/images/one-tailwind/repository-preview-hi-res.png">
<meta property="og:image:type" content="image/png">
<meta property="og:image:width" content="1920">
<meta property="og:image:height" content="960">

<meta property="twitter:card" content="summary_large_image">
<meta property="twitter:title" content="Admin One HTML">
<meta property="twitter:description"
	content="Admin One - free Tailwind dashboard">
<meta property="twitter:image:src"
	content="https://justboil.me/images/one-tailwind/repository-preview-hi-res.png">
<meta property="twitter:image:width" content="1920">
<meta property="twitter:image:height" content="960">

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-130795909-1"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
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
			<div
				class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
				<ul>
					<li>Admin</li>
					<li>Profile</li>
				</ul>
				<a href="https://justboil.me/"
					onclick="alert('Coming soon'); return false" target="_blank"
					class="button blue"> <span class="icon"><i
						class="mdi mdi-credit-card-outline"></i></span> <span>Premium Demo</span>
				</a>
			</div>
		</section>

		<!-- 核心內容標題 -->
		<section class="is-hero-bar">
			<div
				class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
				<h1 class="title">Profile</h1>
				<button class="button light">Button</button>
			</div>
		</section>

		<!-- 原核心內容的 section 開始 -->
		<section class="section main-section">
		  <div class="card mb-6">
		    <header class="card-header">
		      <p class="card-header-title">
		        <span class="icon"><i class="mdi mdi-ballot"></i></span>
		        Forms
		      </p>
		    </header>
		    <div class="card-content">
		    
		      <form action="${contextRoot}/member/editMember" method="post">
		      
		      	<!-- 欄位1 -->
		       <div class="field">
		         <label class="label">編號</label>
		
		         <div class="control">
		         	${member.memberid}
				<input type="hidden" name="memberid" id="memberid" value="${member.memberid}">
		         </div>
		         <p class="help">
		           
		         </p>
		       </div>
		
		      	<!-- 欄位2 -->
		       <div class="field">
		         <label class="label">帳號</label>
		
		         <div class="control">
		         	${member.username}
				<input type="hidden" name="username" id="username" value="${member.username}">
		         </div>
		         <p class="help">
		           
		         </p>
		       </div>
		       
		      	<!-- 欄位3 -->
		       <div class="field">
		         <label class="label">密碼</label>
		         <div class="control">
		           <input class="input" type="text" name="password" id="password" value="${member.password}">
		         </div>
		         <p class="help">
		           
		         </p>
		       </div>
		       
		      	<!-- 欄位4 -->
		       <div class="field">
		         <label class="label">姓</label>
		
		         <div class="control">
		           <input class="input" type="text" name="lastname" id="lastname" value="${member.lastname}">
		         </div>
		         <p class="help">
		           
		         </p>
		       </div>
		       
		      	<!-- 欄位5 -->
		       <div class="field">
		         <label class="label">名</label>
		
		         <div class="control">
		           <input class="input" type="text" name="firstname" id="firstname" value="${member.firstname}">
		         </div>
		         <p class="help">
		           
		         </p>
		       </div>
		          
		      	<!-- 欄位6 -->
		       <div class="field">
		         <label class="label">生日</label>
		
		         <div class="control">
		           <input class="input" type="text" name="birthdate" id="birthdate" value="${member.birthdate}">
		         </div>
		         <p class="help">
		           
		         </p>
		       </div>
		       
		      	<!-- 欄位7 -->
		       <div class="field">
		         <label class="label">性別</label>
		
		         <div class="control">
		           <input class="input" type="text" name="gender" id="gender" value="${member.gender}">
		         </div>
		         <p class="help">
		           
		         </p>
		       </div>
		       
		      	<!-- 欄位8 -->
		       <div class="field">
		         <label class="label">電話</label>
		
		         <div class="control">
		           <input class="input" type="text" name="phone" id="phone" value="${member.phone}">
		         </div>
		         <p class="help">
		           
		         </p>
		       </div>
		       
		      	<!-- 欄位9 -->
		       <div class="field">
		         <label class="label">email</label>
		
		         <div class="control">
		           <input class="input" type="text" name="email" id="email" value="${member.email}">
		         </div>
		         <p class="help">
		           
		         </p>
		       </div>
		       
		      	<!-- 欄位10 -->
		       <div class="field">
		         <label class="label">住址</label>
		
		         <div class="control">
		           <input class="input" type="text" name="address" id="address" value="${member.address}">
		         </div>
		         <p class="help">
		           
		         </p>
		       </div>
		       
		        <hr>
		
		        <div class="field grouped">
		          <div class="control">
		            <button type="submit" class="button green">
		              確認
		            </button>
		          </div>
		          <div class="control">
		            <button type="reset" class="button red" id="reset">
		              清除
		            </button>
		          </div>
		          <div class="field grouped">
		          <div class="control">
		            <button type="submit" class="button green">
		              返回
		            </button>
		          </div>
		        </div>
		      </form>
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
					<p>
						Lorem ipsum dolor sit amet <b>adipiscing elit</b>
					</p>
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
					<p>
						Lorem ipsum dolor sit amet <b>adipiscing elit</b>
					</p>
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
	<script type="text/javascript"
		src="${contextRoot}/resources/backstage/js/main.min.js?v=1628755089081"></script>

	<script>
		!function(f, b, e, v, n, t, s) {
			if (f.fbq)
				return;
			n = f.fbq = function() {
				n.callMethod ? n.callMethod.apply(n, arguments) : n.queue
						.push(arguments)
			};
			if (!f._fbq)
				f._fbq = n;
			n.push = n;
			n.loaded = !0;
			n.version = '2.0';
			n.queue = [];
			t = b.createElement(e);
			t.async = !0;
			t.src = v;
			s = b.getElementsByTagName(e)[0];
			s.parentNode.insertBefore(t, s)
		}(window, document, 'script',
				'https://connect.facebook.net/en_US/fbevents.js');
		fbq('init', '658339141622648');
		fbq('track', 'PageView');
	</script>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
	
	<!-- 一鍵清除 -->
	<script type="text/javascript">
		$("#reset").click(function(){
			$("#password").attr("value","");
			$("#lastname").attr("value","");
			$("#firstname").attr("value","");
			$("#birthdate").attr("value","");
			$("#gender").attr("value","");
			$("#phone").attr("value","");
			$("#email").attr("value","");
			$("#address").attr("value","");
		});
	</script>
	
	<noscript>
		<img height="1" width="1" style="display: none"
			src="https://www.facebook.com/tr?id=658339141622648&ev=PageView&noscript=1" />
	</noscript>

	<!-- Icons below are for demo only. Feel free to use any icon pack. Docs: https://bulma.io/documentation/elements/icon/ -->
	<link rel="stylesheet"
		href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">

</body>
</html>