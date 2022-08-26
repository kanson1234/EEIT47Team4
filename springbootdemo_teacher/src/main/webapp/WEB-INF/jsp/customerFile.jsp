<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="layout/navbar.jsp" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">

<title>我的個人資料</title>
<style>
.button {
	background-color: #D1AC00;
	color: #0C1618;
	border: none;
	border-radius: 10px;
}

* {
	box-sizing: border-box;
}

html {
	font-size: 100%;
}

body {
	padding: 0;
	margin: 0;
	min-height: 100vh;
	background: -webkit-linear-gradient(transparent, rgba(255, 255, 255, .3)),
		-webkit-linear-gradient(350deg, rgba(0, 70, 67, .8) 30%, #B0EAE8 120%);
	background: linear-gradient(transparent, rgba(110, 110, 110, .3)),
		linear-gradient(100deg, rgba(0, 70, 67, .8) 30%, #D1AC00 120%);
}

.about-dev {
	width: 100%;
	max-width: 36rem;
	margin: auto;
	/*陰影設置*/
	box-shadow: 2px 4px 2px -2px rgba(0, 0, 0, .3), -2px -4px 15px -2px
		rgba(0, 0, 0, .2);
}

.profile-card_header {
	/*改照片背框顏色*/
	background: #004643;
	border-left: 0.625rem solid #D1AC00;
	padding: 1.5em 1.5em 1em;
	text-align: center;
}

/* profile picture */
.profile-card_header-imgbox {
	display: block;
	width: 13rem;
	height: 13rem;
	overflow: hidden;
	border-radius: 50%;
	margin: auto;
	background: rgba(250, 214, 195, 1);
	border: 0.2rem solid #D1AC00;
}

.profile-card_header img {
	max-width: 100%;
}

/* header heading */
.profile-card_header h1 {
	color: #f3f3f3;
	font-size: 1.5rem;
	margin-top: 0.8em;
	font-family: 'Oswald', sans-serif;
	font-weight: normal;
	position: relative;
}

/* about section */
.profile-card_about {
	line-height: 1.5;
	background: #E6E4D6;
	padding: 1.5em 2rem;
	font-family: 'Lato', sans-serif;
}

.form-label {
	margin: 0;
	display: inline-block;
	color: #333;
	font-weight: normal;
	text-transform: uppercase;
	position: relative;
	z-index: 2;
	vertical-align: middle;
}

.form-label ::before {
	content: '';
	position: absolute;
	width: 110%;
	/*  max-width: 13.8rem;
*/
	height: 1rem;
	/*更改label顏色*/
	background: #F6BE9A;
	left: -5px;
	top: 40%;
	z-index: -1;
}

@media screen and (min-width: 33em) {
	.side_wrapper {
		margin: 2rem auto;
	}
	.profile-card_header {
		padding: 1.5em 4em 1em;
	}
}
</style>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
</head>

<body>




	<!-- 	<div class="container"> -->
	<!-- 		<div -->
	<!-- 			style="margin: 20px; padding: 20px; padding-left: 200px; padding-right: 200px; margin-left: auto; margin-right: auto; width: 60%; border: solid 1px; border-radius: 5px; border-color: rgb(163, 163, 163);"> -->


	<%-- <p style="color: red;">${msg.success}</p> --%>
	<!-- 			<div class="text-center"> -->
	<!-- 				<h2>我的個人資料</h2> -->
	<!-- 			</div> -->
	<!-- 			<div class="mb-3"> -->

	<!-- 				<label class="form-label"></label> <input type="hidden" -->
	<!-- 					class="form-control" name="customerId" -->
	<%-- value="${oneCustomer.getcId()}"> <label class="form-label"></label> --%>
	<!-- 				<img width="350" id="img" -->
	<%-- src="${contextRoot}/downloadImage/${oneCustomer.cId}" /> <br> --%>

	<!-- 				<label class="form-label"><font size="4">帳號:</font></label> <input -->
	<!-- 					type="text" class="form-control" name="cAccount" -->
	<%-- readonly="readonly" value="${oneCustomer.getcAccount()}"> <label --%>
	<!-- 					class="form-label"><font size="4">密碼:</font></label> <input -->
	<!-- 					type="password" class="form-control" name="cPwd" -->
	<%-- readonly="readonly" value="${oneCustomer.getcPwd()}"> <label --%>
	<!-- 					class="form-label"><font size="4">姓:</font></label> <input -->
	<!-- 					type="text" class="form-control" name="cFirstName" -->
	<%-- readonly="readonly" value="${oneCustomer.getcFirstName()}"> --%>
	<!-- 				<label class="form-label"><font size="4">名:</font></label> <input -->
	<!-- 					type="text" class="form-control" name="cLastName" -->
	<%-- readonly="readonly" value="${oneCustomer.getcLastName()}"> --%>
	<!-- 				<label class="form-label">生日</label> <input type="date" -->
	<!-- 					class="form-control" name="cbDate" value="" id="cDate" -->
	<!-- 					readonly="readonly"> <label class="form-label"><font -->
	<!-- 					size="4">個人電子信箱:</font></label> <input type="text" class="form-control" -->
	<!-- 					name="cEmail" readonly="readonly" -->
	<%-- value="${oneCustomer.getcEmail()}"> --%>

	<!-- 			</div> -->
	<%-- <a href="${contextRoot}/customer/editOne"> --%>
	<!-- 				<button type="button" class="btn btn-lg btn-primary">編輯個人資料</button> -->
	<!-- 			</a> -->
	<!-- 			<button class="btn btn-lg btn-secondary" id="cancel">取消</button> -->


	<!-- 		</div> -->
	<!-- 	</div> -->

	<div class="side_wrapper">
		<section class="about-dev">
			<header class="profile-card_header">
				<div class="profile-card_header-container">
					<div class="profile-card_header-imgbox">
						<img src="${contextRoot}/downloadImage/${oneCustomer.cId}" />
					</div>
					<h1>${oneCustomer.getcFirstName()}
						${oneCustomer.getcLastName()}</h1>
				</div>
			</header>
			<div class="profile-card_about">
				<label class="form-label"> <input type="hidden"
					class="form-control" name="customerId"
					value="${oneCustomer.getcId()}"></label> <label class="form-label">
					<font size="5">帳號:</font>
				</label> <input type="text" class="form-control" name="cAccount"
					style="margin-bottom: 10px;" readonly="readonly"
					value="${oneCustomer.getcAccount()}"> <label
					class="form-label"><font size="5"> 密碼:</font> </label> <input
					type="password" class="form-control" name="cPwd"
					style="margin-bottom: 10px;" readonly="readonly"
					value="${oneCustomer.getcPwd()}"> <label class="form-label">
					<font size="5">出生年月日:</font>
				</label> <input type="date" class="form-control" name="cbDate"
					style="margin-bottom: 10px;" value="" id="cDate"
					readonly="readonly"> <label class="form-label"> <font
					size="5">個人電子信箱:</font>
				</label> <input type="text" class="form-control" name="cEmail"
					style="margin-bottom: 10px;" readonly="readonly"
					value="${oneCustomer.getcEmail()}"> <br> <br> <a
					href="${contextRoot}/customer/editOne"
					style="text-decoration: none;">
					<button type="button" class="button">編輯個人資料</button>
				</a> <a href="${contextRoot}/" style="text-decoration: none;">
					<button type="button" class="button" id="cancel">取消</button>
				</a>
			</div>
		</section>

	</div>

</body>

<script>
	$('#imgInp').change(function() {
		var file = $('#imgInp')[0].files[0];
		var reader = new FileReader;
		reader.onload = function(e) {
			$('#img').attr('src', e.target.result);
		};
		reader.readAsDataURL(file);
	});

	//取消按鈕返回上頁
	$("#cancel").click(function(event) {
		event.preventDefault(); //取消預設行為
		window.location.replace("http://localhost:8080/"); //返回特定頁面
	})

	// 		//密碼可視切換
	// 		$("#checkEye").click(function() {
	// 			if ($(this).hasClass('fa-eye')) {
	// 				$("#cPassword").attr('type', 'password');
	// 			} else {
	// 				$("#cPassword").attr('type', 'text');
	// 			}
	// 			$(this).toggleClass('fa-eye').toggleClass('fa-eye-slash');
	// 		});

	var dateControl = document.querySelector('input[type="date"]');
	dateControl.value = '${oneCustomer.getcBirthdate()}'
</script>


</html>