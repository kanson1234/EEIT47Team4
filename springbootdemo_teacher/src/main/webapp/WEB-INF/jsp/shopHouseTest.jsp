<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="layout/navbar.jsp" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>

<html>
<script type="text/javascript">
	$(document).ready(function() {
		$('#imgInp').change(function() {
			console.log("aaaaa");
			var file = $('#imgInp')[0].files[0];
			var reader = new FileReader;
			reader.onload = function(e) {
				$('#img').attr('src', e.target.result);
			};
			reader.readAsDataURL(file);
		});
	});
</script>
<head>
<meta charset="UTF-8">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<title>新增商品頁面</title>
</head>
<body>
	<div class="container">
		<h1 align="center">新增頁面</h1>

		<div
			style="margin: 20px; padding: 20px; padding-left: 200px; padding-right: 200px; margin-left: auto; margin-right: auto; width: 60%; border: solid 1px; border-radius: 5px; border-color: rgb(163, 163, 163);">
			<form action="${pageContext.request.contextPath}/shopHouse/addItem" method="post" enctype="multipart/form-data">
				<h2 class="h3 mb-3 fw-normal">新增商品</h2>

				<div class="mb-3">

					<label class="form-label">名稱: <input type="text" id="itemName" name="itemName"></label> 
					<label class="form-label">圖片:<input type="file" name="file" accept="image/*" id="imgInp"><img width="100" id="img" src="" /></label>
					<label class="form-label">價錢:<input id="itemPrice" name="itemPrice"></label> 
					<label class="form-label">種類:<input id="classify" name="classify"></label> 
					<label class="form-label">上架:<input id="State" name="State"></label>
				    <label class="form-label"><input type="hidden" id="c2Id" name="c2Id" value="${c2Id}"></label></div>
					<button type="submit" class="btn btn-lg btn-primary">確認</button>
					<hr>
					<div class="text-center m-5">
					<div>商品一鍵帶入:</div>
                    <div align="left" style="float:left"><input type="button" class="btn btn-outline-info fastInput" value="商品1"></div>
					<div align="right" style="float:right"><input type="button" class="btn btn-outline-info fastInput2" value="商品2"></div>
					</div>
				
				</div>
			</form>

		</div>
	</div>
</body>

<script type="text/javascript">
//一鍵帶入
$(".fastInput").click(function(){
	$("#itemName").val("兩段式輕巧摺疊椅");
	$("#itemPrice").val(2800);
	$("#classify").val("椅子");
	$("#State").val(1);
});
$(".fastInput2").click(function(){
	$("#itemName").val("Coleman LAY躺椅-黑");
	$("#itemPrice").val(3700);
	$("#classify").val("椅子");
	$("#State").val(1);
});


</script>
</html>