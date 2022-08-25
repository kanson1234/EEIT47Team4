<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
.navbar{
	background-color: #D1AC00;
}
.navSearch {
	display: flex;
	align-items: center;
	margin-left: auto; input ,button{ border : none;
	outline: none;
	height: 30px;
	background-color: #ffffff;
}
div#dropdownSignINSignOut{
	background-color:#004643;
}
input {
	padding-left: 12px;
	width: 80%;
	border-radius: 100px 0 0 100px;
}

button {
	width: 20%;
	border-radius: 0 100px 100px 0;
	cursor: pointer;
}

.fa-search {
	color: #555555; &: hover { color : #26ff93;
	transition: all 0.3s;
}
}
}
</style>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet" />


</head>
<body>



	<nav class="navbar navbar-expand-lg navbar-light " style="z-index:1;">
		<a class="navbar-brand"
			href="${pageContext.request.contextPath}/ShopHouse/indexShopHouseItems"><img
			width="100px" src="${contextRoot}/img/Logo1.png"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/showAllRetailerFront">店家一覽</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="${pageContext.request.contextPath}/ShopHouse/FrontPageShopHouseItems">所有商品
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="${pageContext.request.contextPath}/ShopHouse/findByClothes">服飾
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
					href="${pageContext.request.contextPath}/admin/Admin">後臺管理 <span
						class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="${pageContext.request.contextPath}/ShopHouse/viewItems">後臺管理所有商品
						<span class="sr-only">(current)</span>
				</a></li>



			</ul>


			<div class="dropdown text-end rounded-pill text-light" style="background-color:#C7A200;" >
				<c:if test="${empty customerLoginOk && empty adminLoginOk && empty retailerLoginOk}">
					<ul class="navbar-nav mr-auto">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="${contextRoot}/loginC"
							role="button" aria-expanded="false"> 登入 </a></li>

					</ul>
				</c:if>
				<c:if test="${!empty retailerLoginOk}">
					<c:set var="retailer" value="retailerLoginOk" />
					<div >
						<a class="nav-link dropdown-toggle" href="#" role="button"
							data-toggle="dropdown" aria-expanded="false"> <img
							src="${contextRoot}/showlogo/${retailerLoginOk.rid}" width="45"
							height="45" class="rounded-circle"> <span class="text-dark">${retailerLoginOk.rName }</span>
						</a>
						<ul class="navbar-nav mr-auto">
							<li class="nav-item dropdown">
								<div class="dropdown-menu">
									<a class="dropdown-item" href="${contextRoot}/Retailer/retailerInfoPage/${retailerLoginOk.rid}">商家資訊</a> <a
										class="dropdown-item"
										href="${contextRoot}/ShopHouse/viewC2IdItems?id=${retailerLoginOk.rid}">商品管理</a> <a
										class="dropdown-item" href="${contextRoot}/logout">登出</a>
								</div>
							</li>
						</ul>
					</div>
				</c:if>
				<c:if test="${!empty customerLoginOk}">
					<c:set var="customer" value="customerLoginOk" />
					<div>
						<a class="nav-link dropdown-toggle" href="#" role="button"
							data-toggle="dropdown" aria-expanded="false"> <img
							src="${contextRoot}/downloadImage/${customerLoginOk.cId}"
							width="45" height="45" class="rounded-circle"> <span class="text-dark">${customerLoginOk.cFirstName}</span>
						</a>

						<ul class="navbar-nav mr-auto ">
							<li class="nav-item dropdown">
								<div class="dropdown-menu">

									<a class="dropdown-item" href="${contextRoot}/customer/findOne">顧客資訊</a>
									<a class="dropdown-item" href="#">訂單管理</a>
									 <a class="dropdown-item" href="${contextRoot}/logout">登出</a>
								</div>
							</li>
						</ul>
					</div>
				</c:if>


				<c:if test="${!empty adminLoginOk}">
					<c:set var="admin" value="adminLoginOk" />
					<div>

						<a class="nav-link dropdown-toggle" href="#" role="button"
							data-toggle="dropdown" aria-expanded="false"><span>${adminLoginOk.firstName}</span>

						</a>

						<ul class="navbar-nav mr-auto">
							<li class="nav-item dropdown">
								<div class="dropdown-menu">

									<a class="dropdown-item" href="${contextRoot}/customer/findAll">後臺管理</a>
									<a class="dropdown-item" href="${contextRoot}/logout">登出</a>
								</div>4
							</li>
						</ul>
					</div>
				</c:if>

			</div>
			<div align="right">
				<form method="get" class="form-inline my-2 my-lg-0"
					action="${pageContext.request.contextPath}/ShopHouse/findByKeyword">
					<input style="padding: 4px" class="form-control mr-sm-1"
						type="text" placeholder="Coleman" name="word" /> <input
						type="submit" name="Search" value="搜尋"
						class="btn btn-outline-success my-2 my-sm-0" />
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