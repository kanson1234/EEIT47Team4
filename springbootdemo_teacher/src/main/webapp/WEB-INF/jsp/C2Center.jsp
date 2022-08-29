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
		var selectByC1Id = document.getElementById("selectByC1Id")
		var selectByC2Id = document.getElementById("selectByC2Id")
		var selectByValue = document.getElementById("selectBy").value.onchange = (selectByXX());

		function selectByXX() {
			selectByValue = document.getElementById("selectBy").value
			if (selectByValue == "ByC1Id") {
				console.log('selectBy:ByC1Id')
				selectByC1Id.style = ('display:block')
				selectByC2Id.style = ('display:none')
			}
		}
		$("#selectBy").change(function() {
			selectByValue = document.getElementById("selectBy").value
			if (selectByValue == "ByC1Id") {
				$("#selectByC1Id").show();
				$("#selectByC2Id").hide();
			}
			if (selectByValue == "ByC2Id") {
				$("#selectByC1Id").hide();
				$("#selectByC2Id").show();
			}
		})
	}
</Script>
</head>

<body>

	<div class="container-fluid">
		<div class="row">

			<!-- C1SideBar -->
			<jsp:include page="C1Bar\C1SideBar.jsp" />
			<!-- C1SideBar -->

			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<c:if test="${!empty findAllToA1}">
					<h2>銷售紀錄</h2>
				</c:if>
				<div class="table-responsive">
					<table>
						<tr>
							<td><input type="text" id="cid"></td>
							<td><button id="findallbyC1idBtn">依客戶ID查詢</button></td>
							<td><input type="text" id="c2id"></td>
							<td><button id="findallbyC2idBtn">依店家ID查詢</button></td>
							<td><input type="text" id="name"></td>
							<td><button id="findByNamebtn">商品名稱查詢</button></td>
							<td><button id="findallbytimeBtn" type="button">findAllByTimeBtn</button></td>
						</tr>
						<tr>
							<td><span>開始時間</span></td>
							<td><input type="date" id="dateStar" style="margin: 1px;"></td>
							<td><span>結束時間</span></td>
							<td><input type="date" id="dateEnd" style="margin: 1px;"></td>
							<td><button type="button" id="findByTime">查詢</button></td>
						</tr>
					</table>
					<hr />
				</div>
				<table class="mytable" id="list_data_json">
					<thead>

						<tr>
							<!-- C1 -->
							<th>消費者ID</th>
							<!-- SR -->
							<th>srShoppingRecord_Id</th>
							<th>消費時間</th>
							<th>購買數量</th>
							<!-- SH -->
							<th>商品ID</th>
							<th>商品名稱</th>
							<th>商品圖片</th>
							<th>價格</th>
							<th>商品分類</th>
							<th>商品狀況</th>
							<!-- C2 -->
							<th>廠商ID</th>
							<th>廠商名稱</th>
							<th>成交狀況</th>
						</tr>

					</thead>
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
											state2 = "退貨";
										}
										msg_data += '<tr>'
										msg_data += '<td><a href="' + value.customer.cId + '">' + value.customer.cId + '</a></td>'
										msg_data += '<td>' + value.srShoppingRecord_Id + '</td>'
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
											state2 = "退貨";
										}

										msg_data += '<tr>'
										msg_data += '<td><a href="' + value.customer.cId + '">' + value.customer.cId + '</a></td>'
										msg_data += '<td>' + value.srShoppingRecord_Id + '</td>'
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
											state2 = "退貨";
										}

										msg_data += '<tr>'
										msg_data += '<td><a href="' + value.customer.cId + '">' + value.customer.cId + '</a></td>'
										msg_data += '<td>' + value.srShoppingRecord_Id + '</td>'
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
											state2 = "退貨";
										}

										msg_data += '<tr>'
										msg_data += '<td><a href="' + value.customer.cId + '">' + value.customer.cId + '</a></td>'
										msg_data += '<td>' + value.srShoppingRecord_Id + '</td>'
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
											state2 = "退貨";
										}
										msg_data += '<tr>'
										msg_data += '<td><a href="' + value.customer.cId + '">' + value.customer.cId + '</a></td>'
										msg_data += '<td>' + value.srShoppingRecord_Id + '</td>'
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
						})
					})
				</script>
				</table>
			</main>
		</div>

	</div>




</body>

</html>