<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<jsp:include page="layout/navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:forEach items="${tent}" var="i">
		<tr>
			<td>${i.itemName}</td>
			<td><a
				href="${pageContext.request.contextPath}/ShopHouse/itemDetail/${i.id}"><img
					width="150"
					src="${pageContext.request.contextPath}/downloadImg/${i.id}"></a></td>
			<td>${i.price}</td>
			<td>${i.classify}</td>
			<td>${i.c2Id}</td>
			
		</tr>
	</c:forEach>

</body>
</html>