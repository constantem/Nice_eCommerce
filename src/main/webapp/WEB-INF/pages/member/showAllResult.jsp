<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>所有會員</title>

<!-- Tailwind is included -->
<!-- <link rel="stylesheet" href="${contextRoot}/resources/backstage/css/main.css?v=1628755089081"> -->
<link rel="stylesheet"
	href="${contextRoot}/resources/backstage/css/main.css">
<link rel="apple-touch-icon" sizes="180x180"
	href="${contextRoot}/resources/backstage/apple-touch-icon.png" />
<link rel="icon" type="image/png" sizes="32x32"
	href="${contextRoot}/resources/backstage/favicon-32x32.png" />
<link rel="icon" type="image/png" sizes="16x16"
	href="${contextRoot}/resources/backstage/favicon-16x16.png" />
<link rel="mask-icon"
	href="${contextRoot}/resources/backstage/safari-pinned-tab.svg"
	color="#00b4b6" />

<meta name="description" content="Admin One - free Tailwind dashboard">

<meta property="og:url"
	content="https://justboil.github.io/admin-one-tailwind/">
<meta property="og:site_name" content="JustBoil.me">
<meta property="og:title" content="Admin One HTML">
<meta property="og:description"
	content="Admin One - free Tailwind dashboard">
<meta property="og:image"
	content="https://justboil.me/images/one-tailwind/repository-preview-hi-res.png">
<meta property="og:image:type" content="image/png">
<meta property="og:image:width" content="1920">
<meta property="og:image:height" content="960">

<meta property="twitter:card" content="summary_large_image">
<meta property="twitter:title" content="Admin One HTML">
<meta property="twitter:description"
	content="Admin One - free Tailwind dashboard">
<meta property="twitter:image:src"
	content="https://justboil.me/images/one-tailwind/repository-preview-hi-res.png">
<meta property="twitter:image:width" content="1920">
<meta property="twitter:image:height" content="960">

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
	
</head>

<style>
#searchMem{

font-size:120%;
font-weight:bold;
}



</style>


