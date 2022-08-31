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
<!-- C1SideBar -->
			<jsp:include page="layout/SidebarRetailer.jsp" />
			<!-- C1SideBar -->
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
<Script>
	window.onload = function() {
		var selectByC2Id = document.getElementById("selectByC2Id")
	}
	
</Script>

</head>

<body>

<div class="navbar navbar-dark  bg-dark flex-md-nowrap p-0 shadow">
	<a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">條件搜尋</a> 
	<input class="form-control form-control-dark w-100" type="text" placeholder="輸入商品名稱或店家名稱" id="SearchBsar" aria-label="Search" >
	<div class="navbar-nav">
		<!-- <div class="nav-item text-nowrap">
			<a class="nav-link px-3" href="#">Sign out</a>
		</div> -->
	</div>
	<script>
		$(document).ready(function () {
			$(SearchBsar).keyup(function (event) {
				if (event.which === 13) {
					var SearchBsartext = document.getElementById("SearchBsar").value
					var keyword = SearchBsartext.trim()
					let text = keyword;
					if (keyword != "") {
						// $(location).prop("href", "http://localhost:8080/findbyKeyWord?keyword=" + keyword)
						const myArray = text.split(" ");
						var int=myArray.length
						console.log(int)

						if (int<=1) {
							if (keyword>2000000) {
							$.ajax({
									url: "http://localhost:8080/findallbyCidtoC2?cid=" + keyword,
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
												
												msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.itemName + '</td>'
												msg_data += '<td style="vertical-align: middle; text-align: center;"><img width="100" src="${pageContext.request.contextPath}/downloadImg/'	+ value.shophousebean.id +'"></td>'
												msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.srTotalPrice + '</td>'
												msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.classify + '</td>'
												msg_data += '<td style="vertical-align: middle; text-align: center;">' + state + '</td>'
												msg_data += '<td style="vertical-align: middle; text-align: center;">' + state2 + '</td>'
												msg_data += '</tr>'
											})
											msg_data += '</tbody>'
											$('#tbtital h2').remove();
											$('#tbtital').append('<h2>依「顧客ID」查詢銷售紀錄</h2>')
											$('#list_data_json').append(msg_data)
										},
										error: function (err) {
											alert('輸入「顧客ID」 不存在，或查無銷售紀錄，請在試一次')
										}
									})

							return
						}
						if (2000000>keyword & keyword>1000000  ) {
							alert("不可查詢其他商家銷售紀錄")
							return
						} 
						else {
							$.ajax({
									url: "http://localhost:8080/findallbyItNameToC2?name=" + keyword,
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
											
											msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.itemName + '</td>'
											msg_data += '<td style="vertical-align: middle; text-align: center;"><img width="100" src="${pageContext.request.contextPath}/downloadImg/'	+ value.shophousebean.id +'"></td>'
											msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.srTotalPrice + '</td>'
											msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.classify + '</td>'
											msg_data += '<td style="vertical-align: middle; text-align: center;">' + state + '</td>'
											msg_data += '<td style="vertical-align: middle; text-align: center;">' + state2 + '</td>'
											msg_data += '</tr>'
										})
										msg_data += '</tbody>'
										$('#tbtital h2').remove();
										$('#tbtital').append('<h2>依「物品名稱」查詢銷售紀錄</h2>')
										$('#list_data_json').append(msg_data)
									},
									error: function (err) {
										alert('輸入「商品」不存在，或查無銷售紀錄，請在試一次')
									}
								})
							}
							console.log(SearchBsartext)
							console.log(keyword)
						
						
							}if (int==2) {
							var dateStar = myArray[0]
							var dateEnd = myArray[1]
								var date1 = new Date(dateStar);
								var date2 = new Date(dateEnd);

								console.log(date1)
								console.log(date2)
								if ( date1 > date2) {
									alert("請選擇正確的日期關係")
									return
								}
								console.log(dateStar)
								console.log(dateEnd)
								
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
											
											msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.itemName + '</td>'
											msg_data += '<td style="vertical-align: middle; text-align: center;"><img width="100" src="${pageContext.request.contextPath}/downloadImg/'	+ value.shophousebean.id +'"></td>'
											msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.srTotalPrice + '</td>'
											msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.classify + '</td>'
											msg_data += '<td style="vertical-align: middle; text-align: center;">' + state + '</td>'
											msg_data += '<td style="vertical-align: middle; text-align: center;">' + state2 + '</td>'
											msg_data += '</tr>'
										})
										msg_data += '</tbody>'
										$('#tbtital h2').remove();
										$('#tbtital').append('<h2>依「日期」查詢銷售紀錄</h2>')
										$('#list_data_json').append(msg_data)
									},
									error: function (err) {
										console.log(err)
									}
								})
							} 
						} else {
							return
						}
				}
			});
		})
	</script>
</div>
	<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
		<div class="container-fluid">
	
			<div class="row" >
				
				<div class="table-responsive" >
					<div id="tbtital">
						<c:if test="${!empty findAllToC2}">
							<h2>銷售紀錄</h2>
						</c:if>
					</div>
				</div>
				<table class="table table-striped table-sm" id="list_data_json">
					<thead>
						<tr>
							<!-- C1 -->
							<th scope="col"	style="vertical-align: middle; vertical-align: top; text-align: center;">消費者ID</th>
							<!-- SR -->
							<th scope="col"	style="vertical-align: middle; vertical-align: top; text-align: center;">消費時間</th>
							<th scope="col"	style="vertical-align: middle; vertical-align: top; text-align: center;">購買數量</th>
							<!-- SH -->
							<th scope="col"	style="vertical-align: middle; vertical-align: top; text-align: center;">商品名稱</th>
							<th scope="col"	style="vertical-align: middle; vertical-align: top; text-align: center;">商品圖片</th>
							<th scope="col" style="vertical-align: middle; text-align: center; vertical-align: top;">價格</th>
							<th scope="col"	style="vertical-align: middle; vertical-align: top; text-align: center;">商品分類</th>
							<th scope="col"	style="vertical-align: middle; vertical-align: top; text-align: center;">商品狀況</th>
							<!-- C2 -->
							<th scope="col"	style="vertical-align: middle; vertical-align: top; text-align: center;">成交狀況</th>
						</tr>
					</thead>
				</table>
		</div>
</div>
</body>

</html>