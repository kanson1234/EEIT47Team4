<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的個人資料</title>

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
				action="${contextRoot}/updateCustomer?id=${oneCustomer.getCid()}"
				method="post" enctype="multipart/form-data">
				<h6 style="color: green">${msg}</h6>
				<h2>我的個人資料</h2>

				<div class="mb-3">

					<label class="form-label"></label> <input type="hidden"
						class="form-control" name="customerId"
						value="${oneCustomer.getCid()}">

					<div>帳號:</div>
					<div>${oneCustomer.getCaccount()}</div>

					<p style="color: red;">${errors.caccount}</p>
					<label class="form-label">密碼:</label> <input type="text"
						class="form-control" name="cPwd" value="${oneCustomer.getCpwd()}">
					<p style="color: red;">${errors.cpwd}</p>
					<label class="form-label">姓:</label> <input type="text"
						class="form-control" name="cFirstName"
						value="${oneCustomer.getCfirstName()}">
					<p style="color: red;">${errors.cfirstName}</p>
					<label class="form-label">名:</label> <input type="text"
						class="form-control" name="cLastName"
						value="${oneCustomer.getClastName()}">
					<p style="color: red;">${errors.clastName}</p>
					<label class="form-label">生日:</label> <input type="text"
						class="form-control" name="cbDate"
						value="${oneCustomer.getCbirthdate()}">
					<p style="color: red;">${errors.cbirthdate}</p>
					<label class="form-label">個人電子信箱:</label> <input type="text"
						class="form-control" name="cEmail"
						value="${oneCustomer.getCemail()}">
					<p style="color: red;">${errors.cbirthdate}</p>
					<label class="form-label">個人圖片:</label> <input type="file"
						accept="image/*" name="cImg" id="imgInp"><img width="350"
						id="img" src="${contextRoot}/downloadImage/${oneCustomer.cid}" />
					<p style="color: red;">${errors.cimg}</p>

				</div>
				<a onclick="confirm('確認修改會員資料?');alert('修改成功！');">
					<button type="submit" class="btn btn-lg btn-primary">修改</button>
				</a>
				<button class="btn btn-lg btn-secondary" id="cancel">取消</button>
				${errors.msg}
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
			window.location.replace("http://localhost:8080/logindex"); //返回特定頁面
		})
	</script>

</body>
</html>