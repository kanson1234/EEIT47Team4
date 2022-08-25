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

<!-- bootstrap 5.1.3 JS -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

</head>
<body>
	<div class="container">
		<div
			style="margin: 20px; padding: 20px; padding-left: 200px; padding-right: 200px; margin-left: auto; margin-right: auto; width: 60%; border: solid 1px; border-radius: 5px; border-color: rgb(163, 163, 163);">


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
						<font size="4">帳號:</font>
					</div>
					<div>${oneCustomer.getcAccount()}</div>

					<label class="form-label"><font size="4">密碼:</font></label> <input
						type="text" class="form-control" name="cPwd"
						value="${oneCustomer.getcPwd()}">
					<p style="color: red;">${errors.cPwd}</p>
					<label class="form-label"><font size="4">姓:</font></label> <input
						type="text" class="form-control" name="cFirstName"
						value="${oneCustomer.getcFirstName()}">
					<p style="color: red;">${errors.cFirstName}</p>
					<label class="form-label"><font size="4">名:</font></label> <input
						type="text" class="form-control" name="cLastName"
						value="${oneCustomer.getcLastName()}">
					<p style="color: red;">${errors.cLastName}</p>
					<label class="form-label"><font size="4">生日:</font></label> <input
						type="date" class="form-control" name="cbDate" value="">
					<p style="color: red;">${errors.cbDate}</p>
					<label class="form-label"><font size="4">個人電子信箱:</font></label> <input
						type="text" class="form-control" name="cEmail"
						value="${oneCustomer.getcEmail()}">
					<p style="color: red;">${errors.cEmail}</p>
					<label class="form-label"><font size="4">個人圖片:</font></label> <input
						type="file" accept="image/*" name="cImg" id="imgInp"><img
						width="350" id="img"
						src="${contextRoot}/downloadImage/${oneCustomer.cId}" />
					<p style="color: red;">${errors.cImg}</p>

				</div>
				<a onclick="confirm('確認修改會員資料?');">
					<button type="submit" class="btn btn-lg btn-primary">修改</button>
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
			window.location.replace("http://localhost:8080/"); //返回特定頁面
		})

		var dateControl = document.querySelector('input[type="date"]');
		dateControl.value = '${oneCustomer.getcBirthdate()}'
	</script>

</body>
</html>