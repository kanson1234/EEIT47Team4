<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">

<jsp:include page="layout/navbar.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<title>平台管理頁面</title>

<!-- <link rel="canonical" href="https://bootstrap5.hexschool.com/docs/5.1/examples/dashboard/"> -->

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
	crossorigin="anonymous"></script>

<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0"
                    crossorigin="anonymous"> -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
	crossorigin="anonymous"></script>

<!-- Bootstrap core CSS -->
<!-- <link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
                    crossorigin="anonymous"> -->

<!-- Favicons -->
<!-- <link rel="apple-touch-icon" href="/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
                <link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
                <link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
                <link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">
                <link rel="mask-icon" href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
                <link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
                <meta name="theme-color" content="#7952b3"> -->

<!-- Custom styles for this template -->
<!-- <link href="dashboard.css" rel="stylesheet"> -->
</head>

<body>

	<!-- SearchBar -->
	<jsp:include page="AdminBar/SearchBar.jsp" />
	<!-- SearchBar -->

	<div class="container-fluid">
		<div class="row">
			<!-- AdminSideBar -->
			<jsp:include page="AdminBar/AdminSideBar.jsp" />
			<!-- AdminSideBar -->

			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<!-- outputbar -->
				<jsp:include page="AdminBar/outputbar.jsp" />
				<!-- outputbar -->


				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<div class="btn-toolbar mb-2 mb-md-0">
						<div class="btn-toolbar mb-2 mb-md-0">
							<div>
								<span>開始時間</span><input type="date" id="dateStar"> <span>結束時間</span><input
									type="date" id="dateEnd">
								<button type="button" id="findByTime">查詢</button>
							</div>
						</div>
					</div>
				</div>

				<h2>依「客戶 ID」查詢結果</h2>
				<div class="table-responsive">
					<table class="table table-striped table-sm">
						<thead>
							<tr>
								<th scope="col"
									style="vertical-align: middle; vertical-align: top">消費者ID
								</th>
								<th scope="col"
									style="vertical-align: middle; vertical-align: top">消費時間</th>
								<th scope="col"
									style="vertical-align: middle; vertical-align: top">購買數量</th>
								<th scope="col"
									style="vertical-align: middle; vertical-align: top">商品ID</th>
								<th scope="col"
									style="vertical-align: middle; vertical-align: top">商品名稱</th>
								<th scope="col"
									style="vertical-align: middle; vertical-align: top">商品圖片</th>
								<th scope="col"
									style="vertical-align: middle; vertical-align: top">價格</th>
								<th scope="col"
									style="vertical-align: middle; vertical-align: top">商品分類</th>
								<th scope="col"
									style="vertical-align: middle; vertical-align: top">廠商ID</th>
								<th scope="col"
									style="vertical-align: middle; vertical-align: top">廠商名稱</th>
								<th scope="col"
									style="vertical-align: middle; vertical-align: top">成交狀況</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty data}">
								<Script>
									alert("查詢的「客戶 ID」不存在")
								</Script>
							</c:if>
							<c:forEach items="${data}" var="findall">
								<tr>

									<td style="vertical-align: middle;">${findall.customer.cId}</td>
									<td style="vertical-align: middle;"><fmt:formatDate
											pattern="yyyy/MM/dd HH:mm:ss" value="${findall.srtime}" /></td>

									<td style="vertical-align: middle;">${findall.srCount}</td>
									<td style="vertical-align: middle;">${findall.shophousebean.id}
									</td>
									<td style="vertical-align: middle;">${findall.shophousebean.itemName}
									</td>
									<td style="vertical-align: middle;"><a
										href="${pageContext.request.contextPath}/ShopHouse/itemDetail/${findall.shophousebean.id}"><img
											width="150"
											src="${pageContext.request.contextPath}/downloadImg/${findall.shophousebean.id}"></a>
									</td>
									<td style="vertical-align: middle;">${findall.srTotalPrice}</td>
									<td style="vertical-align: middle;">${findall.shophousebean.classify}
									</td>
									<td style="vertical-align: middle;">
										${findall.shophousebean.retailerBean.rid}</td>
									<td style="vertical-align: middle;">
										${findall.shophousebean.retailerBean.rName}</td>
									<c:if test="${findall.srState==true}">
										<td style="vertical-align: middle;">成交</td>
									</c:if>
									<c:if test="${findall.srState==false}">
										<td style="vertical-align: middle;">待退款</td>
									</c:if>

								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
			</main>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
		integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"
		integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha"
		crossorigin="anonymous"></script>
	<!-- <script src="dashboard.js"></script> -->
</body>

</html>