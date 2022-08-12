<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<meta charset="UTF-8">
<title>register Page</title>
</head>
<body>
	<div class="container">

		<form action="${contextRoot}/Retailer/registerPage"
			method="post" enctype="multipart/form-data">

			First Name : <input type="text" id="rFirstName" name="rFirstName"> <br />
			Last Name :<input type="text" id="rLastName" name="rLastName"> <br /> 
			Account:<input type="text" id="rAccount" name="rAccount"> <br /> 
			Password:<input type="text" id="rPwd" name="rPwd"> <br /> 
			phone Number:<input type="text" id="rPhone" name="rPhone"> <br />
			information:<input type="text" id="rInfo" name="rInfo">
			Logo :<input type="file" name="logo"> <br /> 
			Photo:<input type="file" name="photo"> <br /> 
			<input type="submit" value="送出" />

		</form>
	<a href = "${contextRoot}/Retailer/RetailerCRUD">回到查詢頁</a>
	</div>

</body>
</html>