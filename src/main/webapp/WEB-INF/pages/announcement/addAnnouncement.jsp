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
					<title>新增活動</title>

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

					#wrap {
						display: table;
						width: 600px;
						margin: auto;
					}

					#content {
						display: table-cell;
						width: 40%;
					}

					#sidebar {
						width: 30%;
						display: table-cell;
					}

					.inner {
						align-items: center;
					}

					button {
						float: left;
					}

					/* .inputCol{
	color:blue;
} */
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
									<li>新增優惠券</li>
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
									新增你的活動
								</h1>
								<button class="button light">Button</button>
							</div>
						</section>

						<section class="section main-section">
							<!--     <div id="wrap"> -->
							<!-- 	    <div id="sidebar" style="height:500px;">323232323</div> -->
							<div id="wrap">

								<div class="card-content">
									<div class="field">

										<div class="control">
											<div class="select">
												<table>
													<form:form method="GET" action="${contextRoot}/announcement/add"
														modelAttribute="announcement">
														<%-- <form:input type="hidden" path="id"
															value="${announcement.id}" /> --%>
														<thead>
															<tr>
																<th>活動名稱</th>
																<td class="inputCol" data-label="title">
																	<form:input path="title" id="title" />
																</td>
															</tr>
															<tr>
																<th>活動內容</th>
																<td data-label="description">
																	<form:textarea rows="10" cols="40" path="description" />
																</td>
															</tr>
															
															<!-- <tr>
																<th>對應的優惠券</th>
																<td data-label="discount.name">
																	<form:input path="discount.name" id="discount.name" />
																</td>
															</tr> -->
															<!-- <tr>
																<th>建立日期</th>
																<td data-label="createdAt">
																	<form:input type="date" path="createdAt"
																		id="createdAt" />
																</td>
															</tr>
															<tr>
																<th>修改日期</th>
																<td data-label="modifiedAt">
																	<form:input type="date" path="modifiedAt"
																		id="modifiedAt" />
																</td>
															</tr> -->
														</thead>
												</table>
											</div>
										</div>
									</div>
									<tr>
										<!-- <td data-label="add">  -->
										<!-- <form:button>新增</form:button>  -->
										<!-- </td> -->
										<div>
											<button id="btnInsert" type="submit" class="button green">新增</button>
											<button id="btnNewInOneClick" type="button"	class="button blue">一鍵生成</button>
											<button id="btnClear" type="button" class="button red">清除</button>
										</div>
									</tr>
									</form:form>

								</div>
							</div>

							<jsp:directive.include file="/WEB-INF/pages/layout/backstage/footer.jsp" />




							<!-- Scripts below are for demo only -->
							<script type="text/javascript"
								src="${contextRoot}/resources/backstage/js/main.min.js?v=1628755089081"></script>

							<script src="${contextRoot}/resources/js/jquery-3.6.0.js"></script>

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

							<!-- =====================一鑑生成欄位內容(開始)==================== -->
							<script>
								$("#btnNewInOneClick").click(function () {
									$("#title").val("光棍節單身萬歲");
									$("#description").val("臣亮言：先帝創業未半，而中道崩殂。今天下三分，益州疲敝，此誠危急存亡之秋也！然侍衞之臣，不懈於內；忠志之士，忘身於外者，蓋追先帝之殊遇，欲報之於陛下也。誠宜開張聖聽，以光先帝遺德，恢弘志士之氣；不宜妄自菲薄，引喻失義，以塞忠諫之路也。");
									// $("#conditionCategory").val("有門檻");
									// $("#conditionPrice").val("2000");
									// $("#discountCategory").val("定額折扣");
									// $("#discountPercent").val("");
									// $("#discountAmount").val("150");
									// $("#startDate").val("2022-11-01");
									// $("#endDate").val("2022-11-11");

								});
							</script>
							<!-- =====================一鑑生成欄位內容(結束)==================== -->

							<!-- =====================清除輸入欄位內容(開始)==================== -->
							<script>
								$("#btnClear").click(function () {
									$("#title").val("");
									$("#description").val("");
									// $("#conditionCategory").val("");
									// $("#conditionPrice").val("");
									// $("#discountCategory").val("");
									// $("#discountPercent").val("");
									// $("#discountAmount").val("");
									// $("#startDate").val("");
									// $("#endDate").val("");

								});
							</script>
							<!-- =====================清除輸入欄位內容(結束)==================== -->


							<noscript>
								<img height="1" width="1" style="display: none"
									src="https://www.facebook.com/tr?id=658339141622648&ev=PageView&noscript=1" />
							</noscript>

							<!-- Icons below are for demo only. Feel free to use any icon pack. Docs: https://bulma.io/documentation/elements/icon/ -->
							<link rel="stylesheet"
								href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">



				</body>

				</html>