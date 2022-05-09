<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />



<!-- 複製用, 核心內容留一個表單 -->



<!DOCTYPE html>
<html lang="en" class="">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>明細</title>

<!-- 使用原生 https://materialdesignicons.com/ 的 icon-->
<link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css">

<!-- 使用原生 Tailwind css -->
<link rel="stylesheet" href="${contextRoot}/resources/backstage/css/main.css?v=1628755089081">

<!-- 網站頁籤 logo -->
<link rel="icon" type="image/png" sizes="32x32" href="${contextRoot}/resources/backstage/favicon-32x32.png"/>
<link rel="icon" type="image/png" sizes="16x16" href="${contextRoot}/resources/backstage/favicon-16x16.png"/>

<!-- 原生 js, 負責 nav 的動態變動與彈窗的動態變動 -->
<script type="text/javascript" 
	src="${contextRoot}/resources/backstage/js/main.min.js?v=1628755089081"
	defer>
</script>

</head>
<body>

<div id="app">

<!-- 插入上導覽列與左導覽列 -->
<jsp:directive.include file="/WEB-INF/pages/layout/backstage/nav-and-aside.jsp" />
	
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

<section class="is-hero-bar">
  <div class="flex flex-col md:flex-row items-center justify-between space-y-6 md:space-y-0">
    <h1 class="title">
      Profile
    </h1>
    <button class="button light">Button</button>
  </div>
</section>

<section class="section main-section">
  <div class="grid grid-cols-1 gap-6 lg:grid-cols-2 mb-6">
    <div class="card">
      <header class="card-header">
        <p class="card-header-title">
          <span class="icon"><i class="mdi mdi-account-circle"></i></span>
          Edit Profile
        </p>
      </header>
      <div class="card-content">
        <form>
          <div class="field">
            <label class="label">Avatar</label>
            <div class="field-body">
              <div class="field file">
                <label class="upload control">
                  <a class="button blue">
                    Upload
                  </a>
                  <input type="file">
                </label>
              </div>
            </div>
          </div>
          <hr>
          <div class="field">
            <label class="label">Name</label>
            <div class="field-body">
              <div class="field">
                <div class="control">
                  <input type="text" autocomplete="on" name="name" value="John Doe" class="input" required>
                </div>
                <p class="help">Required. Your name</p>
              </div>
            </div>
          </div>
          <div class="field">
            <label class="label">E-mail</label>
            <div class="field-body">
              <div class="field">
                <div class="control">
                  <input type="email" autocomplete="on" name="email" value="user@example.com" class="input" required>
                </div>
                <p class="help">Required. Your e-mail</p>
              </div>
            </div>
          </div>
          <hr>
          <div class="field">
            <div class="control">
              <button type="submit" class="button green">
                Submit
              </button>
            </div>
          </div>
        </form>
      </div>
    </div>
    <div class="card">
      <header class="card-header">
        <p class="card-header-title">
          <span class="icon"><i class="mdi mdi-account"></i></span>
          Profile
        </p>
      </header>
      <div class="card-content">
        <div class="image w-48 h-48 mx-auto">
          <img src="https://avatars.dicebear.com/v2/initials/john-doe.svg" alt="John Doe" class="rounded-full">
        </div>
        <hr>
        <div class="field">
          <label class="label">Name</label>
          <div class="control">
            <input type="text" readonly value="John Doe" class="input is-static">
          </div>
        </div>
        <hr>
        <div class="field">
          <label class="label">E-mail</label>
          <div class="control">
            <input type="text" readonly value="user@example.com" class="input is-static">
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="card">
    <header class="card-header">
      <p class="card-header-title">
        <span class="icon"><i class="mdi mdi-lock"></i></span>
        Change Password
      </p>
    </header>
    <div class="card-content">
      <form>
        <div class="field">
          <label class="label">Current password</label>
          <div class="control">
            <input type="password" name="password_current" autocomplete="current-password" class="input" required>
          </div>
          <p class="help">Required. Your current password</p>
        </div>
        <hr>
        <div class="field">
          <label class="label">New password</label>
          <div class="control">
            <input type="password" autocomplete="new-password" name="password" class="input" required>
          </div>
          <p class="help">Required. New password</p>
        </div>
        <div class="field">
          <label class="label">Confirm password</label>
          <div class="control">
            <input type="password" autocomplete="new-password" name="password_confirmation" class="input" required>
          </div>
          <p class="help">Required. New password one more time</p>
        </div>
        <hr>
        <div class="field">
          <div class="control">
            <button type="submit" class="button green">
              Submit
            </button>
          </div>
        </div>
      </form>
    </div>
  </div>
</section>

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

<!-- 彈窗2 -->
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

</div>

</body>
</html>
