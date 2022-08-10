<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>修改頁面</title>
</head>
<body>
	<div align='center'>
		<h2>商品修改頁面</h2>
<!-- 		<form method="get" action="search"> -->
<!-- 			<input type="text" name="keyword" /> <input type="submit" -->
<!-- 				name="Search" /> -->
<!-- 		</form> -->
		<br />
<form action="${pageContext.request.contextPath}/ShopHouse/editItem" method="post" enctype="multipart/form-data">
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">產品名稱<input name="itemName"></th>
					<th scope="col">照片<input type="file" name="file"></th>
					<th scope="col">價錢<input name="itemPrice"></th>
					<th scope="col">種類<input name="classify"></th>
					<th scope="col">狀態<input id="state" name="state"></th>
					<th scope="col">店家<input name="c2Id"></th>
					<th scope="col"><input type="submit" value="修改"></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${shopHouseItem.itemName}</td>
					<td><img width="150"
						src="${pageContext.request.contextPath}/downloadImg/${shopHouseItem.id}"></td>
					<td>${shopHouseItem.price}</td>
					<td>${shopHouseItem.classify}</td>
					<td>${shopHouseItem.c2Id}</td>
					
				</tr>
			</tbody>
		</table>
</form>
	</div>
</body>
</html>