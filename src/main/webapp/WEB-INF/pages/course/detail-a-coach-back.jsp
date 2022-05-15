<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en" class="">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>教練</title>

<!-- 使用原生 https://materialdesignicons.com/ 的 icon-->
<link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">

<!-- 使用原生 Tailwind css -->
<link rel="stylesheet" href="${contextRoot}/resources/backstage/css/main.css?v=1628755089081">

<!-- 網站頁籤 logo -->
<link rel="icon" type="image/png" sizes="32x32" href="${contextRoot}/resources/backstage/favicon-32x32.png"/>
<link rel="icon" type="image/png" sizes="16x16" href="${contextRoot}/resources/backstage/favicon-16x16.png"/>

<style>
  	@media (min-width:768px){	
  		/* local 客製內容 */
  		.md\:grid-cols-1-2{
  			grid-template-columns:minmax(0,1fr) minmax(0,2fr)
  		}
  	}

	.displayNone,.imgDisplayNone,.imgEditNone {
		display:none;
	}

</style>

<!-- 原生 js, 負責 nav 的動態變動與彈窗的動態變動 -->
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

	// global 變數
	let originalProfileExists = false;

	// 初始 ajax
	$.ajax({
		method: "GET",
		url: $("#contextRoot").val()+"/api/coach/"+$("#coachId").val(),
		success: function (coach) {
			// field 1
			$("#lastNameSpan").text( coach.lastName );
			$("#lastNameInput").val( coach.lastName );
			// field 2
			$("#firstNameSpan").text( coach.firstName );
			$("#firstNameInput").val( coach.firstName );
			// field 3
			$("#nicknameSpan").text( coach.nickname );
			$("#nicknameInput").val( coach.nickname );
			// field 4
			$("#genderSpan").text( coach.gender );
			$("#genderInput").val( coach.gender );
			// field 5
			$("#phoneSpan").text( coach.phone );
			$("#phoneInput").val( coach.phone );
			// field 6
			$("#emailSpan").text( coach.email );
			$("#emailInput").val( coach.email );
			// field 7
			$("#addressSpan").text( coach.address );
			$("#addressInput").val( coach.address );
			// field 8
			const hireDate = new Date(coach.hireDate);
			const hireDateFormat = hireDate.getFullYear()+"/"+(hireDate.getMonth()+1)+"/"+hireDate.getDate();
			$("#hireDateSpan").text( hireDateFormat );
			$("#hireDateInput").val( coach.hireDate );
			// 若有照片
			if(coach.profileBase64) {
				console.log("有照片");
				$("#profileOriginalDisplay").attr("src", "data:image/jpeg;base64, "+coach.profileBase64);
				$("#profileUploadDisplay").attr("src", "data:image/jpeg;base64, "+coach.profileBase64);
				originalProfileExists = true;
				$(".forImgDisplay").removeClass("imgDisplayNone");
			}
		}
	});
	
	// 初始化, 若沒照片則隱藏掉照片div
	console.log("===>"+originalProfileExists);
	if( originalProfileExists ) {
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
				
				// 向後端請求修改
				$.ajax({
					method: "PUT",
					url: $("#contextRoot").val() + "/api/coach",
					data: new FormData( $("#editCoachForm")[0] ),
					processData: false,
					contentType:false,
					success: function (status) {
						if(status=="修改成功") {
							Swal.fire({
								text: "修改成功",
								showConfirmButton: true,
								confirmButtonText: 'OK',
								confirmButtonColor: 'rgb(16, 185, 129)',
							}).then(function (result) {
								if(result.isConfirmed) {
									location.reload();
								}
							});
						}
					}
				});
			}
		});
	});

	// 綁定"取消"按鈕的click事件處理函式 
	$("#cancelBtn").click(function() {
		$(".forDisplay").removeClass("displayNone");
		$(".forEdit").addClass("displayNone");
		
		// 消掉檔案上傳(input file)
		$("#profileUploadInput").val("");
		// 沒照片要隱藏div
		if( !originalProfileExists ) {
			$(".forImgDisplay").addClass("imgDisplayNone");
		}
		// 複製原照片至編輯模式照片
		$("#profileUploadDisplay").attr("src", 
			$("#profileOriginalDisplay").attr("src")
		);
		// 復原傳至後端的base64屬性至原來的值(回復撤除照片的影響)
		$("#profileBase64ToBackend").val(
			$("#profileBase64KeepOrig").val()
		);
		$(".forImgEdit").removeClass("imgEditNone");
		
	}); // end of 取消 event
	
	///////////////////////////////////////////////////////
	// 照片處理
	///////////////////////////////////////////////////////
	
	// "上傳"input的change事件處理(必在編輯模式)
	$("#profileUploadInput").change(function () {
		
		const inputFile = $( this )[0].files[0];
		
		// 若非照片檔===>編輯模式仍用原檔
		const mimeType = inputFile.type;
		if( !mimeType.match(/image.*/) ){
			Swal.fire({
				text: "請上傳照片！"
				showConfirmButton: true,
				confirmButtonText: 'OK',
				confirmButtonColor: 'rgb(16, 185, 129)',
			});
			
			// 上傳用的 input 清空
			$( this ).val("");
			
			// 顯示用的 orginal img 不動
			
			// 顯示用的 edit img 為 orignal img
			$("#profileUploadDisplay").attr("src", 
				$("#profileOriginalDisplay").attr("src")
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
		$("#profileUploadDisplay")[0].src = (window.URL ? URL : webkitURL).createObjectURL( inputFile ); // firefox 用 window.URL, chrome 用 webkitURL
		
		// 要傳去後端的原 field 清空
		$("#profileBase64").val("");
	});
	
	// "撤除照片"按鈕的click事件處理
	$("#takeProfileOffBtn").click(function () {
		// 消掉編輯模式的照片(img與input file)
		$("#profileUploadDisplay").attr("src", "");
		$("#profileBase64ToBackend").val("");
		$("#profileUploadInput").val("");
		$(".forImgEdit").addClass("imgEditNone");
	});

	
}); // end of document ready
</script>

