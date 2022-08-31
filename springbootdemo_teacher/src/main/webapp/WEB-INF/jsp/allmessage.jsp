<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="layout/navbar.jsp" />
<jsp:include page="layout/Sidebar.jsp" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>BlockList</title>
</head>
<body>
<%-- <jsp:include page="layout/Sidebar.jsp" /> --%>
<main>
<div class="container">
	<div align='center'>
	
	
<%-- 	<form method="get" action="${pageContext.request.contextPath}/Message/getByMsgcontext"> --%>
<!-- 			<input type="text" name="keyword"/> -->
<!-- 			<input type="submit" name="Search"/> -->
<!-- 		</form> -->
		
		<table class="table" id="retailerTable">
<thead class="thead-dark">

		<tr>
			
			<th>留言時間</th>
			<th>留言</th>
			<th>留言人id</th>
			
			
			
			<th>修改</th>
			<th>刪除</th>
			
		</tr>
		</thead>
		<tbody>
			<c:forEach items="${AllMessage}" var="m">
				<tr>
					
					<td>${m.mdate}</td>
					<td>${m.mcontext}</td>
					<td>${m.customerMsg.cId}</td>
					
					
					<td><a
						href="${pageContext.request.contextPath}/message/editMessage/${m.mid}">
							<button>編輯</button>
					</a></td>
					<td><a
						href="${pageContext.request.contextPath}/message/delete/${m.mid}">
					<button type="submit">刪除</button>
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

</main>
 <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
</body>
</html>