<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
   
<!--script>
function confirm(){
	if (confirm('123')){
	return true; 
	}
	else{
		return false;
	}
}
</script-->
<!DOCTYPE html>
<html>
<head>
	<!-- Mobile Specific Meta -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- Favicon-->
	<link rel="shortcut icon" href="${contextRoot}/resources/frontstageLogo/favicon.png">
	<!-- Author Meta -->
	<meta name="author" content="CodePixar">
	<!-- Meta Description -->
	<meta name="description" content="">
	<!-- Meta Keyword -->
	<meta name="keywords" content="">
	<!-- meta character set -->
	<meta charset="UTF-8">
	<!-- Site Title -->
	<title>客服表單</title>
	<!--
		CSS
		============================================= -->
	<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/linearicons.css">
	<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/font-awesome.min.css">
	<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/themify-icons.css">
	<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/bootstrap.css">
	<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/owl.carousel.css">
	<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/nice-select.css">
	<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/nouislider.min.css">
	<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/ion.rangeSlider.css" />
	<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/ion.rangeSlider.skinFlat.css" />
	<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/magnific-popup.css">
	<link rel="stylesheet" href="${contextRoot}/resources/frontstage/css/main.css">
</head>


<style>

	#divForm{
		width: 200%;
		margin: auto;
		
	}

	.subForm{
		border-collapse: collapse;
		border: none;
		border-radius: 5px;
		margin-top: 30px;
		margin: auto;
		
		
		/* width: 80px;
		height: 50px; */
	}

	.formQuestion{
		margin-top: 20px;
	}

	.formHead{
		font-size: x-large;
		font-weight: bold;
		background-color: rgb(243, 168, 29);
		color: rgb(0, 0, 0);
	}

	#cusForm{
		filter: drop-shadow(7px 7px 7px #a1a0a0);
		margin-bottom: 30px;
	}




</style>


<body>

	<!-- Start Header Area -->
	<header class="header_area sticky-header">
		<div class="main_menu">
			<!-- 插入上導覽列 -->
			<jsp:directive.include file="/WEB-INF/pages/layout/frontstage/nav.jsp" />
		</div>
		<div class="search_input" id="search_input_box">
			<div class="container">
				<form class="d-flex justify-content-between">
					<input type="text" class="form-control" id="search_input" placeholder="Search Here">
					<button type="submit" class="btn"></button>
					<span class="lnr lnr-cross" id="close_search" title="Close Search"></span>
				</form>
			</div>
		</div>
	</header>
	<!-- End Header Area -->

	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>客服表單</h1>
					<nav class="d-flex align-items-center">
						<a href="">首頁<span class="lnr lnr-arrow-right"></span></a>
						<a href="">客服中心<span class="lnr lnr-arrow-right"></span></a>
						<a href="">客服表單</a>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->

	<div class="container">
		<p />

		<div  class="row justify-content-center">
			<div class="col-9">
				<div class="card" id="cusForm">
					<div style="color: 	#3c3c3c;"  class="card-header formHead">客服表單</div>
					<div class="card-body">
						<form:form action="${contextRoot}/message/insert" class="form"
							method="GET" modelAttribute="CustomerBean">

							<div class="input-group">
								<label style="color: 	#3c3c3c;" for="exampleFormControlTextarea1" class="form-label">請選擇你/妳遇到的問題(必選):</label>
							<form:select path="serviceInfo" value="" class="form-select" aria-label="Default select example">
									<form:option value="產品問題"/>
									<form:option value="行銷活動"/>
									<form:option value="商品運送"/>
									<form:option value="交易及帳務相關"/>
									<form:option value="商品退貨"/>
									<form:option value="瑕疵問題"/>
									<form:option value="會員相關"/>
							</form:select>
						</div>
						



						<div class="mb-3 formQuestion">
							<label style="color: 	#3c3c3c;" for="exampleFormControlTextarea1" class="form-label">請詳加描述問題(非必填):</label>
							<textarea class="form-control" id="exampleFormControlTextarea1" path="description" value="" placeholder="請詳加描述您的問題..." rows="3"></textarea>
						  </div>
						
							
