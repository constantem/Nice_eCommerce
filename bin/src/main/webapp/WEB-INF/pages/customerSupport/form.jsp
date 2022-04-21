<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    <c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<%-- <jsp:include page="layout/default.jsp"/>     --%>
 <!--script>
function confirm(){
	if (confirm('123')){
	return true; 
	}
	else{
		return false;
	}
}
</script-->   
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
<form:form action="${contextRoot}/message/insert" class="form" method="GET" modelAttribute="CustomerBean">


<div class="input-group">

</div>
請選擇你/妳遇到的問題(必選):<form:input type="text" path="serviceInfo" value=""/><br>
請詳加描述問題(非必填):<form:input type="text" path="description" value=""/><br>
請輸入你/妳的名字(必填):<form:input type="text" path="name" value=""/><br>
請輸入你/妳的聯絡方式(必填):<form:input type="text" path="phone" value=""/><br>
請選擇方便連絡時段(必選):<input type="checkbox" name="preferedContactTime" value="1">上午
					<input type="checkbox" name="preferedContactTime" value="2">下午<br>
<input type="submit" name="submit" value="送出表單" >
</form:form>
</div>

</div>

</div>

</div>
</div>
</body>
</html>