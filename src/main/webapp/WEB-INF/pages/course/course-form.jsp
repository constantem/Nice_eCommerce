<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en" class="">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>新增課程</title>

<!-- 使用原生 https://materialdesignicons.com/ 的 icon-->
<link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">

<!-- 使用原生 Tailwind css -->
<link rel="stylesheet" href="${contextRoot}/resources/backstage/css/main.css?v=1628755089081">

<!-- 網站頁籤 logo -->
<link rel="icon" type="image/png" sizes="32x32" href="${contextRoot}/resources/backstage/favicon-32x32.png"/>
<link rel="icon" type="image/png" sizes="16x16" href="${contextRoot}/resources/backstage/favicon-16x16.png"/>

<!-- local css -->
<style>

	.displayNone {
		display:none;
	}
	.course-image-size {
		width:30rem;
		height:30rem;
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
$(document).ready(function() {
	
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
				$("#courseDescription").val(courseAutoInput.courseDescription);
				

				const coachAutoSelected = JSON.parse(autoInputMapObj.coach);
				$("#coachId")
					.find("option[value="+coachAutoSelected.id+"]").prop("selected",true)
					.siblings().prop("selected",false);

				const roomAutoSelected = JSON.parse(autoInputMapObj.room);
				$("#roomNo")
					.find("option[value="+roomAutoSelected.roomNo+"]").prop("selected",true)
					.siblings().prop("selected",false);
				$("#roomNo").trigger("change");
			}
		});
	});

	// 確認按鈕綁定 handler
	$("#submitBtn").click(function() {
		Swal.fire({
			title: '確認新增？',
			showConfirmButton: true, // 不寫也預設 true
			confirmButtonText: '新增',
			confirmButtonColor: 'rgb(16, 185, 129)',
			showCancelButton: true,
			cancelButtonText: "取消",
			cancelButtonColor: 'rgb(239, 68, 68)',
		}).then(function (result) {

			if (result.isConfirmed) { // 選確認
				
				// 用 FormData 來傳
				const theForm = $("#courseForm")[0]; // jquery object 為 collection, 要拿出第一個才是 DOM object
				const dataFile = new FormData( theForm ); 
				
				$.ajax({
					type: "POST",
					url : $("#contextRoot").val() + "/course/create",
			        processData: false, //防止 jquery 將 data 變成 query String
			        contentType: false,
			        cache: false,
					data : dataFile,
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
								confirmButtonColor: 'rgb(16, 185, 129)',
								showCancelButton: true,
								cancelButtonText: '<span style="color:black;">回列表</span>',
								cancelButtonColor: 'rgb(243, 244, 246)',
							}).then(function (result) {
								if(!result.isConfirmed) { // 不按 OK, 跳轉
									window.location.href= $("#contextRoot").val() + "/staff/course/show/all";
								} 
							});
						} else if(message == "新增失敗") {

						}
					}
				}); // 新增 ajax 結束
			} // "確認新增"情況結束
		}) // 第一層 sweat alert 完全結束	
	}); // 確認按鈕綁定 handler 結束
	
	// 綁定上傳按鈕的 change 事件處理函式
	$("#pictureUploadInput").change( function () {
		const theFile = $(this)[0].files[0];
		const mimeType = theFile.type;
		
		if( !theFile.type.match(/image.*/) ){
			Swal.fire({
				text: "請上傳照片！",
				showConfirmButton: true, // 不寫也預設 true
				confirmButtonText: 'OK',
				confirmButtonColor: 'rgb(16, 185, 129)'
			});
			
			// 回復無照片狀態
			cancelUploadedImg();
			
               return;
		}
		
		// 有照片狀態
		$(".showIfImgExists").removeClass("displayNone");
		$(this).text("重新上傳");
		$('#pictureDisplay')[0].src = (window.URL ? URL : webkitURL).createObjectURL( theFile ); // firefox 用 window.URL, chrome 用 webkitURL
		
	}); // 綁定上傳按鈕的 change 事件處理函式結束
	
	// 綁定取消上傳按鈕的 click 事件處理函式
	$("#uploadCancelBtn").click(cancelUploadedImg);
	
	// 回復無照片狀態及畫面的函式
	function cancelUploadedImg() {
		$('#pictureDisplay')[0].src = "";
		$("#pictureUploadInput").val("");
		$(".showIfImgExists").addClass("displayNone");
		$("#pictureUploadBtn").text("上傳");
	}
	
	// room 的 change 事件
	$("#roomNo").change(function () {
		const capacity = $("#roomNo option").filter(":selected").data("capacity");
		$("#totalPlaces").empty(); // 清空 option
		for(let i=capacity; i>=1; i--) {
			console.log(i);
			console.log($("<option></option>").val(i).text(i));
			$("#totalPlaces")
				.append( $("<option></option>").val(i).text(i) );
		}
		
	});
	
	// total places 確定後, remaining places 也要確定, 這交給 entity 的 prePersist 做
	
}); // document ready 結束
</script>


