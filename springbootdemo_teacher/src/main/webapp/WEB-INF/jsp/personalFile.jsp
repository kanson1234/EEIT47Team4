<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="layout/navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改個人資料</title>
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
	background: #B9E28C;
	left: -5px;
	top: 50%;
	z-index: -1;
}

.form-label {
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

.form-label ::before {
	content: '';
	position: absolute;
	width: 110%;
	/*  max-width: 13.8rem;
*/
	height: 1rem;
	/*更改標題顏色*/
	background: #F2E86D;
	left: -5px;
	top: 50%;
	z-index: -1;
}
</style>


<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

</head>
<body>
	<div class="container">
		<div
			style="background-color: #E6E4D6; margin: 20px; padding-left: 200px; padding-right: 200px; margin-left: auto; margin-right: auto; width: 90%; border: solid 1px; border-radius: 5px; border-color: rgb(163, 163, 163);">


			<form
				action="${contextRoot}/customer/update?id=${oneCustomer.getcId()}"
				method="post" enctype="multipart/form-data">
				<div class="text-center">
					<h2>修改個人資料</h2>
				</div>
				<div class="mb-3">

					<label class="form-label"></label> <input type="hidden"
						class="form-control" name="customerId"
						value="${oneCustomer.getcId()}">

					<div>
						<label class="form-label"><font size="5">帳號:</font></label>
					</div>
					<div style="font-size: large;">${oneCustomer.getcAccount()}</div>

					<label class="form-label"><font size="5">密碼:</font></label> <input
						type="text" class="form-control" name="cPwd"
						value="${oneCustomer.getcPwd()}">
					<p style="color: red;">${errors.cPwd}</p>
					<label class="form-label"><font size="5">姓氏:</font></label> <input
						type="text" class="form-control" name="cFirstName"
						value="${oneCustomer.getcFirstName()}">
					<p style="color: red;">${errors.cFirstName}</p>
					<label class="form-label"><font size="5">名稱:</font></label> <input
						type="text" class="form-control" name="cLastName"
						value="${oneCustomer.getcLastName()}">
					<p style="color: red;">${errors.cLastName}</p>
					<label class="form-label"><font size="5">出生年月日:</font></label> <input
						type="date" class="form-control" name="cbDate" value="">
					<p style="color: red;">${errors.cbDate}</p>
					<label class="form-label"><font size="5">電子信箱:</font></label> <input
						type="text" class="form-control" name="cEmail"
						value="${oneCustomer.getcEmail()}">
					<p style="color: red;">${errors.cEmail}</p>
					<label class="form-label"><font size="5">個人圖片:</font></label> <input
						type="file" accept="image/*" name="cImg" id="imgInp"><img
						width="350" id="img" style="margin-left: 130px;margin-top: 10px"
						src="${contextRoot}/downloadImage/${oneCustomer.cId}" />
					<p style="color: red;">${errors.cImg}</p>

				</div>
				<a onclick="confirm('確認修改會員資料?');">
					<button type="submit" class="btn btn-lg btn btn-warning">修改</button>
				</a>
				<button class="btn btn-lg btn-secondary" id="cancel">取消</button>
			</form>
		</div>
	</div>

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
			window.history.back();//回上頁
		})

		var dateControl = document.querySelector('input[type="date"]');
		dateControl.value = '${oneCustomer.getcBirthdate()}'
	</script>

</body>
</html>