<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="layout/navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">




</script>

<style type="text/css">
#div1, #div2, #div3 {
	display: inline-block;
}
</style>


</head>
<body>
	<div class="container" align="center">
		<div class="row">
			<a
				href="${pageContext.request.contextPath}/ShopHouse/findByKeywordOrderByPrice?word=${word}"><button
					type="submit" class="badge badge-light" id="desc">最高價</button></a> <a
				href="${pageContext.request.contextPath}/ShopHouse/findByKeywordOrderByPriceASC?word=${word}"><button
					type="submit" class="badge badge-light" id="asc">最低價</button></a>
		</div>
	</div>


<div class="container">
		<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">
			<c:forEach items="${lowerPrice}" var="i">
				<div class="col">
					<div class="card" style="width: 14rem; height: 380px;">
						<a
							href="${pageContext.request.contextPath}/ShopHouse/itemDetail/${i.id}">
							<img height="180"
							src="${pageContext.request.contextPath}/downloadImg/${i.id}"
							class="card-img-top" alt="...">
						</a>

						<div class="card-body">
							<p class="card-text">${i.itemName}</p>
							<p class="card-text" style="color: red;">${i.price}</p>
						</div>
						<div align="center">
							<button type="submit" class="addToCar">加入購物車</button>
							<input type="hidden" value="1" class="num"> <input
							type="hidden" value="${i.id}" class="itid">
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<div class="container">
		<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">
			<c:forEach items="${higherPrice}" var="i">
				<div class="col">
					<div class="card" style="width: 14rem; height: 380px;">
						<a
							href="${pageContext.request.contextPath}/ShopHouse/itemDetail/${i.id}">
							<img height="180"
							src="${pageContext.request.contextPath}/downloadImg/${i.id}"
							class="card-img-top" alt="...">
						</a>

						<div class="card-body">
							<p class="card-text">${i.itemName}</p>
							<p class="card-text" style="color: red;">${i.price}</p>
						</div>
						<div align="center">
							<button type="submit" class="addToCar">加入購物車</button>
							<input type="hidden" value="1" class="num"> <input
							type="hidden" value="${i.id}" class="itid">
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

<!-- 	<div class="album py-5 bg-light">  row-cols-1 row-cols-sm-2 row-cols-md-3 g-3-->
	<div class="container">
		<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3" >
				<c:forEach items="${keyword}" var="i">
					<div class="col">
						<div class="card" style="width: 14rem; height: 380px;">
							<a
								href="${pageContext.request.contextPath}/ShopHouse/itemDetail/${i.id}">
								<img height="180"
								src="${pageContext.request.contextPath}/downloadImg/${i.id}"
								class="card-img-top" alt="...">
							</a>

							<div class="card-body">
								<p class="card-text">${i.itemName}</p>
								<p class="card-text" style="color:red;">${i.price}</p>
							</div>
							<div align="center">
								<button type="submit" class="addToCar">加入購物車</button>
							<input type="hidden" value="1" class="num"> <input
							type="hidden" value="${i.id}" class="itid">
							</div>

						</div>
					</div>
				</c:forEach>
			
		</div>
	</div>
<script>
		$(document)
				.ready(
						function() {
							// findAllByTime
							$('.addToCar')
									.click(
											function(e) {
												var num = $(e.target).parent().find('.num').val();
												var itid = $(e.target).parent().find('.itid').val();

												var dtoObj = {
													"num" : num,
													"itid" : itid
												};

												console.log(dtoObj)
												var dtoJson = JSON
														.stringify(dtoObj);
												console.log(dtoJson)
												$
														.ajax({
															url : 'http://localhost:8080/ShoppingCar/add?num='
																	+ num
																	+ "&itid="
																	+ itid,
															contentType : 'application/json', // 送過去的資料型別
															dataType : "text", // 回傳回來的資料型別
															method : 'get',
															success : function(
																	result) {
																alert(result)
															},
															error : function(
																	err) {
																alert("請登入")
																window.location.href = "http://localhost:8080/loginC"
															}
														})
											})
						})
	</script>
</body>
</html>

