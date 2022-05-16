<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>課程資訊</title>

<!-- 使用原生 https://materialdesignicons.com/ 的 icon-->
<link rel="stylesheet"
	href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">

<!-- 使用原生 Tailwind css -->
<link rel="stylesheet" type="text/css"
	href="${contextRoot}/resources/backstage/css/main.css">

<!-- 網站頁籤 logo -->
<link rel="icon" type="image/png" sizes="32x32" href="${contextRoot}/resources/backstage/favicon-32x32.png" />
<link rel="icon" type="image/png" sizes="16x16" href="${contextRoot}/resources/backstage/favicon-16x16.png" />

<style>
  	@media (min-width:768px){
		/* 原 global 內容 */
  		.md\:space-y-0>:not([hidden])~:not([hidden]){
  			--tw-space-y-reverse:0;margin-top:calc(0px * calc(1 - var(--tw-space-y-reverse)));margin-bottom:calc(0px * var(--tw-space-y-reverse))
  		}
  		.md\:flex-row{
  			flex-direction:row
  		}
  		
  		.md\:grid-cols-1-2{
  			grid-template-columns:minmax(0,1fr) minmax(0,2fr)
  		}
  		
  		.md\:grid-cols-3{
  			grid-template-columns:repeat(3,minmax(0,1fr))
  		}
  		
  		/* local 客製內容 */
  		.md\:grid-cols-4{
  		grid-template-columns:repeat(4,minmax(0,1fr))
  		}
  	}

	.displayNone,.imgDisplayNone,.imgEditNone {
		display:none;
	}

/*   	@media (min-width:1024px){ */
/*   		.lg\:grid-cols-2{ */
/*   			grid-template-columns:repeat( 2,minmax(0,1fr) ) */
/*   		} */
/*   	} */

	.course-image-size {
		width:20rem;
		height:20rem;
	}
	.image img{
		display:block;
		height:auto;
		max-width:100%;
		width:100%
	}
	.image img.course-image {
		width:100%;
    	height:100%; 
    	object-fit: contain; 
	}
</style>

<!-- 套用原生 js, 原本放 body 最下面, 改到上面要加 defer(==document ready) -->
<script type="text/javascript"
	src="${contextRoot}/resources/backstage/js/main.min.js?v=1628755089081"
	defer>
</script>

<!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous">
</script>

