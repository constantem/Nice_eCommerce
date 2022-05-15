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

					<link rel="icon" type="image/png" sizes="32x32"
						href="${contextRoot}/resources/backstage/favicon-32x32.png" />
					<link rel="icon" type="image/png" sizes="16x16"
						href="${contextRoot}/resources/backstage/favicon-16x16.png" />

				</head>
				<style>
					@media (min-width:768px) {

						.md\:grid-cols-1-2 {
							grid-template-columns: minmax(0, 1fr) minmax(0, 2fr)
						}
						.md\:grid-cols-2-1 {
							grid-template-columns: 100px minmax(0, 2fr) minmax(0, 1fr) 100px
						}

						.md\:grid-cols-from-2 {
							grid-column-start: 2;
							grid-column-end: 3;
						}

					}

					#showTitle {
						margin: auto;
					}

					/* #wrap {
						display: table;
						width: 600px;
						margin: auto;
					} */

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
							
							</div>
						</section>

						<!-- 標題 -->
						<section class="is-hero-bar">
							<div class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
								<h1 id="showTitle" class="title">
									新增你的活動
								</h1>
							</div>
						</section>

						<section class="section main-section">
							
							<form:form 
							method="POST" 
							action="${contextRoot}/announcement/add"
							modelAttribute="announcement"
							enctype="multipart/form-data">

							<div class="grid grid-cols-1 gap-6 md:grid-cols-2-1 mb-6">
								<!-- 左資訊磚:  -->
								<div class="card md:grid-cols-from-2">
							
									<div class="card-content">
										<div class="field">

											<div class="control">
												<div class="select">
													<table>

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
																		<form:textarea rows="10" cols="40"
																			path="description" />
																	</td>
																</tr>
																<tr>
																	<th>對應優惠券</th>
																	<td data-label="discount_id">
																		<form:select path="discountId">
																			<c:forEach items="${discounts}" var="discount">
																				<form:option value="${discount.id}">
																					${discount.name}</form:option>
																			</c:forEach>
																		</form:select>
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
												<button id="btnNewInOneClick" type="button"
													class="button blue">一鍵生成</button>
												<button id="btnClear" type="button" class="button red">清除</button>
											</div>
										</tr>
										

									</div>
								</div>

								<!-- 右資訊磚: 放照片 -->
								<div class="card">
									<div class="card-content">
										<div class="image">
											<img id="imgDisplay" src="" alt="">
										</div>
										<div class="field">
											<div class="field-body">
												<div class="field file grouped">
													<label class="control upload">
														<a class="button blue">上傳</a>
														<input id="fileInput" type="file" name="file">
													</label>
												</div>

											</div>
										</div>
									</div>

								</div>
							</div>
							</form:form>
							<jsp:directive.include file="/WEB-INF/pages/layout/backstage/footer.jsp" />




							<!-- Scripts below are for demo only -->
							<script type="text/javascript"
								src="${contextRoot}/resources/backstage/js/main.min.js?v=1628755089081"></script>

							<script src="${contextRoot}/resources/js/jquery-3.6.0.js"></script>

							<!-- =====================一鑑生成欄位內容(開始)==================== -->
							<script>
								$("#btnNewInOneClick").click(function () {
									$("#title").val("光棍節單身萬歲");
									$("#description").val("【Nice運動網脫單計畫 雙11不怕閃!】<br>雙11即將來到，單身的朋友們不想再被閃了嗎？<br>Nice運動網特別規劃一系列脫單運動計畫，與其孤單一個人做運動，不如找個夥伴一同去運動吧！");
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

							<script>
								// 上傳照片的change事件處理
								$("#fileInput").change(function () {
									let file = $(this)[0].files[0];
									$("#imgDisplay")[0].src = (window.URL ? URL : webkitURL).createObjectURL( file );
								});
							</script>
							<!-- Icons below are for demo only. Feel free to use any icon pack. Docs: https://bulma.io/documentation/elements/icon/ -->
							<link rel="stylesheet"
								href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">



				</body>

				</html>