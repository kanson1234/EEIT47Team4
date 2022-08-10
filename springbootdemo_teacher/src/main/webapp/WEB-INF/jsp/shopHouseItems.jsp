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

	<div class="container">
		<h1>商品</h1>

		<table>

			<c:forEach var="i" items="${AllItem}">


				<div>${i.itemName}</div>
				<%-- 	   <td>${i.itemImg}</td> --%>
				
					<img width="150"
						src="${pageContext.request.contextPath}/downloadImg/${i.id}">
				
				${i.price}
				${i.classify}
				${i.status}
				${i.c2Id}

				<div>

					<a href="${pageContext.request.contextPath}/ShopHouse/editItemId/${i.id}"><button type="submit">編輯</button></a>
					<!-- onclick="return confirm('確認刪除?') -->
					<a onclick="return confirm('確認刪除?')" href="${pageContext.request.contextPath}/ShopHouse/deleteById/${i.id}">
						<button type="submit">刪除</button>
					</a>

				</div>

			</c:forEach>

		</table>

	</div>

</body>
</html>