<!-- sweat alert 2 CDN -->	
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
	$(document).ready(function() { // Document is ready

		// 初始化, 若沒照片則隱藏掉照片div
		console.log("===>"+$("#originalPictureExists").val());
		if( $("#originalPictureExists").val() == "true" ) {
			$(".forImgDisplay").removeClass("imgDisplayNone");
		}
		
		// 綁定"編輯"按鈕的click事件處理函式
		$("#editBtn").click(function() {
			$(".forDisplay").addClass("displayNone");
			$(".forEdit").removeClass("displayNone");
		});

		// 綁定"確認修改"按鈕的click事件處理函式
		$("#sendBtn").click(function() {
			Swal.fire({
				text: "確認修改？",
				showConfirmButton: true,
				confirmButtonText: 'OK',
				confirmButtonColor: 'rgb(16, 185, 129)',
				showCancelButton: true,
				cancelButtonText: "取消",
				cancelButtonColor: 'rgb(239, 68, 68)',
			}).then(function (result) {
				if(result.isConfirmed) {
					$("#editCourseForm").submit();
				}
			});
		});

		// 綁定"取消"按鈕的click事件處理函式 
		$("#cancelBtn").click(function() {
			$(".forDisplay").removeClass("displayNone");
			$(".forEdit").addClass("displayNone");

			$.each($("input.forEdit"), function(index,thisInput) {
				$(thisInput).val(
					$(thisInput).siblings("span.forDisplay").text()
				);
			});

			$.each($("select.forEdit"), function(index,thisSelect) {
				const originalOption = $(thisSelect).siblings("span.forDisplay").text();
				$(thisSelect)
					.find("option:contains("+originalOption+")").prop("selected", true)
					.siblings().prop("selected", false);
			});
			
			// 消掉檔案上傳(input file)
			$("#pictureUploadInput").val("");
			// 沒照片要隱藏div
			if( $("#originalPictureExists").val() != "true" ) {
				$(".forImgDisplay").addClass("imgDisplayNone");
			}
			// 複製原照片至編輯模式照片
			$("#pictureUploadDisplay").attr("src", 
				$("#pictureOriginalDisplay").attr("src")
			);
			// 復原傳至後端的base64屬性至原來的值(回復撤除照片的影響)
			$("#pictureBase64ToBackend").val(
				$("#pictureBase64KeepOrig").val()
			);
			$(".forImgEdit").removeClass("imgEditNone");
			
		}); // end of 取消 event
		
		///////////////////////////////////////////////////////
		// 照片處理
		///////////////////////////////////////////////////////
		
		// "上傳"input的change事件處理(必在編輯模式)
		$("#pictureUploadInput").change(function () {

			const inputFile = $( this )[0].files[0];
			
			// 若非照片檔===>編輯模式仍用原檔
			const mimeType = inputFile.type;
			if( !mimeType.match(/image.*/) ){
				Swal.fire({
					text: "請上傳照片！",
					showConfirmButton: true,
					confirmButtonText: 'OK',
					confirmButtonColor: 'rgb(16, 185, 129)',
				});
				
				// 上傳用的 input 清空
				$( this ).val("");
				
				// 顯示用的 orginal img 不動
				
				// 顯示用的 edit img 為 orignal img
				$("#pictureUploadDisplay").attr("src", 
					$("#pictureOriginalDisplay").attr("src")
				);
				
				// 藏起來的未修改 input 不動
				
                return;
			}
			
			// 有照片狀態
			
			// 上傳用的 input 有東西要傳後端
			
			// 顯示用的 orginal img 不動
			
			// 顯示用的 edit img 套用並顯示
			$(".forImgDisplay").removeClass("imgDisplayNone");
			$(".forImgEdit").removeClass("imgEditNone");
			$("#pictureUploadDisplay")[0].src = (window.URL ? URL : webkitURL).createObjectURL( inputFile ); // firefox 用 window.URL, chrome 用 webkitURL
			
			// 要傳去後端的原 field 清空
			$("#pictureBase64").val("");
		});
		
		// "撤除照片"按鈕的click事件處理
		$("#takePictureOffBtn").click(function () {
			// 消掉編輯模式的照片(img與input file)
			$("#pictureUploadDisplay").attr("src", "");
			$("#pictureBase64ToBackend").val("");
			$("#pictureUploadInput").val("");
			$(".forImgEdit").addClass("imgEditNone");
		});

		
	}); // end of document ready
</script>

</head>
<body>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<input type="hidden" id="contextRoot" value="${contextRoot}">

<div id="app">

<!-- 插入上導覽列與左導覽列 -->
<jsp:directive.include file="/WEB-INF/pages/layout/backstage/nav-and-aside.jsp" />

<!-- 目錄 -->
<section class="is-title-bar">
	<div
		class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
		<ul>
			<li>管理系統</li>
			<li>課程管理</li>

		</ul>

	</div>
</section>

<!-- 標題 -->
<section class="is-hero-bar">
	<div
		class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
		<h1 class="title">課程資訊</h1>
		<a href="${pageContext.request.contextPath}/staff/course/show/all"><button
				class="button light">返回課程列表</button></a>
	</div>
</section>

