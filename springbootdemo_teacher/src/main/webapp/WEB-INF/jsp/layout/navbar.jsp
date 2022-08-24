<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet" />


</head>
<body>


	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="${pageContext.request.contextPath}/ShopHouse/indexShopHouseItems">首頁</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/showAllRetailerFront">店家一覽</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="${pageContext.request.contextPath}/ShopHouse/FrontPageShopHouseItems">所有商品
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="${pageContext.request.contextPath}/ShopHouse/findByTent">帳篷
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="${pageContext.request.contextPath}/ShopHouse/findByLight">照明設備
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="${pageContext.request.contextPath}/ShopHouse/findByBackpack">功能背包
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="${pageContext.request.contextPath}/shopHouse/add">新增商品 <span
						class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="${pageContext.request.contextPath}/admin/Admin">後臺管理 <span
						class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="${pageContext.request.contextPath}/ShopHouse/viewItems">後臺管理所有商品
						<span class="sr-only">(current)</span>
				</a></li>
				
			</ul>
			
		<div class="dropdown text-end">
			<c:if test="${empty customerLoginOk && empty adminLoginOk && empty retailerLoginOk}">
				<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" role="button"
					data-toggle="dropdown" aria-expanded="false"> 登入 </a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="${contextRoot}/loginA">管理者登入</a> <a
							class="dropdown-item" href="${contextRoot}/loginR">商家登入</a> <a
							class="dropdown-item" href="${contextRoot}/loginC">會員登入</a>
					</div></li>
				</ul>	
			</c:if>
			<c:if test="${!empty retailerLoginOk}">
			<c:set var="retailer" value="retailerLoginOk" />
			<div>
			<a class="nav-link dropdown-toggle" href="#" role="button"
					data-toggle="dropdown" aria-expanded="false">
					<img src="${contextRoot}/showlogo/${retailerLoginOk.rid}" width="45" height="45" class="rounded-circle"> 
					<span>${retailerLoginOk.rName }</span> 
			</a>
				<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown">
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">商家資訊</a> <a
							class="dropdown-item" href="${contextRoot}/ShopHouse/viewC2IdItems">商品管理</a> <a
							class="dropdown-item" href="${contextRoot}/logout">登出</a>
					</div></li>
				</ul>
				</div>
			</c:if>	
			<c:if test="${!empty customerLoginOk}">
			<c:set var="customer" value="customerLoginOk" />
			<div>
			<a class="nav-link dropdown-toggle" href="#" role="button"
					data-toggle="dropdown" aria-expanded="false">
					<img src="${contextRoot}/downloadImage/${customerLoginOk.cId}" width="45" height="45" class="rounded-circle"> 
					<span>${customerLoginOk.cFirstName}</span> 
					</a>
			
				<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown">
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">顧客資訊</a> 
						<a class="dropdown-item" href="#">訂單管理</a> 
						<a class="dropdown-item" href="${contextRoot}/logout">登出</a>
					</div></li>
				</ul>
				</div>
			</c:if>	
			<c:if test="${!empty adminLoginOk}">
			<c:set var="admin" value="adminLoginOk" />
			<div>
			<a class="nav-link dropdown-toggle" href="#" role="button"
					data-toggle="dropdown" aria-expanded="false">
					<img src="" width="45" height="45" class="rounded-circle" alt="..."> 
					<span>${adminLoginOk.id}</span> 
					</a>
			
				<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown">
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">後臺管理</a> 
						<a class="dropdown-item" href="${contextRoot}/logout">登出</a>
					</div></li>
				</ul>
				</div>
			</c:if>	
			
			
		</div>

			<div class="row align-end">
					<form class="row g-3" method="get" action="${pageContext.request.contextPath}/ShopHouse/findByKeyword">
					 <div class="col-md-6">
					<input style="padding:5px" class="form-control mr-sm-2" type="text" name="word" /> 
					</div>
					 <div class="col-md-4">
					<input type="submit" name="Search" value="搜尋" />
					</div>
					</form>
			</div>
		</div>
	</nav>

	<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"
		type="text/javascript"></script>

</body>
</html>