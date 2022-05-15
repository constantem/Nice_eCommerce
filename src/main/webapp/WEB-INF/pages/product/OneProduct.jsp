<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en" class="">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Nice_eCommerce_MainPage</title>


<!----------------------------- CSS------------------------------------------ -->
<c:set var="contextRoot" value="${pageContext.request.contextPath}"></c:set>
<link href="${contextRoot}/resources/backstage/css/main.css"
	rel="stylesheet" />
<link href="${contextRoot}/css/jquery-ui.theme.css" rel="stylesheet" />
<link href="${contextRoot}/css/jquery-ui.theme.min.css" rel="stylesheet" />
<link rel="icon" type="image/png" sizes="32x32"
	href="${contextRoot}/resources/backstage/favicon-32x32.png" />
<link rel="icon" type="image/png" sizes="16x16"
	href="${contextRoot}/resources/backstage/favicon-16x16.png" />
<!--------------------------------------------------------------------------- -->

<!-- ajax -->
<script
	src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<link rel="stylesheet"
	href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

<meta name="description" content="Admin One - free Tailwind dashboard">



</head>
<style>
#title {
	font-size: 140%;
}

#pageTitle {
	margin: auto;
}

#functionTitle {
	margin-left: 420px;
}

#d1 {
	width: 520px;
	margin-left: 30px;
	margin: auto;
}

#d2 {
	width: 650px;
	background-color: white;
	margin: auto;
	padding: 30px;
	margin-top: 20px;
	filter: drop-shadow(7px 7px 7px #a1a0a0);
	border-radius: 15px;
}

.card-header-title {
	font-size: 120%;
}

figure {
	width: 20%;
	border: 4px transparent;
	margin: 4px;
	width: 120px;
	height: 120px;
	float: right;
}

#imgFile {
	margin-top: 10px;
	margin-bottom: 15px;
}

#imgFile1 {
	margin-top: 10px;
}

#imgFile2 {
	margin-top: 10px;
}

#imgFile3 {
	margin-top: 10px;
}

#imgFile4 {
	margin-top: 10px;
}

.imgTag {
	margin-right: 400px;
	color: #2894FF;
}

#saveChange {
	margin-left: 250px;
	width: 90px;
	background-color: #2894FF;
	border: none;
}

#saveChange:hover {
	background-color: #0873dd;
	transition: 0.3s;
}
</style>

