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
<style type="text/css">
.wrap { /*父元素*/
	width: 100%;
	height: 400px;
	display: flex;
	justify-content: space-between;
}

.left {
	width: 50%;
	height: 200px;
}

.middle {
	width: 25%;
	height: 200px;
}

.right {
	width: 25%;
	height: 200px;
}
</style>
</head>
<body>
	<header>
		<%-- 	<div>${shopHouseItem.itemName}</div>  --%>
		<!-- 	<div><img width="250" -->
		<%-- 			src="${pageContext.request.contextPath}/downloadImg/${shopHouseItem.id}"></div> --%>
		<%-- 		<div>${shopHouseItem.price}</div>  --%>
		<%-- 		<div>${shopHouseItem.classify}</div>  --%>
		<%-- 		<div> ${shopHouseItem.c2Id}</div>  --%>

		<div class="container" align="center">
			<div class="wrap">

				<div class="left" style="width: 18rem;">
					<img
						src="${pageContext.request.contextPath}/downloadImg/${shopHouseItem.id}"
						class="card-img-top" alt="...">

				</div>
				
				<div class="middle"><a href=""><button type="button">${shopHouseItem.classify }</button></a></div>
				
				<div class="right">
					<p class="card-text">商品名稱:${shopHouseItem.itemName}</p>

					<p class="card-text">價錢:${shopHouseItem.price}</p>
					<div>
						<a href=""><button type="submit">加入購物車</button></a>
					</div>
					<div>
						<input type="number" value="1">
					</div>

				</div>


			</div>
		</div>


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
			<div class="card-header">留言板</div>
			<div class="card-body">

				<form
					action="${pageContext.request.contextPath}/ShopHouse/postMessages?SH_Item_Id=${shopHouseItem.id}"
					method="post">

					留言區:
					<textarea rows="3" cols="50" id="newMsg" name="newMsg"></textarea>


					<button type="submit" class="btn btn-primary">送出</button>
				</form>
			</div>
		</div>

		<div></div>
	</header>
	<footer> </footer>
</body>
</html>