<!-- 核心內容的 section 開始 -->
<section class="section main-section">

	<!-- form 表單開始 -->
	<form:form id="editCourseForm"
		action="${pageContext.request.contextPath}/course/update/${course.id}"
		modelAttribute="course" 
		method="POST"
		enctype="multipart/form-data">
	<div class="grid grid-cols-1 gap-6 md:grid-cols-1-2 mb-6">
		<!-- 左資訊磚 -->
		<div class="card">
		  <header class="card-header">
		    <p class="card-header-title">
		      <span class="icon"><i class="mdi mdi-account"></i></span>
		      課程照片
		    </p>
		  </header>
		  <div class="card-content">
		  
		  	<!-- 判斷是否有照片 -->
		  	<input type="hidden" id="originalPictureExists" value="${course.pictureBase64!=null}">
			<!-- 原照片 base64, 若撤下要復原用 -->
			<input type="hidden" id="pictureBase64KeepOrig" value="${course.pictureBase64}">
			<!-- 原照片 base64, 原封不動再傳回後端, 除非被撤下 -->
			<input type="hidden" id="pictureBase64ToBackend" name="pictureBase64" value="${course.pictureBase64}">
		    <!-- 照片本體 -->
		    <div class="forDisplay forImgDisplay forImgEdit image course-image-size mx-auto imgDisplayNone">
		      <img id="pictureOriginalDisplay" class="course-image" src="data:image/png;base64, ${course.pictureBase64}" alt="">
		    </div>
		    <div class="forDisplay forImgDisplay forImgEdit forEdit image course-image-size mx-auto imgDisplayNone displayNone">
		      <img id="pictureUploadDisplay" class="course-image" src="data:image/png;base64, ${course.pictureBase64}" alt="">
		    </div>
			    
			<hr class="forImgDisplay forEdit forImgEdit displayNone imgDisplayNone">
		    
		    <!-- input file 與原來的 original picture Base64 -->
    		<div class="field forEdit displayNone">
			  <div class="field-body">
			    <div class="field file grouped">
			      <label class="upload control">
			        <a id="pictureUploadBtn" class="button blue">
			        	上傳
			        </a>
			        <input id="pictureUploadInput" name="pictureFile" type="file">
			      </label>
			      <div class="control forImgEdit">
			      	<button id="takePictureOffBtn" type="button" class="button red forImgDisplay imgDisplayNone">撤除照片</button>
			      </div>
			    </div>
			  </div>
			</div>
			
			<hr class="forEdit displayNone">
			
			<div class="grid grid-cols-1 gap-6 md:grid-cols-1-2 mb-6">
			
				<!-- input 輸入格0 -->
				<form:input hidden="hidden" path="id"
					value="${course.id}" />
				
				<!-- input 輸入格1 -->
				<div class="field">
					<form:label class="label" path="courseName">課名</form:label>

					<div class="control">
						<span class="forDisplay">${course.courseName}</span>
						<form:input id="courseName" class="input forEdit displayNone"
							type="text" path="courseName"
							value="${course.courseName}" placeholder="例: 有氧舞蹈" />
					</div>
					<p class="help">*必填</p>
					<p class="help">
						<form:errors style="color: red;" path="courseName"
							cssClass="error" />
					</p>
				</div>
				
				<!-- select 下拉選項1 -->
				<div class="field">
					<form:label class="label" path="coachId">教練</form:label>
					<div class="control">
						<div class="select">
							<span class="forDisplay">${course.coach.lastName}${course.coach.firstName}</span>
							<form:select class="forEdit displayNone" path="coachId">
								<c:forEach items="${coachs}" var="coach">
									<form:option
										value="${coach.id}">${coach.lastName}${coach.firstName}</form:option>
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
							<span class="forDisplay">${course.room.roomNo}${course.room.roomName}</span>
							<form:select class="forEdit displayNone" path="roomNo">
								<c:forEach items="${rooms}" var="room">
									<form:option 
										data-capacity="${room.roomSizeType.roomCapacity}"
										value="${room.roomNo}">
										${room.roomNo}${room.roomName} 容納${room.roomSizeType.roomCapacity}人
									</form:option>
								</c:forEach>
							</form:select>
						</div>
					</div>
				</div>

			</div>
		  </div>
		</div>
		
		<!-- 右資訊磚 -->
		<div class="card">
			<header class="card-header">
				<div
					class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
					<p class="card-header-title">
						<span class="icon"><i class="mdi mdi-ballot"></i></span> 課程資訊 <span
							id="formError" style="color: red"></span>
					</p>
					<button class="button blue forDisplay" type="button" id="editBtn">編輯</button>
				</div>
			</header>
			<div class="card-content">

				<!-- input 輸入格3 -->
				<div class="field">
					<form:label class="label" path="courseDescription">課程概述</form:label>
					<div class="control">
						<span class="forDisplay">${course.courseDescription}</span>
						<form:textarea id="courseDescription" class="textarea forEdit displayNone"
							path="courseDescription"
							value="${course.courseClassAmount}" placeholder="24" />
					</div>
					<form:errors path="courseDescription" />
				</div>

				<!-- input 輸入格2 -->
				<div class="field">
					<form:label class="label" path="courseStartDate">開課日期</form:label>
					<div class="control">
						<span class="forDisplay">${course.courseStartDate}</span>
						<form:input id="courseStartDate" class="input forEdit displayNone"
							type="date" path="courseStartDate"
							value="${course.courseStartDate}" placeholder="YYYY/MM/DD" />
					</div>
					<form:errors style="color: red;" path="courseStartDate"
						cssClass="error" />
				</div>

				<!-- input 輸入格3 -->
				<div class="field">
					<form:label class="label" path="courseClassAmount">堂數</form:label>
					<div class="control">
						<span class="forDisplay">${course.courseClassAmount}</span>
						<form:input id="courseClassAmount" class="input forEdit displayNone"
							type="text" path="courseClassAmount"
							value="${course.courseClassAmount}" placeholder="24" />
					</div>
					<form:errors path="courseClassAmount" />
				</div>

				<!-- input 輸入格4 -->
				<div class="field">
					<form:label class="label" path="totalPlaces">規劃人數</form:label>
					<div class="control">
						<div class="select">
							<span class="forDisplay">${course.totalPlaces}</span>
							<input disabled class="input forEdit displayNone" style="background: #ccc;"
								name="totalPlaces" value="${course.totalPlaces}">
							<input type="hidden" name="totalPlaces" value="${course.totalPlaces}">
						</div>
					</div>
				</div>
				
				<!-- 剩餘人數不變 -->
				<div class="field">
					<form:label class="label" path="remainingPlaces">剩餘人數</form:label>
					<div class="control">
						<div class="select">
							<span class="forDisplay">${course.remainingPlaces}</span>
							<input disabled class="input forEdit displayNone" style="background: #ccc;"
								name="remainingPlaces" value="${course.remainingPlaces}">
							<input type="hidden" name="remainingPlaces" value="${course.remainingPlaces}">
						</div>
					</div>
				</div>

				<!-- input 輸入格5 -->
				<div class="field">
					<form:label class="label" path="coursePrice">價錢</form:label>

					<div class="control">
						<span class="forDisplay">${course.coursePrice}</span>
						<form:input class="input forEdit displayNone" type="text"
							id="coursePrice" path="coursePrice"
							value="${course.coursePrice}" placeholder="20000" />
					</div>
					<form:errors path="coursePrice" />
				</div>

				<hr class="forEdit displayNone">

				<div class="field grouped forEdit displayNone">
					<div class="control forEdit displayNone">
						<button id="sendBtn" type="button" id="submit" class="button green">確認修改</button>
					</div>
					<div class="control forEdit displayNone">
						<button id="cancelBtn" type="button" class="button red">取消</button>
					</div>
				</div>
	
				
			</div>
		</div>

	</div>
	</form:form>
</section>

<!-- 插入頁腳 -->
<jsp:directive.include file="/WEB-INF/pages/layout/backstage/footer.jsp" />

</div>

</body>
</html>