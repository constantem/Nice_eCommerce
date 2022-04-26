<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />



<!-- 這個檔案是給你給你複製貼上用的, 請創一個 jsp 檔, 將此檔全部內容複製貼在該 jsp 檔 -->



<!DOCTYPE html>
<html lang="en" class="">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>我頁標題(未更改)</title>

  <!-- Tailwind is included -->
  <!-- <link rel="stylesheet" href="${contextRoot}/resources/backstage/css/main.css?v=1628755089081"> -->
  <link rel="stylesheet" href="${contextRoot}/resources/backstage/css/main.css">
  <link rel="apple-touch-icon" sizes="180x180" href="${contextRoot}/resources/backstage/apple-touch-icon.png" />
  <link rel="icon" type="image/png" sizes="32x32" href="${contextRoot}/resources/backstage/favicon-32x32.png" />
  <link rel="icon" type="image/png" sizes="16x16" href="${contextRoot}/resources/backstage/favicon-16x16.png" />
  <link rel="mask-icon" href="${contextRoot}/resources/backstage/safari-pinned-tab.svg" color="#00b4b6" />

  <meta name="description" content="Admin One - free Tailwind dashboard">

  <meta property="og:url" content="https://justboil.github.io/admin-one-tailwind/">
  <meta property="og:site_name" content="JustBoil.me">
  <meta property="og:title" content="Admin One HTML">
  <meta property="og:description" content="Admin One - free Tailwind dashboard">
  <meta property="og:image" content="https://justboil.me/images/one-tailwind/repository-preview-hi-res.png">
  <meta property="og:image:type" content="image/png">
  <meta property="og:image:width" content="1920">
  <meta property="og:image:height" content="960">

  <meta property="twitter:card" content="summary_large_image">
  <meta property="twitter:title" content="Admin One HTML">
  <meta property="twitter:description" content="Admin One - free Tailwind dashboard">
  <meta property="twitter:image:src" content="https://justboil.me/images/one-tailwind/repository-preview-hi-res.png">
  <meta property="twitter:image:width" content="1920">
  <meta property="twitter:image:height" content="960">


<!-- 自訂 link, script -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

  <!-- Global site tag (gtag.js) - Google Analytics -->
  <script async src="https://www.googletagmanager.com/gtag/js?id=UA-130795909-1"></script>
  <script>
    window.dataLayer = window.dataLayer || [];
    function gtag() { dataLayer.push(arguments); }
    gtag('js', new Date());
    gtag('config', 'UA-130795909-1');
  </script>

</head>

<body>

  <div id="app">

	<!-- 插入上導覽列與左導覽列 -->
	<jsp:directive.include file="/WEB-INF/pages/layout/backstage/nav-and-aside.jsp" />
	
	<!-- 章節層級 -->
    <section class="is-title-bar">
      <div class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
        <ul>
          <li>Admin</li>
          <li>Profile</li>
        </ul>
        <a href="https://justboil.me/" onclick="alert('Coming soon'); return false" target="_blank" class="button blue">
          <span class="icon"><i class="mdi mdi-credit-card-outline"></i></span>
          <span>Premium Demo</span>
        </a>
      </div>
    </section>

	<!-- 核心內容標題 -->
    <section class="is-hero-bar">
      <div class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
        <h1 class="title">
          員工管理系統
        </h1>
        <button class="button light">Button</button>
      </div>
    </section>

	<!-- 原核心內容的 section 開始 -->
	<section class="section main-section">
			<div class="card has-table">
				<section class="section main-section">

					<header class="card-header">
						<p class="card-header-title">
							<span class="icon"><i class="mdi mdi-account-multiple"></i></span>
							員工名單
						</p>
						<a href="#" class="card-header-icon"> <span class="icon"><i
								class="mdi mdi-reload"></i></span>
						</a>
					</header>
				</section>
			</div>

			<div class="col-md-4 col-md-offset-8">
				
				<button type="button" class="btn btn-primary btn-sm" id="emp_add_model_btn">新增</button>
				<button type="button" class="btn btn-danger btn-sm" id="emp_delete_all_btn"onclick="deleteEmpList()">刪除</button>	
			</div>
			
			<div class="row">
				<div class="col-md-12">
					<!-- <table class="table table-hover" id="emps_table"> -->
						<table id="noteTable" class="table table-hover table-sm" style="display:block; overflow-x: auto;white-space: nowrap;">
						<!-- <thead> -->
							<thead class="thead-dark">
							<tr>
								<th><input type="checkbox" id="check_all" class="all">#</th>
								<th>員工編號</th>
								<th>姓名</th>
								<th>性別</th>
								<th>電話</th>
								<th>電子信箱</th>
								<th>住址</th>
								<th>職稱</th>
								<th>受雇起始日</th>
								<th>建立日期</th>
								<th>修改日期</th>
								<th>權限</th>
								<th>操作</th>
			
							</tr>
						</thead>
			
						<tbody>
						
						</tbody>
					</table>
				</div>			
			</div>

			<div  style="text-align:center;">
				<ul class="pagination justify-content-center" style="margin:20px 0; cursor: pointer;"></ul>
			</div>
	
	</section>
	<!-- 原核心內容的 section 結束 -->

	<!-- 插入頁腳 -->
	<jsp:directive.include file="/WEB-INF/pages/layout/backstage/footer.jsp" />

    <div id="sample-modal" class="modal">
      <div class="modal-background --jb-modal-close"></div>
      <div class="modal-card">
        <header class="modal-card-head">
          <p class="modal-card-title">Sample modal</p>
        </header>
        <section class="modal-card-body">
          <p>Lorem ipsum dolor sit amet <b>adipiscing elit</b></p>
          <p>This is sample modal</p>
        </section>
        <footer class="modal-card-foot">
          <button class="button --jb-modal-close">Cancel</button>
          <button class="button red --jb-modal-close">Confirm</button>
        </footer>
      </div>
    </div>

    <div id="sample-modal-2" class="modal">
      <div class="modal-background --jb-modal-close"></div>
      <div class="modal-card">
        <header class="modal-card-head">
          <p class="modal-card-title">Sample modal</p>
        </header>
        <section class="modal-card-body">
          <p>Lorem ipsum dolor sit amet <b>adipiscing elit</b></p>
          <p>This is sample modal</p>
        </section>
        <footer class="modal-card-foot">
          <button class="button --jb-modal-close">Cancel</button>
          <button class="button blue --jb-modal-close">Confirm</button>
        </footer>
      </div>
    </div>

