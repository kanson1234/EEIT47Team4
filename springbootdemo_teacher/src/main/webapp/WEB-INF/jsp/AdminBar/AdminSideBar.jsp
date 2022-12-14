<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
	crossorigin="anonymous"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
	crossorigin="anonymous"></script>


</head>
<body>
	<nav id="sidebarMenu"
		class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
		<div class="position-sticky pt-3">
			<ul class="nav flex-column">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="#"> <span data-feather="home"></span>
						銷售量圖表
				</a></li>
				<li class="nav-item"><a class="nav-link" href="${contextRoot}/Admin/SalesRecord"> <span
						data-feather="users"></span> 所有交易紀錄
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#"> <span
						data-feather="file"></span> 商家帳號管理
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#"> <span
						data-feather="layers"></span> 顧客帳號管理
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#"> <span
						data-feather="shopping-cart"></span> 商品管理
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#"> <span
						data-feather="bar-chart-2"></span> 顧客清單
				</a></li>

			</ul>

			<!--                                 <h6 -->
			<!--                                     class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted"> -->
			<!--                                     <span>Saved reports</span> -->
			<!--                                     <a class="link-secondary" href="#" aria-label="Add a new report"> -->
			<!--                                         <span data-feather="plus-circle"></span> -->
			<!--                                     </a> -->
			<!--                                 </h6> -->
			<!--                                 <ul class="nav flex-column mb-2"> -->
			<!--                                     <li class="nav-item"> -->
			<!--                                         <a class="nav-link" href="#"> -->
			<!--                                             <span data-feather="file-text"></span> -->
			<!--                                             Current month -->
			<!--                                         </a> -->
			<!--                                     </li> -->
			<!--                                     <li class="nav-item"> -->
			<!--                                         <a class="nav-link" href="#"> -->
			<!--                                             <span data-feather="file-text"></span> -->
			<!--                                             Last quarter -->
			<!--                                         </a> -->
			<!--                                     </li> -->
			<!--                                     <li class="nav-item"> -->
			<!--                                         <a class="nav-link" href="#"> -->
			<!--                                             <span data-feather="file-text"></span> -->
			<!--                                             Social engagement -->
			<!--                                         </a> -->
			<!--                                     </li> -->
			<!--                                     <li class="nav-item"> -->
			<!--                                         <a class="nav-link" href="#"> -->
			<!--                                             <span data-feather="file-text"></span> -->
			<!--                                             Year-end sale -->
			<!--                                         </a> -->
			<!--                                     </li> -->
			<!--                                 </ul> -->
		</div>
	</nav>




	<script
		src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
		integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"
		integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha"
		crossorigin="anonymous"></script>
</body>

</html>