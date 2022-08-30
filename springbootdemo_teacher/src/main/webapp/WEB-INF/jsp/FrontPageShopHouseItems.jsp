<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="layout/navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>商品頁面</title>


<style type="text/css">
#div1, #div2, #div3 {
	display: inline-block;
}
</style>

</head>
<body>
	<div align="center">

		<!-- 		<div id="div1"> -->
		<!-- 			<form name="classifySearch" -->
		<%-- 				action="${pageContext.request.contextPath}/ShopHouse/findByClassify" --%>
		<!-- 				method="get"> -->
		<!-- 				<select name="classify"> -->
		<!-- 					<option value="烤肉架">烤肉架</option> -->
		<!-- 					<option value="鞋子">鞋子</option> -->
		<!-- 					<option value="帳篷">帳篷</option> -->
		<!-- 					<option value="椅子">椅子</option> -->
		<!-- 					<option value="燈具">燈具</option> -->
		<!-- 					<option value="餐具">餐具</option> -->
		<!-- 				</select> <input type="submit" value="搜尋"> -->
		<!-- 			</form> -->
		<!-- 		</div> -->
		<div>
			<div id="div1">
				<div class="dropdown text-end">

					<ul class="navbar-nav mr-auto">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-toggle="dropdown" aria-expanded="false">種類</a>
							<div class="dropdown-menu">
								<a class="dropdown-item"
									href="${contextRoot}/ShopHouse/findByClassify?classify=帳篷">帳篷</a>
								<a class="dropdown-item"
									href="${contextRoot}/ShopHouse/findByClassify?classify=鞋子">鞋子</a>
								<a class="dropdown-item"
									href="${contextRoot}/ShopHouse/findByClassify?classify=烤肉架">烤肉架</a>
								<a class="dropdown-item"
									href="${contextRoot}/ShopHouse/findByClassify?classify=椅子">椅子</a>
							</div></li>
					</ul>
				</div>

				<div id="div2">
					<form name="classifySearch"
						action="${pageContext.request.contextPath}/ShopHouse/lowerPrice"
						method="get">
						<button type="submit" class="badge badge-light">最低價</button>
					</form>
				</div>
				<div id="div3">
					<form name="classifySearch"
						action="${pageContext.request.contextPath}/ShopHouse/highPrice"
						method="get">
						<button type="submit" class="badge badge-light">最高價</button>
					</form>
				</div>
			</div>
		</div>


		<div class="container">
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-4">
				<c:forEach items="${lowerPrice}" var="i">
					<div class="col">
						<div class="card" style="width: 14rem; height: 380px;">
							<a
								href="${pageContext.request.contextPath}/ShopHouse/itemDetail/${i.id}"><img
								height="180"
								src="${pageContext.request.contextPath}/downloadImg/${i.id}"
								class="card-img-top" alt="..."></a>

							<div class="card-body">
								<p class="card-text">${i.itemName}</p>
								<p class="card-text" style="color: red;">${i.price}</p>
							</div>
							<div>
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
								href="${pageContext.request.contextPath}/ShopHouse/itemDetail/${i.id}"><img
								height="180"
								src="${pageContext.request.contextPath}/downloadImg/${i.id}"
								class="card-img-top" alt="..."></a>

							<div class="card-body">
								<p class="card-text">${i.itemName}</p>
								<p class="card-text" style="color: red;">${i.price}</p>
							</div>
							<div>
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
				<c:forEach items="${category}" var="i">
					<div class="col">
						<div class="card" style="width: 14rem; height: 380px;">
							<a
								href="${pageContext.request.contextPath}/ShopHouse/itemDetail/${i.id}"><img
								height="180"
								src="${pageContext.request.contextPath}/downloadImg/${i.id}"
								class="card-img-top" alt="..."></a>
							<div class="card-body">
								<p class="card-text">${i.itemName}</p>
								<p class="card-text" style="color: red;">${i.price}</p>
							</div>
							<div>
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
				<c:forEach items="${pages.content}" var="i">
					<div class="col">
						<div class="card" style="width: 14rem; height: 380px;">
							<a
								href="${pageContext.request.contextPath}/ShopHouse/itemDetail/${i.id}"><img
								height="180"
								src="${pageContext.request.contextPath}/downloadImg/${i.id}"
								class="card-img-top" alt="..."></a>




							<div class="card-body">
								<p class="card-text">${i.itemName}</p>
								<p class="card-text" style="color: red;">${i.price}</p>
							</div>
							<div>
								<button type="submit" class="addToCar">加入購物車</button>
							<input type="hidden" value="1" class="num"> <input
							type="hidden" value="${i.id}" class="itid">
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div>
				<c:forEach var="pagesNumber" begin="1" end="${pages.totalPages}">

					<c:choose>

						<c:when test="${pages.number != pagesNumber -1}">
							<a
								href="${pageContext.request.contextPath}/ShopHouse/FrontPageShopHouseItems?p=${pagesNumber}">
								${pagesNumber} </a>

						</c:when>
						<c:otherwise>
				       ${pagesNumber}
			</c:otherwise>

					</c:choose>

				</c:forEach>
			</div>
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