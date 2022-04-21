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
</head>
<body>
	<div class="container">
		<p />
		<div class="row justify-content-center">
			<div class="col-9">
				<div class="card">
					<div class="card-header">客服表單</div>
					<div class="card-body">
						<h1>查詢全部資料</h1>
						<table border="1">
							<tr style="background-color: #a8fefa">
								<th>Id
								<th>ServiceInfo
								<th>Description
								<th>Name
								<th>Phone
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
									<td>
										<input type="text" name="id" value="${customerBean.id}" disabled> 
										<input type="hidden" name="id" value="${customerBean.id}"> <br>
									<td>
										<input type="text" name="serviceInfo" value="${customerBean.serviceInfo}" disabled><br> 
										<input type="hidden" name="serviceInfo" value="${customerBean.serviceInfo}">
									<td>
										<input type="text" name="description" value="${customerBean.description}" disabled><br> 
										<input type="hidden" name="description" value="${customerBean.description}">
									<td>
										<input type="text" name="name" value="${customerBean.name}" disabled><br> 
										<input type="hidden" name="name" value="${customerBean.name}">
									<td>
										<input type="text" name="phone" value="${customerBean.phone}" disabled><br> 
										<input type="hidden" name="phone" value="${customerBean.phone}">
									<td>
										<input type="text" name="preferedContactTime" value="${customerBean.preferedContactTime}" disabled><br>
										<input type="hidden" name="preferedContactTime" value="${customerBean.preferedContactTime}">
									<td>
										<input type="text" name="processStatus" value="${customerBean.processStatus}" disabled><br> 
										<input type="hidden" name="processStatus" value="${customerBean.processStatus}">
									<td>
										<input type="text" name="remark" value="${customerBean.remark}" disabled><br> 
										<input type="hidden" name="remark" value="${customerBean.remark}">
									<td>
										<input type="text" name="createdAt" value="${customerBean.createdAt}" disabled><br> 
										<input type="hidden" name="createdAt" value="${customerBean.createdAt}">
									<td>
										<input type="text" name="modifiedAt" value="${customerBean.modifiedAt}" disabled><br> 
										<input type="hidden" name="modifiedAt" value="${customerBean.modifiedAt}">
									<td> 修改
									<td> 刪除
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