<!-- 員工查詢模態框 -->
	<!-- Modal -->
	<div class="modal fade" id="empInquireModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		data-target="#empInquireModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
							aria-hidden="true">&times;</span></button>
					<h4 style="text-align:center" class="modal-title">員工資料</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">	
						<!-- <div class="modal-body">
							<input id="images" type="hidden" name="images">
							<p id="images" name="images"><img src="" width=200></p>
						</div> -->
						<div class="modal-body">
							<!-- <input name="file" id="file"> -->
							<input id="images" type="hidden" name="file">
							<p ><img src="" width=200 id="img_inquire_url"></p>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">姓</label>
							<div class="col-sm-10">
								<input type="text" style="outline:none;" name="firstName" readonly class="form-control-static"
									id="lastName_inquire_input">
								<span class="help-block"></span>
							</div>
						</div>
 
							
						<div class="form-group">
							<label class="col-sm-2 control-label">名</label>
							<div class="col-sm-10">
								<input type="text" style="outline:none;" name="firstName" readonly class="form-control-static"
									id="firstName_inquire_input">
								<span class="help-block"></span>
							</div>
						</div>
	
						<div class="form-group">
							<label class="col-sm-2 control-label">性別</label>
							<div class="col-sm-10">
								<label class="radio-inline">
									<input type="radio" name="gender" readonly id="gender_inquire_input"
										value="M" checked>男
								</label>
								<label class="radio-inline">
									<input type="radio" name="gender" readonly id="gender_inquire_input"
										value="F">女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">電話</label>
							<div class="col-sm-5">
								<input type="text" style="outline:none;" name="phone" readonly class="form-control-static"
									id="phone_inquire_input">
								<span class="help-block"></span>
							</div>
						</div>
	
						<div class="form-group">
							<label class="col-sm-2 control-label">email</label>
							<div class="col-sm-10">
								<input type="text" style="outline:none;" name="email" readonly class="form-control-static"
									id="email_inquire_input" placeholder="xxxxx@gmail.com">
								<span class="help-block"></span>
							</div>
						</div>
	
						<div class="form-group">
							<label class="col-sm-2 control-label">地址</label>
							<div class="col-sm-3">
								<input class="form-control-static" style="outline:none;" name="address1"
								readonly id="address1_inquire_select">				
							</div>
							<div class="col-sm-3">
								<input class="form-control-static" style="outline:none;" name="address2"
								readonly id="address2_inquire_select">	
							</div>
							<div class="col-sm-8">
								<input type="text"style="outline:none;" name="address" readonly class="form-control-static"
									id="address_inquire_input">
								<span class="help-block"></span>
							</div>
						</div>
	
						<div class="form-group">
							<label class="col-sm-2 control-label">職稱</label>
							<div class="col-sm-10">
								<input type="text" style="outline:none;" name="jobTitle" readonly class="form-control-static"
									id="jobTitle_inquire_input">
								<span class="help-block"></span>
							</div>
						</div>
	
						<div class="form-group">
							<label class="col-sm-2 control-label">權限</label>
							<div class="col-sm-10">		
									<input name="permission" style="outline:none;" readonly class="form-control-static"
										id="permission_inquire_input">
									<span class="help-block"></span>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
			
