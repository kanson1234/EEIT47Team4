<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="layout/navbar.jsp" />
<jsp:include page="layout/Sidebar.jsp" />

<!DOCTYPE html>
<html>
<head>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
<meta charset="UTF-8">
<title>停權會員清單</title>
<style>
body {
	background-color: #E6E6EA;
}

div.container {
	background-color: #E6E6EA;
}
</style>

</head>
<body>
	<main>
		<div class="container">
			<div align='center'>
				<h2>已停權之帳號</h2>
				<%-- 				<form action="${contextRoot}/findCustomerByKeywords" method="get" --%>
				<!-- 					enctype="multipart/form-data"> -->
				<!-- 					<input type="text" name="keywords" placeholder="輸入會員姓、名或帳號" -->
				<!-- 						maxlength="30" size="30"><br> -->
				<!-- 					<button class="btn btn-outline-success">搜尋會員資訊</button> -->
				<!-- 				</form> -->

				<div class="container">
					<table class="table" style="background-color:#70AE3E" id="customerTable">
						<thead>
							<tr>
								<td scope="col">ID</td>
								<td scope="col">個人圖片</td>
								<td scope="col">姓</td>
								<td scope="col">名</td>
								<td scope="col">帳號</td>
								<td scope="col">密碼</td>
								<td scope="col">生日</td>
								<td scope="col">電子信箱</td>
								<td scope="col" style="white-space: nowrap;">註冊/更新日期</td>
								<td scope="col" style="white-space: nowrap;">帳號狀態</td>
								<td scope="col" style="white-space: nowrap;">狀態切換</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${customer}" var="c">
								<tr>
									<td>${c.cId}</td>
									<td><img width="150"
										src="${contextRoot}/downloadImage/${c.cId}"></td>
									<td>${c.cFirstName}</td>
									<td>${c.cLastName}</td>
									<td>${c.cAccount}</td>
									<td>${c.cPwd}</td>
									<td><fmt:formatDate pattern="yyyy/MM/dd"
											value="${c.cBirthdate}" /></td>
									<td>${c.cEmail}</td>

									<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm"
											value="${c.cDate}" /></td>
									<td>${c.cStatus}</td>
									<td><a href="${contextRoot}/changeCustomerStatus/${c.cId}" style="white-space: nowrap;">
											<button class="btn btn-success">帳號回復</button>
									</a></td>
									<!-- 									<td><a onclick="return confirm('真的要刪除此筆資料嗎?')" -->
									<%-- 										href="${contextRoot}/deleteCustomer/${c.cId}"> --%>
									<!-- 											<button class="btn btn-warning">X</button> -->
									<!-- 									</a></td> -->
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<script type="text/javascript">
						$(document)
								.ready(
										function() {
											$('#customerTable')
													.DataTable(
															{
																"lengthMenu" : [
																		10, 5,
																		2, 1 ],
																"language" : {
																	"lengthMenu" : "顯示 _MENU_ 項結果",
																	"search" : "搜尋:",
																	"info" : "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
																	"infoEmpty" : "顯示第 0 至 0 項結果，共 0 項",
																	"paginate" : {
																		"first" : "第一頁",
																		"previous" : "上一頁",
																		"next" : "下一頁",
																		"last" : "最後一頁"
																	}

																}
															});
										});
					</script>
				</div>
			</div>
		</div>
	</main>
	<script
		src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
</body>
</html>