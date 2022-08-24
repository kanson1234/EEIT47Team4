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
<style type="text/css">
#div1,#div2,#div3{
display:inline-block;
}

</style>

</head>
<body>
	<div align="center">
	    <div id="div1"> 
		<form name="classifySearch"
			action="${pageContext.request.contextPath}/ShopHouse/findByClassify"
			method="get">
			<select name="classify">
				<option value="烤肉架">烤肉架</option>
				<option value="鞋子">鞋子</option>
				<option value="帳篷">帳篷</option>
				<option value="椅子">椅子</option>
				<option value="燈具">燈具</option>
				<option value="餐具">餐具</option>
			</select> <input type="submit" value="搜尋">
		</form>
		</div>
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
		
		
		
		<div class="container" align="center">
		<div class="row">
			<c:forEach items="${lowerPrice}" var="i">
				<div class="card" style="width: 18rem;">
					<a
						href="${pageContext.request.contextPath}/ShopHouse/itemDetail/${i.id}"><img
						width="150"
						src="${pageContext.request.contextPath}/downloadImg/${i.id}"
						class="card-img-top" alt="..."></a>

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
		
		
		

<!-- 		<form name="classifySearch" -->
<%-- 			action="${pageContext.request.contextPath}/ShopHouse/highPrice" --%>
<!-- 			method="get"> -->
<!-- 			<button type="submit">最高價</button> -->
<!-- 		</form> -->
		
		<div class="container" align="center">
		<div class="row">
			<c:forEach items="${higherPrice}" var="i">
				<div class="card" style="width: 18rem;">
					<a
						href="${pageContext.request.contextPath}/ShopHouse/itemDetail/${i.id}"><img
						width="150"
						src="${pageContext.request.contextPath}/downloadImg/${i.id}"
						class="card-img-top" alt="..."></a>

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
	<div class="container" align="center">
		<div class="row">
			<c:forEach items="${category}" var="i">
				<div class="card" style="width: 18rem;">
					<a
						href="${pageContext.request.contextPath}/ShopHouse/itemDetail/${i.id}"><img
						width="150"
						src="${pageContext.request.contextPath}/downloadImg/${i.id}"
						class="card-img-top" alt="..."></a>




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




		<div class="container" align="center">
			<div class="row">
				<c:forEach items="${pages.content}" var="i">
					<div class="card" style="width: 18rem;">
						<a
							href="${pageContext.request.contextPath}/ShopHouse/itemDetail/${i.id}"><img
							width="150"
							src="${pageContext.request.contextPath}/downloadImg/${i.id}"
							class="card-img-top" alt="..."></a>




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
							<a
								href="${pageContext.request.contextPath}/ShopHouse/FrontPageShopHouseItems?p=${pagesNumber}">
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