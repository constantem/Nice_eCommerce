<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form:form class="form" method="POST" modelAttribute="workMessage">
		<table>
			<tr>
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

			<c:forEach items="${members}" var="member">
				<tr>
					<td>
						<form:input type="text" name="member_id" value="${member.member_id}" disabled /></td>
						<form:input type="hidden" path="member_id" value="${member.member_id}" />
					<td>
						<form:input type="text" name="username" value="${member.username}" disabled /></td>
						<form:input type="hidden" path="username" value="${member.username}" />
					<td>
						<form:input type="text" name="password" value="${member.password}" disabled /></td>
						<form:input type="hidden" path="password" value="${member.password}" />
					<td>
						<form:input type="text" name="lastname,firstname" value="${member.lastname}${member.firstname}" disabled /></td>
						<form:input type="hidden" path="lastname,firstname" value="${member.lastname}${member.firstname}" />
					<td>
						<form:input type="text" name="birthdate" value="${member.birthdate}" disabled /></td>
						<form:input type="hidden" path="birthdate" value="${member.birthdate}" />
					<td>
						<form:input type="text" name="gender" value="${member.gender}" disabled /></td>
						<form:input type="hidden" path="gender" value="${member.gender}" />
					<td>
						<form:input type="text" name="phone" value="${member.phone}" disabled /></td>
						<form:input type="hidden" path="phone" value="${member.phone}" />
					<td>
						<form:input type="text" name="email" value="${member.email}" disabled /></td>
						<form:input type="hidden" path="email" value="${member.email}" />
					<td>
						<form:input type="text" name="address" value="${member.address}" disabled /></td>
						<form:input type="hidden" path="address" value="${member.address}" />

					<td>修改</td>

					<td>刪除</td>

				</tr>
			</c:forEach>
		</table>
	</form:form>
</body>
</html>