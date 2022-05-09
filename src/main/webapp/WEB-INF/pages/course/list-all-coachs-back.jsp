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
<title>教練列表</title>

<!-- Icons below are for demo only. Feel free to use any icon pack. Docs: https://bulma.io/documentation/elements/icon/ -->
<link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">

<!-- Tailwind is included -->
<link rel="stylesheet" href="${contextRoot}/resources/backstage/css/main.css?v=1628755089081">

<link rel="icon" type="image/png" sizes="32x32" href="${contextRoot}/resources/backstage/favicon-32x32.png"/>
<link rel="icon" type="image/png" sizes="16x16" href="${contextRoot}/resources/backstage/favicon-16x16.png"/>

<!-- Scripts below are for demo only -->
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
		
		// 請求 coach list
		$.ajax({
			method: "GET", // api query
			url: $("#contextRoot").val() + "/api/coach",
			success: function (coachs) {
				$(coachs).each(function (index, coach) {
					// 樣板
					const trTemplate = $("#tr-template");
					
					// 複製
					const trClone = $( $(trTemplate).html() );
					// 開始塞值
					$("#fullName", trClone).text(coach.lastName+coach.firstName);
					$("#nickname", trClone).text(coach.nickname);
					$("#gender", trClone).text(coach.gender);
					$("#phone", trClone).text(coach.phone);
					$("#email", trClone).text(coach.email);
					$("#address", trClone).text(coach.address);
					$("#hireDate", trClone).find("small").text(coach.hireDate);
					console.log("coach.modifiedAt");
					console.log(coach.modifiedAt, typeof coach.modifiedAt);
					console.log(coach.modifiedAt==null);
					if(coach.modifiedAt==null) { // 從未編輯, 用 createdAt
						$("#createdAtOrModifiedAt", trClone).find("small").text(coach.createdAt);
					} else { // 編輯過, 用 modifiedAt
						$("#createdAtOrModifiedAt", trClone).find("small").text(coach.modifiedAt);
					}
					// 塞 Base64 給 img
					if(coach.profileBase64) {
						$("#profileBase64", trClone).attr("src", "data:image/jpeg;base64, "+coach.profileBase64);
					}
					// 塞值給連結
					$("#editAnchor", trClone).attr("href", $("#contextRoot").val()+"/coach/detailPage/"+coach.id);
					
					// 插在樣板前面
					$( trTemplate ).before( trClone );
				})
			}
		});
	});
</script>
</head>
<body>

<input type="hidden" id="contextRoot" value="${contextRoot}">

<div id="app">

<!-- 插入上導覽列與左導覽列 -->
<jsp:directive.include file="/WEB-INF/pages/layout/backstage/nav-and-aside.jsp" />

<!-- 章節層級 -->
<section class="is-title-bar">
  <div class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
    <ul>
      <li>後台</li>
      <li>教練列表</li>
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
      教練列表
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
          教練
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
            <th class="image-cell"></th>
            <th>姓名</th>
            <th>暱稱</th>
            <th>性別</th>
            <th>電話</th>
            <th>電子信箱</th>
            <th>住址</th>
            <th>起聘日期</th>
            <th>建檔/編輯日期</th>
            <th></th>
          </tr>
          </thead>
          
          <!-- 表格內文(tr+td) -->
          <tbody>
	          <template id="tr-template">
		          <tr>
		            <td class="checkbox-cell">
		              <label class="checkbox">
		                <input type="checkbox">
		                <span class="check"></span>
		              </label>
		            </td>
		            <!-- 小圖 td -->
		            <td class="image-cell">
		              <div class="image">
		                <img id="profileBase64" src="" class="rounded-full">
		              </div>
		            </td>
		            <!-- 文字 td 開始 -->
		            <td id="fullName"></td>
		            <td id="nickname"></td>
		            <td id="gender"></td>
		            <td id="phone"></td>
		            <td id="email"></td>
		            <td id="address"></td>
		            <td id="hireDate">
		              <small class="text-gray-500"></small>
		            </td>
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
		                <button class="button small red --jb-modal" data-target="sample-modal" type="button">
		                  <span class="icon"><i class="mdi mdi-trash-can"></i></span>
		                </button>
		              </div>
		            </td>
		          </tr>
			  </template>
          </tbody>
        </table>
        
        <!-- 頁碼頁數 -->
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

<!-- 彈窗1 -->
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

</div>

</body>
</html>