<body>

	<!-- 	為了讓body內也能使用contextRoot的值 -->
	<input type="hidden" id="contextRoot"
		value="${pageContext.request.contextPath}">


	<!--主要外層Div -->
	<div id="app">

		<!-- 插入上導覽列與左導覽列 -->
		<jsp:directive.include
			file="/WEB-INF/pages/layout/backstage/nav-and-aside.jsp" />
			
		<section class="is-title-bar">
			<div
				class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
				<ul>
					<li>管理系統</li>
					<li>商品管理</li>
				</ul>
			</div>
		</section>




		<section class="is-hero-bar">
			<div
				class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
				<h1 id="pageTitle" class="title">
					<i class="bi bi-info-square-fill"></i>&nbsp商品詳細資訊
				</h1>
				<button class="button light">Button</button>
			</div>
		</section>



		<div class="card" id=d2>
			<header class="card-header">
				<p class="card-header-title">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
              					 <path
							d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z" />
								</svg>
					&nbsp 修改商品資料
				</p>
			</header>

			<div class="card-content">
				<label class="label">商品圖片</label>
				<div class="image mx-auto">

					<img src="${contextRoot}/ProductTempImg/${pdVal.imgUrl}"
						alt="picture" id="productImg">

					<figure>
						<img onerror="this.style.display='none'" alt="&nbsp圖片未上傳"
							src="${contextRoot}/ProductTempImg/${pdVal.imgUrl_A}">
					</figure>

					<figure>
						<img onerror="this.style.display='none'" alt="&nbsp圖片未上傳"
							src="${contextRoot}/ProductTempImg/${pdVal.imgUrl_B}">
					</figure>

					<figure>
						<img onerror="this.style.display='none'" alt="&nbsp圖片未上傳"
							src="${contextRoot}/ProductTempImg/${pdVal.imgUrl_C}">
					</figure>

					<figure>
						<img onerror="this.style.display='none'" alt="&nbsp圖片未上傳"
							src="${contextRoot}/ProductTempImg/${pdVal.imgUrl_D}">
					</figure>

				</div>
			</div>

			<form id="editForm" action="${contextRoot}/editProduct" method="post"
				enctype="multipart/form-data">

				<div class="field">
					<!-- 					<label class="label">商品編號</label> -->
					<div class="control">
						<input name="id" type="text" readonly value="${id}"
							class="input is-static">
					</div>
					<input type="hidden" name="id" value="${pdVal.id}">
				</div>

				<div class="field">
					<label class="label">變更商品照片</label>
					<div class="control">

						<span class="imgTag"><i class="bi bi-camera-fill"></i>&nbsp
							商品主圖</span> <input id="imgFile" name="imgFile" class="input" type="file"
							value="">

						<hr>

						<input id="imgFile1" name="imgFile1" class="input" type="file"
							value=""> <input id="imgFile2" name="imgFile2"
							class="input" type="file" value=""> <input id="imgFile3"
							name="imgFile3" class="input" type="file" value=""> <input
							id="imgFile4" name="imgFile4" class="input" type="file" value="">

					</div>
				</div>
				<!-- 為保留原圖片 -->
				<%-- 			<input id="img" type="hidden" name="img" class="input" type="text" value="${pdVal.img}"> --%>

				<input id="imgUrl" type="hidden" name="imgUrl" class="input"
					type="text" value="${pdVal.imgUrl}"> <input id="imgUrl_A"
					type="hidden" name="imgUrl_A" class="input" type="text"
					value="${pdVal.imgUrl_A}"> <input id="imgUrl_B"
					type="hidden" name="imgUrl_B" class="input" type="text"
					value="${pdVal.imgUrl_B}"> <input id="imgUrl_C"
					type="hidden" name="imgUrl_C" class="input" type="text"
					value="${pdVal.imgUrl_C}"> <input id="imgUrl_D"
					type="hidden" name="imgUrl_D" class="input" type="text"
					value="${pdVal.imgUrl_D}">

				<div class="field">
					<label class="label">商品名稱</label>
					<div class="control">
						<input type="text" name="productName" value="${pdVal.productName}"
							class="input is-static">
					</div>
				</div>

				<div class="field">
					<label class="label">商品類別</label>
					<div class="select">
						<select id="subcategorySelect" name="subcategory_id">
							<option type="" value="${pdVal.subCategory.subcategory_id}">${pdVal.subCategory.name}</option>
						</select>
					</div>
				</div>

				<div class="field">
					<label class="label">商品描述</label>
					<div class="control">
						<textarea name="productDiscription" class="textarea"
							placeholder="">${pdVal.productDiscription}</textarea>
					</div>
				</div>

				<div class="field">
					<label class="label">供應商</label>
					<div class="control">
						<input type="text" name="supplier" value="${pdVal.supplier}"
							class="input is-static">
					</div>
				</div>

				<div class="field">
					<label class="label">商品顏色</label>
					<div class="control">
						<input type="text" name="color" value="${pdVal.color}"
							class="input is-static">
					</div>
				</div>

				<div class="field">
					<label class="label">商品尺寸</label>
					<div class="control">
						<input type="text" name="size" value="${pdVal.size}"
							class="input is-static">
					</div>
				</div>

				<div class="field">
					<label class="label">商品重量</label>
					<div class="control">
						<input type="text" name="weight" value="${pdVal.weight}"
							class="input is-static">
					</div>
				</div>

				<div class="field">
					<label class="label">商品價格</label>
					<div class="control">
						<input type="text" name="price" value="${pdVal.price}"
							class="input is-static">
					</div>
				</div>

				<div class="field">
					<label class="label">庫存量</label>
					<div class="control">
						<input id="quantity" type="text" name="stock.quantity"
							value="${pdVal.stock.quantity}" class="input is-static">
					</div>
				</div>



				<div class="field">
					<label class="label">修改時間 </label>
					<div class="control">
						<input id="modifiedAt" name="modifiedAt" class="input" type="text"
							value=""> <input id="" name="createdAt" class="input"
							type="hidden" value="${pdVal.createdAt}">
					</div>
				</div>

				<div class="field">
					<div class="control">
						<button id="saveChange" type="button" class="button green">
							<i class="bi bi-pencil-square"></i>&nbsp修改
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>




	<footer class="footer">
		<div
			class="flex flex-col md:flex-row items-center justify-between space-y-3 md:space-y-0">
			<div class="flex items-center justify-start space-x-3">
				<div>Nice eCommerce</div>

				<div>
					<p>
						, All Right Reserved.<a href="" target="_blank"></a>
					</p>
				</div>
			</div>
		</div>
	</footer>






	<!-- ================================================================================ -->



	<script>
		$(window).load(function() {

			if ($("#quantity").text() < 50) {
				$(this).css("color", "#FF3333")
			} else {

			}
		});
	</script>


	<script>
		requestAllSubcategory();

		function requestAllSubcategory() {
			$("#subcategorySelect").html("");

			$.ajax({
				url : $("#contextRoot").val()
						+ "/queryAllSubCategory.controller",
				type : 'post',
				success : function(subcategories) {
					$("#subcategorySelect").append('<option type="" value="${pdVal.subCategory.subcategory_id}">${pdVal.subCategory.name}</option>')
					$.each(subcategories, function(index, subcategory) {
						var newOption = $("<option></option>").val(
								subcategory.subcategory_id).text(
								subcategory.name)

						$("#subcategorySelect").append(newOption);
					});
				}
			});
		}
	</script>

	<script type="text/javascript">

		$('#saveChange').click(function() {
			Swal.fire({
			title: '確定修改?',
			showDenyButton: true,
			confirmButtonText: '儲存修改',
			denyButtonText: `放棄修改`,
			}).then((result) => {
			/* Read more about isConfirmed, isDenied below */
			if (result.isConfirmed) {
				Swal.fire('修改成功', '', 'success')


				setTimeout(editProduct,1500)
			} else if (result.isDenied) {
				Swal.fire('修改資料未儲存', '', 'info')
			}
			})
		});

		function editProduct(){
			$("#editForm").submit();
		}

		
	</script>



	<!-- ================================================================================ -->





	<!------------------------------ JS------------------------------------------------ -->
	<script src="${contextRoot}/resources/js/main.min.js?v=1628755089081"></script>
	<script src="${contextRoot}/resources/js/chart.sample.js"></script>
	<script src="${contextRoot}/resources/js/chart.sample.min.js"></script>
	<script src="${contextRoot}/resources/js/main.js"></script>
	<script src="${contextRoot}/resources/js/main.min.js"></script>
	<script src="${contextRoot}/resources/js/jquery-3.6.0.js"></script>
	<script src="${contextRoot}/resources/js/bootstrap.bundle.min.js"></script>
	<script src="${contextRoot}/resources/js/jquery-1.4.4.min.js"></script>
	<script src="${contextRoot}/resources/js/jquery-ui.js"></script>
	<!------------------------------ JS------------------------------------------------ -->


</body>
</html>