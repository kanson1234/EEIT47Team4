<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="layout/shopNavbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>ViewRetailer</title>
</head>
<body>
	<header>
		<div align="center">店家一覽</div>

	</header>
	<main>
	<div class="container" align="center">
		<div class="row">
			<c:forEach items="${listRetailer}" var="retailer">
				<div class="card" style="width: 18rem;">
<%-- 					<a href="${contextRoot}/R/find?id=${retailer.rid}"> --%>
					<a href="${contextRoot}/retailerGetAllItem?id=${retailer.rid}">
					<img src="${contextRoot}/showlogo/${retailer.rid}" 
					class="card-img-top" alt="...">
					</a>
					<div class="card-body">
						<p class="card-text">${retailer.rName}</p>
					</div>

				</div>
			</c:forEach>
		</div>
	</div>
	</main>
</body>
</html>