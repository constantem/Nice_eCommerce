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
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">



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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<meta name="description" content="Admin One - free Tailwind dashboard">



</head>
<style>

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
}

.productImg {
	width: 800px;
	height: 355px;
	filter: drop-shadow(9px 9px 5px #7B7B7B);
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
				<h1 id="pageTitle" class="title">廣告輪播圖配置</h1>

				<button class="button light">未完成頁面</button>
			</div>
		</section>

		<!--	================================ 新增圖片 Modal ====================================== -->

		<div class="modal fade" id="exampleModal" tabindex="-1"
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
		</div>
		
		
		
		
		
	<!--======================================= 修改圖片 Modal ============================================ -->

		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
			  <div class="modal-content">
				<div class="modal-header">
				  <h5 class="modal-title" id="staticBackdropLabel"><i class="bi bi-gear-wide-connected"></i>&nbsp更換廣告配置</h5>
				  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>

				<div class="modal-body">
				<form id="changeForm" method="post" action="${contextRoot}/editProductAds"
					enctype="multipart/form-data">

					<div class="imgdiv">
						<img id="img1" class="productImg"
						src="">
					</div>
					
					<div class="input-group mb-3">
						<input hidden type="text" name="id" class="form-control"
							id="input0" value=""> <label hidden class="input-group-text"
							for="inputGroupFile02">編號</label>
					</div>

					<div class="input-group mb-3">
						<input type="file" name="imgFile1" class="form-control"
							id=""> <label class="input-group-text"
							for="inputGroupFile02">廣告圖A</label>
							
						<input type="hidden" name="imgUrl_A" class="form-control"
							id="input1" value="">
							
					</div>
				
					<hr>

					<div class="imgdiv">
						<img id="img2" class="productImg"
						src="">
					</div>

					<div class="input-group mb-3">
						<input type="file" name="imgFile2" class="form-control"
							id=""> <label class="input-group-text"
							for="inputGroupFile02">廣告圖B</label>
						
						<input type="hidden" name="imgUrl_B" class="form-control"
							id="input2" value="">	
					</div>
					

					<hr>

					<div class="imgdiv">
						<img id="img3" class="productImg"
						src="">
					</div>

					<div class="input-group mb-3">
						<input type="file" name="imgFile3" class="form-control"
							id=""> <label class="input-group-text"
							for="inputGroupFile02">廣告圖C</label>
							
						<input type="hidden" name="imgUrl_C" class="form-control"
							id="input3" value="">
					</div>
				
					<hr>

					<div class="imgdiv">
						<img id="img4" class="productImg"
						src="">
					</div>

					<div class="input-group mb-3">
						<input type="file" name="imgFile4" class="form-control"
							id=""> <label class="input-group-text"
							for="inputGroupFile02">廣告圖D</label>
							
						<input type="hidden" name="imgUrl_D" class="form-control"
							id="input4" value="">
					</div>
			
					<hr>
					
					<div class="field">
						<label class="label">修改時間 </label>
							<input id="" name="createdAt" class="input"
								type="hidden" value="">
						<div class="control">
							<input readonly id="" name="modifiedAt" class="input"
								type="text" value="">
						</div>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="button" id="btnChange" class="btn btn-primary">更改圖片</button>
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
				<h1 id="functionTitle" align="center" class="title">商品廣告輪播配置</h1>
				<button class="button light">Button</button>
			</div>
		</section>

		<div class="card" id=d2>
		
		
			<button id="btnNew" type="button" class="btn btn-warning"
				data-bs-toggle="modal" data-bs-target="#exampleModal"
				data-bs-whatever="@mdo"><i class="bi bi-plus-square-fill"></i>&nbsp新增廣告圖</button>


		<form method="post" action="${contextRoot}/getOneProductAds">
			<button id="btnChg" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
				<i class="bi bi-gear-wide-connected"></i>&nbsp更改廣告圖
			</button>
		</form>
		
		



	<!--=============================================================================================== -->

	
<%-- 			<c:forEach items="${prodAds}" var="prodAds"> --%>

				<div class="adBox" class="card-content">
					<label class="label"><i class="bi bi-badge-ad-fill"></i>&nbsp
						廣告輪播圖片--A</label>
					<figure>
						<img id="img11" class="productImg"
							src="">
					</figure>
				</div>


				<div class="adBox" class="card-content">
					<label class="label"><i class="bi bi-badge-ad-fill"></i>&nbsp廣告輪播圖片--B</label>

					<figure>
						<img id="img22" class="productImg"
							src="">
					</figure>
				</div>

				<div class="adBox" class="card-content">
					<label class="label"><i class="bi bi-badge-ad-fill"></i>&nbsp廣告輪播圖片--C</label>

					<figure>
						<img id="img33" class="productImg"
							src="">
					</figure>
				</div>

				<div class="adBox" class="card-content">
					<label class="label"><i class="bi bi-badge-ad-fill"></i>&nbsp廣告輪播圖片--D</label>

					<figure>
						<img id="img44" class="productImg"
							src="">
					</figure>
				</div>

<%-- 			</c:forEach> --%>
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
		<script src="sweetalert2.all.min.js"></script>	
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