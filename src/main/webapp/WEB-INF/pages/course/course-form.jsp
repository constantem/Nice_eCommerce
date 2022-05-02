<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>首頁</title>

<!-- Icons below are for demo only. Feel free to use any icon pack. Docs: https://bulma.io/documentation/elements/icon/ -->
<link rel="stylesheet"
	href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">

<!-- Tailwind is included -->
<link rel="stylesheet" type="text/css"
	href="${contextRoot}/resources/backstage/css/main.css">


<link rel="apple-touch-icon" sizes="180x180" href="${contextRoot}/resources/backstage/apple-touch-icon.png" />
<link rel="icon" type="image/png" sizes="32x32" href="${contextRoot}/resources/backstage/favicon-32x32.png" />
<link rel="icon" type="image/png" sizes="16x16" href="${contextRoot}/resources/backstage/favicon-16x16.png" />
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

<!-- Scripts below are for demo only -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/backstage/js/main.min.js?v=1628755089081"></script>

<!-- jQuery CDN -->	
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<!-- sweat alert 2 CDN -->	
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
	$(document).ready(function() {
		
		// 開發階段測試: 測試日期
		console.log("初入jsp的courseStartDate->"+$("#courseStartDate").val());

		// 一鍵新增按鈕綁定 handler
		$("#autoinput").click(function() {
			$.ajax({
				url : $("#contextRoot").val() + "/course/autoinput",
				type : "GET",
				// 	dataType: "json", // 要加, 回傳的東西才會是 JS object
				success : function(autoInputMapObj) { // 拿到 JS object, 非 string
					const courseAutoInput = JSON.parse(autoInputMapObj.course); // 但裡面的 Course instance 為 JSON string, 要轉為 JS object
					$("#courseName").val(courseAutoInput.courseName);
					$("#courseStartDate").val(courseAutoInput.courseStartDate);
					$("#courseClassAmount").val(courseAutoInput.courseClassAmount);
					$("#coursePrice").val(courseAutoInput.coursePrice);

					// 開發階段測試: 測試日期
					console.log("autoInput後jsp的courseStartDate->"+$("#courseStartDate").val());
					
					console.log(autoInputMapObj.coach);
					const coachAutoSelected = JSON.parse(autoInputMapObj.coach);
					$("#coachId")
						.find("option[value="+coachAutoSelected.id+"]").prop("selected",true)
						.siblings().prop("selected",false);

					const roomAutoSelected = JSON.parse(autoInputMapObj.room);
					$("#roomNo")
						.find("option[value="+roomAutoSelected.roomNo+"]").prop("selected",true)
						.siblings().prop("selected",false);
				}
			});
		});

		// 確認按鈕綁定 handler
		$("#submitBtn").click(function() {
			Swal.fire({
				title: '確認新增？',
				showConfirmButton: true, // 不寫也預設 true
				confirmButtonText: '新增',
				showDenyButton: true,
				denyButtonText: "取消",
			}).then(function (result) {

				if (result.isConfirmed) { // 選確認
					$.ajax({
						url : $("#contextRoot").val() + "/course/create",
						type : "GET",
						data : $("form").serialize(),
						success : function(message) {
							console.log(message);
							if (message == "驗證不通過") {
								$("#formError").text("請重新輸入");
							} else if (message == "新增成功") {
								Swal.fire({
									icon: 'success',
									title: message,
									showConfirmButton: true, // 不寫也預設 true
									confirmButtonText: 'OK',
									showCloseButton: true,
									showCancelButton: true,
									cancelButtonText: '回列表'
								}).then(function (result) {
									if(!result.isConfirmed) { // 不按 OK, 跳轉
										window.location.href= $("#contextRoot").val() + "/course/show/all";
									} 
								});
							} else if(message == "新增失敗") {

							}
						}
					}); // 新增 ajax 結束
				} // "確認新增"情況結束
			}) // 第一層 sweat alert 完全結束
			

			
		});
	});
</script>
</head>
<body>
	
<input type="hidden" id="contextRoot" value="${contextRoot}">

<div id="app">

<!-- 插入上導覽列與左導覽列 -->
<jsp:directive.include file="/WEB-INF/pages/layout/backstage/nav-and-aside.jsp" />

