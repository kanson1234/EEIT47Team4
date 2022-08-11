<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align='center'>
<!-- 		<h2>Account Manager</h2> -->
<!-- 		<form method="get" action="search"> -->
<!-- 			<input type="text" name="keyword" /> <input type="submit" -->
<!-- 				name="Search" /> -->
<!-- 		</form> -->
		<br />

		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">產品名稱</th>
					<th scope="col">照片</th>
					<th scope="col">價錢</th>
					<th scope="col">種類</th>
					<th scope="col">店家</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${page.content}" var="i">
					<tr>
						<td>${i.itemName}</td>
						<td><img width="150"
							src="${pageContext.request.contextPath}/downloadImg/${i.id}"></td>
						<td>${i.price}</td>
						<td>${i.classify}</td>
						<td>${i.c2Id}</td>
						<td><a
							href="${pageContext.request.contextPath}/ShopHouse/editItemId/${i.id}"><button
									type="submit">編輯</button></a> <a onclick="return confirm('確認刪除?')"
							href="${pageContext.request.contextPath}/ShopHouse/deleteById/${i.id}">
								<button type="submit">刪除</button>
						</a></td>
						<td></td>
					</tr>
				</c:forEach>
                    
				<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">


					<c:choose>

						<c:when test="${page.number != pageNumber -1}">
							<a href="${pageContext.request.contextPath}/ShopHouse/viewItems?p=${pageNumber}">
								${pageNumber} </a>

						</c:when>

						<c:otherwise>
				       ${pageNumber}
				    </c:otherwise>


					</c:choose>



				</c:forEach>


			</tbody>
		</table>

	</div>
</body>
</html>