<!-- 自訂彈窗 -->
<!-- 員工新增模態框 -->
	<!-- Modal --> 
	<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-target="#empAddModal">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 style="text-align:center" class="modal-title" id="myModalLabel">新增員工</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
				<div class="modal-body">

				<!-- <p id="img_url"><img src="" width=200></p> -->
				<p ><img src="" width=200 id="img_url"></p>
				<input type="file" name="img" id="file">
				<input id="img" type="hidden" name="img">
				<input type="button" name="img" id="button" value="上傳">
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">密碼</label>
					<div class="col-sm-10">
					  <input required type="password" name="password" class="form-control" id="password_add_input">
					  <span class="help-block"></span>
					</div>
				  </div>

			  <div class="form-group">
			    <label class="col-sm-2 control-label">姓</label>
			    <div class="col-sm-10">
			      <input type="text" name="lastName" class="form-control" id="lastName_add_input" placeholder="王">
			      <span class="help-block"></span>
			    </div>
			  </div>

			  
				<div class="form-group">
				  <label class="col-sm-2 control-label">名</label>
				  <div class="col-sm-10">
					<input type="text" name="firstName" class="form-control" id="firstName_add_input" placeholder="小明">
					<span class="help-block"></span>
				  </div>
				</div>
		
			 <div class="form-group">
			    <label class="col-sm-2 control-label">性別</label>
			    <div class="col-sm-10">
			      <label class="radio-inline">
					  <input type="radio" name="gender" id="gender1_add_input" value="M" checked> 男
				  </label>
				  <label class="radio-inline">
					  <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
			      </label>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">電話</label>
			    <div class="col-sm-5">
			      <input type="tel" name="phone" class="form-control" id="phone_add_input" placeholder="請輸入手機號碼">
			      <span class="help-block"></span>
			    </div>
			  </div>

			  <div class="form-group">
			    <label class="col-sm-2 control-label">email</label>
			    <div class="col-sm-10">
			      <input type="email" name="email" class="form-control" id="email_add_input" placeholder="xxxxx@gmail.com">
			      <span class="help-block"></span>
			    </div>
			  </div>

			   <div class="form-group"> 
			   	 <label class="col-sm-2 control-label">地址</label>
			   	 <div class="col-sm-3">
			    	<select class="form-control" name="address1" id="address1_add_select">

					</select>
			   	 </div>
					<div class="col-sm-3">
						<select class="form-control" name="address2" id="address2_add_select">
	
						</select>
						</div> 
						<div class="col-xs-push-3">
							<input type="text" name="address" class="form-control" id="address_add_input"  >
							<span class="help-block"></span>
						  </div>
			  </div>

			<div class="form-group">
				<label class="col-sm-2 control-label">職稱</label>
				<div class="col-sm-10">
					<label class="radio-inline">
						<select class="form-control" name="jobTitle" id="jobTitle_add_input">
							<option>經理</option>
							<option>主管</option>
							<option>一般職員</option>
						</select>
					</label>
				</div>
			</div>

			  <div class="form-group">
			    <label class="col-sm-2 control-label">權限</label>
			    <div class="col-sm-10">
			      <label class="radio-inline">	 
					<select class="form-control" name="permission" id="permission_add_input">
						<option>一般權限</option>
						<option>超級管理員權限</option>
					</select>
				  </label>
			    </div>
			  </div>

			</form>
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-primary" id="emp_save_btn">新增</button>
	        <button type="button" class="btn btn-success" data-dismiss="modal">關閉</button>
			<button type="button" class="btn btn-danger" id="emp_Automatic">一鍵輸入</button> 
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 員工修改模態框 -->
	<!-- Modal -->
	<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-target="#empUpdateModal" >
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 style="text-align:center" class="modal-title">員工修改</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
				  
				<div class="modal-body">				
					<!-- <p id="img_url"><img src="" width=200></p> -->
					<p><img src="" width=200 name="img" id="img_update_url"></p>
					<input type="file" name="img" id="file_update">
					<input type="hidden" name="img" id="img_update_input">
					<input type="button" name="img" id="button_updete" value="更新圖片">
					</div>


				<div class="form-group">
					<label class="col-sm-2 control-label">密碼</label>
					<div class="col-sm-10">
					  <input type="text" name="password" class="form-control" id="password_update_input">
					  <span class="help-block"></span>
					</div>
				  </div>

			  <div class="form-group">
			    <label class="col-sm-2 control-label">姓</label>
			    <div class="col-sm-10">
			      <input type="text" name="lastName" class="form-control" id="lastName_update_input" placeholder="王">
			      <span class="help-block"></span>
			    </div>
			  </div>

				<div class="form-group">
				  <label class="col-sm-2 control-label">名</label>
				  <div class="col-sm-10">
					<input type="text" name="firstName" class="form-control" id="firstName_update_input" placeholder="小明">
					<span class="help-block"></span>
				  </div>
				</div>
		
			 <div class="form-group">
			    <label class="col-sm-2 control-label">性別</label>
			    <div class="col-sm-10">
			      <label class="radio-inline">
					  <input type="radio" name="gender" id="gender1_update_input" value="M" checked>男
				  </label>
				  <label class="radio-inline">
					  <input type="radio" name="gender" id="gender2_update_input" value="F">女
			      </label>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">電話</label>
			    <div class="col-sm-5">
			      <input type="text" name="phone" class="form-control" id="phone_update_input" placeholder="請輸入手機號碼">
			      <span class="help-block"></span>
			    </div>
			  </div>

			  <div class="form-group">
			    <label class="col-sm-2 control-label">email</label>
			    <div class="col-sm-10">
			      <input type="text" name="email" class="form-control" id="email_update_input" placeholder="xxxxx@gmail.com">
			      <span class="help-block"></span>
			    </div>
			  </div>

			   <div class="form-group"> 
			   	 <label class="col-sm-2 control-label">地址</label>
			   	 <div class="col-sm-3">
			    	<select class="form-control" name="address1" id="address1_update_select">

					</select>
			   	 </div>
					<div class="col-sm-3">
						<select class="form-control" name="address2" id="address2_update_select">
	
						</select>
						</div>
						<div class="col-xs-push-3">
							<input type="text" name="address" class="form-control" id="address_update_input"  >
							<span class="help-block"></span>
						  </div>
			  </div>

			  <div class="form-group">
				<label class="col-sm-2 control-label">職稱</label>
				<div class="col-sm-10">
					<label class="radio-inline">
						<select class="form-control" name="jobTitle" id="jobTitle_update_input">
							<option>經理</option>
							<option>主管</option>
							<option>一般職員</option>
						</select>
					</label>
				</div>
			</div>

			  <input type="hidden" name="hireDate" class="form-control" id="hireDate_update_input">
			  <input type="hidden" name="createdAt" class="form-control" id="createdAt_update_input">
			
			  <div class="form-group">
			    <label class="col-sm-2 control-label">權限</label>
			    <div class="col-sm-10">
			      <label class="radio-inline">	 
					<select class="form-control" name="permission" id="permission_update_input">
						<option>一般權限</option>
						<option>超級管理員權限</option>
					</select>
				  </label>
			    </div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
	        <button type="button" class="btn btn-success" data-dismiss="modal">關閉</button>
	      </div>
	    </div>
	  </div>
	</div>



  </div>

  <!-- Scripts below are for demo only -->
  <script type="text/javascript" src="${contextRoot}/resources/backstage/js/main.min.js?v=1628755089081"></script>

  <script>
    !function (f, b, e, v, n, t, s) {
      if (f.fbq) return; n = f.fbq = function () {
        n.callMethod ?
          n.callMethod.apply(n, arguments) : n.queue.push(arguments)
      };
      if (!f._fbq) f._fbq = n; n.push = n; n.loaded = !0; n.version = '2.0';
      n.queue = []; t = b.createElement(e); t.async = !0;
      t.src = v; s = b.getElementsByTagName(e)[0];
      s.parentNode.insertBefore(t, s)
    }(window, document, 'script',
      'https://connect.facebook.net/en_US/fbevents.js');
    fbq('init', '658339141622648');
    fbq('track', 'PageView');
  </script>
  
  <!-- 自訂 JS -->
  <script>
	
