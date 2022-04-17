<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="tw.nicesport.model.ProductBean"%>
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
<link rel="apple-touch-icon" sizes="180x180"
	href="${contextRoot}/resources/backstage/apple-touch-icon.png" />
<link rel="icon" type="image/png" sizes="32x32"
	href="${contextRoot}/resources/backstage/favicon-32x32.png" />
<link rel="icon" type="image/png" sizes="16x16"
	href="${contextRoot}/resources/backstage/favicon-16x16.png" />
<!--------------------------------------------------------------------------- -->



<!-- Tailwind is included -->
<link rel="stylesheet" href="css/main.css?v=1628755089081">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="js/main.js">



<!-- ajax -->
<script
	src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="icon" type="image/png" href="favicon.png" />
<link rel="icon" type="image/x-icon" href="favicon.ico" />
<link rel="mask-icon" href="safari-pinned-tab.svg" color="#00b4b6" />
<link rel="stylesheet"
	href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">

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
}

#d2 {
	margin: auto;
	width: 600px;
	margin-top: 20px;
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
</style>

<body>

	<!-- 	為了讓body內也能使用contextRoot的值 -->
	<input type="hidden" id="contextRoot"
		value="${pageContext.request.contextPath}">


	<!--主要外層Div -->
	<div id="app">

		<!-- 上方導覽列 -->
		<%@include file="TopBar.jsp"%>

		<!-- 左側導覽列 -->
		<%@include file="LeftBar.jsp"%>




		<section class="is-hero-bar">
			<div
				class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
				<h1 id="pageTitle" class="title">商品詳細資訊</h1>
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
						<img src="${contextRoot}/ProductTempImg/${pdVal.imgUrl_A}">
					</figure>

					<figure>
						<img src="${contextRoot}/ProductTempImg/${pdVal.imgUrl_B}">
					</figure>

					<figure>
						<img src="${contextRoot}/ProductTempImg/${pdVal.imgUrl_C}">
					</figure>

					<figure>
						<img src="${contextRoot}/ProductTempImg/${pdVal.imgUrl_D}">
					</figure>

				</div>
			</div>

			<form action="editProduct" method="post"
				enctype="multipart/form-data">
				<div class="field">
					<!-- 					<label class="label">商品編號</label> -->
					<div class="control">
						<input name="product_id" type="text" readonly
							value="${product_id}" class="input is-static">
					</div>
				</div>

				<div class="field">
					<label class="label">變更商品照片</label>
					<div class="control">
						<input id="imgFile" name="imgFile" class="input" type="file"
							value="">
						<!-- 						<input id="imgFile1" name="imgFile1" class="input" type="file" -->
						<!-- 							value=""> -->
						<!-- 						<input id="imgFile2" name="imgFile2" class="input" type="file" -->
						<!-- 							value=""> -->
						<!-- 						<input id="imgFile3" name="imgFile3" class="input" type="file" -->
						<!-- 							value=""> -->
						<!-- 						<input id="imgFile4" name="imgFile4" class="input" type="file" -->
						<!-- 							value=""> -->

					</div>
				</div>
				<!-- 為保留原圖片 -->
				<input id="img" type="hidden" name="img" class="input" type="text"
					value="${pdVal.img}"> <input id="imgUrl" type="hidden"
					name="imgUrl" class="input" type="text" value="${pdVal.imgUrl}">

				<input id="imgUrl_A" type="hidden" name="imgUrl_A" class="input"
					type="text" value="${pdVal.imgUrl_A}"> <input id="imgUrl_B"
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
							<option type="hidden" value="${pdVal.subCategory.subcategory_id}">${pdVal.subCategory.name}</option>
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
							value="">
					</div>
				</div>

				<div class="field">
					<div class="control">
						<button type="submit" class="button green">更新商品</button>
						<span>${error}</span>
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









	<!-- Scripts below are for demo only -->
	<script type="text/javascript" src="js/main.min.js?v=1628755089081"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
	<script type="text/javascript" src="js/chart.sample.min.js"></script>
	<noscript>
		<img height="1" width="1" style="display: none"
			src="https://www.facebook.com/tr?id=658339141622648&ev=PageView&noscript=1" />
	</noscript>
	<!-- Icons below are for demo only. Feel free to use any icon pack. Docs: https://bulma.io/documentation/elements/icon/ -->





</body>
</html>