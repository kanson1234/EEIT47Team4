<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="layout/navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登入頁面</title>


<!-- bootstrap 5.1.3 JS -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>


</head>
<body>
	<div class="container">
		<div
			style="margin: 20px; padding: 20px; padding-left: 200px; padding-right: 200px; margin-left: auto; margin-right: auto; width: 60%; border: solid 1px; border-radius: 5px; border-color: rgb(163, 163, 163);">

			<form action="checkadminlogin" method="post"
				style="margin: auto; width: 220px">
				<h2 class="h3 mb-3 fw-normal">管理者登入</h2>
				
				<label class="form-label">管理者帳號</label> <input type="text" class="form-control"  placeholder="輸入帳號"
					name="adAccount" id="floatingInput" />
				<p style="color: red;">${errors.account}</p>
				
				<label class="form-label">管理者密碼</label> <input type="password" class="form-control"  placeholder="輸入密碼"
					name="adPwd" id="floatingPassword" />
				<p style="color: red;">${errors.pwd}</p>

				<button type="submit" class="btn btn-lg btn-primary">登入</button>
				<button class="btn btn-lg btn-secondary" id="cancel">取消</button>
				<p style="color: red;">${errors.msg}</p>

				<div class="text-center m-5">
					快速登入:
					<button class="btn btn-outline-info fastLogin">Admin</button>
				</div>

			</form>
		</div>
	</div>

</body>

<script type="text/javascript">
	//快速登入
	$(".fastLogin").click(function() {
		$("#floatingInput").val("a123");
		$("#floatingPassword").val("a4560");
	});
	
	//取消按鈕返回上頁
	$("#cancel").click(function(event) {
		event.preventDefault(); //取消預設行為
		window.location.replace("http://localhost:8080/logindex"); //返回特定頁面
	})
</script>

</html>