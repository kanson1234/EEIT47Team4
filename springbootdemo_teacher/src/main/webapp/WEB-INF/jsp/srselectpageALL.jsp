<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<title>srselectpageALL</title>
				<script src="/js/jquery-3.6.0.min.js"></script>
				<script src="/js/bootstrap.bundle.min.js"></script>
				<style type="text/css">
					thead>tr>th {
						text-align: center;
						border: 1px red solid;
					}

					tbody>tr>td {
						text-align: center;
						border: 1px red solid;
					}
				</style>
				<Script>
					window.onload = function () {
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
						$("#selectBy").change(function () {
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
				<div>
					<select id="selectBy">
						<!-- <option value="ByC0Id">請選擇查詢方式 </option> -->
						<option value="ByC1Id" selected>Select by C1 ID</option>
						<option value="ByC2Id">Select by C2 ID</option>
					</select>

					<div id="selectByC1Id">
						<input type="text" id="cid">
						<button id="findallbyC1idBtn" type="submit">findAllByC1idBtn</button>
					</div>
					<div id="selectByC2Id">
						<input type="text" id="cid">
						<button id="findallbyC2idBtn" type="submit">findAllByC2idBtn</button>
					</div>
					<div id="selectALL">
						<button id="findallbytimeBtn" type="button">findAllByTimeBtn</button>
					</div>
					<div>
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
									<th>成交狀況</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>

				<script>
					$(document).ready(function () {
						// findAllByTime
						$('#findallbytimeBtn').click(function () {
							console.log('findallbytimeBtn')

							$.ajax({
								url: 'http://localhost:8080/record/findallbytime',
								contentType: 'application/json', // 送過去的資料型別
								dataType: 'json', // 回傳回來的資料型別
								method: 'get',
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
										msg_data += '<td>' + value.shophousebean.itemImg + '</td>'
										
										msg_data += '<td>' + value.shophousebean.itemImg + '</td>'
										
										
										msg_data += '<td>' + value.shophousebean.price + '</td>'
										msg_data += '<td>' + value.shophousebean.classify + '</td>'
										msg_data += '<td>' + state + '</td>'
										msg_data += '<td><a href="' + value.shophousebean.c2Id + '">' + value.shophousebean.c2Id + '</a></td>'
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
						$('#findallbyC1idBtn')
							.click(
								function () {

									var textcid = document
										.getElementById('cid').value;
									console.log(textcid)
									var dtoObj = {
										"cid": textcid
									};
									console.log(dtoObj)
									var dtoJson = JSON.stringify(dtoObj);
									console.log(dtoJson)

									$.ajax({
										url: "http://localhost:8080/record/findallbyCid?cid=" + textcid,
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
												msg_data += '<td>' + value.shophousebean.itemImg + '</td>'
												msg_data += '<td>' + value.shophousebean.price + '</td>'
												msg_data += '<td>' + value.shophousebean.classify + '</td>'
												msg_data += '<td>' + state + '</td>'
												msg_data += '<td><a href="' + value.shophousebean.c2Id + '">' + value.shophousebean.c2Id + '</a></td>'
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

					})
				</script>
			</body>

			</html>