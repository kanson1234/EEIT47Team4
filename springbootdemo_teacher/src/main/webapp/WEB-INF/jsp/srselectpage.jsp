<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>


	<button>
		<a href="${contextRoot}/srselectpage">消費紀錄查詢頁面</a>
	</button>

	<button>
		<a href="${contextRoot}/srselectpageALL">查詢所有消費紀錄</a>
	</button>

	<button>
		<a href="${contextRoot}/ShoppingCar">購物車頁面</a>
	</button>
</body>
</html>