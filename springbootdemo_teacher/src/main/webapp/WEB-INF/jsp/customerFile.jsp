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

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
</head>
<body>
<body>
	<div class="container">
		<div
			style="margin: 20px; padding: 20px; padding-left: 200px; padding-right: 200px; margin-left: auto; margin-right: auto; width: 60%; border: solid 1px; border-radius: 5px; border-color: rgb(163, 163, 163);">


			<p style="color: red;">${msg.success}</p>
			<div class="text-center">
				<h2>我的個人資料</h2>
			</div>
			<div class="mb-3">

				<label class="form-label"></label> <input type="hidden"
					class="form-control" name="customerId"
					value="${oneCustomer.getcId()}"> <label class="form-label"></label>
				<img width="350" id="img"
					src="${contextRoot}/downloadImage/${oneCustomer.cId}" /> <br>

				<label class="form-label"><font size="4">帳號:</font></label> <input
					type="text" class="form-control" name="cAccount"
					readonly="readonly" value="${oneCustomer.getcAccount()}"> <label
					class="form-label"><font size="4">密碼:</font></label> <input
					type="password" class="form-control" name="cPwd"
					readonly="readonly" value="${oneCustomer.getcPwd()}"> <label
					class="form-label"><font size="4">姓:</font></label> <input
					type="text" class="form-control" name="cFirstName"
					readonly="readonly" value="${oneCustomer.getcFirstName()}">
				<label class="form-label"><font size="4">名:</font></label> <input
					type="text" class="form-control" name="cLastName"
					readonly="readonly" value="${oneCustomer.getcLastName()}">
				<label class="form-label">生日</label> <input type="date"
					class="form-control" name="cbDate" value="" id="cDate"
					readonly="readonly"> <label class="form-label"><font
					size="4">個人電子信箱:</font></label> <input type="text" class="form-control"
					name="cEmail" readonly="readonly"
					value="${oneCustomer.getcEmail()}">

			</div>
			<a href="${contextRoot}/customer/editOne">
				<button type="button" class="btn btn-lg btn-primary">編輯個人資料</button>
			</a>
			<button class="btn btn-lg btn-secondary" id="cancel">取消</button>


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