<!-- 請詳加描述問題(非必填):	<form:input type="textarea" path="description" value="" placeholder="請詳加描述您的問題..."/> -->
						


							<div class="mb-3 row">
								<label style="color: 	#3c3c3c;" for="inputPassword" class="col-sm-2 col-form-label">請輸入你/妳的名字(必填):</label>
								<div class="col-sm-10">
								  <input class="form-control" type="text" name="name" value="" placeholder="請輸入中文名字..." pattern="[\u4e00-\u9fa5]{2,4}" oninvalid="validatelt(this,'真实姓名必须是中文，且长度不小于2，不大于4')" required>
								</div>
							  </div>
<!-- 
請輸入你/妳的名字(必填):	<input type="text" name="name" value="" placeholder="請輸入中文名字..." pattern="[\u4e00-\u9fa5]{2,4}" oninvalid="validatelt(this,'真实姓名必须是中文，且长度不小于2，不大于4')" required/> -->


							<div class="mb-3 row">
								<label style="color: 	#3c3c3c;" for="inputPassword" class="col-sm-2 col-form-label">請輸入你/妳的聯絡方式(必填):</label>
								<div class="col-sm-10">
								<input class="form-control" type="text" name="phone" value="" placeholder="請輸入10碼聯絡方式..." pattern="09\d{2}\-?\d{3}\-?\d{3}" required>
								</div>
							</div>

							<br>
<!-- 請輸入你/妳的聯絡方式(必填):	<input type="text" name="phone" value="" placeholder="請輸入10碼聯絡方式..." pattern="09\d{2}\-?\d{3}\-?\d{3}" required/> -->
							<br>

							
							<div class="mb-3 row">
								<label style="color: #3c3c3c;" for="inputPassword" class="col-sm-2 col-form-label">請輸入你/妳的電子郵件信箱(非必填):</label>
								<div class="col-sm-10">
								<input class="form-control" type="email" name="email" value="" placeholder="請輸入您的email..." required>
								</div>
							</div>

<!-- 請輸入你/妳的電子郵件信箱(非必填):	<input type="email" name="email" value="" placeholder="請輸入您的email..." required/> -->
							<br>	
							
						<div class="mb-3 row">	
							<label style="color: #3c3c3c;" for="inputPassword" class="col-sm-2 col-form-label">請選擇方便連絡時段(必選):</label>
							上午&nbsp<input checked="true"  class="pixel-radio btcolor" type="radio" id="black" name="preferedContactTime" value="上午">
							下午&nbsp<input  class="pixel-radio btcolor" type="radio" id="black" name="preferedContactTime" value="下午">
						</div>
						<button  class="primary-btn subForm" type="submit" name="submit" value="送出表單" onclick="SendMail()">送出表單</button>
							
						</form:form>
					</div>

				</div>

			</div>

		</div>
	</div>
	<!-- 引入jquery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>
function SendMail(){
	$.ajax({
		url:'${contextRoot}/message/sendMail',
		type:'GET'
		
	});
}

</script>
<!-- 插入頁腳 -->
	<jsp:directive.include file="/WEB-INF/pages/layout/frontstage/footer.jsp" />

	<script src="${contextRoot}/resources/frontstage/js/vendor/jquery-2.2.4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
	 crossorigin="anonymous"></script>
	<script src="${contextRoot}/resources/frontstage/js/vendor/bootstrap.min.js"></script>
	<script src="${contextRoot}/resources/frontstage/js/jquery.ajaxchimp.min.js"></script>
	<script src="${contextRoot}/resources/frontstage/js/jquery.nice-select.min.js"></script>
	<script src="${contextRoot}/resources/frontstage/js/jquery.sticky.js"></script>
	<script src="${contextRoot}/resources/frontstage/js/nouislider.min.js"></script>
	<script src="${contextRoot}/resources/frontstage/js/countdown.js"></script>
	<script src="${contextRoot}/resources/frontstage/js/jquery.magnific-popup.min.js"></script>
	<script src="${contextRoot}/resources/frontstage/js/owl.carousel.min.js"></script>
	<!--gmaps Js-->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
	<script src="${contextRoot}/resources/frontstage/js/gmaps.min.js"></script>
	<script src="${contextRoot}/resources/frontstage/js/main.js"></script>
</body>
</html>