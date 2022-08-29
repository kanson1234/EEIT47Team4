<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="layout/navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>修改頁面</title>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<div
			style="margin: 20px; padding: 20px; padding-left: 200px; padding-right: 200px; margin-left: auto; margin-right: auto; width: 60%; border: solid 1px; border-radius: 5px; border-color: rgb(163, 163, 163);">
			<form
				action="${pageContext.request.contextPath}/ShopHouse/editItem?id=${shopHouseItem.id}"
				method="post" enctype="multipart/form-data">
				<h2 class="h3 mb-3 fw-normal">商品修改</h2>

				<div class="mb-3">



					<label class="form-label">產品名稱<input name="itemName"
						class="form-control" value="${shopHouseItem.itemName}"></label> <label
						class="form-label">圖片<input type="file"
						class="form-control" name="file" accept="image/*" id="imgInp"><img
						width="100" id="img" src="" /></label>
					<!-- 					<label class="form-label">圖片:</label><input type="file" accept="image/*" name="file" id="imgInp"><img width="200" id="img" src=""/> -->
					<label class="form-label">價錢<input name="itemPrice"
						class="form-control" value="${shopHouseItem.price}"></label> <label
						class="form-label">種類<input name="classify"
						class="form-control" value="${shopHouseItem.classify}"></label> <label
						class="form-label"><input id="state" type="hidden"
						class="form-control" name="state" value="${shopHouseItem.status}"></label>
					<label class="form-label"><input type="hidden" name="c2Id"
						class="form-control" value="${shopHouseItem.c2Id}"></label>
					<!-- 					<th scope="col"><input  type="hidden" name="id"></th> -->

					<button type="submit" class="btn btn-lg btn-primary">修改</button>


				</div>
			</form>
		</div>
	</div>
</body>

<script type="text/javascript">
	$('#imgInp').change(function() {
		var file = $('#imgInp')[0].files[0];
		var reader = new FileReader;
		reader.onload = function(e) {
			$('#img').attr('src', e.target.result);
		};
		reader.readAsDataURL(file);
	});
</script>

</html>