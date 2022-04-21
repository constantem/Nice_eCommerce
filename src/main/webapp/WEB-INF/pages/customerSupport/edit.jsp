<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    <c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>你要確定內</title>
</head>
<body>
<div class="container">
<p/>
<div class="row justify-content-center">
<div class="col-9">
<div class="card">
<div class="card-header">客服表單</div>
<div class="card-body">
<form:form class="form" method="POST" modelAttribute="supportMessage">
<h1>更新資料</h1>
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
					<form method="post" action="">
					<tr>
						<td>
							<input type="text" name="id" value="${cs.id}" disabled>
							<input type="hidden" name="id" value="${cs.id}">
							<br>
						<td><input type="text" name="serviceInfo" value="${cs.serviceInfo}" disabled><br>
							<input type="hidden" name="serviceInfo" value="${cs.serviceInfo}">
						<td><input type="text" name="description" value="${cs.description}" disabled><br>
							<input type="hidden" name="description" value="${cs.description}">
						<td><input type="text" name="name" value="${cs.name}" disabled><br>
							<input type="hidden" name="name" value="${cs.name}">
						<td><input type="text" name="phone" value="${cs.phone}" disabled><br>
							<input type="hidden" name="phone" value="${cs.phone}">
						<td><input type="text" name="preferedContactTime" value="${cs.preferedContactTime}" disabled><br>
							<input type="hidden" name="preferedContactTime" value="${cs.preferedContactTime}">
						<td><input type="text" name="processStatus" value="${cs.processStatus}"><br>
							<input type="hidden" name="processStatus" value="${cs.processStatus}">
						<td><input type="text" name="remark" value="${cs.remark}"><br>
							<input type="hidden" name="remark" value="${cs.remark}">
						<td><input type="text" name="createdAt" value="${cs.createdAt}" disabled><br>
							<input type="hidden" name="createdAt" value="${cs.createdAt}">
						<td><input type="text" name="modifiedAt" value="${cs.modifiedAt}" disabled><br>
							<input type="hidden" name="modifiedAt" value="${cs.modifiedAt}">
						<td><input type="submit" value="確定更新">
					</form>
	</table>
</form:form>
</div>
</div>
</div>
</div>
</div>
</body>
</html>