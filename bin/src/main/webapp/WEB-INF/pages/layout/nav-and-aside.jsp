<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 上導覽列開始 -->
<nav id="navbar-main" class="navbar is-fixed-top">
  <div class="navbar-brand">
    <a class="navbar-item mobile-aside-button">
      <span class="icon"><i class="mdi mdi-forwardburger mdi-24px"></i></span>
    </a>
    <div class="navbar-item">
      <div class="control"><input placeholder="Search everywhere..." class="input"></div>
    </div>
  </div>
  <div class="navbar-brand is-right">
    <a class="navbar-item --jb-navbar-menu-toggle" data-target="navbar-menu">
      <span class="icon"><i class="mdi mdi-dots-vertical mdi-24px"></i></span>
    </a>
  </div>
  <div class="navbar-menu" id="navbar-menu">
    <div class="navbar-end">
      <div class="navbar-item dropdown has-divider">
        <a class="navbar-link">
          <span class="icon"><i class="mdi mdi-menu"></i></span>
          <span>Sample Menu</span>
          <span class="icon">
            <i class="mdi mdi-chevron-down"></i>
          </span>
        </a>
        <div class="navbar-dropdown">
          <a href="${contextRoot}/resources/backstage/profile.html" class="navbar-item">
            <span class="icon"><i class="mdi mdi-account"></i></span>
            <span>My Profile</span>
          </a>
          <a class="navbar-item">
            <span class="icon"><i class="mdi mdi-settings"></i></span>
            <span>Settings</span>
          </a>
          <a class="navbar-item">
            <span class="icon"><i class="mdi mdi-email"></i></span>
            <span>Messages</span>
          </a>
          <hr class="navbar-divider">
          <a class="navbar-item">
            <span class="icon"><i class="mdi mdi-logout"></i></span>
            <span>Log Out</span>
          </a>
        </div>
      </div>
      <div class="navbar-item dropdown has-divider has-user-avatar">
        <a class="navbar-link">
          <div class="user-avatar">
            <img src="https://avatars.dicebear.com/v2/initials/john-doe.svg" alt="John Doe" class="rounded-full">
          </div>
          <div class="is-user-name"><span>John Doe</span></div>
          <span class="icon"><i class="mdi mdi-chevron-down"></i></span>
        </a>
        <div class="navbar-dropdown">
          <a href="${contextRoot}/resources/backstage/profile.html" class="navbar-item active">
            <span class="icon"><i class="mdi mdi-account"></i></span>
            <span>My Profile(暫用模板提供)</span>
          </a>
          <a class="navbar-item">
            <span class="icon"><i class="mdi mdi-settings"></i></span>
            <span>Settings</span>
          </a>
          <a class="navbar-item">
            <span class="icon"><i class="mdi mdi-email"></i></span>
            <span>Messages</span>
          </a>
          <hr class="navbar-divider">
          <a class="navbar-item">
            <span class="icon"><i class="mdi mdi-logout"></i></span>
            <span>Log Out</span>
          </a>
        </div>
      </div>
      <a href="https://justboil.me/tailwind-admin-templates" class="navbar-item has-divider desktop-icon-only">
        <span class="icon"><i class="mdi mdi-help-circle-outline"></i></span>
        <span>About</span>
      </a>
      <a href="https://github.com/justboil/admin-one-tailwind" class="navbar-item has-divider desktop-icon-only">
        <span class="icon"><i class="mdi mdi-github-circle"></i></span>
        <span>GitHub</span>
      </a>
      <a title="Log out" class="navbar-item desktop-icon-only">
        <span class="icon"><i class="mdi mdi-logout"></i></span>
        <span>Log out</span>
      </a>
    </div>
  </div>
</nav>
<!-- 上導覽列結束 -->