var pageSize = 5;
var totalElements;

	$(document).ready(function() {
	let totalPages = 0;

	fetchNotes(totalPages);

});



$(document).on("click", "ul.pagination li a", function() {
        var data = $(this).attr('data');
		let val = $(this).text();
		console.log('val: ' + val);

		if(val.toUpperCase() === "« FIRST") {
			//跳到第一頁
			let currentActive = $("li.active");
			fetchNotes(0);
			$("li.active").removeClass("active");
	  		// add .active to next-pagination li
	  		currentActive.next().addClass("active");
		} else if(val.toUpperCase() === "LAST »") {
			//跳到最後一頁
			fetchNotes(totalPages - 1);
			$("li.active").removeClass("active");
	  		// add .active to next-pagination li
	  		// currentActive.next().addClass("active");
		} else if(val.toUpperCase() === "NEXT ›") {
	  		let activeValue = parseInt($("ul.pagination li.active").text());
	  		if(activeValue < totalPages){
	  			let currentActive = $("li.active");
				startPage = activeValue;
				fetchNotes(startPage);
	  			// remove .active class for the old li tag
	  			$("li.active").removeClass("active");
	  			// add .active to next-pagination li
	  			currentActive.next().addClass("active");
	  		}
	  	} else if(val.toUpperCase() === "‹ PREV") {
	  		let activeValue = parseInt($("ul.pagination li.active").text());
	  		if(activeValue > 1) {
	  			// get the previous page
				startPage = activeValue - 2;
				fetchNotes(startPage);
	  			let currentActive = $("li.active");
	  			currentActive.removeClass("active");
	  			// add .active to previous-pagination li
	  			// currentActive.prev().addClass("active");
	  		}
	  	} else {
			startPage = parseInt(val - 1);
			fetchNotes(startPage);
	  		// add focus to the li tag
	  		$("li.active").removeClass("active");
	  		$(this).parent().addClass("active");
			//$(this).addClass("active");
	  	}
    });
