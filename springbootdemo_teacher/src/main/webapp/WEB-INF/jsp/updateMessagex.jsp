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
		
		

		<form action="${pageContext.request.contextPath}/message/editMessage?id=${Message.mid}" method="post" enctype="multipart/form-data">

		<table class="table">
			<thead class="thead-dark">
				<tr>
<%-- <c:forEach items="${AllItem}" var="m">  --%>
					<th scope="col"><textarea rows="3" cols="50" id="newmcontext" name="newmcontext" placeholder="${Message.mcontext}"></textarea></th>
					<th scope="col"><input name="rid" value="${Message.mrid}" type="hidden"></th>
					<th scope="col"><input name="CS_Id" value="${Message.customerMsg.cId}" type="hidden"></th>
					<th scope="col"><input name="SH_Item_Id" value="${Message.shopHouseBean.id}" type="hidden"></th>
					<th scope="col"><input type="submit" value="修改"></th>
<%-- 				</c:forEach> --%>
				</tr>
			</thead>
			<tbody>
<!-- 				<tr> -->
					
<%-- 					<td>${Message.mcontext}</td> --%>
					
					
<!-- 				</tr> -->
			</tbody>
			
		</table>
</form>
	
	</div>
	</div>

</main>
</body>
</html>