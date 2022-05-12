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
						width: 400px;
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
									新增優惠券
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
													<form:form method="GET" action="${contextRoot}/discount/add"
														modelAttribute="discount">
														<%-- <form:input type="hidden" path="id"
															value="${discount.id}" /> --%>
														<thead>
															<tr>
																<th>活動名稱</th>
																<td class="inputCol" data-label="name">
																	<form:input path="name" id="eventname" />
																</td>
															</tr>
															<tr>
																<th>優惠內容</th>
																<td data-label="description">
																	<form:input path="description" id="description" />
																</td>
															</tr>
															<tr>
																<th>有無門檻</th>
																<td data-label="conditionCategory">
																	<label for="conditionCategory">請選擇:</label>
																	<select id="conditionCategory"
																		name="conditionCategory">
																		<option>有門檻</option>
																		<option>無門檻</option>
																	</select>

																</td>
															</tr>
															<tr>
																<th>低銷金額</th>
																<td data-label="conditionPrice">
																	<form:input path="conditionPrice"
																		id="conditionPrice" />
																</td>
															</tr>
															<tr>
																<th>比例/定額折扣 </th>
																<td data-label="discountCategory">
																	<label for="discountCategory">請選擇:</label>
																	<select id="discountCategory"
																		name="discountCategory">
																		<option>比例折扣</option>
																		<option>定額折扣</option>
																	</select>
																</td>
															</tr>
															<tr>
																<th>折扣百分比</th>
																<td data-label="discountPercent">
																	<form:input type="number" path="discountPercent"
																		id="discountPercent" />
																</td>
															</tr>
															<tr>
																<th>折扣金額</th>
																<td data-label="discountAmount">
																	<form:input type="number" path="discountAmount"
																		id="discountAmount" />
																</td>
															</tr>

															<tr>
																<th>優惠券發放數量</th>
																<td data-label="initialQuantity">
																	<form:input id="initialQuantity" name="initialQuantity"
																		onchange="updateInitialQuantity()" type="number"
																		path="initialQuantity" />
																</td>
															</tr>
															<tr>
																<th>優惠券當前數量</th>
																<td data-label="currentQuantity">
																	<input type="number" disabled
																		value="${discount.currentQuantity}"
																		id="currentQuantity" path="currentQuantity">
																	<form:input type="hidden"
																		value="${discount.initialQuantity}"
																		id="currentQuantityForm"
																		path="currentQuantity" />
																</td>
															</tr>

															<tr>
																<th>活動開始日</th>
																<td data-label="startDate">
																	<form:input type="date" path="startDate"
																		id="startDate" />
																</td>
															</tr>
															<tr>
																<th>活動結束日</th>
																<td data-label="endDate">
																	<form:input type="date" path="endDate"
																		id="endDate" />
																</td>
															</tr>
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
								function updateInitialQuantity() {
									var initialQuantity = $("#initialQuantity").val()
									console.log(initialQuantity);
									$("#currentQuantity").val(initialQuantity)
									$("#currentQuantityForm").val(initialQuantity)
								}
	
							</script>

							<!-- =====================一鑑生成欄位內容(開始)==================== -->
							<script>
								$("#btnNewInOneClick").click(function () {
									$("#eventname").val("光棍節單身萬歲");
									$("#description").val("購物滿2000折150");
									$("#conditionCategory").val("有門檻");
									$("#conditionPrice").val("2000");
									$("#discountCategory").val("定額折扣");
									$("#discountPercent").val("");
									$("#discountAmount").val("150");
									// $("#initialQuantity").val("20");
									// $("#currentQuantity").val("20");
									$("#startDate").val("2022-11-01");
									$("#endDate").val("2022-11-11");

								});
							</script>
							<!-- =====================一鑑生成欄位內容(結束)==================== -->

							<!-- =====================清除輸入欄位內容(開始)==================== -->
							<script>
								$("#btnClear").click(function () {
									$("#eventname").val("");
									$("#description").val("");
									$("#conditionCategory").val("");
									$("#conditionPrice").val("");
									$("#discountCategory").val("");
									$("#discountPercent").val("");
									$("#discountAmount").val("");
									$("#initialQuantity").val("");
									$("#currentQuantity").val("");
									$("#startDate").val("");
									$("#endDate").val("");

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