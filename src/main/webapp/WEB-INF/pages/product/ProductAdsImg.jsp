<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
<title>商城廣告配置</title>


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

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<!--------------------------------------------------------------------------- -->

<!-- ajax -->
<script
	src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>

<link rel="icon" type="image/png" href="favicon.png" />
<link rel="icon" type="image/x-icon" href="favicon.ico" />
<link rel="mask-icon" href="safari-pinned-tab.svg" color="#00b4b6" />
<link rel="stylesheet"
	href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">


<!-- CSS only -->
<!-- <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous"> -->
<meta name="description" content="Admin One - free Tailwind dashboard">



</head>
<style>

.ip{
	margin-top: 5px;
	margin-bottom: 20px;
}

.ad{
	font-size: 100%;
	color: #000;
}

#img1{
	width: 70%;
	height: 70%;
	margin-bottom: 30px;
	margin-left: 65px;
}	
#img2{
	width: 70%;
	height: 70%;
	margin-bottom: 30px;
	margin-left: 65px;
}
#img3{
	width: 70%;
	height: 70%;
	margin-bottom: 30px;
	margin-left: 65px;
}
#img4{
	width: 70%;
	height: 70%;
	margin-bottom: 30px;
	margin-left: 65px;
}

#title {
	font-size: 140%;
}

#pageTitle {
	margin: auto;
}

#functionTitle {
	margin-left: 420px;
	margin: auto;
}

#btnChg {
	margin-left: 680px;
	width: 130px;
}

#btnNew{
	margin-left: 680px;
	width: 130px;
	margin-bottom: 20px;
}

#d1 {
	width: 520px;
	margin-left: 30px;
}

#d2 {
	margin: auto;
	width: 850px;
	margin-top: 20px;
	border: none;
	border-radius: 5px;
}

.card-header-title {
	font-size: 120%;
}

figure {
	width: 20%;
	border: 4px transparent;
	margin: 4px;
	width: 800px;
	height: 355px;
	float: right;
}

.adBox {
	margin-top: 20px;
	/* border-bottom: 1px dashed black; */
	padding-right: 15px;
	margin-bottom: 400px;
	
	
}

