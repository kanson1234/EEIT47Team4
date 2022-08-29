<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="layout/navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>忘記密碼</title>
<style>
body {
	padding: 0;
	margin: 0;
	min-height: 100vh;
	background: -webkit-linear-gradient(transparent, rgba(255, 255, 255, .3)),
		-webkit-linear-gradient(350deg, rgba(0, 70, 67, .8) 30%, #B0EAE8 120%);
	background: linear-gradient(transparent, rgba(110, 110, 110, .3)),
		linear-gradient(100deg, rgba(0, 70, 67, .8) 30%, #D1AC00 120%);
}

.box {
	background-color: #E6E4D6;
	margin: 20px;
	padding: 20px;
	padding-left: 100px;
	padding-right: 100px;
	margin-left: auto;
	margin-right: auto;
	width: 60%;
	border: solid 1px;
	border-radius: 5px;
	border-color: rgb(163, 163, 163);
	box-shadow: 2px 4px 2px -2px rgba(0, 0, 0, .3), -2px -4px 15px -2px
		rgba(0, 0, 0, .2);
}
</style>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

</head>
<body>

	<div class="container">
		<div class="box" align='center'>
			<h3>忘記密碼</h3>

			<form action="sendForgotMail" method="get"
				style="margin: auto; width: 220px">
				<label class="form-label">您的帳戶</label> <input type="text"
					placeholder="請輸入您的帳號資料" class="form-control"
					name="sendEmailAccount" id="InsertAccount" />
				<p style="color: red;">${errors.customerAccount}</p>
				<label class="form-label">電子信箱</label> <input type="text"
					placeholder="您註冊時填寫之電子信箱" class="form-control"
					name="sendCustomerEmail" id="InsertEmail"/>
				<p style="color: red;">${errors.customerEmail}</p>
				<button type="submit" class="btn btn-lg btn-primary">送出</button>
				<button class="btn btn-lg btn-secondary" id="cancel">取消</button>
				<p style="color: red;">${errors.errorAccount}</p>
				<p style="color: green;">${errors.success}</p>

				<div class="text-center m-5">
					<button type="button" class="btn btn-outline-dark fastInsert">快速帶入</button>
				</div>

			</form>
		</div>
	</div>

</body>
<script type="text/javascript">
	//快速填入
	$(".fastInsert").click(function() {
		$("#InsertAccount").val("ms0592521");
		$("#InsertEmail").val("ansonliu0301@gmail.com");
	});
	
	//取消按鈕返回上頁
	$("#cancel").click(function(event) {
		event.preventDefault(); //取消預設行為
		window.location.replace("http://localhost:8080/"); //返回特定頁面
	})
	
</script>


</html>