<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="layout/navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>修改使用者資料</title>


<body>
	<main>
		<div class="container" align="center">
			<div
				style="margin: 20px; padding: 20px; padding-left: 200px; padding-right: 200px; margin-left: auto; margin-right: auto; width: 60%; border: solid 1px; border-radius: 5px; border-color: rgb(163, 163, 163);">
				<form
					action="${contextRoot}/Retailer/editRetailer?id=${Retailerinfo.rid}"
					method="post" enctype="multipart/form-data">
					<h2 class="h3 mb-3 fw-normal">修改使用者資料</h2>
					<div class="mb-3">
						<label class="form-label">商家名稱</label> <input type="text"
							class="form-control" placeholder="請輸入姓名" name="rName"
							value="${Retailerinfo.rName}" />
						<p style="color: red;">${errors.rName}</p>
						<label class="form-label">帳號</label> <input type="text"
							class="form-control" placeholder="請輸入帳號" name="rAccount"
							value="${Retailerinfo.raccount}" />
						<p style="color: red;">${errors.rAccount}</p>
						<p style="color: red;">${errors.used}</p>
						<label class="form-label">密碼</label> <input type="password"
							class="form-control" placeholder="請輸入密碼" name="rPwd"
							value="${Retailerinfo.rpwd}" />
						<p style="color: red;">${errors.rPwd}</p>
						<label class="form-label">電話</label> <input type="text"
							class="form-control" placeholder="請輸入電話" name="rPhone"
							value="${Retailerinfo.rphone}" />
						<p style="color: red;">${errors.rPhone}</p>
						<label class="form-label">商家描述</label> 
						<textarea name="rInfo" class="form-control" rows="5" cols="33" maxlength="500">${Retailerinfo.rinfo}</textarea>
						<p style="color: red;">${errors.rInfo}</p>
						<label class="form-label">Logo圖樣</label>
						<div>
						<img src="${contextRoot}/showlogo/${Retailerinfo.rid}" 
							class="card-img-top" alt="...">
						</div>
						<input type="file"
							accept="image/*" name="rLogo" id="imglogo" /> <img id="logo"
							width="350" src="" />
						<p style="color: red;">${errors.rLogo}</p>
						<label class="form-label">商家照片</label>
						<div>
						<img src="${contextRoot}/showphoto/${Retailerinfo.rid}" 
							class="card-img-top" alt="...">
						</div>
						<input type="file"
							accept="image/*" name="rPhoto" id="imgphoto" /><img id="photo"
							width="350" src="" />
						<p style="color: red;">${errors.rPhoto}</p>
					</div>
					<button type="submit" class="btn btn-lg btn-primary">送出</button>

					<div>
						<a href="${contextRoot}/Retailer/retailerInfoPage/${retailerLoginOk.rid}"> 回到資訊頁 </a>
					</div>
				</form>
			</div>
		</div>
	<script>
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
	</script>
	</main>

</body>
</html>