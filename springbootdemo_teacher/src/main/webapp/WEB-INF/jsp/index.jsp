<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="layout/navbar.jsp" />


<!DOCTYPE html>
<html>
<head>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<header>
<!-- <h1>首頁</h1> -->
<ul>
<%-- <li><a href="${contextRoot}/ShopHouse/viewItems">所有商品</a></li> --%>
<%-- <li><a href="${contextRoot}/shopHouse/add">新增商品</a></li> --%>
<%-- <li><a href="${contextRoot}/ShopHouse/findItemById">查詢商品</a></li> --%>
<%-- <li><a href="${contextRoot}/Retailer/RetailerCRUD">查詢商家</a></li> --%>
<%-- <li><a href="${contextRoot}/registerR">註冊新商家</a></li> --%>
<%-- <li><a href="${contextRoot}/registerC">註冊新會員</a></li> --%>
</ul>
</header>
<main>
<section class="py-5 text-center container">
<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="${contextRoot}/img/4.jpg" width="300" height="350" class="d-block w-100" alt="">
    </div>
    <div class="carousel-item">
      <img src="${contextRoot}/img/3.jpg" width="300" height="350" class="d-block w-100" alt="">
    </div>
     <div class="carousel-item">
      <img src="${contextRoot}/img/1.png" width="300" height="350" class="d-block w-100" alt="">
    </div>
     <div class="carousel-item">
      <img src="${contextRoot}/img/5.jpg" width="300" height="350" class="d-block w-100" alt="">
    </div>
<!--     <div class="carousel-item"> -->
<!--       <img src="" class="d-block w-100" alt=""> -->
<!--     </div> -->
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</section>


<!-- <h1>首頁</h1> -->
<!-- <ul> -->
<%-- <li><a href="${contextRoot}/ShopHouse/viewItems">所有商品</a></li> --%>
<%-- <li><a href="${contextRoot}/shopHouse/add">新增商品</a></li> --%>
<%-- <li><a href="${contextRoot}/ShopHouse/findItemById">查詢商品</a></li> --%>
<%-- <li><a href="${contextRoot}/Retailer/RetailerCRUD">查詢商家</a></li> --%>
<!-- </ul> -->
<hr > 
<span class="badge badge-danger">最新商品</span>

<div class="container" align="center">
	<div class="row">
		<c:forEach items="${pages.content}" var="i">
			<div class="card" style="width: 14rem; height: 380px;">
				<a href="${pageContext.request.contextPath}/ShopHouse/itemDetail/${i.id}"><img
						height="180"" src="${pageContext.request.contextPath}/downloadImg/${i.id}" class="card-img-top"
						alt="..."></a>
			    <div class="card-body">
						<p class="card-text">${i.itemName}</p>
						<p class="card-text" style="color:red;">${i.price}</p>
					</div>
					<div>
						<a href=""><button type="submit">加入購物車</button></a>
					</div>
			</div>
		</c:forEach>
		</div>
</div>
</main>

</body>
</html>