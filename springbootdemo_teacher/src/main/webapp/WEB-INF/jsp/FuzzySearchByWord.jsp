<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="layout/navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container" align="center">
		<div class="row">
			<c:forEach items="${keyword}" var="i">
				<div class="card" style="width: 18rem;">
					<a href="${pageContext.request.contextPath}/ShopHouse/itemDetail/${i.id}"> <img
						src="${pageContext.request.contextPath}/downloadImg/${i.id}" class="card-img-top"
						alt="..."></a>

					<div class="card-body">
						<p class="card-text">${i.itemName}</p>
						<p class="card-text">${i.price}</p>
					</div>
					<div>
						<a href=""><button type="submit">加入購物車</button></a>
					</div>

				</div>
			</c:forEach>

		</div>
	</div>
</body>
</html>

