<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>零售商註冊</title>
<!-- bootstrap 5.1.3 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<!-- bootstrap 5.1.3 JS -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<!-- jQuery 3.6.0 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<!-- font awesome 5.10.0 -->
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />

<!-- 自定義CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/login.css">
</head>
<body class="vh-100">
	<form action="Retailer/insert.controller" method="post">
		<h2 class="h3 mb-3 fw-normal">零售商註冊</h2>
		<table>
			<tr>
				<td>姓:</td>
				<td><input type="text" name="rFirstName" /></td>
				<td>${errors.name}</td>
			</tr>
			<tr>
				<td>名:</td>
				<td><input type="text" name="rLastName" /></td>
				<td>${errors.name}</td>
			</tr>
			<tr>
				<td>帳號:</td>
				<td><input type="text" name="rAccount" /></td>
				<td>${errors.name}</td>
			</tr>
			<tr>
				<td>密碼:</td>
				<td><input type="password" name="rPwd" /></td>
				<td>${errors.pwd}</td>
			</tr>
			<tr>
				<td>電話:</td>
				<td><input type="text" name="rPhone" /></td>
				<td>${errors.pwd}</td>
			</tr>
			<tr>
				<td><button type="submit" class="btn btn-lg btn-primary">註冊</button></td>
				<td>${errors.msg}</td>
			</tr>
		</table>
	</form>

</body>
</html>