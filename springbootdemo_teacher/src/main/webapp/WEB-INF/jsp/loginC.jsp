<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="layout/navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員登入</title>
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

 h2 {
	margin-left:50px;
	display: inline-block;
	color: #333;
	font-weight: normal;
	text-transform: uppercase;
	font-size: 2rem;
	position: relative;
	z-index: 2;
	vertical-align: middle;
}

 h2::before {
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

.box {
	align: center;
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
	background-color: #E6E4D6;
}

.wrap {
	text-align: center;
}

.wrap ul {
	display: inline-block;
}

.wrap ul li {
	float: left;
}
</style>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

</head>
<body>

	<div class="container">

		<div class="box">
			<div class="wrap">
				<!-- 頁籤 -->
				<ul class="nav nav-pills mb-3 " id="pills-tab" role="tablist">
					<li class="nav-item" role="presentation"><a
						href="${contextRoot}/loginC"><button class="btn btn-light"
								id="pills-home-tab" data-bs-toggle="pill"
								data-bs-target="#pills-home" type="button" role="tab"
								aria-controls="pills-home" aria-selected="false">會員登入</button></a></li>
					<li class="nav-item" role="presentation"><a
						href="${contextRoot}/loginR"><button class="btn btn-light"
								id="pills-profile-tab" data-bs-toggle="pill"
								data-bs-target="#pills-profile" type="button" role="tab"
								aria-controls="pills-profile" aria-selected="false">商家登入</button></a>
					</li>
					<li class="nav-item" role="presentation"><a
						href="${contextRoot}/loginA"><button class="btn btn-light"
								id="pills-contact-tab" data-bs-toggle="pill"
								data-bs-target="#pills-contact" type="button" role="tab"
								aria-controls="pills-contact" aria-selected="false">管理者登入</button></a>
					</li>
				</ul>
			</div>

			<form action="checkcustomerlogin" method="post"
				style="margin: auto; width: 220px">
				<h2>會員登入</h2><br>

				<label class="form-label">您的帳號</label> <input type="text"
					placeholder="輸入帳號" class="form-control" name="cAccount"
					id="floatingInputC" />
				<p style="color: red;">${errors.caccount}</p>

				<label class="form-label">您的密碼</label> <input type="password"
					placeholder="輸入密碼" class="form-control" name="cPwd"
					id="floatingPasswordC" />
				<p style="color: red;">${errors.cpwd}</p>
				<div align="center">
					<button type="submit" class="btn btn-lg btn-primary">登入</button>
					<button class="btn btn-lg btn-secondary" id="cancel">取消</button>
					<p style="color: red;">${errors.cmsg}</p>
					<p style="color: red;">${errors.status}</p>


					<br> <label class="form-label"> <a
						href="${contextRoot}/forgotPassword">忘記密碼?</a></label>
				</div>
				<br> <a href="${contextRoot}/registerC">
					<button type="button"
						class="btn btn-outline-success btn-lg btn-block">我要露營</button>
				</a>

				<div align="center">
					<br> 快速登入: <br><br>
					<button class="btn btn-outline-dark fastLogin">東翰</button>
					<button class="btn btn-outline-dark fastLogin2">伸</button>
				</div>

			</form>
		</div>
	</div>

</body>

<script type="text/javascript">
	var triggerTabList = [].slice.call(document.querySelectorAll('#myTab a'))
	triggerTabList.forEach(function(triggerEl) {
		var tabTrigger = new bootstrap.Tab(triggerEl)

		triggerEl.addEventListener('click', function(event) {
			event.preventDefault()
			tabTrigger.show()
		})
	})

	//快速登入
	$(".fastLogin").click(function() {
		$("#floatingInputC").val("CCC");
		$("#floatingPasswordC").val("DDD");
	});

	$(".fastLogin2").click(function() {
		$("#floatingInputC").val("beauty1234");
		$("#floatingPasswordC").val("b1234");
	});

	//取消按鈕返回上頁
	$("#cancel").click(function(event) {
		event.preventDefault(); //取消預設行為
		window.location.replace("http://localhost:8080/"); //返回特定頁面
	})
</script>

</html>