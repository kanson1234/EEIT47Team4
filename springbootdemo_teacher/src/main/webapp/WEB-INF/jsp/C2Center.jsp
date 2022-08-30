<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">

<jsp:include page="layout/navbar.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<head>
<script src="/js/jquery-3.6.0.min.js"></script>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<title>會員中心</title>

<!-- <link rel="canonical" href="https://bootstrap5.hexschool.com/docs/5.1/examples/dashboard/"> -->



<Script>
	window.onload = function() {
		var selectByC2Id = document.getElementById("selectByC2Id")
		

		
	}
</Script>
</head>

<body>

	<div class="container-fluid">
		<div class="row">

			<!-- C1SideBar -->
			<jsp:include page="C2Bar\C2SideBar.jsp" />
			<!-- C1SideBar -->

			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<c:if test="${!empty findAllToA1}">
					<h2>銷售紀錄</h2>
				</c:if>
				<div class="table-responsive">
					<table >
						<tr>
							<td><input type="text" id="cid"></td>
							<td><button id="findallbyC1idBtntoC2">依客戶ID查詢</button></td>
							<td><input type="text" id="name"></td>
							<td><button id="findallbyItNameToC2">商品名稱查詢</button></td>
							<td><button id="findallbytimeBtn" type="button">findAllByTimeBtn</button></td>
						</tr>
						<tr>
							<td><span>開始時間</span></td>
							<td><input type="date" id="dateStar" style="margin: 1px;"></td>
							<td><span>結束時間</span></td>
							<td><input type="date" id="dateEnd" style="margin: 1px;"></td>
							<td><button type="button" id="findByTimetoC2">查詢</button></td>
						</tr>
					</table>
					<hr />
				</div>
				<table class="table table-striped table-sm" id="list_data_json">
					<thead>

						<tr>
							<!-- C1 -->
							<th scope="col"
									style="vertical-align: middle; vertical-align: top">消費者ID</th>
							<!-- SR -->
							<th scope="col"
									style="vertical-align: middle; vertical-align: top">消費時間</th>
							<th scope="col"
									style="vertical-align: middle; vertical-align: top">購買數量</th>
							<!-- SH -->
							<th scope="col"
									style="vertical-align: middle; vertical-align: top">商品ID</th>
							<th scope="col"
									style="vertical-align: middle; vertical-align: top">商品名稱</th>
							<th scope="col"
									style="vertical-align: middle; vertical-align: top">商品圖片</th>
							<th style="vertical-align: middle; text-align: center;">價格</th>
							<th scope="col"
									style="vertical-align: middle; vertical-align: top">商品分類</th>
							<th scope="col"
									style="vertical-align: middle; vertical-align: top">商品狀況</th>
							<!-- C2 -->
							<th scope="col"
									style="vertical-align: middle; vertical-align: top">成交狀況</th>
						</tr>

					</thead>
					<script>
					$(document).ready(function () {
						// find All  Time1  TO  Time2
						$('#findByTimetoC2').click(function () {
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
							console.log("findByTimetoC2")
							var dateJsonObj = {
								"dateStar": dateStar,
								"dateEnd": dateEnd
							};
							var stringDateJsonObj = JSON.stringify(dateJsonObj);
							console.log("stringDateJsonObj" + stringDateJsonObj)
							$.ajax({
								url: 'http://localhost:8080/admin/record/dateforc2id',
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
											state2 = "待退款";
										}
										msg_data += '<tr>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.customer.cId + '</td>'
											
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.srtime + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.srCount + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.id + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.itemName + '</td>'
										
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.price + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.classify + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + state + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.retailerBean.rid + '</td>'
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
						// findAllByTime
						$('#findallbytimeBtn').click(function () {
							console.log('findallbytimeBtn')
							$.ajax({
								url: 'http://localhost:8080/record/c2id',
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
											state2 = "成交";
										}
										if (value.srState == false) {
											state2 = "待退款";
										}

										msg_data += '<tr>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.customer.cId + '</td>'
											
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.srtime + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.srCount + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.id + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.itemName + '</td>'
										
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.price + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.classify + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + state + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.retailerBean.rid + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + state2 + '</td>'
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
						$('#findallbyC1idBtntoC2').click(function () {
							var textcid = document.getElementById('cid').value;
							console.log(textcid)
							var dtoObj = {
								"cid": textcid
							};
							console.log(dtoObj)
							var dtoJson = JSON.stringify(dtoObj);
							console.log(dtoJson)

							$.ajax({
								url: "http://localhost:8080/findallbyCidtoC2?cid=" + textcid,
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
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.customer.cId + '</td>'
											
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.srtime + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.srCount + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.id + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.itemName + '</td>'
										
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.price + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.classify + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + state + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.retailerBean.rid + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + state2 + '</td>'
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
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.customer.cId + '</td>'
											
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.srtime + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.srCount + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.id + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.itemName + '</td>'
										
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.price + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.classify + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + state + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.retailerBean.rid + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + state2 + '</td>'
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

						$('#findallbyItNameToC2').click(function () {
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
								url: "http://localhost:8080/findallbyItNameToC2?name=" + name,
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
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.customer.cId + '</td>'
											
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.srtime + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.srCount + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.id + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.itemName + '</td>'
										
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.price + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.classify + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + state + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.retailerBean.rid + '</td>'
										msg_data += '<td style="vertical-align: middle; text-align: center;">' + state2 + '</td>'
										msg_data += '</tr>'
									})
									msg_data += '</tbody>'
									$('#list_data_json').append(msg_data)
								},
								error: function (err) {
									alert('輸入商品 不存在，請在試一次')
								}
							})
						})
					})
				</script>
				</table>
			</main>
		</div>

	</div>




</body>

</html>