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
				<input type="text" name="member_id" value="${member.member_id}" disabled></td>
				<input type="hidden" name="member_id" value="${member.member_id}">
			<td>
				<input type="text" name="username" value="${member.username}" disabled></td>
				<input type="hidden" name="username" value="${member.username}">
			<td>
				<input type="text" name="password" value="${member.password}" disabled></td>
				<input type="hidden" name="password" value="${member.password}">
			<td>
				<input type="text" name="lastname,firstname" value="${member.lastname}${member.firstname}" disabled></td>
				<input type="hidden" name="lastname,firstname"value="${member.lastname}${member.firstname}">
			<td>
				<input type="text" name="birthdate" value="${member.birthdate}" disabled></td>
				<input type="hidden" name="birthdate" value="${member.birthdate}">
			<td>
				<input type="text" name="gender" value="${member.gender}" disabled></td>
				<input type="hidden" name="gender" value="${member.gender}">
			<td>
				<input type="text" name="phone" value="${member.phone}" disabled></td>
				<input type="hidden" name="phone" value="${member.phone}">
			<td>
				<input type="text" name="email" value="${member.email}"disabled></td>
				<input type="hidden" name="email" value="${member.email}">
			<td>
				<input type="text" name="address" value="${member.address}"disabled></td>
				<input type="hidden" name="address" value="${member.address}">

			<td>修改</td>

			<td>刪除</td>

		</tr>
	</c:forEach>
	</table>
</body>
</html>