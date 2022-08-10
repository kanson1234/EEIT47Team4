<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   

<c:set var="contextRoot" value="${pageContext.request.contextPath}" /> 


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>新增</title>
</head>
<body>
<div class="container">
<h1>新增頁面</h1>

<form action="${pageContext.request.contextPath}/shopHouse/addItem" method="post" enctype="multipart/form-data">

name : <input type="text" id="itemName" name="itemName">
<br/>
Photo:<input type="file" name="file">
<br/>
Price:<input  id="itemPrice" name="itemPrice">
<br/>
Classify:<input id="classify" name="classify">
<br/>
status:<input  id="State" name="State">
<br/>
c2Id:<input  id="c2Id" name="c2Id">
<br/>
<input type="submit" value="送出" />

</form>

</div>

</body>
</html>