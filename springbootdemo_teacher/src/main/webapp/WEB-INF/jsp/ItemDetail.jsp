<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="layout/navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		${shopHouseItem.itemName} <img width="150"
			src="${pageContext.request.contextPath}/downloadImg/${shopHouseItem.id}">
		${shopHouseItem.price} ${shopHouseItem.classify} ${shopHouseItem.c2Id}


			<c:forEach items="${shopHouseItem.message}" var="m">
				<div class="row justify-content-center">
					<div class="col-8">
						<div class="card">
							<div class="card-header">
								留言時間 <span>${m.mdate}</span>
							</div>

							<div class="card-body">${m.mcontext}</div>

							<div></div>
						</div>
					</div>
				</div>
				<br />
			</c:forEach>

		
		<div class="card">
			<div class="card-header">新增留言區</div>
			<div class="card-body">

				<form action="${pageContext.request.contextPath}/ShopHouse/postMessages?SH_Item_Id=${shopHouseItem.id}" method="post">
 					 
 					 留言區:<textarea rows="3" cols="50" id="newMsg" name="newMsg"></textarea>


					<button type="submit" class="btn btn-primary">送出</button>
 				</form>
			</div>
		</div>

		<div>
		</div>
	</header>
	<footer> </footer>
</body>
</html>