<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<jsp:include page="layout/default.jsp" />

<!DOCTYPE html>
<html>
<head>
<!-- <meta charset="UTF-8"> -->
<meta charset=UTF-8>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>


</head>
<body>
<!-- 員工添加模態框 -->
	<!-- Modal --> 
	<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-target="#empAddModal">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">新增員工</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
				<div class="form-group">
					<label class="col-sm-2 control-label">密碼</label>
					<div class="col-sm-10">
					  <input type="text" name="password" class="form-control" id="password_add_input">
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
			      <input type="text" name="phone" class="form-control" id="phone_add_input"  >
			      <span class="help-block"></span>
			    </div>
			  </div>

			  <div class="form-group">
			    <label class="col-sm-2 control-label">email</label>
			    <div class="col-sm-10">
			      <input type="text" name="email" class="form-control" id="email_add_input" placeholder="email@atguigu.com">
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
			      <input type="text" name="jobTitle" class="form-control" id="jobTitle_add_input">
			      <span class="help-block"></span>
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
	      	<button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal">關閉</button>       
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
	        <h4 class="modal-title">員工修改</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal">
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
					  <input type="radio" name="gender" id="gender1_update_input" value="M" checked> 男
				  </label>
				  <label class="radio-inline">
					  <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
			      </label>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">電話</label>
			    <div class="col-sm-5">
			      <input type="text" name="phone" class="form-control" id="phone_update_input"  >
			      <span class="help-block"></span>
			    </div>
			  </div>

			  <div class="form-group">
			    <label class="col-sm-2 control-label">email</label>
			    <div class="col-sm-10">
			      <input type="text" name="email" class="form-control" id="email_update_input" placeholder="email@atguigu.com">
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
			      <input type="text" name="jobTitle" class="form-control" id="jobTitle_update_input">
			      <span class="help-block"></span>
			    </div>
			  </div>

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
	        <button type="button" class="btn btn-default" data-dismiss="modal">關閉</button>
	      </div>
	    </div>
	  </div>
	</div>


<!-- <--==================================== --> 
	<div class="container">
		<div>
			<div class="card has-table">
				<header class="card-header">
					<p class="card-header-title">
						<span class="icon"><i class="mdi mdi-account-multiple"></i></span>
						Clients
					</p>
					<a href="#" class="card-header-icon"> <span class="icon"><i
							class="mdi mdi-reload"></i></span>
					</a>
				</header>
			</div>

			<section class="is-hero-bar">
				<div
					class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
					<h1 class="title">員工管理系統</h1>
					<button class="button light">Button</button>
				</div>
			</section>
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
				<button type="button" class="btn btn-danger btn-sm">刪除</button>	
			</div>
			
			<div class="row">
				<div class="col-md-12">
					<!-- <table class="table table-hover" id="emps_table"> -->
						<table id="noteTable" class="table table-hover table-sm">
						<!-- <thead> -->
							<thead class="thead-dark">
							<tr>
								<th><input type="checkbox" class="all">#</th>
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

			<ul class="pagination justify-content-center" style="margin:20px 0; cursor: pointer;">
			</ul>

	</div>

</div>
	<script>
	
var pageSize = 5;
var totalElements;

		$(document).ready(function() {
	let totalPages = 0;

	fetchNotes(totalPages);
	
	
	// (function(){
    // 	// get first-page at initial time
    // 	fetchNotes(0);
    // })();
});



