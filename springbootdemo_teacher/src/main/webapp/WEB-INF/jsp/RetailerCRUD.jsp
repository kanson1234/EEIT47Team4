<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="layout/navbar.jsp" />
<jsp:include page="layout/Sidebar.jsp" />
<!DOCTYPE html>
<html>
<head>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
<meta charset="UTF-8">
<title>Account Manager</title>
<style>
	body{
			background-color:#FAF4D3;
			}
	div.container{
			background-color:#FBF7DD;
	}
</style>
</head>
<body>

<main>
<div class="container">
	<div align='center'>
		<h2>帳號管理</h2>
<!-- 		<div> -->
<%-- 		<form method="get" action="${contextRoot}/Retailer/getByAccount"> --%>
<!-- 			<input type="text" name="keyword"/> -->
<!-- 			<input type="submit" name="Search"/> -->
<!-- 		</form> -->
<!-- 		</div> -->
<%-- 		<a href="${contextRoot}/registerR">註冊新帳號</a> --%>
<!-- 		<br/> -->
		<div class="container">
		<table class="table" style="background-color:#FDFAEB" id="retailerTable">
			<thead class="thead-dark">
				<tr>
					<th scope="col">id</th>
					<th scope="col">名字</th>
					<th scope="col">帳號</th>
					<th scope="col">刪除</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach items="${listRetailer}" var="retailer">
					<tr>
						<td>${retailer.rid}</td>
						<td>${retailer.rName}</td>
						<td>${retailer.raccount}</td>

						<td><a onclick="return confirm('確認刪除?')" href="${contextRoot}/Retailer/changeStatusF/${retailer.rid}">

						<button type="submit" class="btn btn-danger">刪除</button>
						</a>
						</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
		<script type="text/javascript">
         $(document).ready( function () {
            $('#retailerTable').DataTable(
            	{  
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
         } );
        </script>
	</div>
	</div>

</div>
</main>
 <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>

</body>
</html>