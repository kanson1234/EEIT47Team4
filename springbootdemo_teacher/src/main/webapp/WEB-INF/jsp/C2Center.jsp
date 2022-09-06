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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
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
		<div class="navbar-nav"></div>
		
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
								if (keyword>1999999) {
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
												var time = '';
												console.log(value.shophousebean.status)
												if (value.shophousebean.status == true) {
													state = "商品上架中";
												}
												if (value.shophousebean.status == false) {
													state = "商品已下架";
												}

												if (value.srState == true) {
													state2 = '<td style="vertical-align: middle; text-align: center;"><div>已成交</div></td>';
												}
												if (value.srState == false) {
													var day1 = new Date(value.srtime);
													console.log("購買日:"+day1	)
													var tt=day1.getTime();
													day1.setTime(tt+(86400000*7))
													console.log("到期日:"+day1)
													var day2 = new Date();
													console.log("今日:"+day2	)
													state2 =  '<td style="vertical-align: middle; text-align: center;"><div id="word">'+"申請退貨"+'</div>'
													+'<div id="SRID${findall.srShoppingRecord_Id}">'
													if (day1>day2) {
														console.log("可退貨")
														state2+='<div id="SRD" style="display:none ;">'+value.srShoppingRecord_Id +'</div><button class="123" style="font-size: 5px">核准</button></td>';
													}else{
														state2+='</td>'
													}
												}
												function formatDate(date) {
										            var d = new Date(date),
										                month = '' + (d.getMonth() + 1),
										                day = '' + d.getDate(),
										                year = d.getFullYear();
										            if (month.length < 2)
										                month = '0' + month;
										            if (day.length < 2)
										                day = '0' + day;
										            return [year, month, day].join('-');
										        }  
												 var d = new Date(value.srtime)
												 time=formatDate(d)
												msg_data += '<tr>'
												msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.customer.cId + '</td>'
												msg_data += '<td style="vertical-align: middle; text-align: center;">' + time + '</td>'
												msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.srCount + '</td>'
												msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.itemName + '</td>'
												msg_data += '<td style="vertical-align: middle; text-align: center;"><img width="100" src="${pageContext.request.contextPath}/downloadImg/'	+ value.shophousebean.id +'"></td>'
												msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.srTotalPrice + '</td>'
												msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.classify + '</td>'
												msg_data += '<td style="vertical-align: middle; text-align: center;">' + state + '</td>'
												msg_data +=	state2
												msg_data += '</tr>'
											})
											msg_data += '</tbody>'
											$('#tbtital h2').remove();
											$('#tbtital').append('<h2>依「顧客ID」查詢銷售紀錄</h2>')
											$('#list_data_json').append(msg_data)
										},
										error: function (err) {
											
											$.alert({
												title:'',
												content:"輸入「顧客ID」 不存在，或查無銷售紀錄，請在試一次"
											});
											
										}
									})
								return
							}
// ===================================================================================================================================================================
							if (1999999>keyword & keyword>1000000  ) {
								alert("不可查詢其他商家銷售紀錄")
								return
							}
// =================================================================================================================================================================== 
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
												var time = '';
												console.log(value.shophousebean.status)
												if (value.shophousebean.status == true) {
													state = "商品上架中";
												}
												if (value.shophousebean.status == false) {
													state = "商品已下架";
												}

												if (value.srState == true) {
													state2 = '<td style="vertical-align: middle; text-align: center;"><div>已成交</div></td>';
												}
												if (value.srState == false) {
													var day1 = new Date(value.srtime);
													console.log("購買日:"+day1	)
													var tt=day1.getTime();
													day1.setTime(tt+(86400000*7))
													console.log("到期日:"+day1)
													var day2 = new Date();
													console.log("今日:"+day2	)
													state2 =  '<td style="vertical-align: middle; text-align: center;"><div id="word">'+"申請退貨"+'</div>'
													+'<div id="SRID${findall.srShoppingRecord_Id}">'
													if (day1>day2) {
														console.log("可退貨")
														state2+='<div id="SRD" style="display:none ;">'+value.srShoppingRecord_Id +'</div><button class="123" style="font-size: 5px">核准</button></td>';
													}else{
														state2+='</td>'
													}
												}
												function formatDate(date) {
										            var d = new Date(date),
										                month = '' + (d.getMonth() + 1),
										                day = '' + d.getDate(),
										                year = d.getFullYear();
										            if (month.length < 2)
										                month = '0' + month;
										            if (day.length < 2)
										                day = '0' + day;
										            return [year, month, day].join('-');
										        }  
												 var d = new Date(value.srtime)
												 time=formatDate(d)
												
												msg_data += '<tr>'
												msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.customer.cId + '</td>'
												msg_data += '<td style="vertical-align: middle; text-align: center;">' + time + '</td>'
												msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.srCount + '</td>'
												msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.itemName + '</td>'
												msg_data += '<td style="vertical-align: middle; text-align: center;"><img width="100" src="${pageContext.request.contextPath}/downloadImg/'	+ value.shophousebean.id +'"></td>'
												msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.srTotalPrice + '</td>'
												msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.classify + '</td>'
												msg_data += '<td style="vertical-align: middle; text-align: center;">' + state + '</td>'
												msg_data +=	state2
												msg_data += '</tr>'
											})
											msg_data += '</tbody>'
										$('#tbtital h2').remove();
										$('#tbtital').append('<h2>依「物品名稱」查詢銷售紀錄</h2>')
										$('#list_data_json').append(msg_data)
									},
									error: function (err) {
										$.alert({
											title:'',
											content:"輸入「商品」不存在，或查無銷售紀錄，請在試一次"
										});
										
									}
								})
							}
							console.log(SearchBsartext)
							console.log(keyword)
