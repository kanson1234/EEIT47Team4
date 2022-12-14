
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

</head>
<body>

	<header> </header>

	<main>
		<div align='center'>
			<div class="container">
				<figure class="figure">
					<img src="${contextRoot}/showlogo/${RetailerInfo.rid}"
						class="card-img-top figure-img img-fluid " alt="..." width="34%"
						height="auto">
				</figure>
				<div class="text">
					<article class="editor">
						<div class="row">
							<div class="col-md-6">
								<img src="${contextRoot}/showphoto/${RetailerInfo.rid}"
									class="card-img-top figure-img img-fluid " alt="...">
							</div>
							<div class="col-md-6">
								<h3
									style="margin-top: 0px; margin-bottom: 0px; font-weight: bold;">
									${RetailerInfo.rName}</h3>
								<div class="col order-5">${RetailerInfo.rinfo}</div>
							</div>
						</div>
					</article>
				</div>
				<div id="sortItems" class="row" style="height: 100px;">
					<select id="sortSelect" class="col form-select" style="height: 30px;margin-left:100px;">
					      <option value="">選擇排序方式</option>
					      <option value="priceASC" >價錢低到高</option>
					      <option value="priceDESC">價錢高到低</option>
    				 </select>
    				 <div class="col" >
							<input type="text" name="keyword" id="searchItemKeyWord" value="" placeholder="請輸入查詢關鍵字"/>
<!-- 							<input type="submit" name="Search" id="search" value="搜尋"/> -->
    				 </div>
<!-- 					<div class="form-check form-check-inline"> -->
<!-- 						 <label class="form-check-label"  -->
<!-- 							for="inlineRadio1">全部商品:</label> -->
<!-- 					</div> -->
<!-- 					<div class="form-check form-check-inline"> -->
<!-- 						<input class="form-check-input" type="radio" -->
<!-- 							name="inlineRadioOptions" id="inlineRadio2" value="option2"> -->
<!-- 						<label class="form-check-label" for="inlineRadio2">價格由低到高</label> -->
<!-- 					</div> -->
<!-- 					<div class="form-check form-check-inline"> -->
<!-- 						<input class="form-check-input" type="radio" -->
<!-- 							name="inlineRadioOptions" id="inlineRadio3" value="option3"> -->
<!-- 						<label class="form-check-label" for="inlineRadio3">價格由高到低 -->
<!-- 						</label> -->
<!-- 					</div> -->
				</div>
				<div class="container" id="ItemsCard">
					<div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">
						<c:forEach items="${listItem}" var="ItemList">
							<div class="col">
								<div class="card" style="width: 14rem; height: 380px;">
									<a href="${contextRoot}/ShopHouse/itemDetail/${ItemList.id}"> <img
										src="${contextRoot}/downloadImg/${ItemList.id}"
										class="card-img-top" alt="...">
									</a>
									<div class="card-body">
										<p class="card-text itemname">${ItemList.itemName}</p>
										<p class="card-text itemprice" style="color: red;" >${ItemList.price}</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>

				</div>
				<script type="text/javascript">
					$(document).ready(
									function() {
										
										$('#searchItemKeyWord').change(function(){ 
// 										$('#search').click(function(){
										var text = $('#searchItemKeyWord').val();//獲取文字框輸入
										
											$('#ItemsCard>div>div').hide().filter(":contains('"+text+"')").show(); 
										 
										});
										

										var priceASC = function(a, b) {
											let x = $(a).find('.itemprice').text();
											let y = $(b).find('.itemprice').text();
											
											return parseInt(x.substring(0, x.length-2)) > parseInt(y.substring(0, y.length-2)) ? 1: -1;
										}	

										var priceDESC = function(a, b) {
											let x = $(a).find('.itemprice').text();
											let y = $(b).find('.itemprice').text();
											
											return parseInt(x.substring(0, x.length-2)) > parseInt(y.substring(0, y.length-2)) ? -1: 1;
										}

										var sortByInput = function(sortBy) {
											var sortEle = $('#ItemsCard>div>div').sort(sortBy);
											$('#ItemsCard>div').empty().append(sortEle);
										}
										
										$("#sortSelect").change(function() {
											   let sortMethod = $("#sortSelect option:selected").val();
											   if (sortMethod == "priceASC") {
											    sortByInput(priceASC);
											   } else if (sortMethod == "priceDESC") {
											    sortByInput(priceDESC);
											   } 
										})
											   
// 										$('#inlineRadio3').click(function() {
// 											sortByInput(desc);
// 										});

// 										$('#inlineRadio2').click(function() {
// 											sortByInput(asc);
// 										});
									});
				</script>


			</div>
		</div>
	</main>
</body>
</html>