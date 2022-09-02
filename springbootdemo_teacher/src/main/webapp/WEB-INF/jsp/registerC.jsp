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

h2 {
	margin-left: 60px;
	display: inline-block;
	color: #333;
	font-weight: normal;
	text-transform: uppercase;
	font-size: 2rem;
	position: relative;
	z-index: 2;
	vertical-align: middle;
}

h2::before {
	content: '';
	position: absolute;
	width: 110%;
	/*  max-width: 13.8rem;*/
	height: 1rem;
	/*更改標題顏色*/
	background: #F7FE72;
	left: -5px;
	top: 50%;
	z-index: -1;
}
</style>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<body>
	<div class="container">
		<div class="box">
			<form action="${contextRoot}/customer/insert" method="post"
				enctype="multipart/form-data">
				<h5 style="color: #70AE3E">${msg.success}</h5>
				<h2>會員註冊</h2>

				<div class="mb-3">
					<label class="form-label">姓:</label><span style="font-size: 15px"
						id="checktext2"></span> <input type="text" placeholder="請輸入姓氏"
						class="form-control" name="cFirstName" id="cFirstName"
						onchange="checkcFirstName()">
					<p style="color: red;">${errors.cFirstName}</p>
					<label class="form-label">名:</label> <span style="font-size: 15px"
						id="checktext3"></span><input type="text" placeholder="請輸入名稱"
						class="form-control" name="cLastName" id="cLastName"
						onchange="checkcLastName()">
					<p style="color: red;">${errors.cLastName}</p>
					<label class="form-label">帳號:</label> <span style="font-size: 15px"
						id="show"></span><input type="text" placeholder="請輸入帳號"
						class="form-control" name="cAccount" id="cAccount"
						onchange="checkcAccount()">
					<p style="color: red;">${errors.cAccount}</p>
					<p style="color: red;">${errors.used}</p>
					<label class="form-label">密碼:<span style="font-size: 15px"
						id="checktext1"></span></label> <input type="password" placeholder="輸入密碼"
						class="form-control" name="cPwd" id="cPwd" onchange="checkPwd()">
					<p style="color: red;">${errors.cPwd}</p>
					<label class="form-label">生日:</label><span style="font-size: 15px"
						id="checktext4"></span> <input type="date" class="form-control"
						name="cbDate" value="" max="2001-12-31" id="cbDate"
						onchange="checkcbDate()">
					<p style="color: red;">${errors.cbDate}</p>
					<label class="form-label">電子信箱:</label><span
						style="font-size: 15px" id="checktext5"></span> <input type="text"
						placeholder="請輸入個人電子信箱" class="form-control" name="cEmail"
						id="cEmail" onchange="checkcEmail()">
					<p style="color: red;">${errors.cEmail}</p>

					<label class="form-label">個人圖片</label> <span
						style="font-size: 15px" id="checktext6"></span><input type="file"
						accept="image/*" name="cImg" id="imgInp" onchange="checkcImg()"><img
						width="350" id="img" src="" />
					<p style="color: red;">${errors.cImg}</p>

				</div>
				<div align="center">
					<button type="submit" class="btn btn-lg btn-primary" id="create">註冊</button>
					<button class="btn btn-lg btn-secondary" id="cancel">取消</button>
					<br> <br>
					<button type="button" class="btn btn-outline-info fastRegister">小敏</button>
				</div>






			</form>
		</div>
	</div>
	<script>
		//快速註冊
		$(".fastRegister").click(function() {
			$("#cFirstName").val("王");
			$("#cLastName").val("敏");
			$("#cAccount").val("beauty123");
			$("#cPwd").val("b123");
			$("#cbDate").val("1995-12-31");
			$("#cEmail").val("ansonliu0301@gmail.com");
			// 		$("#imglogo").attr("src","C:\Users\Student\Pictures\A.jpg");
			// 		$("#imgphoto").attr("src","C:\Users\Student\Pictures\A.jpg");
		});

		//檢測帳戶重複
		function checkcAccount() {
			const account = document.getElementById("cAccount").value;
			console.log(account);
			
			if(account==''){
				$("#show").html("帳號不得為空！").css('color', 'red');
			}
			
			$.ajax({
				url : "${contextRoot}/checkaccount/" + account,
				type : 'get',
				ContentType : 'application/json;charset=utf-8',
				dataType : 'json',
				success : function(result) {
					if (result) {
						$("#show").html("該帳號已存在！").css('color', 'red');
					} else {
						$("#show").html("帳號可使用√").css('color', 'green');
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

		//取消按鈕返回上頁
		$("#cancel").click(function(event) {
			event.preventDefault(); //取消預設行為
			window.location.replace("http://localhost:8080/"); //返回特定頁面
		})

		// 		$("#create").click(function() {
		// 				alert("註冊成功")
		// 		})

		//-------以下為前端提前驗證

		//帳號
// 				function checkcAccount() {
// 					var check = false;
// 					var cAccount = document.getElementById("cAccount").value;
// 					console.log("cAccount" + cAccount);
// 					if (cAccount == "") {
// 						$('#checktext0').html('請輸入帳號').css('color', 'red');
// 						check = false;
// 					} else {
// 						$('#checktext0').html('√').css('color', 'green');
// 						check = true;
// 					}
// 					return check;
// 				}

		//密碼
		function checkPwd() {
			var check = false;
			var cPwd = document.getElementById("cPwd").value;
			console.log("cPwd" + cPwd);
			if (cPwd == "") {
				$('#checktext1').html('請輸入密碼').css('color', 'red');
				check = false;
			} else {
				$('#checktext1').html('√').css('color', 'green');
				check = true;
			}
			return check;
		}
		//姓
		function checkcFirstName() {
			var check = false;
			var cFirstName = document.getElementById("cFirstName").value;
			console.log("cFirstName" + cFirstName);
			if (cFirstName == "") {
				$('#checktext2').html('請輸入姓氏').css('color', 'red');
				check = false;
			} else {
				$('#checktext2').html('√').css('color', 'green');
				check = true;
			}
			return check;
		}
		//名
		function checkcLastName() {
			var check = false;
			var cLastName = document.getElementById("cLastName").value;
			console.log("cLastName" + cLastName);
			if (cLastName == "") {
				$('#checktext3').html('請輸入名稱').css('color', 'red');
				check = false;
			} else {
				$('#checktext3').html('√').css('color', 'green');
				check = true;
			}
			return check;
		}
		//出生日期
		function checkcbDate() {
			var check = false;
			var cbDate = document.getElementById("cbDate").value;
			console.log("cbDate" + cbDate);
			if (cbDate == "") {
				$('#checktext4').html('請輸入出生日期').css('color', 'red');
				check = false;
			} else {
				$('#checktext4').html('√').css('color', 'green');
				check = true;
			}
			return check;
		}
		//電子信箱
		function checkcEmail() {
			var check = false;
			var cEmail = document.getElementById("cEmail").value;
			console.log("cEmail" + cEmail);
			if (cEmail == "") {
				$('#checktext5').html('請輸入電子郵件').css('color', 'red');
				check = false;
			} else {
				$('#checktext5').html('√').css('color', 'green');
				check = true;
			}
			return check;
		}
		//個人圖片
		function checkcImg() {
			var check = false;
			var cImg = document.getElementById("imgInp").value;
			console.log("cImg" + cImg);
			if (cImg == "") {
				$('#checktext6').html('請選擇個人圖片').css('color', 'red');
				check = false;
			} else {
				$('#checktext6').html('√').css('color', 'green');
				check = true;
			}
			return check;
		}
	</script>

</body>


</html>