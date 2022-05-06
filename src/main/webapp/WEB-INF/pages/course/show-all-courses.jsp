<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>首頁</title>

<!-- 使用原生 https://materialdesignicons.com/ 的 icon-->
<link rel="stylesheet"
	href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">

<!-- 使用原生 Tailwind css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/backstage/css/main.css">

<style>
	.left{
		justify-content:flex-start;
	}
</style>

<!-- 網站頁籤 logo -->
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/resources/backstage/favicon-32x32.png" />
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/backstage/favicon-16x16.png" />

<!--jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous">
</script>
	
<!-- sweat alert 2 CDN -->	
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
	$(document).ready(function() {
		
		// 客製化彈窗擋住 global Modal open 
		
		/* local Modal open */
		$(".--jb-modal-delete").click(function (evt) {
			const deleteBtn = evt.currentTarget;
			
			// 取得按鈕上所標記要對應的彈窗div
			const modalId = $(deleteBtn).data("target");
			document.getElementById(modalId).classList.add('active'); // 彈窗彈出來 
			document.documentElement.classList.add('clipped'); // 整個 html 標籤被 clipped
			
			// 取得按鈕上所標記的 course 的 id
			const courseId = $(deleteBtn).data("id");
			$("#deleteConfirmBtn").click(function () {
				$.ajax({
					url: $("#contextRoot").val()+"/course/delete/"+courseId,
					success: function () {
						window.location.href = $("#contextRoot").val()+"/course/show/all";
					}
				});
			});
			
		});
		
		// 全部勾選按鈕
		$("#deleteAll").change(function () {
			if( $("#deleteAll").is(":checked") ) {
				$("input[type=checkbox]").not("#deleteAll").prop("checked",true);
			} else {
				$("input[type=checkbox]").not("#deleteAll").prop("checked",false);
			}
		});
		
		// 批量刪除
		
		/* local Modal open */
		$(".--jb-modal-deleteAll").click(function (evt) {
			
			// 沒勾選就不做事
			if(!$("input[type=checkbox]").is(":checked")) {
				return false;
			}
			
			const deleteAllBtn = evt.currentTarget;
			
			// 取得按鈕上所標記要對應的彈窗div
			const modalId = $(deleteAllBtn).data("target");
			document.getElementById(modalId).classList.add('active'); // 彈窗彈出來 
			document.documentElement.classList.add('clipped'); // 整個 html 標籤被 clipped
			
			// 確認刪除的話
			$("#deleteAllConfirmBtn").click(function () {
				
				const allCheckBox = $("input[type=checkbox]");
				const checkBoxDeleteAll = $("#deleteAll");
				const checkBoxWithId = $("input[type=checkbox]").not("#deleteAll");
				
				let equivalentCheckBox;
				if($(checkBoxDeleteAll).is(":checked")) { // 若全部都勾選
					equivalentCheckBox = $(checkBoxWithId);
				} else { // 若部分勾選
					equivalentCheckBox = $(checkBoxWithId).filter(':checked');
				}
						
				// 批量刪除
				$(equivalentCheckBox).each(function (index, checkInput) {
					const thisCourseId = $(checkInput).data("id");
					$.ajax({
						url: $("#contextRoot").val()+"/course/delete/"+thisCourseId+"/ajax"
					});
				})
				
				Swal.fire({
					title: '共刪除'+$(equivalentCheckBox).length + "筆",
					showConfirmButton: true, // 不寫也預設 true
					confirmButtonText: 'OK',
				}).then(function () {
					window.location.href= $("#contextRoot").val() + "/course/show/all" + "?pageNumber=" + "${thisPageNumberZeroBased+1}";
				});
	
			}); // 確認刪除情境結束
			
		}); // 批量刪除情境結束
		
	
	}); // document ready 結束 
</script>
</head>
<body>
	
<input type="hidden" id="contextRoot" value="${contextRoot}">

<div id="app">

