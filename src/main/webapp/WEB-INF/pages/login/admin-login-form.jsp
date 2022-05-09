<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en" class="form-screen">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>後台超級管理員登入</title>

<!-- 原生 icon -->
<link rel="stylesheet"
	href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">

<!-- 原生 css -->
<link rel="stylesheet" href="${contextRoot}/resources/backstage/css/main.css?v=1628755089081">

<link rel="icon" type="image/png" sizes="32x32" href="${contextRoot}/resources/backstage/favicon-32x32.png"/>
<link rel="icon" type="image/png" sizes="16x16" href="${contextRoot}/resources/backstage/favicon-16x16.png"/>

<!-- 原生 js -->
<script type="text/javascript" 
	src="${contextRoot}/resources/backstage/js/main.min.js?v=1628755089081"
	defer>
</script>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"
integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
crossorigin="anonymous">
</script>
	
<script>
$(document).ready(function() {
	$("#admin").click(function() {
		$.ajax({
			url: $("#contextRoot").val() + "/adminLoginAutoInput",
			success: function (employee) {
				console.log(employee.employee_id);
				$("#username").val(employee.employee_id);
				console.log(employee.password);
				$("#password").val(employee.password);
			}
		});
	});
});
</script>
</head>
<body>
<!-- variable -->
<input type="hidden" id="contextRoot" value="${pageContext.request.contextPath}">
<div id="app">

  <section class="section main-section">
    <div class="card">
      <header class="card-header">
        <a class="card-header-title" 
        	href="${contextRoot}/staffLogin"
        	style="color: LightGray; border-bottom: 1px solid rgb(229, 231, 235);">
          <span class="icon"><i class="mdi mdi-lock"></i></span>
          員工登入
          <span style="color:red;">${error.notexist}</span>
	    </a>
	    <a class="card-header-title" 
	    	style="border-left: 1px solid rgb(229, 231, 235); border-bottom: 1px solid rgb(229, 231, 235);">
          <span class="icon"><i class="mdi mdi-lock"></i></span>
          超級管理員登入<span style="color:red;">${error.notexist}</span>
	    </a>
      </header>
      <div class="card-content">
        <form
        	action="${contextRoot}/adminLoginAuthenticate" 
        	method="post" >

          <div class="field spaced">
            <label for="username" class="label">
            	超級管理員
            </label>
            <div class="control icons-left">
              <input id="username" class="input" type="hidden" name="username" value="1001"/>
            </div>
            <p class="help" style="color:red">
<%--               <form:errors path="username"/> --%>
            </p>
          </div>

          <div class="field spaced">
            <label for="password" class="label">
            	密碼
            </label>
            <p class="control icons-left">
              <input id="password" class="input" type="password" name="password" placeholder=""/>
              <span class="icon is-small left"><i class="mdi mdi-asterisk"></i></span>
            </p>
            <p class="help" style="color:red">
<%--               <form:errors path="password"/> --%>
            </p>
          </div>

          <div class="field spaced">
            <div class="control">
              <label class="checkbox">
<!--               	<input type="checkbox" name="remember" value="1" checked> -->
                <span class="check"></span>
                <span class="control-label">記得密碼(施工中)</span>
              </label>
            </div>
          </div>

          <hr>
          <div class="field grouped">
            <div class="control">
              <input name="submit" type="submit" value="登入" class="button blue"/>
            </div>
            <div class="control">
              <a href="${contextRoot}/backstage" class="button">
                返回
              </a>
            </div>
            <!-- 一鍵輸入 -->
            <div class="control">
             <button id="admin" name="admin" type="button" class="button green">超級管理員</button>
            </div>
          </div>

        </form>
      </div>
    </div>

  </section>


</div>

</body>
</html>