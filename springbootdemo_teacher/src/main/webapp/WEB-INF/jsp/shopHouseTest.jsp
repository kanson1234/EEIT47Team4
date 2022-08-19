<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<jsp:include page="layout/navbar.jsp" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}" /> 


<!DOCTYPE html>

<html>
<script type="text/javascript">
	$(document).ready(function(){
		$('#imgInp').change(function(){
			console.log("aaaaa");
			var file = $('#imgInp')[0].files[0];
			var reader = new FileReader;
			reader.onload = function(e){
				$('#img').attr('src',e.target.result);
			};
			reader.readAsDataURL(file);
		});
	});

</script>
<head>
<meta charset="UTF-8">

<title>新增</title>
</head>
<body>
<div class="container">
<h1>新增頁面</h1>

<form action="${pageContext.request.contextPath}/shopHouse/addItem" method="post" enctype="multipart/form-data">

名稱: <input type="text" id="itemName" name="itemName">
<br/>
圖片:<input type="file" name="file" accept="image/*" id="imgInp"><img width="100" id="img" src=""/>
<!-- <th scope="col">圖片<input type="file" name="file" accept="image/*" id="imgInp"><img width="100" id="img" src=""/></th> -->
<br/>
價錢:<input  id="itemPrice" name="itemPrice">
<br/>
種類:<input id="classify" name="classify">
<br/>
狀態:<input  id="State" name="State">
<br/>
店家:<input  id="c2Id" name="c2Id">
<br/>
<input type="submit" value="送出" />

</form>

</div>

</body>


</html>