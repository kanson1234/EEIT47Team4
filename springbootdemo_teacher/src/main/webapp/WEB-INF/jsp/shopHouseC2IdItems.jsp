<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="layout/navbar.jsp" />
<jsp:include page="layout/SidebarRetailer.jsp" />
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
<meta charset="UTF-8">
<title>後台店家商品一覽</title>
</head>
<body>
	<div class="container" style="margin-left: 200px">
		
		<div class="table-responsive" >
			<table class="table" id="retailerTable">
				<thead class="thead-dark">
					<tr>
						<th scope="col">產品名稱</th>
						<th scope="col">照片</th>
						<th scope="col">價錢</th>
						<th scope="col">種類</th>
						<th scope="col">店家</th>
						<th scope="col">編輯</th>
						<th scope="col">下架</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${c2IdItems}" var="i">
						<tr>
							<td>${i.itemName}</td>
							<td><a
								href="${pageContext.request.contextPath}/ShopHouse/itemDetail/${i.id}"><img
									width="100"
									src="${pageContext.request.contextPath}/downloadImg/${i.id}"></a></td>
							<td>${i.price}</td>
							<td>${i.classify}</td>
							<%-- 					<td>${i.c2Id}</td> --%>
							<td>${i.getRetailerBean().rName}</td>
							<td><a
								href="${pageContext.request.contextPath}/ShopHouse/editItemId/${i.id}"><button
										type="submit" class="btn btn-primary mb-2">編輯</button></a></td>
							<td><a onclick="return confirm('確認下架?')"
								href="${pageContext.request.contextPath}/ShopHouse/changeStatusF/${i.id}">
									<button type="submit" class="btn btn-danger">下架</button>
							</a></td>
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
	 <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
</body>

       

</html>