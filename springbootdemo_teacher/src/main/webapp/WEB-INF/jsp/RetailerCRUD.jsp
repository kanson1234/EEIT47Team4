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
	<div align='center'>
		<h2>Account Manager</h2>
		<form method="get" action="search">
			<input type="text" name="keyword"/>
			<input type="submit" name="Search"/>
		</form>
		<a href="${contextRoot}/registerPage">註冊新帳號</a>
		<br/>
		
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
						<td>${retailer.rfirstName}</td>
						<td>${retailer.raccount}</td>
						<td>
						<a href="${contextRoot}/message/editMessage/${retailer.rid}">
						<button type="submit" class="btn btn-primary mb-2">修改</button>
						</a>
						</td>
						<td>
						<a onclick="return confirm('確認刪除?')" href="${contextRoot}/message/deleteMessage/$${retailer.rid}">
						<button type="submit" class="btn btn-danger">刪除</button>
						</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
</body>
</html>