<!-- 插入上導覽列與左導覽列 -->
<jsp:directive.include file="/WEB-INF/pages/layout/backstage/nav-and-aside.jsp" />
	
<section class="is-title-bar">
	<div
		class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
		<ul>
			<li>運動網</li>
			<li>課程管理系統</li>
			<li>課程列表</li>
		</ul>
		<a href="#" class="button blue"> <span class="icon"><i
				class="mdi mdi-credit-card-outline"></i></span> <span>施工中</span>
		</a>
	</div>
</section>

<section class="is-hero-bar">
	<div
		class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
		<h1 class="title">課程列表</h1>
		<a class="button light" href="${contextRoot}/course/form">
            		<span>新增課程</span>
          	</a>
	</div>
</section>

<section class="section main-section">

	<div class="card has-table">
		<header class="card-header">
			<p class="card-header-title">
				<span class="icon"><i class="mdi mdi-account-multiple"></i></span>
				課程
			</p>
			<a href="#" class="card-header-icon"> <span class="icon"><i
					class="mdi mdi-reload"></i></span>
			</a>
		</header>
		<header class="card-header">
			<p class="card-header-title">
				<label class="checkbox" style="margin-right:10px;">
					<input id="deleteAll" type="checkbox"> 
					<span class="check" style="margin-right:10px;"></span>
					全選
				</label>
				<button type="button" class="button small red --jb-modal-deleteAll" 
					data-target="deleteAllConfirm-modal"
					style="margin-right:10px;">
					<span class="icon"><i class="mdi mdi-trash-can"></i></span>
				</button>
			</p>
		</header>
		<div class="card-content">
			<table>

				<thead>
					<tr>
						<th class="checkbox-cell">
						</th>
						<th class="image-cell"></th>
						<th>課名</th>
						<th>開課日期</th>
						<th>堂數</th>
						<th>時段</th>
						<th>教練</th>
						<th>教室</th>
						<th>價錢</th>
						<th>建檔/編輯日期</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