</head>
<body>

<!-- page controller 帶來的資料 -->
<input type="hidden" id="coachId" value="${id}">
<input type="hidden" id="contextRoot" value="${contextRoot}">

<div id="app">

<!-- 插入上導覽列與左導覽列 -->
<jsp:directive.include file="/WEB-INF/pages/layout/backstage/nav-and-aside.jsp" />

<!-- 目錄 -->
<section class="is-title-bar">
  <div class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
    <ul>
      <li>管理系統</li>
      <li>教練管理</li>
    </ul>
  </div>
</section>

<!-- 標題 -->
<section class="is-hero-bar">
  <div class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
    <h1 class="title">
      教練資訊
    </h1>
    <a href="${contextRoot}/staff/coach/listPage">
    	<button class="button light">回列表</button>
    </a>
  </div>
</section>

<!-- 核心內容的 section 開始 -->
<section class="section main-section">

	<!-- form 表單開始 -->
	<form id="editCoachForm">
	<div class="grid grid-cols-1 gap-6 md:grid-cols-1-2 mb-6">
		<!-- 左資訊磚 -->
		<div class="card">
		  <header class="card-header">
		    <p class="card-header-title">
		      <span class="icon"><i class="mdi mdi-account"></i></span>
		      照片
		    </p>
		  </header>
		  <div class="card-content">
		  
		  	<!-- 判斷是否有照片 -->
		  	<input type="hidden" id="originalProfileExists" value="">
			<!-- 原照片 base64, 若撤下要復原用 -->
			<input type="hidden" id="profileBase64KeepOrig" value="">
			<!-- 原照片 base64, 原封不動再傳回後端, 除非被撤下 -->
			<input type="hidden" id="profileBase64ToBackend" name="profileBase64" value="">
		    <!-- 照片本體 -->
		    <div class="forDisplay forImgEdit image w-48 h-48 mx-auto">
		      <img id="profileOriginalDisplay" src="" alt="" class="rounded-full">
		    </div>
		    <div class="forDisplay forEdit forImgEdit image w-48 h-48 mx-auto displayNone">
		      <img id="profileUploadDisplay" src="" alt="" class="rounded-full">
		    </div>
			    
			<hr class="forEdit forImgEdit displayNone">
		    
		    <!-- input file 與原來的 original profile Base64 -->
    		<div class="field forEdit displayNone">
			  <div class="field-body">
			    <div class="field file grouped">
			      <label class="upload control">
			        <a id="profileUploadBtn" class="button blue">
			        	上傳
			        </a>
			        <input id="profileUploadInput" name="profileFile" type="file">
			      </label>
			      <div class="control forImgEdit">
			      	<button id="takeProfileOffBtn" type="button" class="button red forImgDisplay imgDisplayNone">撤除照片</button>
			      </div>
			    </div>
			  </div>
			</div>
			
			<hr>
			
			<div class="grid grid-cols-1 gap-6 md:grid-cols-1-2 mb-6">
			
				<!-- input 輸入格0 -->
				<input type="hidden" name="id" value="${id}">
				
				<!-- input 輸入格1 -->
				<div class="field">
					<label class="label" for="lastNameInput">姓</label>
	
					<div class="control">
						<span id="lastNameSpan" class="forDisplay"></span>
						<input id="lastNameInput" class="input forEdit displayNone"
							type="text" name="lastName" value=""/>
					</div>
					<p class="help">*必填</p>
				</div>
				
				<!-- input 輸入格2 -->
				<div class="field">
					<label class="label" for="firstNameInput">名</label>
	
					<div class="control">
						<span id="firstNameSpan" class="forDisplay"></span>
						<input id="firstNameInput" class="input forEdit displayNone"
							type="text" name="firstName" value=""/>
					</div>
					<p class="help">*必填</p>
				</div>
				
				<!-- input 輸入格3 -->
				<div class="field">
					<label class="label" for="nicknameInput">暱稱</label>
	
					<div class="control">
						<span id="nicknameSpan" class="forDisplay"></span>
						<input id="nicknameInput" class="input forEdit displayNone"
							type="text" name="nickname" value=""/>
					</div>
					<p class="help">*必填</p>
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
						<span class="icon"><i class="mdi mdi-ballot"></i></span> 個人資訊 <span
							id="formError" style="color: red"></span>
					</p>
					<button class="button blue forDisplay" type="button" id="editBtn">編輯</button>
				</div>
			</header>
			<div class="card-content">

				<!-- input 輸入格4 -->
				<div class="field">
					<label class="label" for="genderInput">性別</label>

					<div class="control">
						<span id="genderSpan" class="forDisplay"></span>
						<input id="genderInput" class="input forEdit displayNone"
							type="text" name="gender" value=""/>
					</div>
					<p class="help">*必填</p>
				</div>
				
				<!-- input 輸入格5 -->
				<div class="field">
					<label class="label" for="phoneInput">電話</label>

					<div class="control">
						<span id="phoneSpan" class="forDisplay"></span>
						<input id="phoneInput" class="input forEdit displayNone"
							type="text" name="phone" value=""/>
					</div>
					<p class="help">*必填</p>
				</div>
				
				<!-- input 輸入格6 -->
				<div class="field">
					<label class="label" for="emailInput">電子信箱</label>

					<div class="control">
						<span id="emailSpan" class="forDisplay"></span>
						<input id="emailInput" class="input forEdit displayNone"
							type="text" name="email" value=""/>
					</div>
					<p class="help">*必填</p>
				</div>
				
				<!-- input 輸入格7 -->
				<div class="field">
					<label class="label" for="addressInput">住址</label>

					<div class="control">
						<span id="addressSpan" class="forDisplay"></span>
						<input id="addressInput" class="input forEdit displayNone"
							type="text" name="address" value=""/>
					</div>
					<p class="help">*必填</p>
				</div>
				
				<!-- input 輸入格8 -->
				<div class="field">
					<label class="label" for="hireDateInput">受聘日期</label>

					<div class="control">
						<span id="hireDateSpan" class="forDisplay"></span>
						<input id="hireDateInput" class="input forEdit displayNone"
							type="text" name="hireDate" value=""/>
					</div>
					<p class="help">*必填</p>
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
	</form>
</section>

<!-- 插入頁腳 -->
<jsp:directive.include file="/WEB-INF/pages/layout/backstage/footer.jsp" />

</div>

</body>
</html>
