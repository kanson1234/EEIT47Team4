<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="layout/navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>RetailerShopPage</title>

</head>
<body>

	<header> </header>

	<main>
		<div align='center'>
			<div class="container">
				<figure class="figure">
					<img src="${contextRoot}/showlogo/${RetailerInfo.rid}"
						class="card-img-top figure-img img-fluid " alt="..."
						width="34%" height="auto">
				</figure>
				<div class="text">
					<article class="editor">
						<div class="row">
							<div class="col-md-6">
								<img src="${contextRoot}/showphoto/${RetailerInfo.rid}"
								class="card-img-top figure-img img-fluid " alt="..."
								 >
							</div>
							<div class="col-md-6">
								<h3 style="margin-top: 0px; margin-bottom: 0px; font-weight: bold;">
									${RetailerInfo.rName}</h3>
								<div class="col order-5">${RetailerInfo.rinfo}</div>	
							</div>
						</div>
					</article>
					</div>
					<div class="row">
						<c:forEach items="${listItem}" var="Item">
							<div class="card" style="width: 17rem;">
								<a href="${contextRoot}/ShopHouse/itemDetail/${Item.id}"> <img
									src="${contextRoot}/downloadImg/${Item.id}"
									class="card-img-top" alt="...">
								</a>
								<div class="card-body">
									<p class="card-text">${Item.itemName}</p>
									<p class="card-text">${Item.price}</p>
								</div>
							</div>
						</c:forEach>
					</div>
					</div>
			</div>
			
		

	</main>
</body>
</html>