<!-- 目錄 -->
<section class="is-title-bar">
	<div
		class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
		<ul>
			<li>康康運動</li>
			<li>課程管理系統</li>
		</ul>
		<a href="#" class="button blue"> <span class="icon"><i
				class="mdi mdi-credit-card-outline"></i></span> <span>施工中</span>
		</a>
	</div>
</section>

<!-- 章節 -->
<section class="is-hero-bar">
	<div
		class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
		<h1 class="title">新增課程</h1>
		<a class="button light" href="${contextRoot}/course/show/all">
            		<span>回列表</span>
          	</a>
	</div>
</section>

<!-- 核心內容 -->
<section class="section main-section">
	<div class="card mb-6">
		<header class="card-header">
			<p class="card-header-title">
				<span class="icon"><i class="mdi mdi-ballot"></i></span> 課程資訊 <span
					id="formError" style="color: red"></span>
			</p>
		</header>
		<div class="card-content">

			<!-- form 表單開始 -->
			<form:form method="get"
				action="${pageContext.request.contextPath}/course/create"
				modelAttribute="course">

				<!-- input 輸入格1 -->
				<div class="field">
					<form:label class="label" path="courseName">課名</form:label>

					<div class="control">
						<form:input class="input" type="text" id="courseName"
							path="courseName" placeholder="例: 有氧舞蹈" />
					</div>
					<p class="help">*必填</p>
					<form:errors style="color:red;" path="courseName" />
				</div>

				<!-- input 輸入格2 -->
				<div class="field">
					<form:label class="label" path="courseStartDate">開課日期</form:label>

					<div class="control">
						<form:input class="input" type="date" id="courseStartDate"
							path="courseStartDate" placeholder="YYYY/MM/DD" />
					</div>
					<form:errors path="courseStartDate" />
				</div>

				<!-- input 輸入格3 -->
				<div class="field">
					<form:label class="label" path="courseClassAmount">堂數</form:label>

					<div class="control">
						<form:input class="input" type="text" id="courseClassAmount"
							path="courseClassAmount" placeholder="24" />
					</div>
					<form:errors path="courseClassAmount" />
				</div>

				<!-- input 輸入格4 -->
				<div class="field">
					<form:label class="label" path="coursePeriod">時段</form:label>

					<div class="control">
						<form:input class="input" type="text" id="coursePeriod"
							path="coursePeriod" placeholder="" />
					</div>
					<form:errors path="coursePeriod" />
				</div>

				<!-- select 下拉選項1 -->
				<div class="field">
					<form:label class="label" path="coachId">教練</form:label>
					<div class="control">
						<div class="select">
							<form:select id="coachId" path="coachId">
								<c:forEach items="${coachs}" var="coach">
									<form:option value="${coach.id}">${coach.lastName}${coach.firstName}</form:option>
								</c:forEach>
							</form:select>
						</div>
					</div>
				</div>

				<!-- select 下拉選項2 -->
				<div class="field">
					<form:label class="label" path="roomNo">教室</form:label>
					<div class="control">
						<div class="select">
							<form:select id="roomNo" path="roomNo">
								<c:forEach items="${rooms}" var="room">
									<form:option value="${room.roomNo}">${room.roomNo}${room.roomName}</form:option>
								</c:forEach>
							</form:select>
						</div>
					</div>
				</div>

				<!-- input 輸入格5 -->
				<div class="field">
					<form:label class="label" path="coursePrice">價錢</form:label>

					<div class="control">
						<form:input class="input" type="text" id="coursePrice"
							path="coursePrice" placeholder="20000" />
					</div>
					<form:errors path="coursePrice" />
				</div>

				<hr>

				<div class="field grouped">
					<div class="control">
						<button type="button" id="submitBtn" class="button green">確認新增</button>
					</div>
					<div class="control">
						<button type="reset" class="button red">清除</button>
					</div>
					<div class="control">
						<button type="button" id="autoinput" class="button blue">一鍵生成</button>
					</div>
				</div>
			</form:form>
		</div>
	</div>

</section>

<!-- 插入頁腳 -->
<jsp:directive.include file="/WEB-INF/pages/layout/backstage/footer.jsp" />

<!-- 原生彈窗1 -->
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

<!-- 原生彈窗2 -->
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

<!-- 彈窗: 客製"確認新增" -->
<div id="sample-modal-insertConfirm" class="modal">
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

</body>
</html>


