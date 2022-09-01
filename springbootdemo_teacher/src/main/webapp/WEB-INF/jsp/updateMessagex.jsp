<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="layout/navbar.jsp" />
<jsp:include page="layout/Sidebar.jsp" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>修改頁面</title>


</head>
<body>
	<div class="container">
		<div
			style="margin: 20px; padding: 20px; padding-left: 200px; padding-right: 200px; margin-left: auto; margin-right: auto; width: 60%; border: solid 1px; border-radius: 5px; border-color: rgb(163, 163, 163);">
			<form action="${pageContext.request.contextPath}/message/editMessage?id=${Message.mid}" method="post" enctype="multipart/form-data">

				<h2 class="h3 mb-3 fw-normal">留言修改</h2>

				<div class="mb-3">
				<label class="form-label">產品名稱:
				<input class="form-control" value="${Message.shopHouseBean.itemName}" disabled></label>



					<label class="form-label"><input name="SH_Item_Id"
						class="form-control" value="${Message.shopHouseBean.id}" type="hidden"></label>
						<div></div>
						<label class="form-label">留言人名稱:<input name="CS_Id"
						class="form-control" value="${Message.customerMsg.cFirstName}" disabled></label>
						 <div></div>
					
					<label class="form-label"><input name="CS_Id"
						class="form-control" value="${Message.customerMsg.cId}" type="hidden"></label>
						<label class="form-label"><input name="rid"
						class="form-control" value="${Message.mrid}" type="hidden"></label> 	
						<div></div>
						 
						<label class="form-label">留言內容
						<textarea rows="3" cols="26" id="newmcontext" name="newmcontext" placeholder="${Message.mcontext}"></textarea></label>
					

					<button type="submit" class="btn btn-lg btn-primary">修改</button>
					


				</div>
			</form>
		</div>
	</div>
</body>

</html>