function buildPagination(result) {
		totalPages = result.totalPages;
		var pageNumber = result.pageable.pageNumber;
		 totalElements = result.totalElements;
		var numLinks = 10;
		

		var first = '';
		var prev = '';
		if (pageNumber > 0) {
			if(pageNumber !== 0) {
				first = '<li class="page-item"><a class="page-link">« First</a></li>';
			}
			prev = '<li class="page-item"><a class="page-link">‹ Prev</a></li>';
		} else {
			
			prev = '<li><a >‹ Prev</a></li>'; 
			first = '<li><a aria-disabled style="pointer-events: none">« First</a></li>';
		}
		
		// var next = '';
		// var last = '';
		if (pageNumber < totalPages) {
			if(pageNumber !== totalPages - 1) {
				next = '<li class="page-item"><a class="page-link">Next ›</a></li>';				
				last = '<li class="page-item"><a class="page-link">Last »</a></li>';
			}
		} else {
			next = '<li><a class="page-link">Next ›</a></li>'; // on the last page, don't show 'next' link
			last = '<li><a class="page-link">Last »</a></li>'; // nor 'last page' link
		}
		
		var start = pageNumber - (pageNumber % numLinks) + 1;
		var end = start + numLinks - 1;
		end = Math.min(totalPages, end);
		var pagingLink = '';
		
		for (var i = start; i <= end; i++) {
			if (i == pageNumber + 1) {
				pagingLink += '<li class="page-item active"><a class="page-link"> ' + i + ' </a></li>'; // no need to create a link to current page
			} else {
				pagingLink += '<li class="page-item"><a class="page-link"> ' + i + ' </a></li>';
			}
		}
		
		// return the page navigation link
		pagingLink = first + prev + pagingLink + next + last;
		
		$("ul.pagination").append(pagingLink);
	}
	