.productImg {
	width: 800px;
	height: 355px;
	filter: drop-shadow(9px 9px 5px #7B7B7B);
	border-radius: 5px;
	
}

.modal {
  position: fixed;
  top: 0;
  left: 0;
  z-index: 1055;
  display: none;
  width: 100%;
  height: 100%;
  overflow-x: hidden;
  overflow-y: auto;
  outline: 0;
}

.modal-dialog {
  position: relative;
  width: auto;
  margin: 0.5rem;
  pointer-events: none;
}
.modal.fade .modal-dialog {
  transition: transform 0.3s ease-out;
  transform: translate(0, -50px);
}
@media (prefers-reduced-motion: reduce) {
  .modal.fade .modal-dialog {
    transition: none;
  }
}
.modal.show .modal-dialog {
  transform: none;
}
.modal.modal-static .modal-dialog {
  transform: scale(1.02);
}

.modal-dialog-scrollable {
  height: calc(100% - 1rem);
}
.modal-dialog-scrollable .modal-content {
  max-height: 100%;
  overflow: hidden;
}
.modal-dialog-scrollable .modal-body {
  overflow-y: auto;
}

.modal-dialog-centered {
  display: flex;
  align-items: center;
  min-height: calc(100% - 1rem);
}

.modal-content {
  position: relative;
  display: flex;
  flex-direction: column;
  width: 100%;
  pointer-events: auto;
  background-color: #fff;
  background-clip: padding-box;
  border: 1px solid rgba(0, 0, 0, 0.2);
  border-radius: 0.3rem;
  outline: 0;
}

.modal-backdrop {
  position: fixed;
  top: 0;
  left: 0;
  z-index: 1050;
  width: 100vw;
  height: 100vh;
  background-color: #000;
}
.modal-backdrop.fade {
  opacity: 0;
}
.modal-backdrop.show {
  opacity: 0.5;
}

.modal-header {
  display: flex;
  flex-shrink: 0;
  align-items: center;
  justify-content: space-between;
  padding: 1rem 1rem;
  border-bottom: 1px solid #dee2e6;
  border-top-left-radius: calc(0.3rem - 1px);
  border-top-right-radius: calc(0.3rem - 1px);
}
.modal-header .btn-close {
  padding: 0.5rem 0.5rem;
  margin: -0.5rem -0.5rem -0.5rem auto;
}

.modal-title {
  margin-bottom: 0;
  line-height: 1.5;
}

.modal-body {
  position: relative;
  flex: 1 1 auto;
  padding: 1rem;
}

.modal-footer {
  display: flex;
  flex-wrap: wrap;
  flex-shrink: 0;
  align-items: center;
  justify-content: flex-end;
  padding: 0.75rem;
  border-top: 1px solid #dee2e6;
  border-bottom-right-radius: calc(0.3rem - 1px);
  border-bottom-left-radius: calc(0.3rem - 1px);
}
.modal-footer > * {
  margin: 0.25rem;
}

@media (min-width: 576px) {
  .modal-dialog {
    max-width: 500px;
    margin: 1.75rem auto;
  }

  .modal-dialog-scrollable {
    height: calc(100% - 3.5rem);
  }

  .modal-dialog-centered {
    min-height: calc(100% - 3.5rem);
  }

  .modal-sm {
    max-width: 300px;
  }
}
@media (min-width: 992px) {
  .modal-lg,
.modal-xl {
    max-width: 800px;
  }
}
@media (min-width: 1200px) {
  .modal-xl {
    max-width: 1140px;
  }
}
.modal-fullscreen {
  width: 100vw;
  max-width: none;
  height: 100%;
  margin: 0;
}
.modal-fullscreen .modal-content {
  height: 100%;
  border: 0;
  border-radius: 0;
}
.modal-fullscreen .modal-header {
  border-radius: 0;
}
.modal-fullscreen .modal-body {
  overflow-y: auto;
}
.modal-fullscreen .modal-footer {
  border-radius: 0;
}

@media (max-width: 575.98px) {
  .modal-fullscreen-sm-down {
    width: 100vw;
    max-width: none;
    height: 100%;
    margin: 0;
  }
  .modal-fullscreen-sm-down .modal-content {
    height: 100%;
    border: 0;
    border-radius: 0;
  }
  .modal-fullscreen-sm-down .modal-header {
    border-radius: 0;
  }
  .modal-fullscreen-sm-down .modal-body {
    overflow-y: auto;
  }
  .modal-fullscreen-sm-down .modal-footer {
    border-radius: 0;
  }
}
@media (max-width: 767.98px) {
  .modal-fullscreen-md-down {
    width: 100vw;
    max-width: none;
    height: 100%;
    margin: 0;
  }
  .modal-fullscreen-md-down .modal-content {
    height: 100%;
    border: 0;
    border-radius: 0;
  }
  .modal-fullscreen-md-down .modal-header {
    border-radius: 0;
  }
  .modal-fullscreen-md-down .modal-body {
    overflow-y: auto;
  }
  .modal-fullscreen-md-down .modal-footer {
    border-radius: 0;
  }
}
@media (max-width: 991.98px) {
  .modal-fullscreen-lg-down {
    width: 100vw;
    max-width: none;
    height: 100%;
    margin: 0;
  }
  .modal-fullscreen-lg-down .modal-content {
    height: 100%;
    border: 0;
    border-radius: 0;
  }
  .modal-fullscreen-lg-down .modal-header {
    border-radius: 0;
  }
  .modal-fullscreen-lg-down .modal-body {
    overflow-y: auto;
  }
  .modal-fullscreen-lg-down .modal-footer {
    border-radius: 0;
  }
}
@media (max-width: 1199.98px) {
  .modal-fullscreen-xl-down {
    width: 100vw;
    max-width: none;
    height: 100%;
    margin: 0;
  }
  .modal-fullscreen-xl-down .modal-content {
    height: 100%;
    border: 0;
    border-radius: 0;
  }
  .modal-fullscreen-xl-down .modal-header {
    border-radius: 0;
  }
  .modal-fullscreen-xl-down .modal-body {
    overflow-y: auto;
  }
  .modal-fullscreen-xl-down .modal-footer {
    border-radius: 0;
  }
}
@media (max-width: 1399.98px) {
  .modal-fullscreen-xxl-down {
    width: 100vw;
    max-width: none;
    height: 100%;
    margin: 0;
  }
  .modal-fullscreen-xxl-down .modal-content {
    height: 100%;
    border: 0;
    border-radius: 0;
  }
  .modal-fullscreen-xxl-down .modal-header {
    border-radius: 0;
  }
  .modal-fullscreen-xxl-down .modal-body {
    overflow-y: auto;
  }
  .modal-fullscreen-xxl-down .modal-footer {
    border-radius: 0;
  }
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




		<section class="is-hero-bar">
			<div
				class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
				<!-- <h1 id="pageTitle" class="title">廣告輪播圖配置</h1> -->

				<!-- <button class="button light">未完成頁面</button> -->
			</div>
		</section>

		<!--	================================ 新增圖片 Modal ====================================== -->

		<!-- <div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">

						<div class="modal-header">
							<h5 class="modal-title" id="staticBackdropLabel"><i class="bi bi-upload"></i>&nbsp新增廣告圖配置</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						  </div>

						<form id="insertAdForm" method="post" action="${contextRoot}/insertProductAds.controller"
							enctype="multipart/form-data">

								<div class="input-group mb-3">
									<input type="file" name="imgUrl_A" class="form-control"
										id="inputGroupFile01"> <label class="input-group-text"
										for="inputGroupFile01">廣告圖A</label>
								</div>

								<div class="input-group mb-3">
									<input type="file" name="imgUrl_B" class="form-control"
										id="inputGroupFile02"> <label class="input-group-text"
										for="inputGroupFile02">廣告圖B</label>
								</div>

								<div class="input-group mb-3">
									<input type="file" name="imgUrl_C" class="form-control"
										id="inputGroupFile03"> <label class="input-group-text"
										for="inputGroupFile04">廣告圖C</label>
								</div>

								<div class="input-group mb-3">
									<input type="file" name="imgUrl_D" class="form-control"
										id="inputGroupFile04"> <label class="input-group-text"
										for="inputGroupFile04">廣告圖D</label>
								</div>

								<div class="field">
									<label class="label">上架時間 </label>
									<div class="control">
										<input readonly id="" name="createdAt" class="input"
											type="text" value="">
									</div>
								</div>


								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">Close</button>
									<button type="button" id="insertImg" class="btn btn-warning">新增圖片</button>
								</div>
						</form>
					</div>
				</div>
			</div>
		</div> -->
		
		
		
		
		
	<!--======================================= 修改圖片 Modal ============================================ -->

		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
			  <div class="modal-content">
				<div class="modal-header">
				  <h5 class="modal-title" id="staticBackdropLabel"><i class="bi bi-plus-slash-minus"></i>&nbsp更換廣告配置</h5>
				  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>

				<div class="modal-body">
				<form id="changeForm" method="post" action="${contextRoot}/editProductAds"
					enctype="multipart/form-data">

					<div class="imgdiv">
						<img onerror="this.src='${contextRoot}/img/banner/banner9-removebg.png'" id="img1" class="productImg"
						src="">
					</div>
					
					<div class="input-group mb-3">
						<input hidden type="text" name="id" class="form-control"
							id="input0" value=""> <label hidden class="input-group-text"
							for="inputGroupFile02">編號</label>
					</div>

					<div class="input-group mb-3 ip">
						<input type="file" name="imgFile1" class="form-control"
							id=""> <label class="input-group-text"
							for="inputGroupFile02"></label>
							
						<input type="hidden" name="imgUrl_A" class="form-control"
							id="input1" value="">
							
					</div>
				
					<hr>

					<div class="imgdiv">
						<img onerror="this.src='${contextRoot}/img/banner/banner9-removebg.png'"  id="img2" class="productImg"
						src="">
					</div>

					<div class="input-group mb-3 ip">
						<input type="file" name="imgFile2" class="form-control"
							id=""> <label class="input-group-text"
							for="inputGroupFile02"></label>
						
						<input type="hidden" name="imgUrl_B" class="form-control"
							id="input2" value="">	
					</div>
					

					<hr>

					<div class="imgdiv">
						<img onerror="this.src='${contextRoot}/img/banner/banner9-removebg.png'"  id="img3" class="productImg"
						src="">
					</div>

					<div class="input-group mb-3 ip">
						<input type="file" name="imgFile3" class="form-control"
							id=""> <label class="input-group-text"
							for="inputGroupFile02"></label>
							
						<input type="hidden" name="imgUrl_C" class="form-control"
							id="input3" value="">
					</div>
				
					<hr>

					<div class="imgdiv">
						<img onerror="this.src='${contextRoot}/img/banner/banner9-removebg.png'"  id="img4" class="productImg"
						src="">
					</div>

					<div class="input-group mb-3 ip">
						<input type="file" name="imgFile4" class="form-control"
							id=""> <label class="input-group-text"
							for="inputGroupFile02"></label>
							
						<input type="hidden" name="imgUrl_D" class="form-control"
							id="input4" value="">
					</div>
			
					<hr>
					
					<div  class="field">
<!-- 						<label  class="label">修改時間 </label> -->
							<input hidden id="" name="createdAt" class="input"
								type="hidden" value="">
						<div class="control">
							<input hidden readonly id="" name="modifiedAt" class="input"
								type="text" value="">
						</div>
					</div>

					<div class="modal-footer">
						<button type="button" class="button light"
							data-bs-dismiss="modal">取消</button>
						<button type="button" id="btnChange" class="button light">更改圖片</button>
					</div>
				</form>
			</div>

			  </div>
			</div>
		  </div>
		

		<!-- 	====================================================================================== -->
		

		<section class="is-hero-bar">
			<div
				class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
				<h1 id="functionTitle" align="center" class="title"><i class="bi bi-badge-ad-fill ad"></i>&nbsp購物商城廣告配置</h1>
				<!-- <button class="button light">Button</button> -->
			</div>
		</section>

		<div class="card" id=d2>
		
		
			<!-- <button id="btnNew" type="button" class="btn btn-warning"
				data-bs-toggle="modal" data-bs-target="#exampleModal"
				data-bs-whatever="@mdo"><i class="bi bi-plus-square-fill"></i>&nbsp新增廣告圖</button> -->


		<form method="post" action="${contextRoot}/getOneProductAds">
			<button id="btnChg" type="button" class="button blue" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
				<i class="bi bi-gear-wide-connected"></i>&nbsp更改廣告圖
			</button>
		</form>
		
		



	<!--=============================================================================================== -->

	
			<c:forEach items="${prodAds}" var="prodAds"> 

				<div class="card-content adBox">
					<label class="label">
						</label>
					<figure>
						<img id="img11" class="productImg"
							src="">
					</figure>
				</div>


				<div  class="card-content adBox">
					<label class="label"></label>

					<figure>
						<img id="img22" class="productImg"
							src="">
					</figure>
				</div>

				<div  class="card-content adBox">
					<label class="label"></label>

					<figure>
						<img id="img33" class="productImg"
							src="">
					</figure>
				</div>

				<div  class="card-content adBox">
					<label class="label"></label>

					<figure>
						<img id="img44" class="productImg"
							src="">
					</figure>
				</div>

 			</c:forEach>
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



		<!-- ================================================================================ -->



		
		
		
		<!-- =============================== 抓取圖片資料 =================================== -->


		<script>

		$(document).ready(function getAllPtoto(){
			
			$.ajax({
				url:$("#contextRoot").val() +"/shopCenterProductAds.controller",
				type:"post",
				success:function(productAds){
					console.log(productAds)
					// for modal
					$("#img1").attr("src", $("#contextRoot").val()+"/ProductTempImg/"+productAds.imgUrl_A);
					$("#img2").attr("src", $("#contextRoot").val()+"/ProductTempImg/"+productAds.imgUrl_B);
					$("#img3").attr("src", $("#contextRoot").val()+"/ProductTempImg/"+productAds.imgUrl_C);
					$("#img4").attr("src", $("#contextRoot").val()+"/ProductTempImg/"+productAds.imgUrl_D);
					
					// for page
					$("#img11").attr("src", $("#contextRoot").val()+"/ProductTempImg/"+productAds.imgUrl_A);
					$("#img22").attr("src", $("#contextRoot").val()+"/ProductTempImg/"+productAds.imgUrl_B);
					$("#img33").attr("src", $("#contextRoot").val()+"/ProductTempImg/"+productAds.imgUrl_C);
					$("#img44").attr("src", $("#contextRoot").val()+"/ProductTempImg/"+productAds.imgUrl_D);

				}
			})

			if($("#img11").val() != null || $("#img11").val() != ""){
				$("#btnNew").attr("disabled",)
			}
		}
	)
	</script>




	<script>
		$("#btnChg").click(function getphoto(){

			$.ajax({
				url:$("#contextRoot").val() +"/getOneProductAds",
				type:"post",
				success:function(pd){
					
					$("#input0").val(pd.id)
					$("#input1").val(pd.imgUrl_A)
					$("#input2").val(pd.imgUrl_B)
					$("#input3").val(pd.imgUrl_C)
					$("#input4").val(pd.imgUrl_D)
					
					console.log(pd.imgUrl_A);

				}
			})
		})

	</script>

	<!--sweetalert 廣告修改確認-->
	<script type="text/javascript">

		$('#btnChange').click(function() {
			Swal.fire({
			title: '確定修改?',
			showDenyButton: true,
			showCancelButton: true,
			confirmButtonText: '儲存修改',
			denyButtonText: `放棄修改`,
			}).then((result) => {
			/* Read more about isConfirmed, isDenied below */
			if (result.isConfirmed) {
				Swal.fire('修改成功', '', 'success')

				setTimeout(editAds,2000)

			} else if (result.isDenied) {
				Swal.fire('圖片未儲存', '', 'info')
			}
			})
		});

		function editAds(){
			$("#changeForm").submit();
		}

	</script>

	
					<!--sweetalert 新增廣告圖-->
					<script>
						$("#insertImg").click(function(){

							Swal.fire(
								'新增成功!',
								'',
								'success'
								)		
							setTimeout(insertAd,1700)	
						})
						function insertAd () {
								$("#insertAdForm").submit()
								}
					</script>

	<!-- ================================================================================= -->



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
		<!-- JavaScript Bundle with Popper -->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
			crossorigin="anonymous"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
		<!------------------------------ JS------------------------------------------------ -->


</body>

</html>