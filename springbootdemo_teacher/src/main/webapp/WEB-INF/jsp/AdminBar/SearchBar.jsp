<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
			<!doctype html>
			<html lang="en">

			<c:set var="contextRoot" value="${pageContext.request.contextPath}" />


			<body >
				<div class="navbar navbar-dark  bg-dark flex-md-nowrap p-0 shadow">
					<a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">條件搜尋
					</a> <input class="form-control form-control-dark w-100" type="text" placeholder="輸入商品名稱或店家名稱"
						id="SearchBsar" aria-label="Search" >
					<div class="navbar-nav">
						<!-- <div class="nav-item text-nowrap">
                            <a class="nav-link px-3" href="#">Sign out</a>
                        </div> -->
					</div>
					<script>
						$(document).ready(function () {
							$(SearchBsar).keyup(function (event) {
								if (event.which === 13) {
									var SearchBsartext = document.getElementById("SearchBsar").value
									var keyword = SearchBsartext.trim()

									console.log(SearchBsartext)
									console.log(keyword)
									if (keyword != "") {
										$(location).prop("href", "http://localhost:8080/findbyKeyWord?keyword=" + keyword)
									} else {
										return
									}
								}
							});
						})
					</script>
				</div>

				<script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
					integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
					crossorigin="anonymous"></script>
				<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"
					integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha"
					crossorigin="anonymous"></script>
				<!-- <script src="dashboard.js"></script> -->
			</body>

			</html>