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
.wrap {
	width: 100%;
	height: 400px;
	display: flex;
	justify-content: space-between;
}

.left {
	width: 45%;
	height: 200px;
}

.right {
	width: 55%;
	height: 200px;
}

.size {
	width: 20%;
}

.mainSize {
	width: 150%;
}
</style>
</head>

<body>
	<header>
		<%-- <div>${shopHouseItem.itemName}</div> --%>
		<!-- 	<div><img width="250" -->
		<%-- src="${pageContext.request.contextPath}/downloadImg/${shopHouseItem.id}">
								</div> --%>
		<%-- <div>${shopHouseItem.price}</div> --%>
		<%-- <div>${shopHouseItem.classify}</div> --%>
		<%-- <div> ${shopHouseItem.c2Id}</div> --%>

		<div class="container" align="center">
			<div class="wrap">
				<div class="left" style="width: 18rem;">
					<img class="mainSize"
						src="${pageContext.request.contextPath}/downloadImg/${shopHouseItem.id}"
						class="card-img-top" alt="...">

				</div>


				<div class="right">
					<a
						href="${pageContext.request.contextPath}/retailerGetAllItem?id=${shopHouseItem.c2Id}">
						<button type="button" class="badge badge-warning">${shopHouseItem.getRetailerBean().rName}
						</button>
					</a>

					<p class="card-text">商品名稱:${shopHouseItem.itemName}</p>

					<<<<<<< HEAD
					<p class="card-text">價錢:${shopHouseItem.price}</p>
					<a
						href="${pageContext.request.contextPath}/ShopHouse/findByClassifyLabel?classify=${shopHouseItem.classify}">
						<button type="button" class="badge badge-secondary">${shopHouseItem.classify}</button>
					</a>
					<div>
						<a href=""><button type="submit" id="addToCar">加入購物車</button></a>
					</div>
					<div>
						<input type="number" value="1" id="num"> <input
							type="text" value="${shopHouseItem.id}" id="itid">
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
			


<<<<<<< HEAD
		<!--
														action="${pageContext.request.contextPath}/ShopHouse/postMessages?SH_Item_Id=${shopHouseItem.id}"
														method="post"> -->

		留言區:
		<textarea rows="3" cols="50" id="newMsg" name="newMsg"></textarea>


		<button type="submit" class="btn btn-primary">送出</button>
		</form>
		</div>
		</div>
=======

				<form action="${pageContext.request.contextPath}/ShopHouse/postMessages?SH_Item_Id=${shopHouseItem.id}"
														method="post"> 
					
					留言區:
					<textarea rows="3" cols="50" id="newMsg" name="newMsg"></textarea>
					<button type="submit" class="btn btn-primary">送出</button>
				</form>
			</div>
		</div>

>>>>>>> 65d27b922ef93dc25e6f6d32c7550b603398cfd4

		<div></div>
	</header>
	<footer> </footer>





	<script>
		$(document)
				.ready(
						function() {
							// findAllByTime
							$('#addToCar')
									.click(
											function() {
												alert('成功加入購物車')
												var num = document
														.getElementById('num').value;
												// 										alert(num)
												var itid = document
														.getElementById('itid').value;
												// 										alert(itid)
												// var dtoObj = {
												// 	"num": num,
												// 	"itid":itid
												// };
												// console.log(dtoObj)
												// var dtoJson = JSON.stringify(dtoObj);
												// console.log(dtoJson)
												$
														.ajax({
															url : 'http://localhost:8080/ShoppingCar/add?num='
																	+ num
																	+ "&itid="
																	+ itid,
															contentType : 'application/json', // 送過去的資料型別
															dataType : 'json', // 回傳回來的資料型別
															method : 'get',
															success : function(
																	result) {
																console
																		.log(result)
															},
															error : function(
																	err) {
																console
																		.log(err)
															}
														})
											})

							// findAllByCidBtn
						})
	</script>







</body>

</html>