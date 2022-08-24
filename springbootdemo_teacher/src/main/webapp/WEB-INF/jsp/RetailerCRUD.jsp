<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Account Manager</title>
</head>
<body>
<<<<<<< HEAD
=======
<main>
<%-- <jsp:include page="layout/Sidebar.jsp" /> --%>
<div class="container">
>>>>>>> 3dda41fcf20dc147f7fd896e2e46b376f102aca2
	<div align='center'>
		<h2>Account Manager</h2>
		<div>
		<form method="get" action="${contextRoot}/Retailer/getByAccount">
			<input type="text" name="keyword"/>
			<input type="submit" name="Search"/>
		</form>
		</div>
		<a href="${contextRoot}/registerR">註冊新帳號</a>
		<br/>
		<div>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">id</th>
					<th scope="col">名字</th>
					<th scope="col">帳號</th>
					<th scope="col">修改</th>
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
						<a href="${contextRoot}/Retailer/editRetailer/${retailer.rid}">
						<button type="submit" class="btn btn-primary mb-2">修改</button>
						</a>
						</td>
						<td>
						<a onclick="return confirm('確認刪除?')" href="${contextRoot}/message/deleteMessage/${retailer.rid}">
						<button type="submit" class="btn btn-danger">刪除</button>
						</a>
						</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>
	</div>
</body>
</html>