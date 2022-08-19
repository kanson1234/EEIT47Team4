<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="layout/navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>忘記密碼</title>
<!-- bootstrap 5.1.3 JS -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

</head>
<body>

	<div class="container">

		<form action="sendForgotMail" method="get"
			style="margin: auto; width: 220px">
			<label class="form-label">請輸入您的帳戶資料</label> <input type="text" placeholder="您的帳號"
				class="form-control" name="sendEmailAccount" />
			<button type="submit" class="btn btn-lg btn-primary">送出</button>
			<p style="color: red;">${errors.customerAccount}</p>
			<p style="color: red;">${errors.errorAccount}</p>
			<p style="color: green;">${errors.success}</p>
		</form>

	</div>

</body>
</html>