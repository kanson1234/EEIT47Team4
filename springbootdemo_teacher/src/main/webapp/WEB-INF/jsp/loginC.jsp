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

.text-center h2 {
	margin: 0;
	display: inline-block;
	color: #333;
	font-weight: normal;
	text-transform: uppercase;
	font-size: 1.3rem;
	position: relative;
	z-index: 2;
	vertical-align: middle;
}

.text-center h2::before {
	content: '';
	position: absolute;
	width: 110%;
	/*  max-width: 13.8rem;
*/
	height: 1rem;
	/*更改標題顏色*/
	background: #F6BE9A;
	left: -5px;
	top: 50%;
	z-index: -1;
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


<!-- bootstrap 5.1.3 JS -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous">
	
</script>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />


</head>
<body>


	<div class="container">


		<div class="box">

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

			<form action="checkcustomerlogin" method="post"
				style="margin: auto; width: 220px">
				<h2 class="h3 mb-3 fw-normal">會員登入</h2>

				<label class="form-label">您的帳號</label> <input type="text"
					placeholder="輸入帳號" class="form-control" name="cAccount"
					id="floatingInputC" />
				<p style="color: red;">${errors.caccount}</p>

				<label class="form-label">您的密碼</label> <input type="password"
					placeholder="輸入密碼" class="form-control" name="cPwd"
					id="floatingPasswordC" />
				<p style="color: red;">${errors.cpwd}</p>

				<button type="submit" class="btn btn-lg btn-primary">登入</button>
				<button class="btn btn-lg btn-secondary" id="cancel">取消</button>
				<p style="color: red;">${errors.cmsg}</p>
				<p style="color: red;">${errors.status}</p>


				<br> <label class="form-label"> <a
					href="${contextRoot}/forgotPassword">忘記密碼?</a></label> <br> <a
					href="${contextRoot}/registerC">
					<button type="button"
						class="btn btn-outline-success btn-lg btn-block">我要露營</button>
				</a>

				<div class="text-center m-5">
					快速登入:
					<button class="btn btn-outline-dark fastLogin">測試用路人</button>
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
		$("#floatingInputC").val("roy");
		$("#floatingPasswordC").val("1111");
	});

	//取消按鈕返回上頁
	$("#cancel").click(function(event) {
		event.preventDefault(); //取消預設行為
		window.location.replace("http://localhost:8080/"); //返回特定頁面
	})
</script>

</html>