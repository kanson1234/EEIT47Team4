<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">


<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="${pageContext.request.contextPath}/layout/navbar.jsp"/>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<title>平台管理頁面</title>


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
	<!-- SearchBar -->
	<jsp:include page="${pageContext.request.contextPath}/AdminBar/SearchBar.jsp" />
	<!-- SearchBar -->

	<div class="container-fluid">
		<div class="row">

			<!-- AdminSideBar -->
			<%-- 			<jsp:include page="layout/Sidebar.jsp" /> --%>
			<jsp:include page="${pageContext.request.contextPath}/layout/Sidebar.jsp" />
			<!-- AdminSideBar -->

			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 " style="margin-right: 30px;">
				<!-- outputbar -->
				<!-- outputbar -->

				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">

					<div class="btn-toolbar mb-2 mb-md-0">
						<div>
							<span>開始時間</span><input type="date" id="dateStar"> <span>結束時間</span><input
								type="date" id="dateEnd">
							<button type="button" id="findByTime">查詢</button>
						</div>
					</div>
				</div>


				
				<h2>所有交易紀錄</h2>
				<div class="table-responsive">
					<table class="table table-striped table-sm" id="list_data_json">
						<thead>
							<tr>
								<th scope="col"
									style="vertical-align: middle; vertical-align: top">消費者ID</th>
								<th scope="col"
									style="vertical-align: middle; vertical-align: top">消費時間</th>
								<th scope="col"
									style="vertical-align: middle; vertical-align: top">購買數量</th>
								<th scope="col"
									style="vertical-align: middle; vertical-align: top">商品ID</th>
								<th scope="col"
									style="vertical-align: middle; vertical-align: top">商品名稱</th>
								<th scope="col"
									style="vertical-align: middle; vertical-align: top">商品圖片</th>
								<th scope="col"
									style="vertical-align: middle; vertical-align: top">價格</th>
								<th scope="col"
									style="vertical-align: middle; vertical-align: top">商品分類</th>
								<th scope="col"
									style="vertical-align: middle; vertical-align: top">廠商ID</th>
								<th scope="col"
									style="vertical-align: middle; vertical-align: top">商品狀況</th>
								<th scope="col"
									style="vertical-align: middle; vertical-align: top">廠商名稱</th>
								<th scope="col"
									style="vertical-align: middle; vertical-align: top">成交狀況</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty data}">
								<h2>無交易紀錄</h2>
							</c:if>

							<c:forEach items="${data}" var="findall">
								
								
									<td style="vertical-align: middle; text-align: center; display:none;" >${findall.srShoppingRecord_Id} </td>
									<td style="vertical-align: middle; text-align: center;">${findall.customer.cId}</td>
									<td style="vertical-align: middle; text-align: center;"><fmt:formatDate	pattern="yyyy/MM/dd" value="${findall.srtime}" /></td>
									<td style="vertical-align: middle; text-align: center;">${findall.srCount}</td>
									<td style="vertical-align: middle; text-align: center;">${findall.shophousebean.id}	</td>
									<td style="vertical-align: middle; text-align: center;">${findall.shophousebean.itemName}</td>
									<td style="vertical-align: middle; text-align: center;"><a
										href="${pageContext.request.contextPath}/ShopHouse/itemDetail/${findall.shophousebean.id}"><img
											width="150"
											src="${pageContext.request.contextPath}/downloadImg/${findall.shophousebean.id}"></a>
									</td>
									<td style="vertical-align: middle; text-align: center;">${findall.srTotalPrice}</td>
									<td style="vertical-align: middle; text-align: center;">${findall.shophousebean.classify}</td>
									
									
									<c:if test="${findall.shophousebean.status==true}">
										<td style="vertical-align: middle; text-align: center;">商品上架中</td>
									</c:if>
									<c:if test="${findall.shophousebean.status==false}">
										<td style="vertical-align: middle; text-align: center;">商品以下架</td>
									</c:if>														
									<td style="vertical-align: middle; text-align: center;">
										${findall.shophousebean.retailerBean.rid}</td>
									<td style="vertical-align: middle; text-align: center;">
										${findall.shophousebean.retailerBean.rName}</td>
									<c:if test="${findall.srState==true}">
										<td style="vertical-align: middle; text-align: center;">成交</td>
									</c:if>
									<c:if test="${findall.srState==false}">
										<td style="vertical-align: middle; text-align: center;">待退款</td>
									</c:if>
									<!-- <td style="vertical-align:middle;">${findall.srState}</td> -->
								


								</tr>
						
							<script>
								$('#delete'+${findall.srShoppingRecord_Id}).click(function () {
									alert(${findall.srShoppingRecord_Id})
									
									$.ajax({
										url: 'http://localhost:8080/DeleteSrByScId?srid=${findall.srShoppingRecord_Id}',
								
										method:'get',
										success: function (result) {
									console.log(result.append === [])
									$('#list_data_json tbody tr ').remove();
									msg_data = '<tbody>'

									$.each(result, function (index, value) {
										var state = '';
										if (value.shophousebean.status == true) {
											state = "商品上架中";
										}
										if (value.shophousebean.status == false) {
											state = "商品已下架";
										}
										if (value.srState == true) {
											state2 = "成交";
										}
										if (value.srState == false) {
											state2 = '<button onclick="'+"return confirm('"+"請確認已完成退款')"+'" id="delete${findall.srShoppingRecord_Id}"> 刪除紀錄</button>'



										}
										msg_data += '<tr>'
										msg_data += '<td style="vertical-align: middle; text-align: center;"><a href="' + value.customer.cId + '">' + value.customer.cId + '</a></td>'
										msg_data += '<td style="vertical-align: middle; text-align: center; display:none;" >' + value.srShoppingRecord_Id + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.srtime + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.srCount + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.id + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.itemName + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;"><img width="100" src="${pageContext.request.contextPath}/downloadImg/'	+ value.shophousebean.id +'"></td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.price + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.classify + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + state + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.retailerBean.rid + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;"><a href="${pageContext.request.contextPath}/retailerGetAllItem?id=' + value.shophousebean.retailerBean.rid + '">' + value.shophousebean.retailerBean.rName + '</a></td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + state2 + '</td>'
										msg_data += '</tr>'


									})
									msg_data += '</tbody>'
									$('#list_data_json').append(msg_data)
								},
								error: function (err) {
									console.log(err)
									alert(err)
								}
									})
								})
							</script>
							</c:forEach>

						</tbody>
					</table>
				</div>
			</main>
		</div>
	</div>
