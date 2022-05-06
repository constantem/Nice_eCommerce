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
<title>課程</title>

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

	.displayNone,.imgDisplayNone {
		display:none;
	}

/*   	@media (min-width:1024px){ */
/*   		.lg\:grid-cols-2{ */
/*   			grid-template-columns:repeat( 2,minmax(0,1fr) ) */
/*   		} */
/*   	} */
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
			$("#springForm").submit();
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
		}); // end of 取消 event
		
		// "上傳"按鈕的change事件處理(必在編輯模式)
		$("#pictureUploadBtn").change(function () {
			const theFile = $(this)[0].files[0];
			const mimeType = theFile.type;
			
			// 若非照片檔===>編輯模式仍用原檔
			if( !theFile.type.match(/image.*/) ){
				Swal.fire({
					text: "請上傳照片！"
				});
				
				// 上傳用的 input 清空
				$("#pictureUploadInput").val("");
				
				// 顯示用的 orginal img 不動
				
				// 顯示用的 edit img 不動
				
				// 藏起來的未修改 input 不動
				
                return;
			}
			
			// 有照片狀態
			
			// 上傳用的 input 有東西要傳後端
			
			// 顯示用的 orginal img 不動
			
			// 顯示用的 edit img 套用並顯示
			$(".forImgDisplay").removeClass("imgDisplayNone");
			$('#pictureUploadDisplay')[0].src = (window.URL ? URL : webkitURL).createObjectURL( theFile ); // firefox 用 window.URL, chrome 用 webkitURL
			
			// 要傳去後端的原 field 清空
			$("#pictureBase64").val("");
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
			<li>運動網</li>
			<li>課程管理系統</li>
			<li>課程列表</li>
			<li>課程</li>
		</ul>
		<a href="#" class="button blue"> <span class="icon"><i
				class="mdi mdi-credit-card-outline"></i></span> <span>施工中</span>
		</a>
	</div>
</section>

<!-- 標題 -->
<section class="is-hero-bar">
	<div
		class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
		<h1 class="title">課程</h1>
		<a href="${pageContext.request.contextPath}/course/show/all"><button
				class="button light">返回課程列表</button></a>
	</div>
</section>

<!-- 核心內容的 section 開始 -->
<section class="section main-section">
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
		  
		  	<input type="hidden" id="originalPictureExists" value="${course.pictureBase64!=null}">
		    <!-- 照片本體 -->
		    <div class="forImgDisplay image w-48 h-48 mx-auto imgDisplayNone">
		      <img id="pictureOriginalDisplay" src="data:image/png;base64, ${course.pictureBase64}" alt="" class="rounded-full">
		    </div>
		    <div class="forImgDisplay forEdit image w-48 h-48 mx-auto imgDisplayNone displayNone">
		      <img id="pictureUploadDisplay" src="data:image/png;base64, ${course.pictureBase64}" alt="" class="rounded-full">
		    </div>
			    
			<hr class="forImgDisplay forEdit displayNone imgDisplayNone">
		    
    		<div class="field forEdit displayNone">
			  <div class="field-body">
			    <div class="field file grouped">
			      <label class="upload control">
			        <a id="pictureUploadBtn" class="button blue">
			        	<c:if test="${course.pictureBase64!=null}">
			        		重新上傳
			        	</c:if>
			          	<c:if test="${course.pictureBase64==null}">
			        		上傳
			        	</c:if>
			        </a>
			        <input type="hidden" id="originalPictureBase64" value="${course.pictureBase64}">
			        <input type="hidden" id="pictureBase64" name="pictureBase64">
			        <input id="pictureUploadInput" name="pictureFile" type="file">
			      </label>
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
	
				<!-- form 表單開始 -->
				<form:form id="springForm"
					action="${pageContext.request.contextPath}/course/update/${course.id}"
					modelAttribute="course" method="POST">
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
						<form:label class="label" path="coursePeriod">時段</form:label>
	
						<div class="control">
							<span class="forDisplay">${course.coursePeriod}</span>
							<form:input id="coursePeriod" class="input forEdit displayNone"
								type="text" path="coursePeriod"
								value="${course.coursePeriod}" placeholder="" />
						</div>
						<form:errors path="coursePeriod" />
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
											value="${room.roomNo}">${room.roomNo}${room.roomName}</form:option>
									</c:forEach>
								</form:select>
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
	
				</form:form>
			</div>
		</div>

	</div>
</section>

<!-- 插入頁腳 -->
<jsp:directive.include file="/WEB-INF/pages/layout/backstage/footer.jsp" />

</div>

</body>
</html>