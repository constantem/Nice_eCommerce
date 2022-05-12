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
<title>Nice_eCommerce_SearchAllProductPage</title>


<!----------------------------- CSS------------------------------------------ -->
<c:set var="contextRoot" value="${pageContext.request.contextPath}"></c:set>
<link href="${contextRoot}/resources/backstage/css/main.css"
	rel="stylesheet" />
<link rel="apple-touch-icon" sizes="180x180"
	href="${contextRoot}/resources/backstage/apple-touch-icon.png" />
<link rel="icon" type="image/png" sizes="32x32"
	href="${contextRoot}/resources/backstage/favicon-32x32.png" />
<link rel="icon" type="image/png" sizes="16x16"
	href="${contextRoot}/resources/backstage/favicon-16x16.png" />
<!--------------------------------------------------------------------------- -->




<!-- Tailwind is included -->

<link href="https://cdn.bootcss.com/sweetalert/1.1.3/sweetalert.min.css"
	rel="stylesheet">

<link rel="stylesheet" href="css/main.css?v=1628755089081">
<link rel="apple-touch-icon" sizes="180x180" href="apple-touch-icon.png" />
<link rel="icon" type="image/png" sizes="32x32" href="favicon-32x32.png" />
<link rel="icon" type="image/png" sizes="16x16" href="favicon-16x16.png" />
<link rel="mask-icon" href="safari-pinned-tab.svg" color="#00b4b6" />
<link rel="stylesheet"
	href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>	
<meta name="description" content="Admin One - free Tailwind dashboard">

<!-- <meta property="og:url" -->
<!-- 	content="https://justboil.github.io/admin-one-tailwind/"> -->
<!-- <meta property="og:site_name" content="JustBoil.me"> -->
<!-- <meta property="og:title" content="Admin One HTML"> -->
<!-- <meta property="og:description" -->
<!-- 	content="Admin One - free Tailwind dashboard"> -->
<!-- <meta property="og:image" -->
<!-- 	content="https://justboil.me/images/one-tailwind/repository-preview-hi-res.png"> -->
<!-- <meta property="og:image:type" content="image/png"> -->
<!-- <meta property="og:image:width" content="1920"> -->
<!-- <meta property="og:image:height" content="960"> -->

<!-- <meta property="twitter:card" content="summary_large_image"> -->
<!-- <meta property="twitter:title" content="Admin One HTML"> -->
<!-- <meta property="twitter:description" -->
<!-- 	content="Admin One - free Tailwind dashboard"> -->
<!-- <meta property="twitter:image:src" -->
<!-- 	content="https://justboil.me/images/one-tailwind/repository-preview-hi-res.png"> -->
<!-- <meta property="twitter:image:width" content="1920"> -->
<!-- <meta property="twitter:image:height" content="960"> -->



<!-- <!-- Global site tag (gtag.js) - Google Analytics -->
<!-- <script async -->
<!-- 	src="https://www.googletagmanager.com/gtag/js?id=UA-130795909-1"></script> -->
<!-- </head> -->


<style>
#title {
	font-size: 140%;
}

#functionTitle {
	margin: auto;
}

.blink {
    animation-duration: 1s;
    animation-name: blink;
    animation-iteration-count: infinite;
    animation-direction: alternate;
    animation-timing-function: ease-in-out;
}
@keyframes blink {
    from {
        opacity: 1;
    }
    to {
        opacity: 0;
    }
}
@keyframes blink {
    0% {
        opacity: 1;
    }
    80% {
        opacity: 1;
    }
    81% {
        opacity: 0;
    }
    100% {
        opacity: 0;
    }
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


.modTitle{
font-weight: bold;
font-size: x-large;

}

#supplierBtn{
  background-color:			#8E8E8E;
  /* font-weight: bold; */
  color:white;
}
#supplierBtn:hover{
  background-color:		#6C6C6C;
  transition: 0.5s;
}



#mypro{
display: block;
width: 120px;
height: 90px;
}

#mYPROTEINLable{
  float: right;
  margin-right: 120px;
  margin-top: 30px;
  font-size: large;
  font-weight: bold;
  color: rgb(233, 163, 0);
  font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
}

#nike{
display: block;
width: 100px;
height: 90px;
margin-left: 20px;
}

#nikeLable{
  float: right;
  margin-right: 180px;
  margin-top: 35px;
  font-size: large;
  font-weight: bold;
  color: rgb(233, 163, 0);
  font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
}

#newBalanceLable{
  float: right;
  margin-right: 110px;
  margin-top: 30px;
  font-size: large;
  font-weight: bold;
  color: rgb(233, 163, 0);
  font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
}

#newBalanceLable:hover{
  color: 	#EAC100;
  transition: 0.5s;
}

#nikeLable:hover{
  color: 	#EAC100;
  transition: 0.5s;
}

#mYPROTEINLable:hover{
  color: 	#EAC100;
  transition: 0.5s;
}

#newBalance{
display: block;
width: 110px;
height: 80px;;
}


