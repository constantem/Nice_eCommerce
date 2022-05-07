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
					<title>優惠活動</title>

					<!-- 原生 icon -->
					<link rel="stylesheet"
						href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">
					<!-- 原生 css -->
					<link rel="stylesheet" href="${contextRoot}/resources/backstage/css/main.css?v=1628755089081">

					<!-- 網站 logo -->
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
									<li>修改活動內容</li>
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
									修改你的活動
								</h1>
								<button class="button light">Button</button>
							</div>
						</section>

						<section class="section main-section"></section>

						<form:form 
						method="POST"
						action="${contextRoot}/announcement/sendEditAnnouncement"
						modelAttribute="announcement"
						enctype="multipart/form-data">
						<form:input type="hidden" path="id" value="${announcement.id}" />
						<div class="grid grid-cols-1 gap-6 md:grid-cols-2-1 mb-6">
							<!-- 左資訊磚 -->
							<div class="card md:grid-cols-from-2">
								<div class="card-content">
									<div class="field">
	
										<div class="control">
											<div class="select">
												<table>
														<thead>
															<tr>
																<th >活動名稱</th>
																<td data-label="title" >
																	<form:input path="title" />
																</td>
															</tr>
															<tr>
																<th>活動內容</th>
																<td data-label="description" >
																	<form:textarea rows="10" cols="40" path="description" />
																</td>
															</tr>
	
															<tr>
																<th>對應優惠券</th>
																	<td data-label="discount_id">
																		<form:select path="discountId">
																			<c:forEach items="${discounts}" var="discount">
																				<form:option value="${discount.id}">${discount.name}</form:option>
																			</c:forEach>
																		</form:select>
																	</td>
															</tr>
	
															<tr>
	
																<td data-label="edit">
																		<button id="btn" type="submit" class="button green">修改</button>
																</td>
															</tr>
														</thead>
													
	
												</table>
	
											</div>
										</div>
									</div>
								</div>
							</div>

							<!-- 右資訊磚: 放照片 -->
							<div class="card">
								<div class="card-content">
									<div class="image">
										<img id="imgDisplay" src="data:image/png;base64, ${announcement.eventPictureBase64}" alt="">
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
						</section>

						<jsp:directive.include file="/WEB-INF/pages/layout/backstage/footer.jsp" />




						<!-- Scripts below are for demo only -->
						<script type="text/javascript"
							src="${contextRoot}/resources/backstage/js/main.min.js?v=1628755089081"></script>


						<script src="${contextRoot}/resources/js/jquery-3.6.0.js"></script>

						<script>
							$("#fileInput").change(function () {
								let file = $(this)[0].files[0];
								$("#imgDisplay")[0].src = (window.URL ? URL : webkitURL).createObjectURL( file );
							});
						</script>




				</body>

				</html>