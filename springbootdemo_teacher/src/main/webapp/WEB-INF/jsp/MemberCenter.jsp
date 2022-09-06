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
				<c:if test="${!empty data}">
					<h2>購物紀錄</h2>
				</c:if>
				<table class="table" id="retailerTable" style="margin-right:30px ">
					<thead class="thead-dark">
						<tr>
							<th scope="col"
								style="vertical-align: middle; vertical-align: top;text-align: center;">消費時間</th>
							<th scope="col"
								style="vertical-align: middle; vertical-align: top;text-align: center;">購買數量</th>
							<th scope="col"
								style="vertical-align: middle; vertical-align: top;text-align: center;">商品ID</th>
							<th scope="col"
								style="vertical-align: middle;text-align: center; vertical-align: top">商品名稱</th>
							<th scope="col"
								style="vertical-align: middle; text-align: center;vertical-align: top">商品圖片</th>
							<th scope="col"
								style="vertical-align: middle; text-align: center;vertical-align: top">價格</th>
							<th scope="col"
								style="vertical-align: middle; text-align: center;vertical-align: top">商品分類</th>
							<th scope="col"
								style="vertical-align: middle; text-align: center;vertical-align: top">廠商名稱</th>
							<th scope="col"
								style="vertical-align: middle; text-align: center;vertical-align: top">成交狀況</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${data}" var="findall">
							<tr >
								<td style="vertical-align: middle; text-align: center;"><fmt:formatDate
										pattern="yyyy/MM/dd" value="${findall.srtime}" /></td>
								<td style="vertical-align: middle; text-align: center;">${findall.srCount}</td>
								<td style="vertical-align: middle; text-align: center;">${findall.shophousebean.id}</td>
								<td style="vertical-align: middle; text-align: center;">${findall.shophousebean.itemName}</td>
								<td style="vertical-align: middle; text-align: center;">
									<a href="${pageContext.request.contextPath}/ShopHouse/itemDetail/${findall.shophousebean.id}">
										<img width="150" src="${pageContext.request.contextPath}/downloadImg/${findall.shophousebean.id}">
									</a>
								</td>
								<td style="vertical-align: middle; text-align: center;">${findall.srTotalPrice}</td>
								<td style="vertical-align: middle; text-align: center;">${findall.shophousebean.classify}</td>
								<td style="vertical-align: middle; text-align: center;">					
									<a href="${pageContext.request.contextPath}/retailerGetAllItem?id=${findall.shophousebean.retailerBean.rid}">${findall.shophousebean.retailerBean.rName} </a>
								</td>
								<c:if test="${findall.srState==true}">
									<td style="vertical-align: middle; text-align: center;">
										<div>成交</div>
										<div id="SRID${findall.srShoppingRecord_Id}"></div>
										<Script>
											var day1 = new Date("${findall.srtime}");
											var tt=day1.getTime();
											day1.setTime(tt+(86400000*7))
											var day2 = new Date();
											if (day1>day2) {
												$("#SRID${findall.srShoppingRecord_Id}")[0].innerHTML = '<button onclick="' + "alert('將為您通知廠商申請退貨'),location.href='${pageContext.request.contextPath}/Member/RTG?srid=${findall.srShoppingRecord_Id}'" + '">申請退貨</button>';
											
												
											}
										</Script>	
												
									</td>
								</c:if>
								<c:if test="${findall.srState==false}">
									<td style="vertical-align: middle; text-align: center;">
										<div>已申請退貨</div>
									</td>
								</c:if>
							</tr>
						</c:forEach>

					</tbody>
				</table>
				<script type="text/javascript">
					$(document).ready( function () {
						$('#retailerTable').DataTable({  
							"lengthMenu":[10, 5, 2, 1],
							"language": {
								"lengthMenu": "顯示 _MENU_ 項結果",
								"search": "搜尋:",
								"info": "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
								"infoEmpty": "顯示第 0 至 0 項結果，共 0 項",
								"paginate": {
									
									"first": "第一頁",
									"previous": "上一頁",
									"next": "下一頁",
									"last": "最後一頁"
								}
							}
						}); 
					});
				</script>
		
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