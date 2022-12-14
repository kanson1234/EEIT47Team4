<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html lang="en">

<jsp:include page="layout/navbar.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
	<head>
	<link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author"
		content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
	<meta name="generator" content="Hugo 0.88.1">
	<title>會員中心</title>

<!-- <link rel="canonical" href="https://bootstrap5.hexschool.com/docs/5.1/examples/dashboard/"> -->

	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
		crossorigin="anonymous">
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
		crossorigin="anonymous"></script>

</head>

<body>
	<div class="container-fluid">
		<div class="row">

			<jsp:include page="C1Bar\C1SideBar.jsp" />

			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
			
<!-- 			++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
				<c:if test="${!empty data}">
					<h2>購物紀錄</h2>
				</c:if>
				
				
				
				<c:forEach items="${data}" var="findall"> 
				
				<div class="card"  style="margin-top:15px; margin-right:50px;">
				  <div class="card-header">
				    訂單編號 : ${findall.srnox }
				  </div>
				  <div class="card-body">
				    <blockquote class="blockquote mb-0">
				    	<table class="table" style="margin-top:10px">
							<thead>
								<tr>
									<th scope="col"	style="vertical-align: middle; vertical-align: top;text-align: center;">商品名稱</th>
									<th scope="col"	style="vertical-align: middle; vertical-align: top;text-align: center;">商品圖片</th>
									<th scope="col"	style="vertical-align: middle; vertical-align: top;text-align: center;">購買數量</th>
									<th scope="col"	style="vertical-align: middle; vertical-align: top;text-align: center;">店家名稱</th>
									<th scope="col"	style="vertical-align: middle; vertical-align: top;text-align: center;">成交狀況</th>
								</tr>
							</thead>				    	
				    		<tbody>
				    			<c:forEach items="${findall['SR']}" var="de">
					    			<tr>
					    			
					    			

					    			
					    			
					    			
					    				<td style="vertical-align: middle; text-align: center;">
					    					<a href="${pageContext.request.contextPath}/ShopHouse/itemDetail/${de.shophousebean.id}">
					    						${de.shophousebean.itemName}
					    					</a>
					    				</td>
					    				<td style="vertical-align: middle; text-align: center;">
					    					<img width="150" src="${pageContext.request.contextPath}/downloadImg/${de.shophousebean.id}">
					    				</td>
					    				<td style="vertical-align: middle; text-align: center;">${de.srCount}</td>
					    				<td style="vertical-align: middle; text-align: center;">
					    					<a href="${pageContext.request.contextPath}/retailerGetAllItem?id=${de.shophousebean.retailerBean.rid}">
					    						${de.shophousebean.retailerBean.rName}
					    					</a>
					    				</td>
					    				
<!-- ------------------------------------------------------------------------------------------------------------------- -->
								    		<c:if test="${de.srState==true}">
												<td style="vertical-align: middle; text-align: center;">
													<div>成交</div>
													<div id="SRID${de.srShoppingRecord_Id}"></div>
													<Script>
			 											var day1 = new Date("${de.srtime}");
														var tt=day1.getTime();
			 											day1.setTime(tt+(86400000*7)) 
														var day2 = new Date(); 
														if (day1>day2) { 
			 												$("#SRID${de.srShoppingRecord_Id}")[0].innerHTML = '<button onclick="' + "alert('將為您通知廠商申請退貨'),location.href='${pageContext.request.contextPath}/Member/RTG?srid=${de.srShoppingRecord_Id}'" + '">申請退貨</button>';
														} 
			 										</Script>	 
															
												</td>
											</c:if>
											<c:if test="${de.srState==false}">
												<td style="vertical-align: middle; text-align: center;">
													<div>已申請退貨</div>
												</td>
											</c:if>
					    				
<!-- ------------------------------------------------------------------------------------------------------------------- -->
					    			</tr>
				    			</c:forEach>
				    		</tbody>
				    	
				    	</table>
				      <footer class="blockquote-footer">訂單總價 <cite title="Source Title"> ${findall.price}</cite></footer>
				    </blockquote>
				  </div>
				</div>
				
				</c:forEach>
			</main>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
		integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"
		integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
	</body>

</html>