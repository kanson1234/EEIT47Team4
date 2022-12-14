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
							type="hidden" value="${shopHouseItem.id}" id="itid">
					</div>
					<div>你可能也會喜歡...</div>
					<c:forEach items="${category}" begin="1" end="3" var="x">
						<a
							href="${pageContext.request.contextPath}/ShopHouse/itemDetail/${x.id}"><img
							class="size"
							src="${pageContext.request.contextPath}/downloadImg/${x.id}"
							class="card-img-top" alt="..."></a>
					</c:forEach>
				</div>
			</div>
			<hr>

			<div class="card">
				<div class="card-header">留言板</div>
				<div class="card-body"></div>
				<c:forEach items="${shopHouseItem.message}" var="m">
					<div class="row justify-content-center">
						<div class="col-8">

		<div class="card">
								<div class="card-header">
									
									留言人 <span>${m.customerMsg.cFirstName}顧客</span> 
									留言時間 <span>${m.mdate}</span>
									<script>
										if(${m.mstate==true}){
											111
										}
										
									</script>
								</div>
								<div class="card-body">${m.mcontext}</div>
								<div></div>
							</div>
							


	
	

							
							

						</div>
					</div>
					<br />
				</c:forEach>

	
				<form
					action="${pageContext.request.contextPath}/ShopHouse/postMessages?SH_Item_Id=${shopHouseItem.id}"
					method="post">
					<input type="hidden" value="${customerLoginOk.cId}" id="CS_Id"
						name="CS_Id" />
						
					<input type="hidden" value="${shopHouseItem.c2Id}" id="newMrid"
						name="newMrid" /> 
					
					

						留言區:
					<textarea rows="3" cols="50" id="newMsg" name="newMsg"></textarea>
					<button type="submit" class="btn btn-primary">送出</button>
				</form>
			</div>
		</div>


		<div></div>
	</header>
	<footer> </footer>

	<!-- 	<script> -->
	<!-- // 		$(document).ready(function() { -->
	<!-- // 			// findAllByTime -->
	<!-- // 			$('#addToCar').click(function() { -->
	<!-- // 				alert('addToCar') -->

	<!-- // 				var num = document.getElementById('num').value; -->
	<!-- //  				alert(num) -->
	<!-- // 				var itid = document.getElementById('itid').value; -->
	<!-- // 				alert(itid) -->

	<!-- // 				$.ajax({ -->
	<!-- // 					url : 'http://localhost:8080/record/add', -->
	<!-- // 					contentType : 'application/json', // 送過去的資料型別 -->
	<!-- // 					dataType : 'json', // 回傳回來的資料型別 -->
	<!-- // 					method : 'get', -->
	<!-- // 					success : function(result) { -->
	<!-- // 						console.log(result) -->
	<!-- // 					}, -->
	<!-- // 					error : function(err) { -->
	<!-- // 						console.log(err) -->
	<!-- // 					} -->
	<!-- // 				}) -->
	<!-- // 			}) -->


	<!-- // 			// findAllByCidBtn -->
	<!-- // 		}) -->
	<!-- 	</script> -->

	<script>
		$(document)
				.ready(
						function() {
							// findAllByTime
							$('#addToCar')
									.click(
											function() {
												
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
															dataType : 'text', // 回傳回來的資料型別
															method : 'get',
															success : function(
																	result) {
																alert(result)
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

