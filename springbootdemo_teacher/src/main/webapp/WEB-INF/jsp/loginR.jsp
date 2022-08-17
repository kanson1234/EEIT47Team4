<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員登入</title>


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

			<form action="checkretailerlogin" method="post"
				style="margin: auto; width: 220px">
				<h2 class="h3 mb-3 fw-normal">商家登入</h2>
				<label class="form-label">商家帳號</label> <input type="text" class="form-control"
					name="rAccount" id="floatingInputR" />
				<p style="color: red;">${errors.caccount}</p>
				<label class="form-label">商家密碼</label> <input type="password" class="form-control"
					name="rPwd" id="floatingPasswordR"/>
				<p style="color: red;">${errors.cpwd}</p>

				<button type="submit" class="btn btn-lg btn-primary">登入</button>
				<button class="btn btn-lg btn-secondary" id="cancel">取消</button>
				<p style="color: red;">${errors.rmsg}</p>
				
				<div class="text-center m-5">
					快速登入:
					<button class="btn btn-outline-info fastLogin">你好商店</button>
				</div>

			</form>
		</div>
	</div>

</body>

<script type="text/javascript">
	//快速登入
	$(".fastLogin").click(function() {
		$("#floatingInputR").val("2575");
		$("#floatingPasswordR").val("45366");
	});
	
	//取消按鈕返回上頁
	$("#cancel").click(function(event) {
		event.preventDefault(); //取消預設行為
		window.location.replace("http://localhost:8080/logindex"); //返回特定頁面
	})
</script>

</html>