</head>
<body>

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
		<h1 class="title">新增課程</h1>
		<a class="button light" href="${contextRoot}/staff/course/show/all">
            		<span>回列表</span>
          	</a>
	</div>
</section>

<!-- 核心內容的 section 開始 -->
<section class="section main-section">

	<!-- form 表單開始, 含傳照片要用 POST -->
	<form:form 
		id="courseForm"
		method="POST"
		enctype="multipart/form-data"
		action="${pageContext.request.contextPath}/course/create"
		modelAttribute="course">

    <div class="grid grid-cols-1 gap-6 lg:grid-cols-2 mb-6">
    	
      <!-- 左側資訊磚 -->
	  <div class="card">
		<header class="card-header">
			<p class="card-header-title">
				<span class="icon"><i class="mdi mdi-ballot"></i></span> 課程資訊 <span
					id="formError" style="color: red"></span>
			</p>
		</header>
		<div class="card-content">

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
					<form:label class="label" path="courseDescription">課程概述</form:label>

					<div class="control">
						<form:textarea class="textarea"
							id="courseDescription" path="courseDescription" 
							placeholder="" />
					</div>
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
									<form:option 
										data-capacity="${room.roomSizeType.roomCapacity}" 
										value="${room.roomNo}">
										${room.roomNo}${room.roomName} 容量${room.roomSizeType.roomCapacity}人
									</form:option>
								</c:forEach>
							</form:select>
						</div>
					</div>
				</div>

				<!-- input 輸入格5 -->
				<div class="field">
					<form:label class="label" path="totalPlaces">規劃人數</form:label>

					<div class="control">
						<div class="select">
							<form:select id="totalPlaces" path="totalPlaces">
								<c:forEach var="i" begin="1" end="${rooms[0].roomSizeType.roomCapacity}" step="1" varStatus="status">	
									<form:option value="${status.end+1-i}">${status.end+1-i}</form:option>	
								</c:forEach>
							</form:select>
						</div>
					</div>
					<form:errors path="totalPlaces" />
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
			
		</div>
	  </div>
      
      <!-- 右側資訊磚 -->
      <div class="card">
        <header class="card-header">
          <p class="card-header-title">
            <span class="icon"><i class="mdi mdi-account"></i></span>
            課程照片
          </p>
        </header>
        <div class="card-content">
          <!-- 照片顯示 -->
          <div class="image course-image-size mx-auto showIfImgExists displayNone">
            <img class="course-image" id="pictureDisplay" src="" alt="" class="">
          </div>
          <!-- 分隔線 -->
          <hr class="showIfImgExists displayNone">
          <!-- 上傳按鈕 -->
            <div class="field">
              <div class="field-body">
                <div class="field file grouped">
                  <label class="upload control">
                    <a id="pictureUploadBtn" class="button blue">
                      上傳
                    </a>
                    <input id="pictureUploadInput" name="pictureFile" type="file">
                  </label>
                  <div class="control showIfImgExists displayNone">
                    <a id="uploadCancelBtn" class="button red">
                      取消上傳
                    </a>
                  </div>
                </div>
              </div>
            </div>


        </div>
      </div>
    </div>

	<!-- 下側資訊磚 -->
	<div class="card">
      <div class="card-content">
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
      </div>
    </div>
	
	</form:form>
	
</section>
<!-- 核心內容的 section 結束 -->

<!-- 插入頁腳 -->
<jsp:directive.include file="/WEB-INF/pages/layout/backstage/footer.jsp" />

</div>

</body>
</html>
