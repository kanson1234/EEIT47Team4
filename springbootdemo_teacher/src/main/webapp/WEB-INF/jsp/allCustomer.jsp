<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有會員清單</title>
<!-- bootstrap 5.1.3 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<!-- bootstrap 5.1.3 JS -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<!-- jQuery 3.6.0 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

</head>
<body>
	<jsp:include page="navbar.jsp" />
	<%-- 	<h3 style="color: green">${}</h3> --%>
	<%-- 	<h3 style="color: blue">${}</h3> --%>
	<%-- 	<h3 style="color: red">${}</h3> --%>
	<!-- 重複的結構 -->
	<div>
		<table class="table table-hover table align-middle">
			<thead>
				<tr>
					<td>ID</td>
					<td>個人圖片</td>
					<td>姓</td>
					<td>名</td>
					<td>帳號</td>
					<td>密碼</td>
					<td>生日</td>
					<td>註冊/更新日期</td>
					<td>帳號狀態</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${customer}" var="c">
					<tr>
						<td>${c.cid}</td>
						<td><img width="150"
							src="${contextRoot}/downloadImage/${c.cid}"></td>
						<td>${c.cfirstName}</td>
						<td>${c.clastName}</td>
						<td>${c.caccount}</td>
						<td>${c.cpwd}</td>
						<td><fmt:formatDate pattern="yyyy/MM/dd"
								value="${c.cbirthdate}" /></td>
						<td>${c.cdate}</td>
						<td><select name="customerStatus">
								<option value="true">啟用</option>
								<option value="false">停用</option>
						</select></td>
						<td><a href="${contextRoot}/changeCustomerStatus?id=${c.cid}">
								<button class="btn btn-secondary">修改帳號狀態</button>
						</a></td>
						<td><a onclick="return confirm('真的要刪除此筆資料嗎?')"
							href="${contextRoot}/deleteCustomer/${c.cid}">
								<button class="btn btn-warning">X</button>
						</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>