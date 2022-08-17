<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<jsp:include page="layout/navbar.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header>
${shopHouseItem.itemName}
				<img width="150"
						src="${pageContext.request.contextPath}/downloadImg/${shopHouseItem.id}">
			${shopHouseItem.price}
					${shopHouseItem.classify}
					${shopHouseItem.c2Id}

</header>
<footer>



</footer>
</body>
</html>