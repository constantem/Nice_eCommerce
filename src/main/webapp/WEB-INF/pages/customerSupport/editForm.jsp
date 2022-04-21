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
						<h1>修改資料</h1>
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
							</tr>
							<c:forEach items="${allCus}" var="customerBean">
								<c:choose>
									<c:when test="${customerBean.id == id}">
										<form:form method="GET" action="${contextRoot}/message/edit" modelAttribute="customerBean2">
											<tr>
												<td>
													${customerBean.id} 
													<form:input type="hidden" path="id" value="${customerBean.id}"/> 
												<td>
													${customerBean.serviceInfo} 
													<form:input type="hidden" path="serviceInfo" value="${customerBean.serviceInfo}"/>
												<td>
													${customerBean.description} 
													<form:input type="hidden" path="description" value="${customerBean.description}"/>
												<td>
													${customerBean.name} 
													<form:input type="hidden" path="name" value="${customerBean.name}"/>
												<td>
													${customerBean.phone} 
													<form:input type="hidden" path="phone" value="${customerBean.phone}"/>
												<td>
													${customerBean.email} 
													<form:input type="hidden" path="email" value="${customerBean.email}"/>	
												<td>
													${customerBean.preferedContactTime}
													<form:input type="hidden" path="preferedContactTime" value="${customerBean.preferedContactTime}"/>
												<td>
													<form:input type="text" path="processStatus" value="${customerBean.processStatus}"/>
												<td>
													<form:input type="text" path="remark"  value="${customerBean.remark}"/>
												<td>
													${customerBean.createdAt} 
													<form:input type="hidden" path="createdAt" value="${customerBean.createdAt}"/>
												<td>
													${customerBean.modifiedAt} 
<%-- 													<form:input type="hidden" path="modifiedAt" /> --%>
												<td><form:button type="submit">確認修改</form:button>
			<%-- 									<a href="${contextRoot}/message/edit" onclick="return confirm('確認修改')">確認修改</a> --%>
			
											</tr>
											
											
										</form:form>
									</c:when>
									<c:otherwise>
										<tr>
											<td>${customerBean.id} 
											<td>"${customerBean.serviceInfo} 
											<td>${customerBean.description} 
											<td>${customerBean.name}
											<td>${customerBean.phone}
											<td>${customerBean.email} 
											<td>${customerBean.preferedContactTime} 
											<td>${customerBean.processStatus} 
											<td>${customerBean.remark} 
											<td>${customerBean.createdAt} 
											<td>${customerBean.modifiedAt} 
											<td>
										</tr>
									</c:otherwise>
								</c:choose>

							</c:forEach>
											<td><input type="button" onClick="javascript:history.back()" value="回上頁"></td>
							
							<%-- 					</form> --%>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>