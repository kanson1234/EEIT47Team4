<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="layout/navbar.jsp" />
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
				<h5 style="color: green">${msg.success}</h5>
				<h2 class="h3 mb-3 fw-normal">會員註冊</h2>

				<div class="mb-3">
					<label class="form-label">姓</label> <input type="text"
						placeholder="請輸入姓氏" class="form-control" name="cFirstName" id="cFirstName">
					<p style="color: red;">${errors.cFirstName}</p>
					<label class="form-label">名</label> <input type="text"
						placeholder="請輸入名稱" class="form-control" name="cLastName" id="cLastName">
					<p style="color: red;">${errors.cLastName}</p>
					<label class="form-label">帳號</label> <input type="text"
						placeholder="請輸入帳號" class="form-control" name="cAccount"
						id="cAccount">
					<p style="color: red;">${errors.cAccount}</p>
					<p style="color: red;">${errors.used}</p>
					<label class="form-label">密碼</label> <input type="password"
						placeholder="輸入密碼" class="form-control" name="cPwd" id="cPwd">
					<p style="color: red;">${errors.cPwd}</p>
					<label class="form-label">生日</label> <input type="date"
						class="form-control" name="cbDate" value="" max="2001-12-31" id="cbDate">
					<p style="color: red;">${errors.cbDate}</p>
					<label class="form-label">電子信箱</label> <input type="text"
						placeholder="請輸入個人電子信箱" class="form-control" name="cEmail" id="cEmail">
					<p style="color: red;">${errors.cEmail}</p>

					<label class="form-label">個人圖片</label> <input type="file"
						accept="image/*" name="cImg" id="imgInp"><img width="350"
						id="img" src="" />
					<p style="color: red;">${errors.cImg}</p>

				</div>

				<button type="submit" class="btn btn-lg btn-primary" id="create">註冊</button>

				<div class="text-center m-5">
					一鍵註冊會員:
					<button type="button" class="btn btn-outline-info fastRegister">小美</button>
				</div>


			</form>
		</div>
	</div>
	<script>
		//快速註冊
		$(".fastRegister").click(function() {
			$("#cFirstName").val("王");
			$("#cLastName").val("美麗");
			$("#cAccount").val("beauty123");
			$("#cPwd").val("b123");
			$("#cbDate").val("1995-12-31");
			$("#cEmail").val("ansonliu0301@gmail.com");
			// 		$("#imglogo").attr("src","C:\Users\Student\Pictures\A.jpg");
			// 		$("#imgphoto").attr("src","C:\Users\Student\Pictures\A.jpg");
		});

		//檢測帳戶重複
		function checkAccount() {
			const account = document.getElementById("cAccount").value;
			console.log(account);
			$.ajax({
				url : "${contextRoot}/checkAccount/" + account.value,
				success : function(result) {
					if (result) {
						alert("帳號重複");
					}
				}

			});
		}

		$('#imgInp').change(function() {
			var file = $('#imgInp')[0].files[0];
			var reader = new FileReader;
			reader.onload = function(e) {
				$('#img').attr('src', e.target.result);
			};
			reader.readAsDataURL(file);
		});

		// 		$("#create").click(function() {
		// 				alert("註冊成功")
		// 		})
		
		
	</script>

</body>


</html>