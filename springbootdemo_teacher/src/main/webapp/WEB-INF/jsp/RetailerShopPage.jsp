<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="layout/navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>RetailerShopPage</title>
<!-- <script type="text/javascript"> -->
<!-- 	window.onload = function() { -->
<!-- 		var btn = document.getElementById("clickmeS").value;  -->
<!-- 		 『Click Me(JavaScript)』按鈕的事件處理函數 $('#clickmeS').val() -->
<!-- 		btn.onclick = function() { -->
<!-- 			var xhr = new XMLHttpRequest(); -->
<!-- 			//字串+=接標籤 -->
<%-- 			var url = "<c:url value='/retailerGetAllItem/' />" + btn; --%>
<%-- 			console.log("${RetailerShowAllid}"); --%>
<!-- 			xhr.open("GET", url, true); -->
<!-- 			xhr.send(); -->
<!-- 			xhr.onreadystatechange = function() { -->
<!-- 				 if (xhr.readyState == 4 && xhr.status == 200) { -->
<!-- 					 var content="<div class='row'>";    -->
<!-- 					 var Items = JSON.parse(xhr.responseText); -->
<!-- 					 console.log("shop: " + Items.shopHouseBean);    -->
<!-- 					    for (var i = 0; i < Items.shopHouseBean.length; i++) { -->
<%-- 					        var imageURL = "<c:url value='/showlogo/' />" + Items.shopHouseBean[i].itemImg; --%>
<!-- 					         content += "<div class='card' style='width: 18rem;'>" -->
<!-- 					        		+"<img  width='150' height='150' " -->
<!-- 					                + " src='" + imageURL  -->
<!-- 					                + "'class='card-img-top' alt='...'>" -->
<!-- 					                + "<div class='card-body'>" -->
<!-- 					                + "<h5 class='card-title'>"   -->
<!-- 					                + Items.shopHouseBean[i].itemName  -->
<!-- 					                + "</h5>"  -->
<!-- 					                + "<p class='card-text'>" -->
<!-- 					                + Items.shopHouseBean[i].price -->
<!-- 					                + "</p>" -->
<!-- 					                + "<a href='#' class='btn btn-primary'>" -->
<!-- 					                + "加入購物車" -->
<!-- 					                + "</a>" -->
<!-- 					                + "</div>" -->
<!-- 					                + "</div>"; -->

<!-- 					    } -->
<!-- 					content +="</div>"; -->
<!-- 					var divs = document.getElementById("somedivS"); -->
<!-- 					divs.innerHTML = content; -->
<!-- 				} -->
<!-- 			} -->
<!-- 		} -->
<!-- 	} -->

<!-- </script> -->
</head>
<body>

	<header> </header>

	<main>
		<div align='center'>
		<div class="container">
		<div class="row">
			<div class="col-sm-6">
			<img src="${contextRoot}/showlogo/${RetailerInfo.rid}" 
					class="card-img-top rounded-circle" alt="..."
					width="150" height="150">
			<input id='clickmeS' value="${RetailerInfo.rName}"  />
			</div>
			<div>
			<textarea rows="10" cols="50">
			${RetailerInfo.info}
			</textarea>
			</div>
		</div>
		</div>
		<div class="container" align="center">
		<div class="row">
			<c:forEach items="${listItem}" var="Item">
				<div class="card" style="width: 18rem;">
<%-- 					<a href="${contextRoot}/RetailerShowAllItem?id=${Item.id}"> --%>
					<img src="${contextRoot}/downloadImg/${Item.id}" 
					class="card-img-top" alt="...">
<!-- 					</a> -->
					<div class="card-body">
						<p class="card-text">${Item.itemName}</p>
						<p class="card-text">${Item.price}</p>
					</div>

				</div>
			</c:forEach>
		</div>
	</div>
	</div>

	</main>
</body>
</html>