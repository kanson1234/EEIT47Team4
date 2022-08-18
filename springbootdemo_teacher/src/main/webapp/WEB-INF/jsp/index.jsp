<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="layout/navbar.jsp" />


<!DOCTYPE html>
<html>
<head>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<h1>首頁</h1>
<ul>
<li><a href="${contextRoot}/ShopHouse/viewItems">所有商品</a></li>
<li><a href="${contextRoot}/shopHouse/add">新增商品</a></li>
<li><a href="${contextRoot}/ShopHouse/findItemById">查詢商品</a></li>
<li><a href="${contextRoot}/Retailer/RetailerCRUD">查詢商家</a></li>
</ul>

<h1>首頁</h1>



</body>
</html>