</style>
<body>




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
				<h1 id="functionTitle"  class="title" >商品列表</h1>
        <button type="button" id="supplierBtn" class="button light" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@fat">品牌分類查詢</button>
			</div>
		</section>


		<div class="card-content">
			<table>

				<thead>
					<tr>
						<th>商品編號</th>
						<th>商品名稱</th>
						<th>商品類別</th>
						<th>供應商</th>
						<th>商品圖片</th>
						<th>商品顏色</th>
						<th>商品尺寸</th>
						<th>商品價格</th>
						<th>庫存數量</th>
						<th>上架日期</th>
						<th>最後修改日期</th>
						<th></th>
						<th></th>
					</tr>
				</thead>


				<tbody>
					<tr>
						<c:forEach items="${page.content}" var="prod">
							<tr>
								<td data-label="product_id">${prod.id}</td>
								<td data-label="productName">${prod.productName}</td>
								<td data-label="productName">${prod.subCategory.name}</td>
								<td data-label="City">${prod.supplier}</td>
								<td data-label="City"><img alt="picture"
									src="${contextRoot}/ProductTempImg/${prod.imgUrl}" width="112" /></td>
								<!-- 照片欄位 -->
								<td data-label="Created">${prod.color}</td>
								<td data-label="Created">${prod.size}</td>
								<td data-label="Created">${prod.price}</td>
								<td class="quantity" data-label="Created">${prod.stock.quantity}</td>
								<td data-label="Created">${prod.createdAt}</td>
								<td data-label="Created">${prod.modifiedAt}</td>

								<td class="actions-cell">
									<div class="buttons right nowrap">

										<!-- 修改 -->
										<form method="get"
											action="/Nice_eCommerce/getOneProduct${prod.id}">
											<button class="button small green --jb-modal"
												data-target="sample-modal-2" type="submit">
												<span class="icon"><i class="mdi mdi-eye"></i></span>
											</button>
										</form>

										<!-- 刪除 -->
										<form id="deleteForm" method="get"
											action="/Nice_eCommerce/deleteOneProduct${prod.id}">
											<button  id="delete"
												class="button small red --jb-modal delete"
												data-target="sample-modal" type="button">
												<span class="icon"><i class="mdi mdi-trash-can"></i></span>
											</button>
										</form>
										<!-- onclick="return confirm('確認刪除')" -->
									</div>
								</td>
						</c:forEach>
					</tr>
				</tbody>
			</table>

			<div id="page" align="center">
				<div class="table-pagination">
					<div class="flex items-center ">
						<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
							<c:choose>
								<c:when test="${page.number != pageNumber-1}">
									<div class="buttons">
										<a href="${contextRoot}/staff/pageSeperate?p=${pageNumber}"><button
												type="button" class="button active">${pageNumber}</button></a>
										&nbsp&nbsp
									</div>
								</c:when>
								<c:otherwise>
									<c:out value="${pageNumber}"></c:out>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
				</div>
			</div>




      <!--======================================================================================================================-->

     


      <div  class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content" style="width:450px ;">
            <div class="modal-header">
              <h5 class="modal-title modTitle" id="exampleModalLabel">現有品牌</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

              <form>

                <a href="${contextRoot}/BackpageSearchBySupplier?supplier=New Balance"><label id="nikeLable">NIKE</label></a>
                <div class="mb-3" style="display: block; width: 120px;">
                  <a href="${contextRoot}/BackpageSearchBySupplier?supplier=nike"><img id="nike"  src="${contextRoot}/img/logo/nike.jfif"></a>
                </div>
                
                <a href="${contextRoot}/BackpageSearchBySupplier?supplier=New Balance"><label id="newBalanceLable">New Balance</label></a>
                <div class="mb-3"  style="display: block;width: 120px;" >
                  <a href="${contextRoot}/BackpageSearchBySupplier?supplier=New Balance"><img id="newBalance"  src="${contextRoot}/img/logo/new-balance.jpg"></a>
                </div>

                <a href="${contextRoot}/BackpageSearchBySupplier?supplier=New Balance"><label id="mYPROTEINLable">MYPROTEIN</label></a>
                <div class="mb-3"  style="display: block; width: 120px;">
                  <a href="${contextRoot}/BackpageSearchBySupplier?supplier=MYPROTEIN"><img id="mypro"  src="${contextRoot}/img/logo/MYPROTEIN.jpg"></a>
                </div>

                
              </form>
            </div>

            <div class="modal-footer">
              <button type="button" class="button light" data-bs-dismiss="modal">返回</button>
            </div>

          </div>
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




		</div>
	</div>



	<!-- Scripts below are for demo only -->
	<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
			crossorigin="anonymous"></script>


	<script type="text/javascript" src="js/main.min.js?v=1628755089081"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
	<script type="text/javascript" src="js/chart.sample.min.js"></script>
	<script
		src="https://cdn.bootcss.com/sweetalert/1.1.3/sweetalert.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	<noscript>
		<img height="1" width="1" style="display: none"
			src="https://www.facebook.com/tr?id=658339141622648&ev=PageView&noscript=1" />
	</noscript>
	<!-- Icons below are for demo only. Feel free to use any icon pack. Docs: https://bulma.io/documentation/elements/icon/ -->



	<!-- ================================================================================ -->

	<script>
		$(window).load(function() {
			var a = $(".quantity");
			console.log(a);

			$(".quantity").each(function() {
				console.log($(this).text());
				var a = $(this).text();

				if (a < 50) {
					$(this).css("color", "#FF8000").text("低庫存量警示");
				}
				
				if (a == 0) {
					$(this).css("color", "#FF0000").text("無庫存");
					$(this).attr("class","blink")
				} else {

				}
			});
		});
	</script>

	<!--sweetalert 刪除商品確認-->
	<script>

		$(".delete").click(function(){
			let deleteForm = $(this).closest("form");
			Swal.fire({
				title: '確定刪除??',
				text: "刪除後商品資料無法回復",
				icon: 'warning',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: '確定刪除!',
				cancelButtonText: '取消'
				}).then((result) => {
				if (result.isConfirmed) {
					Swal.fire({
					title:'刪除成功',
					text: '資料已刪除',
					icon:'success',
					timer: 2000,
					}).then(function () {
						$(deleteForm).submit();
					});
					// setTimeout(deleteProduct,2000)
				}
			})
		});
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
	<!------------------------------ JS------------------------------------------------ -->


</body>

</html>