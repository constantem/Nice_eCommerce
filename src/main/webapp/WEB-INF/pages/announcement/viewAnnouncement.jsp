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

					<link rel="icon" type="image/png" sizes="32x32"
						href="${contextRoot}/resources/backstage/favicon-32x32.png" />
					<link rel="icon" type="image/png" sizes="16x16"
						href="${contextRoot}/resources/backstage/favicon-16x16.png" />

					<style>
						#showTitle {
							margin: auto;
						}
					</style>

				</head>

				<body>

					<div id="app">

						<!-- 插入上導覽列與左導覽列 -->
						<jsp:directive.include file="/WEB-INF/pages/layout/backstage/nav-and-aside.jsp" />

						<!-- 章節 -->
						<section class="is-title-bar">
							<div class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
								<ul>
									<li>後台</li>
									<li>活動列表</li>
								</ul>
						
							</div>
						</section>

						<!-- 標題 -->
						<section class="is-hero-bar">
							<div class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
								<h1 id="showTitle" class="title">
									活動列表
								</h1>
							
							</div>
						</section>

						<!-- 原核心內容的 section 開始 -->
						<section class="section main-section">

							<div class="card has-table">
								<header class="card-header">
									<p class="card-header-title">
										<span class="icon"><i class="mdi mdi-account-multiple"></i></span>
										活動一覽
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
									<th>活動描述</th>
									<th>對應的優惠券</th>
									<th>上傳的圖片</th>
									<th>建立日期</th>
									<th>修改日期</th>
									<th>修改/刪除</th>
								</tr>
							</thead>

							<!-- 列表內文 -->
							<tbody>

								<c:forEach var="announcement" items="${page.content}">
									<tr>
										<td class="checkbox-cell">
											<label class="checkbox">
												<input type="checkbox">
												<span class="check"></span>
											</label>
										</td>
										<td data-label="id">${announcement.id}</td>
										<td data-label="title">${announcement.title}</td>
										<td data-label="description">${announcement.description}</td>
										<td data-label="discount_id">${announcement.discount.name}</td>
										<td data-label="eventPictureBase64">
											<img src="data:image/png;base64, ${announcement.eventPictureBase64}">
										</td>
										<td data-label="createdAt">
											<small class="text-gray-500" title="Oct 25, 2021">May 17, 2022</small>
										</td>
										<td data-label="modifiedAt">
											<small class="text-gray-500" title="Oct 25, 2021">May 17, 2022</small>
										</td>
										<td class="actions-cell">
											<div class="buttons right nowrap">
												<a href="${contextRoot}/announcement/showEditAnnouncement?id=${announcement.id}">
													<button class="button small green --jb-modal"
														data-target="sample-modal-2" type="button">
														<span class="icon"><i class="mdi mdi-pencil"></i></span>
													</button>
												</a>
												<a onclick="return confirm('確定刪除嗎')"
													href="${contextRoot}/announcement/deleteAnnouncement?id=${announcement.id}">
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
													<a href="${contextRoot}/staff/announcement/viewAnnouncement?p=${pageNumber}">
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

					<!-- Icons below are for demo only. Feel free to use any icon pack. Docs: https://bulma.io/documentation/elements/icon/ -->
					<link rel="stylesheet"
						href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">



				</body>

				</html>