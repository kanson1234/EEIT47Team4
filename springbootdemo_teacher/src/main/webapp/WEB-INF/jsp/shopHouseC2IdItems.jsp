<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="layout/navbar.jsp" />
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">產品名稱</th>
					<th scope="col">照片</th>
					<th scope="col">價錢</th>
					<th scope="col">種類</th>
					<th scope="col">店家</th>
					<th scope="col">編輯</th>
					<th scope="col">刪除</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${c2IdItems}" var="i">
				<tr>
					<td>${i.itemName}</td>
					<td><a
						href="${pageContext.request.contextPath}/ShopHouse/itemDetail/${i.id}"><img
							width="100"
							src="${pageContext.request.contextPath}/downloadImg/${i.id}"></a></td>
					<td>${i.price}</td>
					<td>${i.classify}</td>
					<%-- 					<td>${i.c2Id}</td> --%>
					<td>${i.getRetailerBean().rName}</td>
					<td><a
						href="${pageContext.request.contextPath}/ShopHouse/editItemId/${i.id}"><button
								type="submit" class="btn btn-primary mb-2">編輯</button ></a></td>
								 <td><a onclick="return confirm('確認刪除?')"
						href="${pageContext.request.contextPath}/ShopHouse/deleteById/${i.id}">
							<button type="submit" class="btn btn-danger">刪除</button>
					</a></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>

</body>
</html>