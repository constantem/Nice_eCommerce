<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="tw.nicesport.model.ProductBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en" class="">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Nice_eCommerce_InsertProductPage</title>


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
<link rel="apple-touch-icon" sizes="180x180" href="apple-touch-icon.png" />
<link rel="icon" type="image/png" sizes="32x32" href="favicon-32x32.png" />
<link rel="icon" type="image/png" sizes="16x16" href="favicon-16x16.png" />
<link rel="mask-icon" href="safari-pinned-tab.svg" color="#00b4b6" />
<link rel="stylesheet"
	href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">


<meta name="description" content="Admin One - free Tailwind dashboard">



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

<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
	crossorigin="anonymous"></script>

</head>

<style>
#title {
	font-size: 140%;
}

#insertDiv {
	width: 650px;
	background-color: white;
	margin-left: 350px;
	margin: auto;
	padding: 30px;
	margin-top: 20px;
	filter: drop-shadow(7px 7px 7px #a1a0a0);
	border-radius: 15px;
	
}

 #photoLabel{
	color: red;
} 

#btn1 {
	margin-left: 150px;
}

#InputData {
	width: 90px;
}

#functionTitle {
	margin-left: 480px;
}

#btn {
	margin-left: 380px;
	float: left;
}

#svg {
	color: #2894FF;
}

.imgTag {
	margin-right: 500px;
	color: #2894FF;
}

#img {
	margin-top: 10px;
}

#img1 {
	margin-top: 10px;
	margin-bottom: 15px;
}
.lb{
	margin-right: 500px;
	color: #2894FF	;

}

</style>

<body>


	<!-- 	為了讓body內也能使用contextRoot的值 -->
	<input type="hidden" id="contextRoot"
		value="${pageContext.request.contextPath}">



	<!--主要外層Div -->
	<div id="app">


			<!-- 插入上導覽列與左導覽列 -->
			<jsp:directive.include file="/WEB-INF/pages/layout/backstage/nav-and-aside.jsp" />



		<section class="is-title-bar">
			<div
				class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">

			</div>
		</section>

		<section class="is-hero-bar">
			<div
				class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
				<h1 id="functionTitle" align="center" class="title">商品上架系統</h1>
				<button class="button light">Button</button>
			</div>
		</section>

		<div id="insertDiv" align="center">

			<div align="center">

				<form id="insertForm" method="post" action="insertProduct.controller"
					enctype="multipart/form-data">
					<div id="div1">


						<div class="field">
							<label class="label">商品名稱</label>
							<div class="control">
								<input id="productName" name="productName" class="input"
									type="text" value="">
							</div>
						</div>

						<div class="field">
							<label class="label">商品類別</label>
							<div class="control">

								<button id="btn" onclick="addCat();" class="button light"
									type="button">
									<i id="svg" class="bi bi-plus-square-fill"></i>&nbsp 新增類別
								</button>

								<div class="select">
									<select id="categorySelect" name="category_id">
									</select>
								</div>
							</div>
						</div>

						<div class="field">
							<label class="label">商品子類別</label>
							<div class="control">
								<button id="btn" onclick="addSubCat();" class="button light"
									type="button">
									<i id="svg" class="bi bi-plus-square-fill"></i>&nbsp 新增子類別
								</button>

								<div class="select">
									<select id="subcategorySelect" name="subcategory_id">
									</select>
								</div>
							</div>
						</div>


						<div class="field">
							<label class="label">供應商</label>
							<div class="control">
								<input id="supplier" name="supplier" class="input" type="text"
									value="">
							</div>
						</div>


						<div class="field">
							<label class="label">商品顏色</label>
							<div class="control">
								<input id="color" name="color" class="input" type="text"
									value="">
							</div>
						</div>

						<div class="field">
							<label class="label">商品尺寸</label>
							<div class="control">
								<input id="size" name="size" class="input" type="text" value="">
							</div>
						</div>
						<div class="field">
							<label class="label">商品重量 </label>
							<div class="control">
								<input id="weight" name="weight" class="input" type="text"
									value="">
							</div>
						</div>

						<div class="field">
							<label  class="label">商品照片</label>
							<label id="photoLabel">(最少選擇兩張商品照)</label>
							<div class="control">
								<span class="imgTag"><i class="bi bi-images"></i>&nbsp
									商品主圖</span>
							    <input id="img1" name="img" class="input" type="file" value="">

								<hr>
								<label class="lb">商品照A</label>
								<input id="img" name="imgUrl_A" class="input imgA" type="file" value="">
								
								</i><label class="lb">商品照B</label>
								<input id="img" name="imgUrl_B" class="input imgB" type="file" value="">

								<label class="lb">商品照C</label>
								<input id="img" name="imgUrl_C" class="input imgC" type="file" value="">

								<label class="lb">商品照D</label>
								<input id="img" name="imgUrl_D" class="input imgD" type="file" value="">
							</div>
						</div>

						<div class="field">
							<label class="label">商品價格</label>
							<div class="control">
								<input id="price" name="price" class="input" type="text"
									value="">
							</div>
						</div>

						<div class="field">
							<label class="label">庫存數量 </label>
							<div class="control">
								<input id="quantity" name="quantity" class="input" type="text"
									value="">
							</div>
						</div>

						<div class="field">
							<label class="label">商品描述</label>
							<div class="control">
								<textarea id="productDiscription" name="productDiscription" class="textarea"
									placeholder="輸入商品描述"></textarea>
							</div>
						</div>

						<div class="field">
							<label class="label">上架時間 </label>
							<div class="control">
								<input id="createdAt" name="createdAt" class="input" type="text"
									value="">
							</div>
						</div>


						<div id="div2" class="input-group mb-3">

							<div class="field grouped">
								<div class="control">
									</i><button id="btn1" type="button" class="button green"><i class="bi bi-upload"></i>&nbsp上架</button>
								</div>
								<div class="control">
									<button id="btnreset" type="reset" class="button red">重置</button>
								</div>

								<div id="div4" class="input-group mb-3">
									<input id="InputData" type="button" class="button blue"
										value="一鍵輸入"
										aria-label="Dollar amount (with dot and two decimal places)">
								</div>

							</div>

						</div>
					</div>
				</form>
			</div>

			<!--========================== addSubCategory Dialog==========================  -->

			<form id="inputSubCat" method="post"
				action="insertSubCategory.controller">
				<div id="addSubCategory" title="">

					<p id="dialog-form"
						class="ui-widget ui-widget-content ui-corner-all">
						<i class="bi bi-plus-circle-dotted"></i>&nbsp 輸入欲新增子類別名稱:
					</p>

