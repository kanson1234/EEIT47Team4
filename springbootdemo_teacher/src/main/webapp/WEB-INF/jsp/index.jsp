<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
</head>
<body>
<h1>首頁</h1>
<ul>
<li><a href="${contextRoot}/shopHouse/Allitem">所有商品</a></li>
<li><a href="${contextRoot}/shopHouse/add">新增商品</a></li>
<li><a href="${contextRoot}/ShopHouse/findItemById">查詢商品</a></li>
</ul>


</body>
</html>