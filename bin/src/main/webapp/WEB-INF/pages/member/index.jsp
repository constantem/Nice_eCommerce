<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en" class="">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Profile - Admin One Tailwind CSS Admin Dashboard</title>

<!-- Tailwind is included -->
<!--   <link rel="stylesheet" href="css/main.css?v=1628755089081"> -->

<link rel="apple-touch-icon" sizes="180x180" href="apple-touch-icon.png" />
<link rel="icon" type="image/png" sizes="32x32" href="favicon-32x32.png" />
<link rel="icon" type="image/png" sizes="16x16" href="favicon-16x16.png" />
<link rel="mask-icon" href="safari-pinned-tab.svg" color="#00b4b6" />

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
<link href="${contextRoot}/css/main.css" rel="stylesheet" />
</head>

<body>



	<div id="app">

		<nav id="navbar-main" class="navbar is-fixed-top">
			<div class="navbar-brand">
				<a class="navbar-item mobile-aside-button"> <span class="icon"><i
						class="mdi mdi-forwardburger mdi-24px"></i></span>
				</a>
				<div class="navbar-item">
					<div class="control">
						<input placeholder="Search everywhere..." class="input">
					</div>
				</div>
			</div>
			<div class="navbar-brand is-right">
				<a class="navbar-item --jb-navbar-menu-toggle"
					data-target="navbar-menu"> <span class="icon"><i
						class="mdi mdi-dots-vertical mdi-24px"></i></span>
				</a>
			</div>
			<div class="navbar-menu" id="navbar-menu">
				<div class="navbar-end">
					<div class="navbar-item dropdown has-divider">
						<a class="navbar-link"> <span class="icon"><i
								class="mdi mdi-menu"></i></span> <span>Sample Menu</span> <span
							class="icon"> <i class="mdi mdi-chevron-down"></i>
						</span>
						</a>
						<div class="navbar-dropdown">
							<a href="profile.html" class="navbar-item"> <span
								class="icon"><i class="mdi mdi-account"></i></span> <span>My
									Profile</span>
							</a> <a class="navbar-item"> <span class="icon"><i
									class="mdi mdi-settings"></i></span> <span>Settings</span>
							</a> <a class="navbar-item"> <span class="icon"><i
									class="mdi mdi-email"></i></span> <span>Messages</span>
							</a>
							<hr class="navbar-divider">
							<a class="navbar-item"> <span class="icon"><i
									class="mdi mdi-logout"></i></span> <span>Log Out</span>
							</a>
						</div>
					</div>
					<div class="navbar-item dropdown has-divider has-user-avatar">
						<a class="navbar-link">
							<div class="user-avatar">
								<img src="https://avatars.dicebear.com/v2/initials/john-doe.svg"
									alt="John Doe" class="rounded-full">
							</div>
							<div class="is-user-name">
								<span>John Doe</span>
							</div> <span class="icon"><i class="mdi mdi-chevron-down"></i></span>
						</a>
						<div class="navbar-dropdown">
							<a href="profile.html" class="navbar-item active"> <span
								class="icon"><i class="mdi mdi-account"></i></span> <span>My
									Profile</span>
							</a> <a class="navbar-item"> <span class="icon"><i
									class="mdi mdi-settings"></i></span> <span>Settings</span>
							</a> <a class="navbar-item"> <span class="icon"><i
									class="mdi mdi-email"></i></span> <span>Messages</span>
							</a>
							<hr class="navbar-divider">
							<a class="navbar-item"> <span class="icon"><i
									class="mdi mdi-logout"></i></span> <span>Log Out</span>
							</a>
						</div>
					</div>
					<a href="https://justboil.me/tailwind-admin-templates"
						class="navbar-item has-divider desktop-icon-only"> <span
						class="icon"><i class="mdi mdi-help-circle-outline"></i></span> <span>About</span>
					</a> <a href="https://github.com/justboil/admin-one-tailwind"
						class="navbar-item has-divider desktop-icon-only"> <span
						class="icon"><i class="mdi mdi-github-circle"></i></span> <span>GitHub</span>
					</a> <a title="Log out" class="navbar-item desktop-icon-only"> <span
						class="icon"><i class="mdi mdi-logout"></i></span> <span>Log
							out</span>
					</a>
				</div>
			</div>
		</nav>

		<aside class="aside is-placed-left is-expanded">
			<div class="aside-tools">
				<div>
					Admin <b class="font-black">One</b>
				</div>
			</div>
			<div class="menu is-menu-main">
				<p class="menu-label">General</p>
				<ul class="menu-list">
					<li class="--set-active-index-html"><a href="index.html">
							<span class="icon"><i class="mdi mdi-desktop-mac"></i></span> <span
							class="menu-item-label">Dashboard</span>
					</a></li>
				</ul>
				<p class="menu-label">Examples</p>
				<ul class="menu-list">
					<li class="--set-active-tables-html"><a href="tables.html">
							<span class="icon"><i class="mdi mdi-table"></i></span> <span
							class="menu-item-label">Tables</span>
					</a></li>
					<li class="--set-active-forms-html"><a href="forms.html">
							<span class="icon"><i class="mdi mdi-square-edit-outline"></i></span>
							<span class="menu-item-label">Forms</span>
					</a></li>
					<li class="active"><a href="member.jsp"> <span
							class="icon"><i class="mdi mdi-account-circle"></i></span> <span
							class="menu-item-label">會員</span>
					</a></li>
					<li><a href="login.html"> <span class="icon"><i
								class="mdi mdi-lock"></i></span> <span class="menu-item-label">Login</span>
					</a></li>
					<li><a class="dropdown"> <span class="icon"><i
								class="mdi mdi-view-list"></i></span> <span class="menu-item-label">Submenus</span>
							<span class="icon"><i class="mdi mdi-plus"></i></span>
					</a>
						<ul>
							<li><a href="#void"> <span>Sub-item One</span>
							</a></li>
							<li><a href="#void"> <span>Sub-item Two</span>
							</a></li>
						</ul></li>
				</ul>
				<p class="menu-label">About</p>
				<ul class="menu-list">
					<li><a href="https://justboil.me"
						onclick="alert('Coming soon'); return false" target="_blank"
						class="has-icon"> <span class="icon"><i
								class="mdi mdi-credit-card-outline"></i></span> <span
							class="menu-item-label">Premium Demo</span>
					</a></li>
					<li><a href="https://justboil.me/tailwind-admin-templates"
						class="has-icon"> <span class="icon"><i
								class="mdi mdi-help-circle"></i></span> <span class="menu-item-label">About</span>
					</a></li>
					<li><a href="https://github.com/justboil/admin-one-tailwind"
						class="has-icon"> <span class="icon"><i
								class="mdi mdi-github-circle"></i></span> <span class="menu-item-label">GitHub</span>
					</a></li>
				</ul>
			</div>
		</aside>

		<div align="center">
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
				<tr style="background-color: #EBD3E8">
					<td>${username}
					<td>${password}
			</table>
		</div>
		</section>

		<!-- Icons below are for demo only. Feel free to use any icon pack. Docs: https://bulma.io/documentation/elements/icon/ -->
		<link rel="stylesheet"
			href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">
</body>
</html>
