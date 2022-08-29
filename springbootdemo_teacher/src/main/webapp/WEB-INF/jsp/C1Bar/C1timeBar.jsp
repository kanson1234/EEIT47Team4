<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<body>
	<div class="btn-toolbar mb-2 mb-md-0">

		<div>
			<span>開始時間</span><input type="date" id="dateStar"> <span>結束時間</span><input
				type="date" id="dateEnd">
			<button type="button" id="findByTime">查詢</button>
		</div>
	</div>

</body>

</html>