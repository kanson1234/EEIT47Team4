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
<meta charset="UTF-8">
<title>BlockList</title>
</head>
<body>
<%-- <jsp:include page="layout/Sidebar.jsp" /> --%>
<main>
<div class="container">
	<div align='center'>
	<a
						href="${pageContext.request.contextPath}/message/viewtrue">
					可顯示的留言
					</a>
	
	<form method="get" action="${pageContext.request.contextPath}/Message/getByMsgcontext">
			<input type="text" name="keyword"/>
			<input type="submit" name="Search"/>
		</form>
		
		<table class="table">
<thead class="thead-dark">

		<tr>
			
			<th>留言時間</th>
			<th>留言</th>
			<th>留言人id</th>
			
			
			
			<th>修改</th>
			<th>刪除</th>
			<th>刪除</th>
		</tr>
		</thead>
		<tbody>
			<c:forEach items="${Message}" var="m">
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
					刪除
					</a></td>
					<td><a
						href="${pageContext.request.contextPath}/message/false/${m.mid}">
					刪除
					</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	</div>

</main>
</body>
</html>