<!-- 左導覽列開始 -->
<aside class="aside is-placed-left is-expanded">
  <div class="aside-tools">
    <div>
      運動網 <b class="font-black">後台</b>
    </div>
  </div>
  <div class="menu is-menu-main">
    <p class="menu-label">總覽</p>
    <ul class="menu-list">
      <li class="--set-active-index-html">
        <a href="${contextRoot}/backstage">
          <span class="icon"><i class="mdi mdi-desktop-mac"></i></span>
          <span class="menu-item-label">後台首頁</span>
        </a>
      </li>
    </ul>
    <p class="menu-label">分類</p>
    <ul class="menu-list">
      <li class="--set-active-tables-html">
        <a href="${contextRoot}/resources/backstage/tables.html">
          <span class="icon"><i class="mdi mdi-table"></i></span>
          <span class="menu-item-label">Tables(原模板內容)</span>
        </a>
      </li>
      <li class="--set-active-forms-html">
        <a href="${contextRoot}/resources/backstage/forms.html">
          <span class="icon"><i class="mdi mdi-square-edit-outline"></i></span>
          <span class="menu-item-label">Forms(原模板內容)</span>
        </a>
      </li>
      <li>
        <a href="${contextRoot}/resources/backstage/login.html">
          <span class="icon"><i class="mdi mdi-lock"></i></span>
          <span class="menu-item-label">Login(原模板內容)</span>
        </a>
      </li>     
      
      <!-- 下拉式選單1: 會員管理系統 -->
      <li>
        <a class="dropdown">
          <span class="icon"><i class="mdi mdi-view-list"></i></span>
          <span class="menu-item-label">會員管理</span>
          <span class="icon"><i class="mdi mdi-plus"></i></span>
        </a>
        <ul>
          <li>
            <a href="${contextRoot}/member/form">
              <span>新增會員</span>
            </a>
          </li>
          <li>
            <a href="${contextRoot}/">
              <span>會員列表</span>
            </a>
          </li>
        </ul>
      </li>
      
      <!-- 下拉式選單2: 優惠券管理系統 -->
      <li>
        <a class="dropdown">
          <span class="icon"><i class="mdi mdi-view-list"></i></span>
          <span class="menu-item-label">優惠券管理</span>
          <span class="icon"><i class="mdi mdi-plus"></i></span>
        </a>
        <ul>
          <li>
            <a href="${contextRoot}/discount/form">
              <span>新增優惠券</span>
            </a>
          </li>
          <li>
            <a href="${contextRoot}/discount/viewDiscount">
              <span>優惠券列表</span>
            </a>
          </li>
        </ul>
      </li>

      <!-- 下拉式選單3: 商品管理系統 -->
      <li>
        <a class="dropdown">
          <span class="icon"><i class="mdi mdi-view-list"></i></span>
          <span class="menu-item-label">商品管理</span>
          <span class="icon"><i class="mdi mdi-plus"></i></span>
        </a>
        <ul>
          <li>
            <a href="${contextRoot}/insertPdpage.controller">
              <span>新增商品</span>
            </a>
          </li>
          <li>
            <a href="${contextRoot}/pageSeperate">
              <span>商品列表</span>
            </a>
          </li>
        </ul>
      </li>
      
      <!-- 下拉式選單4: 訂單管理系統 -->
      <li>
        <a class="dropdown">
          <span class="icon"><i class="mdi mdi-view-list"></i></span>
          <span class="menu-item-label">訂單管理</span>
          <span class="icon"><i class="mdi mdi-plus"></i></span>
        </a>
        <ul>
          <li>
            <a href="${contextRoot}/">
              <span>新增訂單</span>
            </a>
          </li>
          <li>
            <a href="${contextRoot}/orders/viewAllOrders">
              <span>訂單列表</span>
            </a>
          </li>
        </ul>
      </li>
      
      <!-- 下拉式選單5: 課程管理系統 -->
      <li>
        <a class="dropdown">
          <span class="icon"><i class="mdi mdi-view-list"></i></span>
          <span class="menu-item-label">課程管理</span>
          <span class="icon"><i class="mdi mdi-plus"></i></span>
        </a>
        <ul>
          <li>
            <a href="${contextRoot}/course/form">
              <span>新增課程</span>
            </a>
          </li>
          <li>
            <a href="${contextRoot}/course/show/all">
              <span>課程列表</span>
            </a>
          </li>
        </ul>
      </li>
      
      <!-- 下拉式選單6: 員工管理系統 -->
      <li>
        <a class="dropdown">
          <span class="icon"><i class="mdi mdi-view-list"></i></span>
          <span class="menu-item-label">員工管理</span>
          <span class="icon"><i class="mdi mdi-plus"></i></span>
        </a>
        <ul>
          <li>
            <a href="${contextRoot}/">
              <span>新增員工</span>
            </a>
          </li>
          <li>
            <a href="${contextRoot}/employee/viewEmployee">
              <span>員工列表</span>
            </a>
          </li>
        </ul>
      </li>
      
      <!-- 下拉式選單7: 客服系統 -->
      <li>
        <a class="dropdown">
          <span class="icon"><i class="mdi mdi-view-list"></i></span>
          <span class="menu-item-label">客服系統</span>
          <span class="icon"><i class="mdi mdi-plus"></i></span>
        </a>
        <ul>
          <li>
            <a href="${contextRoot}/message/selectAll">
              <span>列表</span>
            </a>
          </li>
          <li>
            <a href="${contextRoot}/message/form">
              <span>客服表單(暫時寄放後台)</span>
            </a>
          </li>
        </ul>
      </li>
      
    </ul> <!-- 分類項目結束 -->
    
    
    <p class="menu-label">About</p>
    <ul class="menu-list">
      <li>
        <a href="https://justboil.me" onclick="alert('Coming soon'); return false" target="_blank" class="has-icon">
          <span class="icon"><i class="mdi mdi-credit-card-outline"></i></span>
          <span class="menu-item-label">Premium Demo</span>
        </a>
      </li>
      <li>
        <a href="https://justboil.me/tailwind-admin-templates" class="has-icon">
          <span class="icon"><i class="mdi mdi-help-circle"></i></span>
          <span class="menu-item-label">About</span>
        </a>
      </li>
      <li>
        <a href="https://github.com/justboil/admin-one-tailwind" class="has-icon">
          <span class="icon"><i class="mdi mdi-github-circle"></i></span>
          <span class="menu-item-label">GitHub</span>
        </a>
      </li>
    </ul>
  </div>
</aside>
<!-- 左導覽列結束 -->