<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="layout/navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
#div1, #div2, #div3 {
	display: inline-block;
}
</style>

</head>
<body>

	<div class="container" align="center">
		<div class="row">
			<div id="div2">
				<form name="classifySearch"
					action="${pageContext.request.contextPath}/ShopHouse/lowerPrice"
					method="get">
					<button type="submit" class="badge badge-light">最低價</button>
				</form>
			</div>
			<div id="div3">
				<form name="classifySearch"
					action="${pageContext.request.contextPath}/ShopHouse/highPrice"
					method="get">
					<button type="submit" class="badge badge-light">最高價</button>
				</form>
			</div>
		</div>

		<div class="container">
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">
				<c:forEach items="${lowerPrice}" var="i">
					<div class="card" style="width: 14rem; height: 380px;">
						<a
							href="${pageContext.request.contextPath}/ShopHouse/itemDetail/${i.id}"><img
							height="180"
							src="${pageContext.request.contextPath}/downloadImg/${i.id}"
							class="card-img-top" alt="..."></a>

						<div class="card-body">
							<p class="card-text">${i.itemName}</p>
							<p class="card-text" style="color:red;">${i.price}</p>
						</div>
						<div>
							<a href=""><button type="submit">加入購物車</button></a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">
			<c:forEach items="${higherPrice}" var="i">
				<div class="col">
					<div class="card" style="width: 14rem; height: 380px;">
						<a
							href="${pageContext.request.contextPath}/ShopHouse/itemDetail/${i.id}"><img
							height="180"
							src="${pageContext.request.contextPath}/downloadImg/${i.id}"
							class="card-img-top" alt="..."></a>

						<div class="card-body">
							<p class="card-text">${i.itemName}</p>
							<p class="card-text" style="color:red;">${i.price}</p>
						</div>
						<div>
							<a href=""><button type="submit">加入購物車</button></a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<div class="container">
		<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">
			<c:forEach items="${tent}" var="i">
				<div class="col">
					<div class="card" style="width: 14rem; height: 380px;">
						<a
							href="${pageContext.request.contextPath}/ShopHouse/itemDetail/${i.id}">
							<img height="180" src="${pageContext.request.contextPath}/downloadImg/${i.id}"
							class="card-img-top" alt="...">
						</a>

						<div class="card-body">
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