// =================================================================================================================================================================== 
							}if (int==2) {
							var dateStar = myArray[0]
							var dateEnd = myArray[1]
								var date1 = new Date(dateStar);
								var date2 = new Date(dateEnd);
								
								console.log(date1)
								console.log(date2)
								if ( date1 > date2) {
									$.alert({
										title:'日期格式錯誤',
										content:"請選擇正確的日期關係"
									});
									return
								}
								
								if((date2 - date1)/86400000 > 92){
									$.alert({
										title:'日期格式錯誤',
										content:"查巡區間不可大於3個月"
									});
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
												var time = '';
												console.log(value.shophousebean.status)
												if (value.shophousebean.status == true) {
													state = "商品上架中";
												}
												if (value.shophousebean.status == false) {
													state = "商品已下架";
												}

												if (value.srState == true) {
													state2 = '<td style="vertical-align: middle; text-align: center;"><div>已成交</div></td>';
												}
												if (value.srState == false) {
													var day1 = new Date(value.srtime);
													console.log("購買日:"+day1	)
													var tt=day1.getTime();
													day1.setTime(tt+(86400000*7))
													console.log("到期日:"+day1)
													var day2 = new Date();
													console.log("今日:"+day2	)
													state2 =  '<td style="vertical-align: middle; text-align: center;"><div id="word">'+"申請退貨"+'</div>'
													+'<div id="SRID${findall.srShoppingRecord_Id}">'
													if (day1>day2) {
														console.log("可退貨")
														state2+='<div id="SRD" style="display:none ;">'+value.srShoppingRecord_Id +'</div><button class="123" style="font-size: 5px">核准</button></td>';
													}else{
														state2+='</td>'
													}
												}
												
												function formatDate(date) {
										            var d = new Date(date),
										                month = '' + (d.getMonth() + 1),
										                day = '' + d.getDate(),
										                year = d.getFullYear();
										            if (month.length < 2)
										                month = '0' + month;
										            if (day.length < 2)
										                day = '0' + day;
										            return [year, month, day].join('-');
										        }  
												 var d = new Date(value.srtime)
												 time=formatDate(d)
												
												msg_data += '<tr>'
												msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.customer.cId + '</td>'
												msg_data += '<td style="vertical-align: middle; text-align: center;">' + time + '</td>'
												msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.srCount + '</td>'
												msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.itemName + '</td>'
												msg_data += '<td style="vertical-align: middle; text-align: center;"><img width="100" src="${pageContext.request.contextPath}/downloadImg/'	+ value.shophousebean.id +'"></td>'
												msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.srTotalPrice + '</td>'
												msg_data += '<td style="vertical-align: middle; text-align: center;">' + value.shophousebean.classify + '</td>'
												msg_data += '<td style="vertical-align: middle; text-align: center;">' + state + '</td>'
												msg_data +=	state2
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
	<div>
	
		<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4" style="margin-right:30px; ">
			<div class="container-fluid">
				<div class="row" >
					<div class="table-responsive" >
						<div id="tbtital">
							<c:if test="${!empty data}">
								<h2 id="title">銷售紀錄</h2>
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
							<tbody>
								<c:forEach items="${data}" var="findall">
									<tr >

										<td style="vertical-align: middle; text-align: center;">${findall.customer.cId}</td>
										<td style="vertical-align: middle; text-align: center;"><fmt:formatDate	pattern="yyyy/MM/dd" value="${findall.srtime}" /></td>
										<td style="vertical-align: middle; text-align: center;">${findall.srCount}</td>
										<td style="vertical-align: middle; text-align: center;">${findall.shophousebean.itemName}</td>
										<td style="vertical-align: middle; text-align: center;">
											<a href="${pageContext.request.contextPath}/ShopHouse/itemDetail/${findall.shophousebean.id}">
												<img width="150" src="${pageContext.request.contextPath}/downloadImg/${findall.shophousebean.id}">
											</a>
										</td>
										<td style="vertical-align: middle; text-align: center;">${findall.srTotalPrice}</td>
										<td style="vertical-align: middle; text-align: center;">${findall.shophousebean.classify}</td>
										<td style="vertical-align: middle; text-align: center;">
											<c:if test="${findall.shophousebean.status==true}">
												商品上架中
											</c:if>
											<c:if test="${findall.shophousebean.status==false}">
												商品已下架
											</c:if>
										</td>
										<c:if test="${findall.srState==false}">
											<td style="vertical-align: middle; text-align: center;">
												<div id="word">申請退貨</div>
												<div id="SRID${findall.srShoppingRecord_Id}">
												</div>
												<Script>
													var day1 = new Date("${findall.srtime}");
													var tt=day1.getTime();
													day1.setTime(tt+(86400000*7))
													var day2 = new Date();
													if (day1>day2) {
														$("#SRID${findall.srShoppingRecord_Id}")[0].innerHTML = '<div id="SRD" style="display:none ;">${findall.srShoppingRecord_Id}</div><button class="123" style="font-size: 5px">核准</button>';
													}
												</Script>		
											</td>
										</c:if>
										<c:if test="${findall.srState==true}">
											<td style="vertical-align: middle; text-align: center;">
												<div>已成交</div>
											</td>
										</c:if>
									</tr>
								</c:forEach>
							</tbody>
							
							<script>

								console.log("${pageContext.request.contextPath}= "+"/Member/RTG?srid=")
								
								$( document ).ready(function() {
									
									$.ajax({
										url:'${pageContext.request.contextPath}/c2RTG',
										dataType: 'text',
										method:'get',
										success: function (result ) {
											var a='F'
											if (result==a) {
												$.alert({
															title:'您有尚未處裡的退貨要求',
															content:""
														});
												
											}
											
										}
									})








									$(".123").click(function () { 
										var srd1= $(this).parent().find("#SRD").text();
										var srl1= $(this).parent().parent().parent();
										var srb2= $(this).parent();
										var srlw= $(this).parent().parent().find("#word");
										var asrlw= $(this).parent().parent();

										$.confirm({
											title: '確認要允許退貨嗎?',
											content: '依消保法規定，除個人衛生用品外，顧客於7天內皆可無條件退款,且商家不得拒絕',
											buttons: {
												允許退貨:{
													text: '允許退貨(Y)',
													keys: ['Y', 'shift'],
													action: function () {
														$.alert({
															title:'我們將協助進行取消交易',
															content:""
														});
														$.ajax({
															url:'${pageContext.request.contextPath}/C2/deleteBySR?srid='+srd1,
															method:'get',
															success: function (result) {
																srl1.remove();
															}
														})
													}
												},
												拒絕:  {
													text: '拒絕退貨(N)',
													btnClass: 'btn-red',
													keys: ['N', 'shift'],
													action: function(){
														$.alert({
															title:'您拒絕退貨',
															content:""
														});
														$.ajax({
															url:'${pageContext.request.contextPath}/C2/rejectRTG?srid='+srd1,
															method:'get',
															success: function (result) {
																srb2.remove();
																srlw.remove();
																asrlw.append('<div>已成交</div>');

															}
														})
													}
												},
												稍後處裡: {
													text: '稍後處裡(Esc)',
													btnClass: 'btn-blue',
													keys: ['esc', 'shift'],
													action: function(){
														$.alert({
															title:'請盡早處理',
															content:""
														});
													}
												}
											}
										});
									});
								});
								
								$("#SearchBsar").change(function() {
									setTimeout(() => { 
									console.log("change")
									$(".123").click(function () { 
										var srd1= $(this).parent().find("#SRD").text();
										var srl1= $(this).parent().parent().parent();
										var srb2= $(this).parent();
										var srlw= $(this).parent().parent().find("#word");
										var asrlw= $(this).parent().parent();
										SearchBsartext.remove

										$.confirm({
											title: '確認要允許退貨嗎?',
											content: '依消保法規定，除個人衛生用品外，顧客於7天內皆可無條件退款,且商家不得拒絕',
											buttons: {
												
												允許退貨:{
													text: '允許退貨(Y)',
													keys: ['Y', 'shift'],
													action: function () {
														$.alert({
															title:'我們將協助進行取消交易',
															content:""
														});
														$.ajax({
															url:'${pageContext.request.contextPath}/C2/deleteBySR?srid='+srd1,
															method:'get',
															success: function (result) {
																srl1.remove();
															}
														})
													}
												},
												拒絕:  {
													text: '拒絕退貨(N)',
													btnClass: 'btn-red',
													keys: ['N', 'shift'],
													action: function(){
														$.alert({
															title:'您拒絕退貨',
															content:""
														});
														$.ajax({
															url:'${pageContext.request.contextPath}/C2/rejectRTG?srid='+srd1,
															method:'get',
															success: function (result) {
																srb2.remove();
																srlw.remove();
																asrlw.append('<div>已成交</div>');
															}
														})
													}
												},
												稍後處裡: {
													text: '稍後處裡(Esc)',
													btnClass: 'btn-blue',
													keys: ['esc', 'shift'],
													action: function(){
														$.alert({
															title:'請盡早處理',
															content:""
														});
													}
												}
											}
										});
									});
								}, 500);
								});

							</script>
							
						</thead>
					</table>
			</div>
		</main>
	</div>
</body>

</html>