<script>
					$(document).ready(function () {
						// find All  Time1  TO  Time2
						$('#findByTime').click(function () {
							var dateStar = document.getElementById('dateStar').value
							if (dateStar == "") {
								alert("請選擇開始日期")
								return
							}
							var dateEnd = document.getElementById('dateEnd').value
							if (dateEnd == "") {
								alert("請選擇結束日期")
								return
							}
							var date1 = new Date(dateStar);
							var date2 = new Date(dateEnd);

							if (dateStar != "" && dateEnd != "" && date1 > date2) {
								alert("請選擇正確的日期關係")
								return
							}
							
							console.log(dateStar)
							console.log(dateEnd)
							console.log(date1)
							console.log(date2)
							console.log("findByTime")
							var dateJsonObj = {
								"dateStar": dateStar,
								"dateEnd": dateEnd
							};
							var stringDateJsonObj = JSON.stringify(dateJsonObj);
							console.log("stringDateJsonObj" + stringDateJsonObj)
							$.ajax({
								url: 'http://localhost:8080/admin/record/date',
								contentType: 'application/json', // 送過去的資料型別
								dataType: 'json', // 回傳回來的資料型別
								method: 'post',
								data: stringDateJsonObj,
								success: function (result) {
									console.log(result.append === [])
									$('#list_data_json tbody tr ').remove();
									msg_data = '<tbody>'

									$.each(result, function (index, value) {
										var state = '';
										if (value.shophousebean.status == true) {
											state = "商品上架中";
										}
										if (value.shophousebean.status == false) {
											state = "商品已下架";
										}
										if (value.srState == true) {
											state2 = "成交";
										}
										if (value.srState == false) {
											state2 =  "待退款";
										}
										msg_data += '<tr>'
										msg_data += '<td>' + value.customer.cId + '</td>'
										msg_data += '<td style="display : none;">' + value.srShoppingRecord_Id + '</td>'
										msg_data += '<td>' + value.srtime + '</td>'
										msg_data += '<td>' + value.srCount + '</td>'
										msg_data += '<td>' + value.shophousebean.id + '</td>'
										msg_data += '<td>' + value.shophousebean.itemName + '</td>'
										msg_data += '<td><img width="100" src="${pageContext.request.contextPath}/downloadImg/'	+ value.shophousebean.id +'"></td>'
										msg_data += '<td>' + value.shophousebean.price + '</td>'
										msg_data += '<td>' + value.shophousebean.classify + '</td>'
										msg_data += '<td>' + state + '</td>'
										msg_data += '<td>' + value.shophousebean.retailerBean.rid + '</td>'
										msg_data += '<td><a href="${pageContext.request.contextPath}/retailerGetAllItem?id=' + value.shophousebean.retailerBean.rid + '">' + value.shophousebean.retailerBean.rName + '</a></td>'
										msg_data += '<td>' + state2 + '</td>'
										msg_data += '</tr>'
									})
									msg_data += '</tbody>'
									$('#list_data_json').append(msg_data)
								},
								error: function (err) {
									console.log(err)
									alert(err)
								}
							})
						})
						// findAllByTime
						$('#findallbytimeBtn').click(function () {
							console.log('findallbytimeBtn')
							$.ajax({
								url: 'http://localhost:8080/admin/record/findallbytime',
								contentType: 'application/json', // 送過去的資料型別
								dataType: 'json', // 回傳回來的資料型別
								method: 'get',
								success: function (result) {
									console.log(result)
									console.log(result.append === [])
									$('#list_data_json tbody tr ').remove();
									msg_data = '<tbody>'

									$.each(result, function (index, value) {
										var state = '';
										if (value.shophousebean.status == true) {
											state = "商品上架中";
										}
										if (value.shophousebean.status == false) {
											state = "商品已下架";
										}

										if (value.srState == true) {
											state2 = '<td>'+"成交"+'</td>';
										}
										if (value.srState == false) {
											state2 = '<td>'+"待退款"+'<td>';
										}
										
										msg_data += '<tr>'
										msg_data += '<td>' + value.customer.cId + '</td>'
										
										msg_data += '<td>' + value.srtime + '</td>'
										msg_data += '<td>' + value.srCount + '</td>'
										msg_data += '<td>' + value.shophousebean.id + '</td>'
										msg_data += '<td>' + value.shophousebean.itemName + '</td>'
										msg_data += '<td><img width="100" src="${pageContext.request.contextPath}/downloadImg/' + value.shophousebean.id + '"></td>'
										msg_data += '<td>' + value.shophousebean.price + '</td>'
										msg_data += '<td>' + value.shophousebean.classify + '</td>'
										msg_data += '<td>' + state + '</td>'
										msg_data += '<td>' + value.shophousebean.retailerBean.rid + '</td>'
										msg_data += '<td><a href="${pageContext.request.contextPath}/retailerGetAllItem?id=' + value.shophousebean.retailerBean.rid + '">' + value.shophousebean.retailerBean.rName + '</a></td>'
										msg_data +=  state2 
										msg_data += '</tr>'
									})
									msg_data += '</tbody>'

									$('#list_data_json').append(msg_data)
								},
								error: function (err) {
									console.log(err)
								}
							})
						})

						// findAllByCidBtn
						$('#findallbyC1idBtn').click(function () {
							var textcid = document.getElementById('cid').value;
							console.log(textcid)
							var dtoObj = {
								"cid": textcid
							};
							console.log(dtoObj)
							var dtoJson = JSON.stringify(dtoObj);
							console.log(dtoJson)

							$.ajax({
								url: "http://localhost:8080/Admin/record/findallbyCid?cid=" + textcid,
								contentType: 'application/json', // 送過去的資料型別
								dataType: 'json', // 回傳回來的資料型別
								method: 'get',
								// data:dtoJson,
								success: function (result) {
									console.log(result.append === [])
									$('#list_data_json tbody tr ').remove();
									msg_data = '<tbody>'
									$.each(result, function (index, value) {

										var state = '';
										console.log(value.shophousebean.status)
										if (value.shophousebean.status == true) {
											state = "商品上架中";
										}
										if (value.shophousebean.status == false) {
											state = "商品已下架";
										}

										if (value.srState == true) {
											state2 = "成交";
										}
										if (value.srState == false) {
											state2 ='<a onclick="return confirm("以退款?")" href="${contextRoot}/DeleteSrByScId?srid="'+value.srShoppingRecord_Id+'>刪除</a>';
											
										}

										msg_data += '<tr>'
										msg_data += '<td><a href="' + value.customer.cId + '">' + value.customer.cId + '</a></td>'
										msg_data += '<td style="display: none;">' + value.srShoppingRecord_Id + '</td>'
										msg_data += '<td>' + value.srtime + '</td>'
										msg_data += '<td>' + value.srCount + '</td>'
										msg_data += '<td>' + value.shophousebean.id + '</td>'
										msg_data += '<td>' + value.shophousebean.itemName + '</td>'
										msg_data += '<td><img width="100" src="${pageContext.request.contextPath}/downloadImg/'
											+ value.shophousebean.id +
											'"></td>'
										msg_data += '<td>' + value.shophousebean.price + '</td>'
										msg_data += '<td>' + value.shophousebean.classify + '</td>'
										msg_data += '<td>' + state + '</td>'
										msg_data += '<td>' + value.shophousebean.retailerBean.rid + '</td>'
										msg_data += '<td><a href="${pageContext.request.contextPath}/retailerGetAllItem?id=' + value.shophousebean.retailerBean.rid + '">' + value.shophousebean.retailerBean.rName + '</a></td>'
										msg_data += '<td>' + state2 + '</td>'
										msg_data += '</tr>'
									})
									msg_data += '</tbody>'
									$('#list_data_json').append(msg_data)
								},
								error: function (err) {
									alert('輸入ID 不存在，請在試一次')
								}
							})
						})
						//findallbyC2idBtn
						$('#findallbyC2idBtn').click(function () {
							var textc2id = document.getElementById('c2id').value;
							console.log(textc2id)
							var dtoObj = {
								"c2id": textc2id
							};
							$.ajax({
								url: "http://localhost:8080/admin/record/c2id?c2id=" + textc2id,
								contentType: 'application/json', // 送過去的資料型別
								dataType: 'json', // 回傳回來的資料型別
								method: 'get',
								// data:dtoJson,
								success: function (result) {
									console.log(result.append === [])
									$('#list_data_json tbody tr ').remove();
									msg_data = '<tbody>'
									$.each(result, function (index, value) {

										var state = '';
										console.log(value.shophousebean.status)
										if (value.shophousebean.status == true) {
											state = "商品上架中";
										}
										if (value.shophousebean.status == false) {
											state = "商品已下架";
										}

										if (value.srState == true) {
											state2 = "成交";
										}
										if (value.srState == false) {
											state2 = "待退款";
										}

										msg_data += '<tr>'
										msg_data += '<td><a href="' + value.customer.cId + '">' + value.customer.cId + '</a></td>'
										msg_data += '<td style="display: none;">' + value.srShoppingRecord_Id + '</td>'
										msg_data += '<td>' + value.srtime + '</td>'
										msg_data += '<td>' + value.srCount + '</td>'
										msg_data += '<td>' + value.shophousebean.id + '</td>'
										msg_data += '<td>' + value.shophousebean.itemName + '</td>'
										msg_data += '<td><img width="100" src="${pageContext.request.contextPath}/downloadImg/' + value.shophousebean.id + '"></td>'
										msg_data += '<td>' + value.shophousebean.price + '</td>'
										msg_data += '<td>' + value.shophousebean.classify + '</td>'
										msg_data += '<td>' + state + '</td>'
										msg_data += '<td>' + value.shophousebean.retailerBean.rid + '</td>'
										msg_data += '<td><a href="${pageContext.request.contextPath}/retailerGetAllItem?id=' + value.shophousebean.retailerBean.rid + '">' + value.shophousebean.retailerBean.rName + '</a></td>'
										msg_data += '<td>' + state2 + '</td>'
										msg_data += '</tr>'
									})
									msg_data += '</tbody>'
									$('#list_data_json').append(msg_data)
								},
								error: function (err) {
									alert('輸入ID 不存在，請在試一次')
								}
							})
						})

						$('#findByNamebtn').click(function () {
							var name = document.getElementById('name').value;
							if (name == "") {
								alert("請輸入商品名稱")
								return
							}


							console.log(name)
							var dtoObj = {
								"name": name
							};
							$.ajax({
								url: "http://localhost:8080/admin/record/byName?name=" + name,
								contentType: 'application/json', // 送過去的資料型別
								dataType: 'json', // 回傳回來的資料型別
								method: 'get',
								// data:dtoJson,
								success: function (result) {
									console.log(result.append === [])
									$('#list_data_json tbody tr ').remove();
									msg_data = '<tbody>'
									$.each(result, function (index, value) {
										var state = '';
										console.log(value.shophousebean.status)
										if (value.shophousebean.status == true) {
											state = "商品上架中";
										}
										if (value.shophousebean.status == false) {
											state = "商品已下架";
										}
										if (value.srState == true) {
											state2 = "成交";
										}
										if (value.srState == false) {
											state2 = "待退款";
										}
										msg_data += '<tr>'
										msg_data += '<td><a href="' + value.customer.cId + '">' + value.customer.cId + '</a></td>'
										msg_data += '<td style="display: none;">' + value.srShoppingRecord_Id + '</td>'
										msg_data += '<td>' + value.srtime + '</td>'
										msg_data += '<td>' + value.srCount + '</td>'
										msg_data += '<td>' + value.shophousebean.id + '</td>'
										msg_data += '<td>' + value.shophousebean.itemName + '</td>'
										msg_data += '<td><img width="100" src="${pageContext.request.contextPath}/downloadImg/' + value.shophousebean.id + '"></td>'
										msg_data += '<td>' + value.shophousebean.price + '</td>'
										msg_data += '<td>' + value.shophousebean.classify + '</td>'
										msg_data += '<td>' + state + '</td>'
										msg_data += '<td>' + value.shophousebean.retailerBean.rid + '</td>'
										msg_data += '<td><a href="${pageContext.request.contextPath}/retailerGetAllItem?id=' + value.shophousebean.retailerBean.rid + '">' + value.shophousebean.retailerBean.rName + '</a></td>'
										msg_data += '<td>' + state2 + '</td>'
										msg_data += '</tr>'
									})
									msg_data += '</tbody>'
									$('#list_data_json').append(msg_data)
								},
								error: function (err) {
									alert('輸入商品 不存在，請在試一次')
								}
							})
					})})
				</script>
			


	<script
		src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
		integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"
		integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha"
		crossorigin="anonymous"></script>
</body>

</html>