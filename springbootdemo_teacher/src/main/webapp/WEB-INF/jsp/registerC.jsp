<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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







<body>
<div class="container" >
	<div style="margin: 20px;padding: 20px;padding-left: 200px;padding-right: 200px; margin-left: auto;margin-right: auto; width: 60%; border: solid 1px;border-radius: 5px;border-color: rgb(163, 163, 163);">
	<form action="Customer/insert" method="post"
		enctype="multipart/form-data">
		<h2 class="h3 mb-3 fw-normal">會員註冊</h2>
		
		<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label">姓</label>
			<input type="text" class="form-control" name="cFirstName">
			<p style="color: red;">${errors.name}</p>
		  </div>

				
				
			
			
				名:
				<input type="text" name="cLastName" />
				${errors.name}
			
			
				帳號:
				<input type="text" name="cAccount" />
				${errors.name}
			密碼:
				<input type="password" name="cPwd" />
				${errors.pwd}
			
			
				生日:
				<input type="text" name="cbDate" />
				${errors.pwd}
			
			
				個人圖片:
				<input type="file" accept="image/*" name="cImg"  id="imgInp"/>
				<img width="350"  id="img" src=""/>
				${errors.pwd}
			
			
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