<%-- 					<c:set var="courses" value="${coursesForOnePage.content}" /> --%>
<%-- 					<c:set var="thisPageNumberZeroBased" value="${coursesForOnePage.number}" /> --%>
<%-- 					<c:set var="totalPages" value="${coursesForOnePage.totalPages}" /> --%>
					<c:forEach items="${courses}" var="course">
						<tr>
							<td class="checkbox-cell">
								<label class="checkbox">
									<input type="checkbox" data-id="${course.id}"> 
									<span class="check"></span>
								</label>
							</td>
							<td class="image-cell">
								<div class="image">
									<c:if test="${course.pictureBase64==null}">
										<img class="rounded-full"
											src="">
									</c:if>
									<c:if test="${course.pictureBase64!=null}">
										<img class="rounded-full"
											src="data:image/jpeg;base64, ${course.pictureBase64}">
									</c:if>

								</div>
							</td>
							<td data-label="courseName">${course.courseName}</td>
							<td data-label="courseStartDate">${course.courseStartDate}</td>
							<td data-label="courseClassAmount">${course.courseClassAmount}</td>
							<td data-label="coursePeriod">${course.coursePeriod}</td>
							<td data-label="coachName">${course.coach.lastName}${course.coach.firstName}</td>
							<td data-label="roomNo">${course.room.roomNo}</td>
							<td data-label="coursePrice">${course.coursePrice}</td>
							<td data-label="Created">
								<small class="text-gray-500" title="Oct 25, 2021">
									<c:choose>
										<c:when test="${course.modifiedAt!=null}">
											<fmt:parseDate value="${course.modifiedAt}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedModifiedAt"/>
											<fmt:formatDate value="${parsedModifiedAt}" var="formattedModifiedAt" pattern="yyyy/MM/dd HH:mm:ss"/>
											${formattedModifiedAt}編輯
										</c:when>
										<c:otherwise>
											<fmt:parseDate value="${course.createdAt}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedCreatedAt"/>
											<fmt:formatDate value="${parsedCreatedAt}" pattern="yyyy/MM/dd HH:mm:ss" var="formattedCreatedAt" />
											${formattedCreatedAt}建檔
										</c:otherwise>
									</c:choose>

								</small>
							</td>
							<td class="actions-cell">
								<div class="buttons right nowrap">
									<a href="${pageContext.request.contextPath}/course/show/${course.id}">
										<button class="button small green"
											data-target="sample-modal-2" type="button">
											<span class="icon"><i class="mdi mdi-pencil"></i></span>
										</button>
									</a> 
									<!-- 有 jb-modal-forDeleteConfirm, 觸發客製彈窗 -->
									<button type="button" class="button small red --jb-modal-delete" 
										data-target="deleteConfirm-modal"
										data-id="${course.id}">
										<span class="icon"><i class="mdi mdi-trash-can"></i></span>
									</button>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<!-- 頁碼 -->
			<div class="table-pagination">
				<div class="flex items-center justify-between">
					<div class="buttons">
						<c:forEach begin="1" end="${totalPages}" step="1" var="pageNumber1Based">
							<!-- 主體是頁碼 button, 表單只是因為不想用 a + query string 的方式送 url -->
							<form action="${contextRoot}/course/show/all">
								<input type="hidden" name="pageNumber" value="${pageNumber1Based}">
								<input type="hidden" name="pageSize" value="">
								<input type="hidden" name="direction" value="">
								<input type="hidden" name="property" value="">
								<!-- 本頁的頁碼按鈕, 不讓按 -->
								<c:if test="${pageNumber1Based == (thisPageNumberZeroBased+1)}">
									<button type="button" class="button active">${pageNumber1Based}</button>
								</c:if>
								<c:if test="${pageNumber1Based != (thisPageNumberZeroBased+1)}">
									<!-- 他頁的頁碼按鈕, 可以按 -->
									<button type="submit" class="button">${pageNumber1Based}</button>
								</c:if>									
							</form>
						</c:forEach>
					</div>
					<small>第 ${thisPageNumberZeroBased+1} 頁, 共 ${totalPages} 頁</small>
				</div>
			</div>
		</div>
	</div>

</section>

<!-- 插入頁腳 -->
<jsp:directive.include file="/WEB-INF/pages/layout/backstage/footer.jsp" />

<!-- 刪除按鈕觸發彈窗 -->
<div id="deleteConfirm-modal" class="modal">
	<div class="modal-background --jb-modal-close"></div>
	<div class="modal-card">
		<header class="modal-card-head">
			<p class="modal-card-title">注意</p>
		</header>
		<section class="modal-card-body">
			<p>
				確定要<b>刪除</b>這筆資料嗎?
			</p>
		</section>
		<footer class="modal-card-foot">
			<button class="button --jb-modal-close">返回</button>
			<button id="deleteConfirmBtn" class="button red --jb-modal-close">確認刪除</button>
		</footer>
	</div>
</div>

<!-- 刪除全部按鈕觸發彈窗 -->
<div id="deleteAllConfirm-modal" class="modal">
	<div class="modal-background --jb-modal-close"></div>
	<div class="modal-card">
		<header class="modal-card-head">
			<p class="modal-card-title">注意</p>
		</header>
		<section class="modal-card-body">
			<p>
				確定要<b>刪除</b>這筆資料嗎?
			</p>
		</section>
		<footer class="modal-card-foot">
			<button class="button --jb-modal-close">返回</button>
			<button id="deleteAllConfirmBtn" class="button red --jb-modal-close">確認刪除</button>
		</footer>
	</div>
</div>

</div>

<!-- 原生 js, 負責 nav 的動態變動與彈窗的動態變動 -->
<script type="text/javascript" src="${contextRoot}/resources/backstage/js/main.min.js?v=1628755089081"></script>
</body>
</html>