$(document).on("click", "ul.pagination li a", function() {
        var data = $(this).attr('data');
		let val = $(this).text();
		console.log('val: ' + val);

		// click on the NEXT tag
		if(val.toUpperCase() === "« FIRST") {
			let currentActive = $("li.active");
			fetchNotes(0);
			$("li.active").removeClass("active");
	  		// add .active to next-pagination li
	  		currentActive.next().addClass("active");
		} else if(val.toUpperCase() === "LAST »") {
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
		console.log("totalPages:"+totalPages)
		var pageNumber = result.pageable.pageNumber;
		console.log(pageNumber)
		 totalElements = result.totalElements;
		var numLinks = 10;
		
		// print 'previous' link only if not on page one
		var first = '';
		var prev = '';
		if (pageNumber > 0) {
			if(pageNumber !== 0) {
				first = '<li class="page-item"><a class="page-link">« First</a></li>';
			}
			prev = '<li class="page-item"><a class="page-link">‹ Prev</a></li>';
		} else {
			
			prev = '<li  class="disable"><a >‹ Prev</a></li>'; // on the page one, don't show 'previous' link
			first = '<li class="disable"><a >‹ First</a></li>'; // nor 'first page' link
		}
		
		// print 'next' link only if not on the last page
		var next = '';
		var last = '';
		if (pageNumber < totalPages) {
			if(pageNumber !== totalPages - 1) {
				next = '<li class="page-item"><a class="page-link">Next ›</a></li>';				
				last = '<li class="page-item"><a class="page-link">Last »</a></li>';
			}
		} else {
			next = '<li class="disable"><a class="page-link">Next ›</a></li>'; // on the last page, don't show 'next' link
			last = '<li class="disable"><a class="page-link">Last »</a></li>'; // nor 'last page' link
		}
		
		var start = pageNumber - (pageNumber % numLinks) + 1;
		console.log("start:"+start)
		console.log("pageNumber:"+pageNumber)
		console.log("numLinks:"+numLinks)
		var end = start + numLinks - 1;
		console.log("end:"+end)
		end = Math.min(totalPages, end);
		console.log(Math.min(totalPages, end))
		console.log("end1:"+end)
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
				console.log(result)
	          $('#noteTable tbody').empty();
	          // add table rows
	          $.each(result.content, (idenx, value) => {
	            let noteRow = '<tr>' +
									'<td><input type="checkbox"></td>'+
	      	  						'<td>' + value.employee_id + '</td>' +
			                		'<td>' + value.lastName+value.firstName + '</td>' +
									'<td>' + value.gender +'</td>' +
									'<td>' + value.phone + '</td>' +
									'<td>' + value.email + '</td>' +	
									'<td>' + value.address + '</td>' +
									'<td>' + value.jobTitle + '</td>' +
									'<td>' + value.hireDate + '</td>' +
									'<td>'+ value.createdAt + '</td>' +
									'<td>' + value.modifiedAt + '</td>' +
									'<td>' + value.permission + '</td>' +
									'<td><button class="btn btn-primary btn-sm"id="edit_btn'+value.employee_id+'" value="'+value.employee_id+'" onclick="update(this.value)" ><span class="glyphicon glyphicon-pencil">編輯</span></button></td>'+
									'<td><button class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash">刪除</span></button></td>'+
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

//   function getDepts(ele) {
//     // 清空之前下拉選單的值
//     $(ele).empty();
//     $.ajax({
//       url: "${APP_PATH}/depts",
//       type: "get",
//       success:function (result) {
//         //"extend":{"depts":[{"deptId":1,"deptName":"開發部"},{"deptId":2,"deptName":"測試部"}]}}
//         //顯示部門資訊在下拉選單中
//         $("#empAddModal select").append("")
//         $.each(result.extend.depts,function(){
//           var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId);
//           optionEle.appendTo(ele);
//         });
//       }
//     });
//   }

  // 點選新增按鈕彈出模態框。
  $("#emp_add_model_btn").click(function () {
 
    //清除表單資料（表單完整重置（表單的資料，表單的樣式））
    reset_form("#empAddModal form");
    //s$("")[0].reset();
    //彈出模態框
       $("#empAddModal").modal(); 
  });

		//校驗表格中的數據
		function validate_add_form(){
			//拿到數據，使用正則表達式檢查
			var empName = $("#empName_add_input").val();
			//校驗用戶名
			var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[u\2E80-\u9FFF]{2,5})/;
			if(!regName.test(empName)){
				//先清除樣式，然後校驗如果有錯誤，會友好的在輸入姓名的列表中顯示出校驗不合格的原因
				show_validate_msg("#empName_add_input", "error", "姓名必須是2-5位中文或6-16位英文和數字的組合");
				return false;
			}else{
				show_validate_msg("#empName_add_input", "success", "");
			}
			//檢查信箱
			var email = $("#email_add_input").val();
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if(!regEmail.test(email)){
				//先清除樣式，如果有錯誤，會友好的在輸入email的列表中顯示出檢查不合格的原因
				show_validate_msg("#email_add_input", "error", "信箱格式不正確");
				return false;
			}else{
				show_validate_msg("#email_add_input", "success", "");
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
		
		// //檢查用戶名是否可用（即是否重複）
		// $("#empName_input").change(function(){
		// 	var empName = this.value;
		// 	$.ajax({
		// 		url:"${APP_PATH}/checkuser",
		// 		data:"empName=" + empName,
		// 		type:"GET",
		// 		success:function(result){
		// 			if(result.code==0){
		// 				show_validate_msg("#empName_input", "success", "用戶名可用");
		// 				$("#add_emp_btn").attr("ajax-va", "success");
		// 			}else{
		// 				show_validate_msg("#empName_input", "error", "用戶名已存在");
		// 				$("#add_emp_btn").attr("ajax-va", "error");
		// 			}
		// 		}
		// 	});
			
		// });
		
		//新增模態框裏的保存按鈕
		$("#emp_save_btn").click(function(){
			
			Swal.fire({
				  icon: 'success',
				  title: 'Your work has been saved',
				  showConfirmButton: false,
				  timer: 1500
				})
				
				Swal.fire(
  'Good job!',
  'You clicked the button!',
  'success'
)
			
			//對數據進行校驗
			if(!validate_add_form()){
				return false
			};
			
			// //判斷檢測用戶名重複時放入的屬性信息，來確定下一步幹啥
			// if($(this).attr("ajax-va")=="error"){
			// 	return false;
			// }
						
			$.ajax({
				url:"${contextRoot}/save",
				type:"POST",
				//可以直接把empAddModal form裏的值構成json格式
				data:$("#empAddModal form").serialize(),
				success:function(message){
// 					 alert(message);

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

		// 1、如果在編輯和刪除按鈕建立之前繫結 click 是繫結不上的
  // 1）可以在建立按鈕的時候繫結
  // 2）繫結點選 .live()
//   $(document).on("click", "#edit_btn", function () {


//     //把員工的 id 傳遞給模態框的更新按鈕
//     // $("#emp_update_btn").attr("edit-id", $(this).attr("edit-id"));
//     $("#empUpdateModal").modal({

//     });
//   });


  function update(id) { 
		getEmp(id);
		alert(id);
		$("#emp_update_btn").attr("edit-id", $(this).attr("edit-id"));
		
		

		$("#empUpdateModal").modal({

		});
		getEmp(id);
	}

  function getEmp(id) { 
    $.ajax({
      url:"${contextRoot}/employee/editEmployee?employee_id="+id,
      type:"get",
      success:function (result) {
		  console.log("result:"+result);

        // var empData = result.extend.emp;
		// console.log("empData:"+empData);
		// alert("022")
        $("#password_update_input").val(empData.password);
        $("#lastName_update_input").val(empData.lastName);
		$("#firstName_update_input").val(empData.firstName);
		$("#empUpdateModal input[name=gender]").val([empData.gender]);
		$("#phone_update_input").val(empData.phone);	
		$("#email_update_input").val(empData.email);
		$("#address_update_input").val(empData.address);
		$("#jobTitle_update_input").val(empData.jobTitle);
		$("#permission_update_input").val(empData.permission);
      }
    });
  }
  // 點選更新，更新員工資訊
  $("#emp_update_btn").click(function () {
    // 驗證郵箱是否合法
    // 1、校驗郵箱資訊
    var email = $("#email_update_input").val();
    var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
    if (!regEmail.test(email)) {
      show_validate_msg("#email_update_input", "error", "郵箱格式不正確");
      return false;
    } else {
      show_validate_msg("#email_update_input", "success", "");
    }

    // 2、傳送 ajax 請求儲存更新的員工資料
    $.ajax({
      url:"${contextRoot}/save",
      type:"put",
      data:$("#empUpdateModal form").serialize(),
      success:function (result) {
        $("#empUpdateModal").modal("hide");
        to_page(currentPage);
      }
    });
  });
	</script>
</body>
</html>