<!-- 					<div class="select"> -->
<!-- 						<select  id="categorySelect" name="category_id"> -->
<!-- 						</select> -->
<!-- 					</div> -->

					<input id="createSubcategory" name="name"
						class="input" type="text" value="">
				</div>
			</form>
			<!--========================== addSubCategory Dialog==========================  -->

			<!--========================== addCategory Dialog==========================  -->

			<form id="inputSubCat" method="post"
				action="insertSubCategory.controller">
				<div id="addCategory" title="">

					<p id="dialog-form"
						class="ui-widget ui-widget-content ui-corner-all">
						<i class="bi bi-plus-circle-dotted"></i>&nbsp 輸入欲新增類別名稱:
					</p>

					<input id="createCategory" name="name" class="input" type="text"
						value="">
				</div>
			</form>
			<!--========================== addCategory Dialog==========================  -->



		</div>
	</div>


	<footer class="footer">
		<div
			class="flex flex-col md:flex-row items-center justify-between space-y-3 md:space-y-0">
			<div class="flex items-center justify-start space-x-3">
				<div></div>

				<div>
					<p>
						<a href="" target="_blank"></a>
					</p>
				</div>
			</div>



		</div>
	</footer>


	<!-- Scripts below are for demo only -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>

	<script type="text/javascript" src="js/main.min.js?v=1628755089081"></script>
	<script type="text/javascript" src="../js/jquery.js"></script>
	<script type="text/javascript" src="../js/jquery-ui.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
	<script type="text/javascript" src="js/chart.sample.min.js"></script>


	<script>
		$("#InputData").on("click", function() {
			$("#productName").attr("value", "New Balance鞋")
			$("#supplier").attr("value", "New Balance")
			$("#color").attr("value", "灰")
			$("#size").attr("value", "US9")
			$("#weight").attr("value", "234g")
			$("#price").attr("value", "2350")
			$("#quantity").attr("value", "0")
			$("#productDiscription").attr("value","997H是經典997的次世代進化型號，為追求獨特風格的人群而生，將90年代經典鞋款大膽重塑，向永恆長青傳統致敬。 此款為復古慢跑鞋")
		})

		$("#btnreset").on("click", function() {
			$("#Name").attr("value", "")
			$("#supplier").attr("value", "")
			$("#color").attr("value", "")
			$("#size").attr("value", "")
			$("#weight").attr("value", "")
			$("#price").attr("value", "")
			$("#quantity").attr("value", "")
		})
	</script>
	<!-- ================================================================================ -->

	<!--sweetalert 新增商品-->
	<script>
		// $("#btn1").click(function(){

		// 	Swal.fire(
		// 		'新增成功!',
		// 		'',
		// 		'success'
		// 		)		
		// 	setTimeout(insert,1800)	
		// })
		function insert () {
				$("#insertForm").submit()
    			}


		$("#btn1").click(function(){
			if($("#productName").val()=="" || $("#productName").val()==null){
				Swal.fire({
					position: 'center',
					icon: 'error',
					title: '商品名稱不可空白',
					showConfirmButton: false,
					timer: 2000
				})
			}else if($("#price").val()=="" || $("#price").val()==null){
				Swal.fire({
					position: 'center',
					icon: 'error',
					title: '商品價格不可空白',
					showConfirmButton: false,
					timer: 2000
				})
			}else if($("#quantity").val()=="" || $("#quantity").val()==null){
				Swal.fire({
					position: 'center',
					icon: 'error',
					title: '商品庫存數量不可空白',
					showConfirmButton: false,
					timer: 2000
				})
			}else if($("#img1").val()=="" || $("#img1").val()==null){
				Swal.fire({
					position: 'center',
					icon: 'error',
					title: '商品照不可空白',
					showConfirmButton: false,
					timer: 2000
				})
			}else if($(".imgA").val()=="" || $(".imgA").val()==null){
				Swal.fire({
					position: 'center',
					icon: 'error',
					title: '至少選擇二張商品照片',
					showConfirmButton: false,
					timer: 2000
				})
			}
			else{
				Swal.fire(
				'新增成功!',
				'',
				'success'
				)		
			setTimeout("insert()",1500)	
			}
		})		
	</script>



	<script type="text/javascript">
		$("#addCategory").hide();
		$("#addSubCategory").hide();

		requestAllSubcategory();
		requestAllCategory();

		function addSubCat() {
			requestAllCategory();
			$("#addSubCategory").dialog(

					{
						height : 300,
						width : 300,
						modal : true,
						draggable : true,
						minWidth : 200,
						buttons : {
							"新增" : function() {

								var subCategoryName = $("#createSubcategory")
										.val();

								$.ajax({
									url : $("#contextRoot").val()
											+ "/insertSubCategory.controller",
									type : 'post',
									contentType : "text/html;charset=utf-8",
									data : subCategoryName,
									success : function(result) {
										if (result == "insertSuccess") {
											requestAllSubcategory()
										}
									}
								})
								alert("新增完成");
								$(this).dialog("close");
							}
						}
					});
		}

		function addCat() {
			$("#addCategory").dialog(
					{
						height : 300,
						width : 300,
						modal : true,
						draggable : true,
						minWidth : 200,
						buttons : {
							"新增" : function() {

								var CategoryName = $("#createCategory").val();
								$.ajax({
									url : $("#contextRoot").val()
											+ "/insertCategory.controller",
									type : 'post',
									contentType : "text/html;charset=utf-8",
									data : CategoryName,
									success : function(result) {
										if (result == "insertSuccess") {
											requestAllCategory()
										}
									}
								})
								alert("新增完成");
								$(this).dialog("close");
							}
						}
					});
		}

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

		function requestAllCategory() {

			$("#categorySelect").html("");
			$.ajax({
				url : $("#contextRoot").val() + "/queryAllCategory.controller",
				type : "post",
				success : function(categories) {
					$.each(categories, function(index, category) {
						var newCatOption = $("<option></option>").val(
								category.category_id).text(category.name)
						$("#categorySelect").append(newCatOption);
					});
				}
			});
		}


		// vaPhoto();
		// function vaPhoto(){

		// 	if($(".imgA").val() == "" || $(".imgA").val()== null ){
				
		// 	}else{
		// 		$("#photoLabel").attr("hidden","hidden")
		// 	}
		// }

		$(".imgA").change(function(){
			if($(".imgA").val() == "" || $(".imgA").val()== null
			 &&$("#img1").val()=="" || $("#img1").val()==null
			){
				
			}else{
				$("#photoLabel").text("");
			}
		})

	
	</script>

	







	<!-- ================================================================================ -->



	<noscript>
		<img height="1" width="1" style="display: none"
			src="https://www.facebook.com/tr?id=658339141622648&ev=PageView&noscript=1" />
	</noscript>

<!-- 	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- 	<script src="sweetalert2.all.min.js"></script> -->

	<!-- Icons below are for demo only. Feel free to use any icon pack. Docs: https://bulma.io/documentation/elements/icon/ -->

	<!------------------------------ JS------------------------------------------------ -->
	<script src="${contextRoot}/resources/js/main.min.js?v=1628755089081"></script>
	<script src="${contextRoot}/resources/js/chart.sample.js"></script>
	<script src="${contextRoot}/resources/js/chart.sample.min.js"></script>
	<script src="${contextRoot}/resources/js/main.js"></script>
	<script src="${contextRoot}/resources/js/main.min.js"></script>
	<script src="${contextRoot}/resources/js/jquery-3.6.0.js"></script>
	<script src="${contextRoot}/resources/js/jquery-1.4.4.min.js"></script>
	<script src="${contextRoot}/resources/js/jquery-ui.js"></script>
	<script src="${contextRoot}/resources/js/bootstrap.bundle.min.js"></script>
	<!------------------------------ JS------------------------------------------------ -->



</body>

</html>