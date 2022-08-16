<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet" />


</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="${pageContext.request.contextPath}/home">首頁</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="${pageContext.request.contextPath}/ShopHouse/viewItems">所有商品
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="${pageContext.request.contextPath}/ShopHouse/findByTent">帳篷
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="${pageContext.request.contextPath}/ShopHouse/findByLight">照明設備
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="${pageContext.request.contextPath}/ShopHouse/findByBackpack">功能背包
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="${pageContext.request.contextPath}/shopHouse/add">新增商品
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" role="button"
					data-toggle="dropdown" aria-expanded="false"> Dropdown </a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div></li>
				<li class="nav-item"><a class="nav-link disabled">Disabled</a>
				</li>
			</ul>
			<%-- 			    <form class="form-inline my-2 my-lg-0" method="get" action="${pageContext.request.contextPath}/ShopHouse/findByKeyword"> --%>
			<!-- 			      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search"> -->
			<!-- 			      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button> -->
			<!-- 			    </form> -->
			<form method="get"
				action="${pageContext.request.contextPath}/ShopHouse/findByKeyword">
				<input class="form-control mr-sm-2" type="text" name="word" /> <input
					type="submit" name="Search" value="搜尋" />
			</form>
		</div>
	</nav>

	<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"
		type="text/javascript"></script>

</body>
</html>