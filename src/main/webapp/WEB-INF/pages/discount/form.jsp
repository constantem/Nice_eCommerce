<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
discount form
<form:form method="GET" action="${contextRoot}/discount/add" modelAttribute="discount">
	<form:input path="name"/>
	<form:input path="description"/>
	<form:input path="conditionCategory"/>
	<form:input path="conditionPrice"/>
	<form:input path="discountCategory"/>
	<form:input path="discountPercent"/>
	<form:input path="discountAmount"/>
	<form:input path="startDate"/>
	<form:input path="endDate"/>
	<form:button>新增</form:button>
</form:form>
</body>
</html>