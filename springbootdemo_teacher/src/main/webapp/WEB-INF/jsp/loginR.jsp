<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="layout/navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商家登入</title>


<!-- bootstrap 5.1.3 JS -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>


</head>
<body>
	<div class="container">
		<div
			style="margin: 20px; padding: 20px; padding-left: 100px; padding-right: 100px; margin-left: auto; margin-right: auto; width: 60%; border: solid 1px; border-radius: 5px; border-color: rgb(163, 163, 163);">
			<!-- 頁籤 -->
			<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
				<li class="nav-item" role="presentation"><a
					href="${contextRoot}/loginC"><button class="nav-link"
							id="pills-home-tab" data-bs-toggle="pill"
							data-bs-target="#pills-home" type="button" role="tab"
							aria-controls="pills-home" aria-selected="true">會員登入</button></a></li>
				<li class="nav-item" role="presentation"><a
					href="${contextRoot}/loginR"><button class="nav-link"
							id="pills-profile-tab" data-bs-toggle="pill"
							data-bs-target="#pills-profile" type="button" role="tab"
							aria-controls="pills-profile" aria-selected="false">商家登入</button></a>
				</li>
				<li class="nav-item" role="presentation"><a
					href="${contextRoot}/loginA"><button class="nav-link"
							id="pills-contact-tab" data-bs-toggle="pill"
							data-bs-target="#pills-contact" type="button" role="tab"
							aria-controls="pills-contact" aria-selected="false">管理者登入</button></a>
				</li>
			</ul>

			<form action="checkretailerlogin" method="post"
				style="margin: auto; width: 220px">
				<h2 class="h3 mb-3 fw-normal">商家登入</h2>
				<label class="form-label">商家帳號</label> <input type="text"
					class="form-control" placeholder="輸入帳號" name="rAccount"
					id="floatingInputR" />
				<p style="color: red;">${errors.caccount}</p>
				<label class="form-label">商家密碼</label> <input type="password"
					class="form-control" placeholder="輸入密碼" name="rPwd"
					id="floatingPasswordR" />
				<p style="color: red;">${errors.cpwd}</p>

				<button type="submit" class="btn btn-lg btn-primary">登入</button>
				<button class="btn btn-lg btn-secondary" id="cancel">取消</button>
				<p style="color: red;">${errors.rmsg}</p>

				<br> <a href="${contextRoot}/registerR">
					<button type="button"
						class="btn btn-outline-warning btn-lg btn-block">自己做頭家</button>
				</a> <br>

				<div class="text-center m-5">
					快速登入:
					<button class="btn btn-outline-dark fastLogin">你好商店</button>
				</div>

			</form>
		</div>
	</div>

</body>

<script type="text/javascript">
	var triggerTabList = [].slice.call(document.querySelectorAll('#myTab a'))
	triggerTabList.forEach(function(triggerEl) {
		var tabTrigger = new bootstrap.Tab(triggerEl)

		triggerEl.addEventListener('click', function(event) {
			event.preventDefault()
			tabTrigger.show()
		})
	})
	//快速登入
	$(".fastLogin").click(function() {
		$("#floatingInputR").val("2575");
		$("#floatingPasswordR").val("45366");
	});

	//取消按鈕返回上頁
	$("#cancel").click(function(event) {
		event.preventDefault(); //取消預設行為
		window.location.replace("http://localhost:8080/"); //返回特定頁面
	})
</script>

</html>