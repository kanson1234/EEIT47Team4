<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="layout/navbar.jsp" />
<jsp:include page="layout/Sidebar.jsp" />
<!DOCTYPE html>
<html>
<head>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>BlockList</title>
</head>
<body>
<%-- <jsp:include page="layout/Sidebar.jsp" /> --%>
<main>
<div class="container">
	<div align='center'>
		<h2>Account Manager</h2>
		<div>
		<form method="get" action="${contextRoot}/Retailer/getByAccount">
			<input type="text" name="keyword"/>
			<input type="submit" name="Search"/>
		</form>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">id</th>
					<th scope="col">名字</th>
					<th scope="col">帳號</th>
					<th scope="col">刪除</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach items="${listRetailer}" var="retailer">
					<tr>
						<td>${retailer.rid}</td>
						<td>${retailer.rName}</td>
						<td>${retailer.raccount}</td>
						<td>
						<a onclick="return confirm('確認復原?')" href="${contextRoot}/Retailer/changeStatusT/${retailer.rid}">
						<button type="submit" class="btn btn-danger">復原帳號</button>
						</a>
						</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>
	</div>
</div>
</main>
</body>
</html>