function fetchNotes(startPage) {
		console.log('startPage: ' +startPage);
		/**
		 * get data from Backend's REST API
		 */
	    $.ajax({
	        type : "GET",
	        url : "${contextRoot}/emps",
			contentType:'application/json',
	        data: { 
	            page: startPage, 
	            size: pageSize
	        },
	        success: function(result){
	          $('#noteTable tbody').empty();
	          // add table rows
	          $.each(result.content, (idenx, value) => {
				var gender = value.gender=='M'?'男':'女';

				if(value.modifiedAt==null){
					value.modifiedAt="";
				}	
	            let noteRow = '<tr>' +
									'<td><input type="checkbox" id="checkbox_btn'+value.employee_id+'" value="'+value.employee_id+'" class="check_item"></td>'+
	      	  						'<td>' + value.employee_id + '</td>' +
			                		'<td>' + value.lastName+value.firstName + '</td>' +
									'<td>' + gender +'</td>' +
									'<td>' + value.phone + '</td>' +
									'<td>' + value.email + '</td>' +	
									'<td>' + value.address + '</td>' +
									'<td>' + value.jobTitle + '</td>' +
									'<td>' + value.hireDate + '</td>' +
									'<td>'+ value.createdAt + '</td>' +
									'<td>' + value.modifiedAt + '</td>' +
									'<td>' + value.permission + '</td>' +
									'<td><button class="button small green --jb-modal" id="inquireEmp_btn'+value.employee_id+'" value="'+value.employee_id+'" onclick="inquireEmp(this.value)" data-target="sample-modal-2" type="button"><span class="icon"><i class="mdi mdi-eye"></i></span></button></td>'+
									'<td><button class="btn btn-primary btn-sm"id="edit_btn'+value.employee_id+'" value="'+value.employee_id+'" onclick="update(this.value)" ><span class="glyphicon glyphicon-pencil">編輯</span></button></td>'+
									'<td><button class="btn btn-danger btn-sm"id="delete_btn'+value.employee_id+'" value="'+value.employee_id+'" onclick="deleteEmp(this.value)"><span class="glyphicon glyphicon-trash">刪除</span></button></td>'+
								'</tr>';
	            $('#noteTable tbody').append(noteRow);
	          });
			  

	          if ($('ul.pagination li').length - 2 != result.totalPages){
				  console.log("result.totalPages:"+result.totalPages)
	        	  $('ul.pagination').empty();
	              buildPagination(result);
	          }
	        },
	        error : function(e) {
	          alert("ERROR: ", e);
	          console.log("ERROR: ", e);
	        }
	    });
	}
		
		//清空表單樣式及內容
		function reset_form(ele) {
    $(ele)[0].reset();
    //清空表單樣式
    $(ele).find("*").removeClass("has-error has-success");
    $(ele).find(".help-block").text("");
  }

  // 點選新增按鈕彈出模態框。
  $("#emp_add_model_btn").click(function () {
 
    //清除表單資料（表單完整重置（表單的資料，表單的樣式））
    reset_form("#empAddModal form");
    //s$("")[0].reset();
    //彈出模態框
       $("#empAddModal").modal(); 
  });

		//檢查表格中的數據
		function validate_add_form(){
			//檢查密碼
			// 密碼長度須超過八個字 {8,}
			// - 小寫字母 [a-z]
			// - 大寫字母 [A-Z]
			// - 數字 \d
			// - 特殊符號 "#$%&'()*+,./:;<=>?@[]^_`{|}~-

			var empPassword = $("#password_add_input").val();
			var regex = /^((?=.{8,}$)(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).*|(?=.{8,}$)(?=.*\d)(?=.*[a-zA-Z]).*)/;
			if(!regex.test(empPassword)){
				show_validate_msg("#password_add_input","error","密碼長度須超過八個字,開頭必須是英文,不包含特殊符號")
				return false;
			}else{
				show_validate_msg("#password_add_input", "success", "");
			}
			//拿到數據，使用正則表達式檢查
			var empLastName = $("#lastName_add_input").val();
			var empFirstName = $("#firstName_add_input").val(); 
			//檢查名字
			var regLastName =/(^[u\2E80-\u9FFF]{1,3})/;
			var regFirstName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[u\2E80-\u9FFF]{1,5})/;
			if(!regLastName.test(empLastName)&&!regFirstName.test(empFirstName)){
				//先清除樣式，檢查如果有錯誤，會在輸入姓名的列表中顯示出檢查不合格的原因
				show_validate_msg("#lastName_add_input", "error", "姓必須是1-3位中文");
				show_validate_msg("#firstName_add_input", "error", "名字必須是2-5位中文或6-16位英文");
				return false;
			}else{
				show_validate_msg("#lastName_add_input", "success", "");
				show_validate_msg("#firstName_add_input", "success", "");
			}
			//檢查信箱
			var empEmail = $("#email_add_input").val();
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if(!regEmail.test(empEmail)){
				//先清除樣式，如果有錯誤，會在輸入email的列表中顯示出檢查不合格的原因
				show_validate_msg("#email_add_input", "error", "信箱格式不正確");
				return false;
			}else{
				show_validate_msg("#email_add_input", "success", "");
			}
			var empPhone = $("#phone_add_input").val();
			var regPhone =/^(09)[0-9]{8}$/;
			if(!regPhone.test(empPhone)){
				show_validate_msg("#phone_add_input","error","電話格式不正確")
				return false;
			}else{
				show_validate_msg("#phone_add_input", "success", "");
			}
			return true;
		}
		
		//清除檢查錯誤時加的樣式
		function show_validate_msg(ele, status, msg){
			
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			if("success"==status){
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			}else if("error"==status){
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}	
		//新增模態框裏的保存按鈕
		$("#emp_save_btn").click(function(){

			//對數據進行檢查
			if(!validate_add_form()){
				return false
			};
			
			//判斷檢測用戶名重複時放入的屬性信息，來確定下一步幹啥
			if($(this).attr("ajax-va")=="error"){
				return false;
			}			
			$.ajax({
				url:"${contextRoot}/save",
				type:"POST",
				//可以直接把empAddModal form裏的值構成json格式
				data:$("#empAddModal form").serialize(),
				success:function(message){
// 					 alert(message);
				  Swal.fire({
				  icon: 'success',
				  title: 'Your work has been saved',
				  showConfirmButton: false,
				  timer: 2000
				})
				
// 				Swal.fire(
//   'Good job!',
//   'You clicked the button!',
//   'success'
// )
					if(totalElements%pageSize==0){
						fetchNotes(totalPages);
					}
					else{
						fetchNotes(totalPages-1);
					}
					//關閉模態框
					$("#empAddModal").modal("hide");
						//往最後一頁，顯示剛剛保存的數據
				}
			}); 
		});
   
	//把員工的 id 傳遞給模態框的更新按鈕
	function update(id) {

			$("#empUpdateModal").modal({

			}); 

				$("#button_updete").click(function () {					
					var form = new FormData();
					form.append("file", document.getElementById("file_update").files[0]);
					 $.ajax({
						 url: "${contextRoot}/upload",        
						 data: form,
						 cache: false,
						 async: false,
						 type: "POST",                  
						 encType: "multipart/form-data",            
						 processData: false,
						 contentType: false,
						 success: function (map) { 
							//  alert(map)
							 if (map) { 
								 $("#img_update_url").attr("src",map.filePath);
								// alert("1233")
								$("#img_update_input").val(map.fileName);
								console.log(map.filePath)
		 
							 } else {
								 alert("失敗");
							 }			                
						 },
					 });
				})	

			$.ajax({
				url: "${contextRoot}/viewEmpId?employee_id=" + id,
				type: "get",
				contentType: 'application/json',
				success: function (result) {
					var img = result.img;
					var filePath="/Nice_eCommerce/upload/"+img
					// alert(img)
					// console.log("result:" + result);		
					$("#password_update_input").val(result.password);
					$("#lastName_update_input").val(result.lastName);
					$("#firstName_update_input").val(result.firstName);
					$("#empUpdateModal input[name=gender]").val([result.gender]);
					$("#phone_update_input").val(result.phone);
					$("#email_update_input").val(result.email);
					$("#address_update_input").val(result.address);
					$("#jobTitle_update_input").val(result.jobTitle);
					$("#permission_update_input").val(result.permission);
					$("#img_update_input").val(result.img);
					$("#hireDate_update_input").val(result.hireDate);
					$("#createdAt_update_input").val(result.createdAt);
					if(img!=""&&img!=null){
						$("#img_update_url").attr("src",filePath);
					}

					//   點選更新，更新員工資訊			
					$("#emp_update_btn").click(function () {
			//檢查密碼
			// 密碼長度須超過八個字 {8,}
			// - 小寫字母 [a-z]
			// - 大寫字母 [A-Z]
			// - 數字 \d
			// - 特殊符號 "#$%&'()*+,./:;<=>?@[]^_`{|}~-
			var empPassword = $("#password_update_input").val();
			var regex = /^((?=.{8,}$)(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).*|(?=.{8,}$)(?=.*\d)(?=.*[a-zA-Z]).*)/;
			if(!regex.test(empPassword)){
				show_validate_msg("#password_update_input","error","密碼長度須超過八個字,開頭必須是英文,不包含特殊符號")
				return false;
			}else{
				show_validate_msg("#password_update_input", "success", "");
			}
			//拿到數據，使用正則表達式檢查
			var empLastName = $("#lastName_update_input").val();
			var empFirstName = $("#firstName_update_input").val(); 
			//檢查名字
			var regLastName =/(^[u\2E80-\u9FFF]{1,3})/;
			var regFirstName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[u\2E80-\u9FFF]{1,5})/;
			if(!regLastName.test(empLastName)&&!regFirstName.test(empFirstName)){
				//先清除樣式，檢查如果有錯誤，會在輸入姓名的列表中顯示出檢查不合格的原因
				show_validate_msg("#lastName_update_input", "error", "姓必須是1-3位中文");
				show_validate_msg("#firstName_update_input", "error", "名字必須是2-5位中文或6-16位英文");
				return false;
			}else{
				show_validate_msg("#lastName_update_input", "success", "");
				show_validate_msg("#firstName_update_input", "success", "");
			}
			//檢查信箱
			var empEmail = $("#email_update_input").val();
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if(!regEmail.test(empEmail)){
				//先清除樣式，如果有錯誤，會在輸入email的列表中顯示出檢查不合格的原因
				show_validate_msg("#email_update_input", "error", "信箱格式不正確");
				return false;
			}else{
				show_validate_msg("#email_update_input", "success", "");
			}
			//檢查電話
			var empPhone = $("#phone_update_input").val();
			var regPhone =/^(09)[0-9]{8}$/;
			if(!regPhone.test(empPhone)){
				show_validate_msg("#phone_update_input","error","電話格式不正確")
				return false;
			}else{
				show_validate_msg("#phone_update_input", "success", "");
			}
						// 2、傳送 ajax 請求儲存更新的員工資料 
						if(id!=""){
							$.ajax({
							url: "${contextRoot}/employee/editEmployee?employee_id=" + id,
							//   type:"put",
							// dataType: "json",
							type: "POST",
							data: $("#empUpdateModal form").serialize(),
							success: function (result) {
								console.log(result)
								fetchNotes(0);
								$("#empUpdateModal").modal("hide");
								// to_page(currentPage);
								
								filePath="";
								id="";			
							}
							
						});					
						}		
					});
				}
			});
		}
			function deleteEmp(id) {

				if (confirm("確定要刪除嗎")) {
					$.ajax({
						url: "${contextRoot}/employee/deleteEmployee?employee_id="+ id,
						type: "GET",
						contentType: 'application/json',
						success: function (result) {
							fetchNotes(0);
						}
					});
				}
				$("#emp_delete_all_btn").click(function(){
					alert("221")
				});
			}
				// 全選功能			
				$("#check_all").click(function () {
					$(".check_item").prop("checked", $(this).prop("checked"));
				});

				$(document).on("click", ".check_item", function () {
					var flag = $(".check_item:checked").length == $(".check_item").length;
					$("#check_all").prop("checked", flag);
				});

				function deleteEmpList() {
				//找到被勾選的checkbox
				var emp_list ="";
				var checkboxes = document.querySelectorAll('input[type=checkbox]:checked')

					for (var i = 1; i < checkboxes.length; i++) {
						emp_list += "," + checkboxes[i].value;
						//,123,456
						console.log(checkboxes[i].value);
						// alert(checkboxes[i].value)
				}

				if (confirm("確定要刪除嗎")) {
					$.ajax({
					url: "${contextRoot}/employee/deleteChoiceEmp",
					data:{"employee_id" : [emp_list.substring(1)]},//123,456	
                        traditional : true,//如果要傳陣列，這行一定要加！用傳統的方式來序列化資料
						// 預設的話，traditional為false，即jquery會深度序列化引數物件，
						// 以適應如PHP和Ruby on Rails框架，但servelt api無法處理，
						// 我們可以通過設定traditional 為true阻止深度序列化，然後序列化結果如下：
						// p: ["123", "456", "789"]    =>    p=123&p=456&p=456
						type: "GET",
						success: function (result) {
							console.log(emp_list.substring(1))
							$("#check_all").prop("checked",false);
							fetchNotes(0);
						}
					});
				}
			}

				

			function inquireEmp(id){
				$("#empInquireModal").modal({
			});
			$('img').removeAttr('src');
			$.ajax({
				url: "${contextRoot}/viewEmpId?employee_id=" + id,
				type: "get",
				contentType: 'application/json',
				success: function (result) {
					var img = result.img;
					var filePath="/Nice_eCommerce/upload/"+img
					$("#lastName_inquire_input").val(result.lastName);
					$("#firstName_inquire_input").val(result.firstName);
					$("#empInquireModal input[name=gender]").val([result.gender]);
					$("#phone_inquire_input").val(result.phone);
					$("#email_inquire_input").val(result.email);
					$("#address_inquire_input").val(result.address);
					$("#jobTitle_inquire_input").val(result.jobTitle);
					$("#permission_inquire_input").val(result.permission);
					if(img!=""&&img!=null){
						$("#img_inquire_url").attr("src",filePath);
					}
				}
			});
	};
			
				$(function () {
			        $("#button").click(function () {
						form="";	
			            var form = new FormData();
			            form.append("file", document.getElementById("file").files[0]);
			             $.ajax({
			                 url: "${contextRoot}/upload",        
			                 data: form,
			                 cache: false,
			                 async: false,
			                 type: "POST",                  
			                 encType: "multipart/form-data",            
			                 processData: false,
			                 contentType: false,
			                 success: function (map) { 
			                     if (map) { 
			                     	$("#img_url").attr("src",map.filePath);
									$("#img").val(map.fileName);								
			                     } else {
			                     	alert("失敗");
			                     }										                
			                 }
			             });
						
			        })		 
			    });

				$("#emp_Automatic").click(function(){
					$("#password_add_input").val("a12345678");
					$("#lastName_add_input").val("蘇");
					$("#firstName_add_input").val("峻輝");
					// $("#gender2_add_input").prop("checked",true);
					$("#gender1_add_input").prop("checked",true);
					$("#phone_add_input").val("0976820155");
					$("#email_add_input").val("sulol0703@gmail.com");
					$("#address_add_input").val("台北市中山區");
				})
	</script>
  
  <noscript><img height="1" width="1" style="display:none" src="https://www.facebook.com/tr?id=658339141622648&ev=PageView&noscript=1" /></noscript>



  <!-- Icons below are for demo only. Feel free to use any icon pack. Docs: https://bulma.io/documentation/elements/icon/ -->
  <link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">

</body>

</html>