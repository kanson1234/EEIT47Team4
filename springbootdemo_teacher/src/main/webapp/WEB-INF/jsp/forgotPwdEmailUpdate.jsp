<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="layout/navbar.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改密碼</title>
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

h3 {
	margin-left: 0px;
	display: inline-block;
	color: #333;
	font-weight: normal;
	text-transform: uppercase;
	font-size: 2rem;
	position: relative;
	z-index: 2;
	vertical-align: middle;
}

h3::before {
	content: '';
	position: absolute;
	width: 110%;
	/*  max-width: 13.8rem;*/
	height: 1rem;
	/*更改標題顏色*/
	background: #F7FE72;
	left: -5px;
	top: 50%;
	z-index: -1;
}
</style>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

</head>
<body>

	<div class="container">
		<div class="box" align='center'>
			<h3>修改密碼</h3>

			<form action="customerUpdatePassword" method="POST"
				style="margin: auto; width: 220px">
				<label class="form-label">您的登入帳戶</label> <input type="text"
					placeholder="請輸入您的帳號資料" class="form-control" name="cAccount"
					id="InsertAccount" />
				<p style="color: red;">${errors.cAccount}</p>
				<p style="color: red;">${errors.errorAccount}</p>



				<label class="form-label">您的新密碼</label> <input type="password"
					placeholder="輸入新密碼" class="form-control" name="cPwd1"
					id="InsertPwd1" />
				<p style="color: red;">${errors.cPwd1}</p>



				<label class="form-label">再次輸入新密碼</label> <input type="password"
					placeholder="兩次輸入之密碼需相同" class="form-control" name="cPwd2"
					id="InsertPwd2" />
				<p style="color: red;">${errors.cPwd2}</p>
				<p style="color: red;">${errors.pwdError}</p>



				<button type="submit" class="btn btn-lg btn-primary">送出</button>
				<p style="color: red;">${errors.duplicatePwd}</p>
				<p style="color: green;">${msg.updateSuccess}</p>

				<br> <label class="form-label"> <a
					href="${contextRoot}/loginC">回登入頁面</a>
				</label>
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
		$("#InsertAccount").val("beauty123");
		$("#InsertPwd1").val("b123");
		$("#InsertPwd2").val("b1234");
	});
</script>


</html>