<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    <c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<%-- <jsp:include page="layout/default.jsp"/> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>打我阿笨蛋</title>
</head>
<body>
<div class="container">
<p/>
<div class="row justify-content-center">
<div class="col-9">
<div class="card">
<div class="card-header">客服表單</div>
<div class="card-body">
<h1>以下是您的表單紀錄，請妥善保存</h1>
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
		<tr>
			<td>
				<input type="text" name="id" value="${csResult.id}" disabled>
				<input type="hidden" name="id" value="${csResult.id}">
				<br>
			<td><input type="text" name="serviceInfo" value="${csResult.serviceInfo}" disabled><br>
				<input type="hidden" name="serviceInfo" value="${csResult.serviceInfo}">
			<td><input type="text" name="description" value="${csResult.description}" disabled><br>
				<input type="hidden" name="description" value="${csResult.description}">
			<td><input type="text" name="name" value="${csResult.name}" disabled><br>
				<input type="hidden" name="name" value="${csResult.name}">
			<td><input type="text" name="phone" value="${csResult.phone}" disabled><br>
				<input type="hidden" name="phone" value="${csResult.phone}">
			<td><input type="text" name="email" value="${csResult.email}" disabled><br>
				<input type="hidden" name="email" value="${csResult.email}">	
			<td><input type="text" name="preferedContactTime" value="${csResult.preferedContactTime}" disabled><br>
				<input type="hidden" name="preferedContactTime" value="${csResult.preferedContactTime}">
			<td><input type="text" name="processStatus" value="${csResult.processStatus}" disabled><br>
				<input type="hidden" name="processStatus" value="${csResult.processStatus}">
			<td><input type="text" name="remark" value="${csResult.remark}" disabled><br>
				<input type="hidden" name="remark" value="${csResult.remark}">
			<td><input type="text" name="createdAt" value="${csResult.createdAt}" disabled><br>
				<input type="hidden" name="createdAt" value="${csResult.createdAt}">
	</table>
</div>
</div>
</div>
</div>
</div>
</body>
</html>