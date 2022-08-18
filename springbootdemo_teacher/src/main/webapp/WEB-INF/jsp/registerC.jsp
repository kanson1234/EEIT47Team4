<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員註冊</title>

<!-- bootstrap 5.1.3 JS -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<body>
	<div class="container">
		<div
			style="margin: 20px; padding: 20px; padding-left: 200px; padding-right: 200px; margin-left: auto; margin-right: auto; width: 60%; border: solid 1px; border-radius: 5px; border-color: rgb(163, 163, 163);">
			<form action="${contextRoot}/customer/insert" method="post"
				enctype="multipart/form-data">
				<h2 class="h3 mb-3 fw-normal">會員註冊</h2>

				<div class="mb-3">
					<label class="form-label">姓</label> <input type="text"
						class="form-control" name="cFirstName">
					<p style="color: red;">${errors.cFirstName}</p>
					<label class="form-label">名</label> <input type="text"
						class="form-control" name="cLastName">
					<p style="color: red;">${errors.cLastName}</p>
					<label class="form-label">帳號</label> <input type="text"
						class="form-control" name="cAccount">
					<p style="color: red;">${errors.cAccount}</p>
					<label class="form-label">密碼</label> <input type="password"
						class="form-control" name="cPwd">
					<p style="color: red;">${errors.cPwd}</p>
					<label class="form-label">生日</label> <input type="date"
						class="form-control" name="cbDate" max="2001-12-31">
					<p style="color: red;">${errors.cbDate}</p>
					<label class="form-label">電子信箱</label> <input type="text"
						class="form-control" name="cEmail">
					<p style="color: red;">${errors.cEmail}</p>

					<label class="form-label">個人圖片</label> <input type="file"
						accept="image/*" name="cImg" id="imgInp"><img width="350"
						id="img" src="" />
					<p style="color: red;">${errors.cImg}</p>

				</div>

				<button type="submit" class="btn btn-lg btn-primary">註冊</button>
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
	</script>

</body>


</html>