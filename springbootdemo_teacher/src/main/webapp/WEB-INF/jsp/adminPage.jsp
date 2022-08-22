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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin.css">
<meta charset="UTF-8">
<title>Admin</title>
<script>
	$(document).ready(function() {
		$("#retailerCRUDlink").click(function() {
			$("#div_content").load("RetailerCRUD.jsp");
		});
	});
</script>
</head>
<body>
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

	<main>
	<div id="div_content"> 
	
	</div>
	</main>
</body>
</html>