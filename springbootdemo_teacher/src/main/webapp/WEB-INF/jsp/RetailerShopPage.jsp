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
						class="card-img-top figure-img img-fluid rounded-circle" alt="..."
						width="150" height="150">
				</figure>
				<div class="text">
					<div class="col-md-4"></div>
					<div class="col-md-8">
						<h3 style="margin-top: 0px; margin-bottom: 0px; font-weight: bold;">
							${RetailerInfo.rName}</h3>
						<dl class="row">
							<dt class="row text-uppercase">${RetailerInfo.rName}</dt>
							<dd class="row">
								<p class="text-left">${RetailerInfo.rinfo}</p>
							</dd>
						</dl>
					</div>
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
				<div class="row">
					<div class="col-sm-6">
						<img src="${contextRoot}/showlogo/${RetailerInfo.rid}"
							class="card-img-top rounded-circle" alt="..." width="150"
							height="150"> <input id='clickmeS'
							value="${RetailerInfo.rName}" />
					</div>
					<div>
						<textarea rows="10" cols="50">
			${RetailerInfo.rinfo}
			</textarea>
					</div>
				</div>
		
			<div class="container" align="center">
				<div class="row">
					<c:forEach items="${listItem}" var="Item">
						<div class="card" style="width: 18rem;">
							<a href="${contextRoot}/ShopHouse/itemDetail/${Item.id}">
							<img src="${contextRoot}/downloadImg/${Item.id}"
								class="card-img-top" alt="..."></a>
											
							<div class="card-body">
								<p class="card-text">${Item.itemName}</p>
								<p class="card-text">${Item.price}</p>
							</div>

						</div>
					</c:forEach>
				</div>
			</div>
		

	</main>
</body>
</html>