<body>

	<div id="app">

		<!-- 插入上導覽列與左導覽列 -->
		<jsp:directive.include file="/WEB-INF/pages/layout/backstage/nav-and-aside.jsp" />

	<!-- 層級 -->
	<section class="is-title-bar">
	  <div class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
	    <ul>
	      <li>管理系統</li>
	      <li>會員管理</li>
	    </ul>
	  </div>
	</section>

	<!-- 標題 -->
	<section class="is-hero-bar">
	  <div class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
	    <h1 class="title">
	      會員列表
	    </h1>
	  </div>
	</section>

		<!-- 核心內容標題 -->
		

		<!-- 原核心內容的 section 開始 -->
		
		
			<form action="${contextRoot}/member/findAllByNameLike">
			<label id="searchMem" >查詢特定會員:</label>
				<input type="text" name="specificUsername">
				<input type="submit" value="送出">
			 
			<action="${contextRoot}/staff/member/showAllResult">
				<input type="submit" value="返回">
			</form>

			<table>
			<thead>
				<tr>
				<th class="checkbox-cell"><label class="checkbox">
					<input type="checkbox" id="checkall"><span class="check" οnclick="swapCheck()"></span>
					</label></th>
				<th class="image-cell"></th>
					<th>編號</th>
					<th>帳號</th>
					<th>密碼</th>
					<th>姓名</th>
					<th>生日</th>
					<th>性別</th>
					<th>電話</th>
					<th>email</th>
					<th>住址</th>
					<th>修改</th>
					<th>刪除</th>
				</tr>
				<c:forEach items="${page.content}" var="member">
						<tr>
						<td class="checkbox-cell"><label class="checkbox">
							<input type="checkbox" class="checkitem"> <span class="check"></span>
							</label></td>
						<td class="image-cell">
						</td>
						<td>${member.memberid}</td>
						<td>${member.username}</td>
						<td>${member.password}</td>
						<td>${member.lastname}${member.firstname}</td>
						<td>${member.birthdate}</td>
						<td>${member.gender}</td>
						<td>${member.phone}</td>
						<td>${member.email}</td>
						<td>${member.address}</td>
						<td>
							<a href="${contextRoot}/member/edit?id=${member.memberid}">
								<button class="button small green " type="button">
								  <span class="icon"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
	 									<path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"/>
									</svg></span>
	               				</button>
	               			</a>	
             			</td>
						<td>
							<a href="${contextRoot}/member/delete?id=${member.memberid}">
								<button class="button small red" type="button" onclick="deleteMemberList()">
									<span class="icon"><i class="mdi mdi-trash-can"></i></span>
								</button>
							</a>
						</td>
						
					</tr>
				</c:forEach>
			</table>
			
		<div id="page" align="center"> 
			<div class="table-pagination">
				<div class="flex items-center">
 				<c:forEach var="pageNumber" begin="1" end="${page.totalPages}"> 
 					<c:choose> 
 						<c:when test="${page.number !=pageNumber-1 }">
 						<div class="buttons">
 							<a href="${contextRoot}/staff/member/showAllResult?p=${pageNumber}">
 							<button type="button" class="button active">${pageNumber}</button></a>
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
					<p>
						Lorem ipsum dolor sit amet <b>adipiscing elit</b>
					</p>
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
					<p>
						Lorem ipsum dolor sit amet <b>adipiscing elit</b>
					</p>
					<p>This is sample modal</p>
				</section>
				<footer class="modal-card-foot">
					<button class="button --jb-modal-close">Cancel</button>
					<button class="button blue --jb-modal-close">Confirm</button>
				</footer>
			</div>
		</div>

	</div>

	<!-- Scripts below are for demo only -->
	<script type="text/javascript"
		src="${contextRoot}/resources/backstage/js/main.min.js?v=1628755089081"></script>

	<script>
		!function(f, b, e, v, n, t, s) {
			if (f.fbq)
				return;
			n = f.fbq = function() {
				n.callMethod ? n.callMethod.apply(n, arguments) : n.queue
						.push(arguments)
			};
			if (!f._fbq)
				f._fbq = n;
			n.push = n;
			n.loaded = !0;
			n.version = '2.0';
			n.queue = [];
			t = b.createElement(e);
			t.async = !0;
			t.src = v;
			s = b.getElementsByTagName(e)[0];
			s.parentNode.insertBefore(t, s)
		}(window, document, 'script',
				'https://connect.facebook.net/en_US/fbevents.js');
		fbq('init', '658339141622648');
		fbq('track', 'PageView');
	</script>
	
	<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script type="text/javascript">
	//全選(可全選，無法刪除)
	var isCheckAll = false;
        function swapCheck() {
            if (isCheckAll) {
                $("input[type='checkbox']").each(function() {
                    this.checked = false;
                });
                isCheckAll = false;
            } else {
                $("input[type='checkbox']").each(function() {
                    this.checked = true;
                });
                isCheckAll = true;
            }
        }

        function aa() {
            var bb = "";
            var temp = "";
            var a = document.getElementsByName("user");
            for (var i = 0; i < a.length; i++) {
                if (a[i].checked) {
                    temp = a[i].value;
                    bb = bb + "," + temp;
                }
            }
            document.getElementById("tempString").value = bb.substring(1,
                    bb.length);
        }
	
 		$("#checkall").click(function(){
 			$(".checkitem").prop("checked", $(this).prop("checked"));
 		});

 		$(document).on("click", ".checkitem", function(){
			var flag = $(".checkitem:checked").length == $(".checkitem").length;
 			$("checkall").prop("checked", flag);
		});
 		
	//刪除談窗
 		function deleteMemberList(){
 			var memberlist ="";
 			var checkboxs =document.querySelectorAll("input[type=checkbox]:checked")

 			for(var i = 1; i < checkboxs.length; i++){
 				memberlist += "," + checkboxs[i].value;
 			}

 			if(confirm("確定刪除嗎?")){
 				$.ajax({
 					url:"${contextRoot}/member/delete",
					
				})
 			}
 		}
	</script>

	<noscript>
		<img height="1" width="1" style="display: none"
			src="https://www.facebook.com/tr?id=658339141622648&ev=PageView&noscript=1" />
	</noscript>

	<!-- Icons below are for demo only. Feel free to use any icon pack. Docs: https://bulma.io/documentation/elements/icon/ -->
	<link rel="stylesheet"
		href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">


</body>
</html>