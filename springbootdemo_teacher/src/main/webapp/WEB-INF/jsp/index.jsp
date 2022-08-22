<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="layout/navbar.jsp" />


<!DOCTYPE html>
<html>
<head>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<h1>首頁</h1>
<ul>
<li><a href="${contextRoot}/ShopHouse/viewItems">所有商品</a></li>
<li><a href="${contextRoot}/shopHouse/add">新增商品</a></li>
<li><a href="${contextRoot}/ShopHouse/findItemById">查詢商品</a></li>
<li><a href="${contextRoot}/Retailer/RetailerCRUD">查詢商家</a></li>
<li><a href="${contextRoot}/registerR">註冊新商家</a></li>
<li><a href="${contextRoot}/registerC">註冊新會員</a></li>
</ul>

<hr > 
<span class="badge badge-danger">最新商品</span>
<div class="container" align="center">
	<div class="row">
		<c:forEach items="${pages.content}" var="i">
			<div class="card" style="width: 12rem;">
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
</div>


</body>
</html>