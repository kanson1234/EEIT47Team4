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
	<div align='center'>
<!-- 		<h2>搜尋商品</h2> -->
		<form name="classifySearch" action="${pageContext.request.contextPath}/ShopHouse/findByClassify" method="get">
		<select name="classify">
		<option value="烤肉架">烤肉架</option>
		<option value="鞋子">鞋子</option>
		<option value="帳篷">帳篷</option>
		<option value="椅子">椅子</option>
		<option value="燈具">燈具</option>
		<option value="餐具">餐具</option>
		</select>
		
		<input type="submit" value="搜尋">
		</form>
	
		<table class="table">
<!-- 		<thead class="thead-dark"> -->
<!-- 					<tr> -->
<!-- 						<th scope="col">產品名稱</th> -->
<!-- 						<th scope="col">照片</th> -->
<!-- 						<th scope="col">價錢</th> -->
<!-- 						<th scope="col">種類</th> -->
<!-- 						<th scope="col">店家</th> -->
<!-- 					</tr> -->
<!-- 				</thead> -->
		<c:forEach items="${category}" var="i">
		<tr>
					<td>${i.itemName}</td>
					<td><a href="${pageContext.request.contextPath}/ShopHouse/itemDetail/${i.id}"><img width="150"
						src="${pageContext.request.contextPath}/downloadImg/${i.id}"></a></td>
					<td>${i.price}</td>
					<td>${i.classify}</td>
					<td>${i.c2Id}</td>
<%-- 					<td>${i.RetailerBean.rName}</td> --%>
					<td><a href="${pageContext.request.contextPath}/ShopHouse/editItemId/${i.id}"><button
										type="submit">編輯</button></a> 
					    <a onclick="return confirm('確認刪除?')"	href="${pageContext.request.contextPath}/ShopHouse/deleteById/${i.id}">
									<button type="submit">刪除</button>
							</a></td>					
				</tr>
		</c:forEach>
</table>
<!-- --------------------------------------------------------------------------------------------		 -->
		
<!-- 		<form method="get" -->
<%-- 			action="${pageContext.request.contextPath}/ShopHouse/findByKeyword"> --%>
<!-- 			<input type="text" name="word" /> <input type="submit" name="Search" /> -->
<!-- 			<input type="button" value="clear"> -->
<!-- 		</form> -->

		<c:if test="${!empty keyword }">
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
			<c:forEach items="${keyword}" var="i">
				<tr>
					<td>${i.itemName}</td>
					<td><a href="${pageContext.request.contextPath}/ShopHouse/itemDetail/${i.id}"><img width="150"
						src="${pageContext.request.contextPath}/downloadImg/${i.id}"></a></td>
					<td>${i.price}</td>
					<td>${i.classify}</td>
					<td>${i.c2Id}</td>
<%-- 					<td>${i.RetailerBean.rName}</td> --%>
					<td><a
								href="${pageContext.request.contextPath}/ShopHouse/editItemId/${i.id}"><button
										type="submit">編輯</button></a> <a onclick="return confirm('確認刪除?')"
								href="${pageContext.request.contextPath}/ShopHouse/deleteById/${i.id}">
									<button type="submit">刪除</button>
							</a></td>					
				</tr>
			</c:forEach>		
		</table>
		</c:if>
<!-- --------------------------------------------------------------------------------------------		 -->
		

		<c:if test="${empty keyword }">
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
							
							<td><a href="${pageContext.request.contextPath}/ShopHouse/itemDetail/${i.id}"><img width="150"
								src="${pageContext.request.contextPath}/downloadImg/${i.id}"></a></td>
							<td>${i.price}</td>
							<td>${i.classify}</td>
							<td>${i.c2Id}</td>
							<td>${i.getRetailerBean().rName}</td>
							<td><a
								href="${pageContext.request.contextPath}/ShopHouse/editItemId/${i.id}"><button
										type="submit">編輯</button></a> <a onclick="return confirm('確認刪除?')"
								href="${pageContext.request.contextPath}/ShopHouse/deleteById/${i.id}">
									<button type="submit">刪除</button>
							</a></td>
							<td></td>
						</tr>
					</c:forEach>

				</tbody>

			</table>
			<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">


				<c:choose>

					<c:when test="${page.number != pageNumber -1}">
						<a
							href="${pageContext.request.contextPath}/ShopHouse/viewItems?p=${pageNumber}">
							${pageNumber} </a>

					</c:when>

					<c:otherwise>
				       ${pageNumber}
				    </c:otherwise>

				</c:choose>

			</c:forEach>
		</c:if>
	</div>
</body>

</html>