<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<body>

	<nav class="navbar navbar-expand-lg bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">淘氣登山用品</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="${contextRoot}/logindex">商城首頁</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${contextRoot}/registerR">商家註冊</a></li>
						<li class="nav-item"><a class="nav-link"
						href="${contextRoot}/registerC">會員註冊</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${contextRoot}/customer/findAll">所有會員</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${contextRoot}/customer/findOne">我的會員資料</a></li>


					<li class="nav-item dropdown">
						<div class="btn-group">
							<button type="button" class="btn btn-success dropdown-toggle "
								data-bs-toggle="dropdown" aria-expanded="false">登入</button>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="${contextRoot}/login">管理者登入</a></li>
								<li><a class="dropdown-item"
									href="${contextRoot}/loginR">商家登入</a></li>
								<li><a class="dropdown-item"
									href="${contextRoot}/loginC">會員登入</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="${contextRoot}/logout">登出</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</nav>




	<!-- 	<div class="nav"> -->
	<!-- 		<input type="checkbox" id="nav-check"> -->
	<!-- 		<div class="nav-header"> -->
	<!-- 			<div class="nav-title">首頁</div> -->
	<!-- 		</div> -->
	<!-- 		<div class="nav-btn"> -->
	<!-- 			<label for="nav-check"> <span></span> <span></span> <span></span> -->
	<!-- 			</label> -->
	<!-- 		</div> -->

	<!-- 		<div class="nav-links"> -->
	<%-- 			<a href="${contextRoot}/logindex">登入頁面</a> <a --%>
	<%-- 				href="${contextRoot}/customer/findAll">所有會員</a> <a --%>
	<%-- 				href="${contextRoot}/personalFile">我的會員資料</a> <a --%>
	<!-- 				href="https://codepen.io/jo_Geek/">留言板</a> <a -->
	<!-- 				href="https://jsfiddle.net/user/jo_Geek/">聯絡我們</a> -->

	<!-- 			<div class="btn-group"> -->
	<!-- 				<button type="button" class="btn btn-success dropdown-toggle " -->
	<!-- 					data-bs-toggle="dropdown" aria-expanded="false">Action</button> -->
	<!-- 				<ul class="dropdown-menu"> -->
	<%-- 					<li><a class="dropdown-item" href="${contextRoot}/login">管理者登入</a></li> --%>
	<%-- 					<li><a class="dropdown-item" href="${contextRoot}/registerR">商家註冊</a></li> --%>
	<%-- 					<li><a class="dropdown-item" href="${contextRoot}/registerC">顧客註冊</a></li> --%>
	<!-- 					<li><hr class="dropdown-divider"></li> -->
	<!-- 					<li><a class="dropdown-item" href="#">Separated link</a></li> -->
	<!-- 				</ul> -->
	<!-- 			</div> -->

	<!-- 		</div> -->
	<!-- 	</div> -->

</body>



</html>