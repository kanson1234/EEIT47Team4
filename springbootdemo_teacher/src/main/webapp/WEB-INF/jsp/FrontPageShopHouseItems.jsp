<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="layout/navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container" align="center">
	<div class="row">
		<c:forEach items="${pages.content}" var="i">
			<div class="card" style="width: 18rem;">
				<a href="${pageContext.request.contextPath}/ShopHouse/itemDetail/${i.id}"><img
						width="150" src="${pageContext.request.contextPath}/downloadImg/${i.id}" class="card-img-top"
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
<div>
	<c:forEach var="pagesNumber" begin="1" end="${pages.totalPages}">

		<c:choose>

			<c:when test="${pages.number != pagesNumber -1}">
				<a href="${pageContext.request.contextPath}/ShopHouse/FrontPageShopHouseItems?p=${pagesNumber}">
					${pagesNumber} </a>

			</c:when>
			<c:otherwise>
				       ${pagesNumber}
			</c:otherwise>

		</c:choose>

	</c:forEach>
</div>
</div>
</body>
</html>