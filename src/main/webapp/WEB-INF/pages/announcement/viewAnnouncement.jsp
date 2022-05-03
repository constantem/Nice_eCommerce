<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
			<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
				<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
				<!DOCTYPE html>
				<html lang="en" class="">

				<head>
					<meta charset="utf-8">
					<meta http-equiv="X-UA-Compatible" content="IE=edge">
					<meta name="viewport" content="width=device-width, initial-scale=1">
					<title>折價券</title>

					<!-- Tailwind is included -->
					<!-- <link rel="stylesheet" href="${contextRoot}/resources/backstage/css/main.css?v=1628755089081"> -->
					<link rel="stylesheet" href="${contextRoot}/resources/backstage/css/main.css">
					<link rel="apple-touch-icon" sizes="180x180"
						href="${contextRoot}/resources/backstage/apple-touch-icon.png" />
					<link rel="icon" type="image/png" sizes="32x32"
						href="${contextRoot}/resources/backstage/favicon-32x32.png" />
					<link rel="icon" type="image/png" sizes="16x16"
						href="${contextRoot}/resources/backstage/favicon-16x16.png" />
					<link rel="mask-icon" href="${contextRoot}/resources/backstage/safari-pinned-tab.svg"
						color="#00b4b6" />

					<meta name="description" content="Admin One - free Tailwind dashboard">

					<meta property="og:url" content="https://justboil.github.io/admin-one-tailwind/">
					<meta property="og:site_name" content="JustBoil.me">
					<meta property="og:title" content="Admin One HTML">
					<meta property="og:description" content="Admin One - free Tailwind dashboard">
					<meta property="og:image"
						content="https://justboil.me/images/one-tailwind/repository-preview-hi-res.png">
					<meta property="og:image:type" content="image/png">
					<meta property="og:image:width" content="1920">
					<meta property="og:image:height" content="960">

					<meta property="twitter:card" content="summary_large_image">
					<meta property="twitter:title" content="Admin One HTML">
					<meta property="twitter:description" content="Admin One - free Tailwind dashboard">
					<meta property="twitter:image:src"
						content="https://justboil.me/images/one-tailwind/repository-preview-hi-res.png">
					<meta property="twitter:image:width" content="1920">
					<meta property="twitter:image:height" content="960">

					<!-- Global site tag (gtag.js) - Google Analytics -->
					<script async src="https://www.googletagmanager.com/gtag/js?id=UA-130795909-1"></script>
					<script>
						window.dataLayer = window.dataLayer || [];
						function gtag() {
							dataLayer.push(arguments);
						}
						gtag('js', new Date());
						gtag('config', 'UA-130795909-1');
					</script>
				</head>
				<style>
					#showTitle {
						margin: auto;
					}
				</style>

				<body>

					<div id="app">

						<!-- 插入上導覽列與左導覽列 -->
						<jsp:directive.include file="/WEB-INF/pages/layout/backstage/nav-and-aside.jsp" />

						<!-- 章節 -->
						<section class="is-title-bar">
							<div class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
								<ul>
									<li>後台</li>
									<li>優惠券列表</li>
								</ul>
								<a href="https://justboil.me/" onclick="alert('Coming soon'); return false"
									target="_blank" class="button blue">
									<span class="icon"><i class="mdi mdi-credit-card-outline"></i></span>
									<span>Premium Demo</span>
								</a>
							</div>
						</section>

						<!-- 標題 -->
						<section class="is-hero-bar">
							<div class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
								<h1 id="showTitle" class="title">
									優惠券列表
								</h1>
								<button class="button light">Button</button>
							</div>
						</section>

						<!-- 原核心內容的 section 開始 -->
						<section class="section main-section">

							<div class="card has-table">
								<header class="card-header">
									<p class="card-header-title">
										<span class="icon"><i class="mdi mdi-account-multiple"></i></span>
										優惠券
									</p>
									<a href="#" class="card-header-icon">
										<span class="icon"><i class="mdi mdi-reload"></i></span>
									</a>
								</header>
								<div class="card-content">
						</section>
						<table>







							<!-- 列表表頭 -->
							<thead>
								<tr>
									<th class="checkbox-cell">
										<label class="checkbox">
											<input type="checkbox">
											<span class="check"></span>
										</label>
									</th>
									<th>編號</th>
									<th>活動名稱</th>
									<th>優惠內容</th>
									<th>有無門檻</th>
									<th>低銷金額</th>
									<th>比例/定額折扣</th>
									<th>折扣百分比</th>
									<th>折扣金額</th>
									<th>活動開始日</th>
									<th>活動結束日</th>
									<th>建立日期</th>
									<th>修改/刪除</th>
								</tr>
							</thead>

							<!-- 列表內文 -->
							<tbody>

								<c:forEach var="discount" items="${discounts}">
									<tr>
										<td class="checkbox-cell">
											<label class="checkbox">
												<input type="checkbox">
												<span class="check"></span>
											</label>
										</td>
										<td data-label="id">${discount.id}</td>
										<td data-label="name">${discount.name}</td>
										<td data-label="description">${discount.description}</td>
										<td data-label="conditionCategory">${discount.conditionCategory}</td>
										<td data-label="conditionPrice">${discount.conditionPrice}</td>
										<td data-label="discountCategory">${discount.discountCategory}</td>
										<td data-label="discountPercent">${discount.discountPercent}</td>
										<td data-label="discountAmount">${discount.discountAmount}</td>
										<td data-label="startDate">${discount.startDate}</td>
										<td data-label="endDate">${discount.endDate}</td>
										<td data-label="Created">
											<small class="text-gray-500" title="Oct 25, 2021">Oct 25, 2021</small>
										</td>
										<td class="actions-cell">
											<div class="buttons right nowrap">
												<a href="${contextRoot}/discount/showEditDiscount?id=${discount.id}">
													<button class="button small green --jb-modal"
														data-target="sample-modal-2" type="button">
														<span class="icon"><i class="mdi mdi-pencil"></i></span>
													</button>
												</a>
												<a onclick="return confirm('確定要刪掉人家嗎>w<')"
													href="${contextRoot}/discount/deleteDiscount?id=${discount.id}">
													<button class="button small red --jb-modal"
														data-target="sample-modal" type="button">
														<span class="icon"><i class="mdi mdi-trash-can"></i></span>
													</button>
												</a>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div id="page" align="center">
							<div class="table-pagination">
								<div class="flex items-center ">
									<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
										<c:choose>
											<c:when test="${page.number != pageNumber-1}">
												<div class="buttons">
													<a href="${contextRoot}/discount/viewDiscount?p=${pageNumber}">
														<button type="button"
															class="button active">${pageNumber}</button></a>
												</div>
											</c:when>
											<c:otherwise>
												<c:out value="${pageNumber}"></c:out>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
					</div>



					<!-- 原核心內容的 section 結束 -->

					<!-- 插入頁腳 -->
					<jsp:directive.include file="/WEB-INF/pages/layout/backstage/footer.jsp" />




					<!-- Scripts below are for demo only -->
					<script type="text/javascript"
						src="${contextRoot}/resources/backstage/js/main.min.js?v=1628755089081"></script>

					<script>
						!function (f, b, e, v, n, t, s) {
							if (f.fbq)
								return;
							n = f.fbq = function () {
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
					<noscript>
						<img height="1" width="1" style="display: none"
							src="https://www.facebook.com/tr?id=658339141622648&ev=PageView&noscript=1" />
					</noscript>

					<!-- Icons below are for demo only. Feel free to use any icon pack. Docs: https://bulma.io/documentation/elements/icon/ -->
					<link rel="stylesheet"
						href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">



				</body>

				</html>