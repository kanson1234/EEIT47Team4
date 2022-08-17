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
			</head>

			<body>
				<div>
					<input type="text" id="myMessage">
					<button id="findallbytimeBtn" type="submit">送出</button>
					<button id="findallbytime" type="button">送出</button>
					<div>
						<table class="mytable" id="list_data_json">
							<thead>
								<tr>
									<th>cId</th>
									<th>cLastName</th>
									<th>srShoppingRecord_Id</th>
									<th>srtime</th>
									<th>srCount</th>
									<th>shItemId</th>
									<th>shItemName</th>
									<th>shImg</th>
									<th>shPrice</th>
									<th>shClassify</th>
									<th>shState</th>
									<th>c2Id</th>
									<th></th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
				<script>
					$(document).ready(function () {
						$('#findallbytime').click(function () {
							console.log('findallbytime')
							$.ajax({
								url: 'http://localhost:8080/record/findallbytime',
								// 					contentType : 'application/json', // 送過去的資料型別
								dataType: 'json', // 回傳回來的資料型別
								method: 'get',
								success: function (result) {
									console.log(result)
									$('#list_data_json tbody tr ').remove();
									msg_data = '<tbody>'
									$.each(result, function (index, value) {
										msg_data += '<tr>'
										msg_data += '<td>' + value.customer.cId + '</td>'
										msg_data += '<td>' + value.customer.cLastName + '</td>'
										msg_data += '<td>' + value.srShoppingRecord_Id + '</td>'
										msg_data += '<td>' + value.srtime + '</td>'
										msg_data += '<td>' + value.srCount + '</td>'
										msg_data += '<td>' + value.storehouse.shItemId + '</td>'
										msg_data += '<td>' + value.storehouse.shItemName + '</td>'
										msg_data += '<td>' + value.storehouse.shImg + '</td>'
										msg_data += '<td>' + value.storehouse.shPrice + '</td>'
										msg_data += '<td>' + value.storehouse.shClassify + '</td>'
										msg_data += '<td>' + value.storehouse.shState + '</td>'
										msg_data += '<td>' + value.storehouse.c2Id + '</td>'
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

					
					})
				</script>
			</body>

			</html>