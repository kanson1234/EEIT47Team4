<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="layout/navbar.jsp" />
<jsp:include page="layout/Sidebar.jsp" />
<!DOCTYPE html>
<html>
<head>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Admin</title>
<style type="text/css">

</style>
</head>
<body>
<<<<<<< HEAD
<<<<<<< HEAD
	<header
		class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
		<a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">Admin</a>
		<button class="navbar-toggler position-absolute d-md-none collapsed"
			type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu"
			aria-controls="sidebarMenu" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<input class="form-control form-control-dark w-100" type="text"
			placeholder="Search" aria-label="Search">
		<ul class="navbar-nav px-3">
			<li class="nav-item text-nowrap"><a class="nav-link" href="#">Sign
					out</a></li>
		</ul>
	</header>
	<div class="container-fluid">
		<div class="row">
			<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
				<div class="position-sticky pt-3">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#"> <span data-feather="home"></span>
								銷售量圖表
						</a></li>
						<li class="nav-item"><a class="nav-link" href="${contextRoot}/Retailer/RetailerCRUD"> <span
								data-feather="file" id="retailerCRUDlink"></span> 商家帳號管理
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"> <span
								data-feather="shopping-cart"></span> 商品管理
						</a></li>
						<li class="nav-item"><a class="nav-link" href="${contextRoot}/record/srselectpageALL"> <span
								data-feather="shopping-cart"></span> 交易紀錄
						</a></li>
						<li class="nav-item"><a class="nav-link" href="${contextRoot}/Admin/SalesRecord3"> <span
								data-feather="shopping-cart"></span> 交易紀錄2
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"> <span
								data-feather="users"></span> Customers
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"> <span
								data-feather="bar-chart-2"></span> 顧客黑名單
						</a></li>
						<li class="nav-item"><a class="nav-link" href="#"> <span
								data-feather="layers"></span> 商家黑名單
						</a></li>
					</ul>
=======
<!-- 	<header -->
<!-- 		class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow"> -->
<!-- 		<a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">Admin</a> -->
<!-- 		<button class="navbar-toggler position-absolute d-md-none collapsed" -->
<!-- 			type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" -->
<!-- 			aria-controls="sidebarMenu" aria-expanded="false" -->
<!-- 			aria-label="Toggle navigation"> -->
<!-- 			<span class="navbar-toggler-icon"></span> -->
<!-- 		</button> -->
<!-- 		<input class="form-control form-control-dark w-100" type="text" -->
<!-- 			placeholder="Search" aria-label="Search"> -->
<!-- 		<ul class="navbar-nav px-3"> -->
<!-- 			<li class="nav-item text-nowrap"><a class="nav-link" href="#">Sign -->
<!-- 					out</a></li> -->
<!-- 		</ul> -->
<!-- 	</header> -->

<%-- 						<li class="nav-item"><a class="nav-link" href="${contextRoot}/Retailer/RetailerCRUD"> <span --%>
<!-- 								data-feather="file" id="retailerCRUDlink"></span> 商家帳號管理 -->
>>>>>>> e34289924ad60a3b00e2a5f25f0b3021ff268257
=======

>>>>>>> 3dda41fcf20dc147f7fd896e2e46b376f102aca2

<main>
	<div id="div_content"> 
	
	</div>
</main>

	

</body>
</html>