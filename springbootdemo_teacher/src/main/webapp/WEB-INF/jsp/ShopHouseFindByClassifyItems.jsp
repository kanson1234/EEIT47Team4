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
<div class="container">
		<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3" >
		<c:forEach items="${category}" var="i">
		<div class="col">
			<div class="card" style="width: 14rem;">
				<a href="${pageContext.request.contextPath}/ShopHouse/itemDetail/${i.id}"><img
						height="180px" src="${pageContext.request.contextPath}/downloadImg/${i.id}" class="card-img-top"
						alt="..."></a>
			    <div class="card-body" align="center">
						<p class="card-text">${i.itemName}</p>
						<p class="card-text" style="color:red;">${i.price}</p>
					</div>
					<div align="center">
						<a href=""><button type="submit">加入購物車</button></a>
					</div>
			</div>
			</div>
		</c:forEach>
</div>
</div>
</body>
</html>