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
<title>課程訂單列表</title>

<!-- 原生 icon -->
<link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">

<!-- 原生 css -->
<link rel="stylesheet" href="${contextRoot}/resources/backstage/css/main.css?v=1628755089081">

<link rel="icon" type="image/png" sizes="32x32" href="${contextRoot}/resources/backstage/favicon-32x32.png"/>
<link rel="icon" type="image/png" sizes="16x16" href="${contextRoot}/resources/backstage/favicon-16x16.png"/>

<!-- 原生 js -->
<script type="text/javascript" 
	src="${contextRoot}/resources/backstage/js/main.min.js?v=1628755089081"
	defer>
</script>

<!--jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous">
</script>

<script>
$(document).ready(function () {
	// 請求 course booking list
	$.ajax({
		method: "GET", // api query
		url: $("#contextRoot").val() + "/api/courseBooking",
		success: function (courseBookingDtoList) {
			$(courseBookingDtoList).each(function (index, courseBookingDto) {
				// 樣板
				const trTemplate = $("#tr-template");
				
				// 複製
				const trClone = $( $(trTemplate).html() );
				// 開始塞值
				$("#memberId", trClone).text(courseBookingDto.memberId);
				$("#memberFullName", trClone).text(courseBookingDto.memberFullName);
				$("#courseName", trClone).text(courseBookingDto.courseName);
				$("#bookingStatus", trClone).text(courseBookingDto.bookingStatus);
				if(courseBookingDto.modifiedAt==null) { // 從未編輯, 用 createdAt
					$("#createdAtOrModifiedAt", trClone).find("small").text(courseBookingDto.createdAt);
				} else { // 編輯過, 用 modifiedAt
					$("#createdAtOrModifiedAt", trClone).find("small").text(courseBookingDto.modifiedAt);
				}
				// 塞值給連結
// 				$("#editAnchor", trClone).attr("href", $("#contextRoot").val()+"/courseBooking/detailPage/"+courseBookingDto.id);
				// 塞id給deleteBtn
				$("#deleteBtn", trClone).attr("data-id", courseBookingDto.id); // jQuery 的 data setter 不能改變 html 的 data-* (因為 html DOM object attr 推出較晚), 只能改變 object 的 data, 若要改變 html 的 data-* 要用 attr
				// 插在樣板前面
				$( trTemplate ).before( trClone );
			})
		}
	}); // find all 請求結束
});
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
      <li>後台</li>
      <li>課程訂單列表</li>
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
      課程訂單列表
    </h1>
    <button class="button light">Button</button>
  </div>
</section>

<!-- 核心內容的 section 開始 -->
<section class="section main-section">

    <div class="card has-table">
    
      <!-- 表格標題 -->
      <header class="card-header">
        <p class="card-header-title">
          <span class="icon"><i class="mdi mdi-account-multiple"></i></span>
          課程訂單
        </p>
        <a href="#" class="card-header-icon">
          <span class="icon"><i class="mdi mdi-reload"></i></span>
        </a>
      </header>

      <!-- 真的表格 -->
      <div class="card-content">
        <table>
          
          <!-- 表格表頭(th) -->
          <thead>
          <tr>
            <th class="checkbox-cell">
              <label class="checkbox">
                <input type="checkbox">
                <span class="check"></span>
              </label>
            </th>
            <th>會員編號</th>
            <th>會員姓名</th>
            <th>課程名稱</th>
            <th>訂單狀態</th>
            <th>建檔/編輯日期</th>
            <th></th>
          </tr>
          </thead>
          
          <!-- 表格內文(td) -->
          <tbody id="templateContainer">
	          <template id="tr-template">
		          <tr>
		            <td class="checkbox-cell">
		              <label class="checkbox">
		                <input type="checkbox">
		                <span class="check"></span>
		              </label>
		            </td>
		            <!-- 文字 td 開始 -->
		            <td id="memberId"></td>
		            <td id="memberFullName"></td>
		            <td id="courseName"></td>
		            <td id="bookingStatus"></td>
		            <td id="createdAtOrModifiedAt">
		              <small class="text-gray-500"></small>
		            </td>
		            <td class="actions-cell">
		              <div class="buttons right nowrap">
		                <a id="editAnchor">
			                <button class="button small green" type="button">
			                  <span class="icon"><i class="mdi mdi-pencil"></i></span>
			                </button>
		                </a>
		                <!-- 有 jb-modal-forDeleteConfirm, 觸發客製彈窗 -->
		                <button id="deleteBtn" type="button" class="button small red --jb-modal-delete" 
		                	data-target="deleteConfirm-modal" 
		                	data-id="">
		                  <span class="icon"><i class="mdi mdi-trash-can"></i></span>
		                </button>
		              </div>
		            </td>
		          </tr>
			  </template>
          </tbody>
        </table>
        <div class="table-pagination">
          <div class="flex items-center justify-between">
            <div class="buttons">
              <button type="button" class="button active">1</button>
              <button type="button" class="button">2</button>
              <button type="button" class="button">3</button>
            </div>
            <small>Page 1 of 3</small>
          </div>
        </div>
      </div>
    </div>

</section>
<!-- 原核心內容的 section 結束 -->

<!-- 插入頁腳 -->
<jsp:directive.include file="/WEB-INF/pages/layout/backstage/footer.jsp" />

<!-- 刪除按鈕觸發彈窗 -->
<div id="deleteConfirm-modal" class="modal">
	<div class="modal-background --jb-modal-close"></div>
	<div class="modal-card" style="width:300px">
		<header class="modal-card-head">
			<p class="modal-card-title">注意</p>
		</header>
		<section class="modal-card-body">
			<p>
				確定要<b>刪除</b>這筆資料嗎?
			</p>
		</section>
		<footer class="modal-card-foot">
			<button class="button --jb-modal-close">返回</button>
			<button id="deleteConfirmBtn" class="button red --jb-modal-close">確認刪除</button>
		</footer>
	</div>
</div>

</div>

</body>
</html>
