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
					<label class="form-label">商店名稱:</label><span style="font-size: 15px"
						id="checktext1"></span> <input type="text"
						class="form-control" placeholder="請輸入商店名稱" name="rName" id="rName" onchange="checkrName()" />
					<p style="color: red;">${errors.rName}</p>
					<label class="form-label">帳號:</label><span style="font-size: 15px"
						id="checktext2"></span><input type="text"
						class="form-control" placeholder="請輸入帳號" name="rAccount"
						id="rAccount" onchange="checkrAccount()" />
					<p style="color: red;">${errors.rAccount}</p>
					<p style="color: red;">${errors.used}</p>
					<label class="form-label">密碼:</label><span style="font-size: 15px"
						id="checktext3"></span><input type="password"
						class="form-control" placeholder="請輸入密碼" name="rPwd" id="rPwd" onchange="checkrPwd()"/>
					<p style="color: red;">${errors.rPwd}</p>
					<label class="form-label">電話:</label><span style="font-size: 15px"
						id="checktext4"></span><input type="text"
						class="form-control" placeholder="請輸入聯絡電話" name="rPhone"
						id="rPhone" onchange="checkrPhone()"/>
					<p style="color: red;">${errors.rPhone}</p>
					<label class="form-label">商家描述:</label><span style="font-size: 15px"
						id="checktext5"></span> <input type="text"
						class="form-control" placeholder="輸入商家描述" name="rInfo" id="rInfo" onchange="checkrInfo()"/>
					<p style="color: red;">${errors.rInfo}</p>
					<label class="form-label">商家Logo:</label><span style="font-size: 15px"
						id="checktext6"></span><input type="file"
						accept="image/*" name="rLogo" id="imglogo" onchange="checkrLogo()"/> <img id="logo"
						width="350" src="" />
					<p style="color: red;">${errors.rLogo}</p>
					<label class="form-label">商家照片:</label><span style="font-size: 15px"
						id="checktext7"></span><input type="file"
						accept="image/*" name="rPhoto" id="imgphoto" onchange="checkrPhoto()"/> <img id="photo"
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
		
		//前端驗證
		
			//商店名稱
		function checkrName() {
			var check = false;
			var rName = document.getElementById("rName").value;
			console.log("rName" + rName);
			if (rName == "") {
				$('#checktext1').html('請輸入商店名稱').css('color', 'red');
				check = false;
			} else {
				$('#checktext1').html('√').css('color', 'green');
				check = true;
			}
			return check;
		}

		//帳號
		function checkrAccount() {
			var check = false;
			var rAccount = document.getElementById("rAccount").value;
			console.log("rAccount" + rAccount);
			if (rAccount == "") {
				$('#checktext2').html('請輸入帳號').css('color', 'red');
				check = false;
			} else {
				$('#checktext2').html('√').css('color', 'green');
				check = true;
			}
			return check;
		}
		//密碼
		function checkrPwd() {
			var check = false;
			var rPwd = document.getElementById("rPwd").value;
			console.log("rPwd" + rPwd);
			if (rPwd == "") {
				$('#checktext3').html('請輸入密碼').css('color', 'red');
				check = false;
			} else {
				$('#checktext3').html('√').css('color', 'green');
				check = true;
			}
			return check;
		}
		//電話
		function checkrPhone() {
			var check = false;
			var rPhone = document.getElementById("rPhone").value;
			console.log("rPhone" + rPhone);
			if (rPhone == "") {
				$('#checktext4').html('請輸入電話').css('color', 'red');
				check = false;
			} else {
				$('#checktext4').html('√').css('color', 'green');
				check = true;
			}
			return check;
		}
		//商家描述
		function checkrInfo() {
			var check = false;
			var rInfo = document.getElementById("rInfo").value;
			console.log("rInfo" + rInfo);
			if (rInfo == "") {
				$('#checktext5').html('請輸入商家描述').css('color', 'red');
				check = false;
			} else {
				$('#checktext5').html('√').css('color', 'green');
				check = true;
			}
			return check;
		}
		//商家logo
		function checkrLogo() {
			var check = false;
			var imglogo = document.getElementById("imglogo").value;
			console.log("imglogo" + imglogo);
			if (imglogo == "") {
				$('#checktext6').html('請輸入商家logo').css('color', 'red');
				check = false;
			} else {
				$('#checktext6').html('√').css('color', 'green');
				check = true;
			}
			return check;
		}
		//商家照片
		function checkrPhoto() {
			var check = false;
			var imgphoto = document.getElementById("imgphoto").value;
			console.log("imgphoto" + imgphoto);
			if (imgphoto == "") {
				$('#checktext7').html('請選擇商家照片').css('color', 'red');
				check = false;
			} else {
				$('#checktext7').html('√').css('color', 'green');
				check = true;
			}
			return check;
		}
		
	</script>

</body>
</html>