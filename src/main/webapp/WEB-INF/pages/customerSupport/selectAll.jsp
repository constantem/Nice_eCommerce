<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<%-- <jsp:include page="layout/default.jsp"/> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>打我阿笨蛋</title>
<style>
	td, input {
		width: 100px
	}
</style>
</head>
<body>
	<div class="container">
		<p />
		<div class="row justify-content-center">
			<div class="col-9">
				<div class="card">
					<div class="card-header">客服表單</div>
					<div class="card-body">
						<h1>查詢全部資料</h1> <form action="${contextRoot}/message/findByServiceInfoLike">
											特定問題查詢:<input type="text" name="findByServiceInfoLike">
											<input type="submit" value="送出">
											</form>
											
						<table border="1">
							<tr style="background-color: #a8fefa">
								<th>Id
								<th>ServiceInfo
								<th>Description
								<th>Name
								<th>Phone
								<th>Email
								<th>PreferedContactTime
								<th>ProcessStatus
								<th>Remark
								<th>CreatedAt
								<th>ModifiedAt
								<th>Update
								<th>Delete
							</tr>
							<%-- 					<form method="GET" action="HwUpdate"> --%>
							<c:forEach items="${allCus}" var="customerBean">
								<tr>
									<td>${customerBean.id} 
									<td>${customerBean.serviceInfo} 
									<td>${customerBean.description} 
									<td>${customerBean.name}
									<td>${customerBean.phone}
									<td>${customerBean.email} 
									<td>${customerBean.preferedContactTime} 
									<td>${customerBean.processStatus} 
									<td>${customerBean.remark} 
									<td>${customerBean.createdAt} 
									<td>${customerBean.modifiedAt} 
									<td><a href="${contextRoot}/message/editForm?id=${customerBean.id}">修改</a>
									<td><a href="${contextRoot}/message/delete?id=${customerBean.id}">刪除</a>
								</tr>
							</c:forEach>
							<%-- 					</form> --%>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>