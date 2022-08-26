<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="layout/navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>零售商註冊</title>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<style>
body {
	padding: 0;
	margin: 0;
	min-height: 100vh;
	background: -webkit-linear-gradient(transparent, rgba(91, 192, 235, .3)),
		-webkit-linear-gradient(100deg, rgba(209, 172, 0, .8) 30%, #B0EAE8
		120%);
	background: linear-gradient(transparent, rgba(91, 192, 235, .3)),
		linear-gradient(350deg, rgba(209, 172, 0, .8) 10%, #004643 120%);
}

.box {
	background-color: #E6E4D6;
	margin: 20px;
	padding: 20px;
	padding-left: 200px;
	padding-right: 200px;
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




</head>
<body>
	<div class="container">
		<div class="box">
			<form action="${contextRoot}/Retailer/insert" method="post"
				enctype="multipart/form-data">
				<h5 style="color: green">${msg.success}</h5>
				<h2 class="h3 mb-3 fw-normal">零售商註冊</h2>

				<div class="mb-3">
					<label class="form-label">商店名稱</label> <input type="text"
						class="form-control" placeholder="請輸入商店名稱" name="rName" id="rName" />
					<p style="color: red;">${errors.rName}</p>
					<label class="form-label">帳號</label><input type="text"
						class="form-control" placeholder="請輸入帳號" name="rAccount"
						id="rAccount" />
					<p style="color: red;">${errors.rAccount}</p>
					<p style="color: red;">${errors.used}</p>
					<label class="form-label">密碼</label><input type="password"
						class="form-control" placeholder="請輸入密碼" name="rPwd" id="rPwd" />
					<p style="color: red;">${errors.rPwd}</p>
					<label class="form-label">電話</label><input type="text"
						class="form-control" placeholder="請輸入聯絡電話" name="rPhone"
						id="rPhone" />
					<p style="color: red;">${errors.rPhone}</p>
					<label class="form-label">商家描述</label> <input type="text"
						class="form-control" placeholder="輸入商家描述" name="rInfo" id="rInfo" />
					<p style="color: red;">${errors.rInfo}</p>
					<label class="form-label">Logo圖樣</label><input type="file"
						accept="image/*" name="rLogo" id="imglogo" /> <img id="logo"
						width="350" src="" />
					<p style="color: red;">${errors.rLogo}</p>
					<label class="form-label">商家照片</label><input type="file"
						accept="image/*" name="rPhoto" id="imgphoto" /> <img id="photo"
						width="350" src="" />
					<p style="color: red;">${errors.rPhoto}</p>
				</div>

				<button type="submit" class="btn btn-lg btn-primary">註冊</button>
				<button class="btn btn-lg btn-secondary" id="cancel">取消</button>

				<div class="text-center m-5">
					一鍵註冊:
					<button type="button" class="btn btn-outline-info fastRegister">傳品</button>
				</div>

			</form>
		</div>
	</div>
	<script>
		//快速註冊
		$(".fastRegister").click(function() {
			$("#rName").val("傳品登山用品");
			$("#rAccount").val("sss123");
			$("#rPwd").val("sss456");
			$("#rPhone").val("0930228768");
			$("#rInfo").val("做您舒適的登山體驗最堅實的後盾");
			// 		$("#imglogo").attr("src","C:\Users\Student\Pictures\A.jpg");
			// 		$("#imgphoto").attr("src","C:\Users\Student\Pictures\A.jpg");
		});

		$('#imglogo').change(function() {
			var file = $('#imglogo')[0].files[0];
			var reader = new FileReader;
			reader.onload = function(e) {
				$('#logo').attr('src', e.target.result);
			};
			reader.readAsDataURL(file);
		});

		$('#imgphoto').change(function() {
			var file = $('#imgphoto')[0].files[0];
			var reader = new FileReader;
			reader.onload = function(e) {
				$('#photo').attr('src', e.target.result);
			};
			reader.readAsDataURL(file);
		});

		//取消按鈕返回上頁
		$("#cancel").click(function(event) {
			event.preventDefault(); //取消預設行為
			window.location.replace("http://localhost:8080/"); //返回特定頁面
		})
	</script>

</body>
</html>