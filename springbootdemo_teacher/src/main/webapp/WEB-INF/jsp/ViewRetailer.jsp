<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="layout/navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>ViewRetailer</title>
<<<<<<< HEAD
=======

	<style type="text/css">
			#tab {
			    width: auto;
			    background: #1caa5d;
			    border: solid 1px #1caa5d;
			}
			
			/* 頁籤ul */
			#tab > ul {
			    /* overflow: hidden; */
			    margin: 0;
			    padding: 10px 20px 0 20px;
			}
			
			#tab > ul > li {
			    list-style-type: none;
			}
			
			/* 頁籤上的文字 */
			#tab > ul > li > a { 
			    text-decoration: none;
			    font-size: 15px;
			    color: #333;
			    float: left;
			    padding: 10px;
			    margin-left: 5px;
			}
			
			/*頁籤div內容*/
			#tab > div {
			    clear: both;
			    padding: 0 15px;
			    height: 0;
			    overflow: hidden;
			    visibility: hidden;
			}
			
			/*第一筆的底色*/
			span:target ~ #tab > ul li:first-child a {
			    background: #1caa5d;
			}
			
			span:target ~ #tab > div:first-of-type {
			    visibility: hidden;
			    height: 0;
			    padding: 0 15px;
			}
			
			/*頁籤變換&第一筆*/
			span ~ #tab > ul li:first-child a,
			#tab-1:target ~ #tab > ul li a[href$="#tab-1"],
			#tab-2:target ~ #tab > ul li a[href$="#tab-2"],
			#tab-3:target ~ #tab > ul li a[href$="#tab-3"],
			#tab-4:target ~ #tab > ul li a[href$="#tab-4"],
			#tab-5:target ~ #tab > ul li a[href$="#tab-5"] {
			    background: #fff;
			    border-radius: 5px 5px 0 0;
			}
			
			span ~ #tab > ul li:first-child a::before,
			#tab-1:target ~ #tab > ul li a[href$="#tab-1"]::before,
			#tab-2:target ~ #tab > ul li a[href$="#tab-2"]::before,
			#tab-3:target ~ #tab > ul li a[href$="#tab-3"]::before,
			#tab-4:target ~ #tab > ul li a[href$="#tab-4"]::before,
			#tab-5:target ~ #tab > ul li a[href$="#tab-5"]::before {
			    background-color: white;
			    height: 100%;
			}
			
			/*頁籤內容顯示&第一筆*/
			span ~ #tab > div:first-of-type,
			#tab-1:target ~ #tab > div.tab-content-1,
			#tab-2:target ~ #tab > div.tab-content-2,
			#tab-3:target ~ #tab > div.tab-content-3,
			#tab-4:target ~ #tab > div.tab-content-4,
			#tab-5:target ~ #tab > div.tab-content-5 {
			    visibility: visible;
			    height: auto;
			    background: #fff;
			}
			
			span {
			    display: none;
			}
	</style>
>>>>>>> 3dda41fcf20dc147f7fd896e2e46b376f102aca2
</head>
<body>
	<header>
		<div align="center">店家一覽</div>
	</header>
	<main>
<<<<<<< HEAD
	<div class="container" align="center">
		<div class="row">
			<c:forEach items="${listRetailer}" var="retailer">
				<div class="card" style="width: 18rem;">
<%-- 					<a href="${contextRoot}/R/find?id=${retailer.rid}"> --%>
					<a href="${contextRoot}/retailerGetAllItem?id=${retailer.rid}">
					<img src="${contextRoot}/showlogo/${retailer.rid}" 
					class="card-img-top" alt="...">
					</a>
					<div class="card-body">
						<p class="card-text">${retailer.rName}</p>
					</div>

				</div>
			</c:forEach>
		</div>
	</div>
	</main>
=======
<div class="container" align="center">
		<span id="tab-1">主頁</span>
		<span id="tab-2">頁面1</span>
		<span id="tab-3">頁面2</span>
		<span id="tab-4">頁面3</span>
		<span id="tab-5">頁面4</span>
		
		<!-- 頁籤按鈕 -->
		<div id="tab">
		    <ul>
		        <li><a href="#tab-1">主頁</a></li>
		        <li><a href="#tab-2">A開頭</a></li>
		        <li><a href="#tab-3">C開頭</a></li>
		        <li><a href="#tab-4">S開頭</a></li>
		         <li><a href="#tab-5">T開頭</a></li>
		    </ul>
		
		    <!-- 頁籤的內容區塊 -->
		    <div class="tab-content-1">
				<div class="row" align="center">
					<c:forEach items="${listRetailer}" var="retailer">
						<div class="card" style="width: 17rem;">
							<a href="${contextRoot}/retailerGetAllItem?id=${retailer.rid}">
							<img src="${contextRoot}/showlogo/${retailer.rid}" 
							class="card-img-top" alt="...">
							</a>
							<div class="card-body">
								<p class="card-text">${retailer.rName}</p>
							</div>
		
						</div>
					</c:forEach>
				</div>
				<hr/>
		    </div>
		    <div class="tab-content-2">
		      <div class="row" align="center">
					<c:forEach items="${listRetailer}" var="retailer">
					<c:if test='${fn:startsWith(retailer.rName,"A")||fn:startsWith(retailer.rName,"a")}'>
						<div class="card" style="width: 17rem;">
							<a href="${contextRoot}/retailerGetAllItem?id=${retailer.rid}">
							<img src="${contextRoot}/showlogo/${retailer.rid}" 
							class="card-img-top" alt="...">
							</a>
							<div class="card-body">
								<p class="card-text">${retailer.rName}</p>
							</div>
		
						</div>
						</c:if>
					</c:forEach>
				</div>
				<hr/>
		    </div>
		    <div class="tab-content-3">
		      <div class="row" align="center">
					<c:forEach items="${listRetailer}" var="retailer">
					<c:if test='${fn:startsWith(retailer.rName,"C")||fn:startsWith(retailer.rName,"c")}'>
						<div class="card" style="width: 17rem;">
							<a href="${contextRoot}/retailerGetAllItem?id=${retailer.rid}">
							<img src="${contextRoot}/showlogo/${retailer.rid}" 
							class="card-img-top" alt="...">
							</a>
							<div class="card-body">
								<p class="card-text">${retailer.rName}</p>
							</div>
		
						</div>
						</c:if>
					</c:forEach>
				</div>
				<hr/>
		    </div>
		    
		    <div class="tab-content-4">
		       <div class="row" align="center">
					<c:forEach items="${listRetailer}" var="retailer">
					<c:if test='${fn:startsWith(retailer.rName,"S")||fn:startsWith(retailer.rName,"s")}'>
						<div class="card" style="width: 17rem;">
							<a href="${contextRoot}/retailerGetAllItem?id=${retailer.rid}">
							<img src="${contextRoot}/showlogo/${retailer.rid}" 
							class="card-img-top" alt="...">
							</a>
							<div class="card-body">
								<p class="card-text">${retailer.rName}</p>
							</div>
		
						</div>
						</c:if>
					</c:forEach>
				</div>
				<hr/>
		    </div>
		    
		    <div class="tab-content-5">
		       <div class="row" align="center">
					<c:forEach items="${listRetailer}" var="retailer">
					<c:if test='${fn:startsWith(retailer.rName,"T")||fn:startsWith(retailer.rName,"t")}'>
						<div class="card" style="width: 17rem;">
							<a href="${contextRoot}/retailerGetAllItem?id=${retailer.rid}">
							<img src="${contextRoot}/showlogo/${retailer.rid}" 
							class="card-img-top" alt="...">
							</a>
							<div class="card-body">
								<p class="card-text">${retailer.rName}</p>
							</div>
		
						</div>
						</c:if>
					</c:forEach>
				</div>
				<hr/>
		    </div>
		    
	</div>
</div>


	</main>

>>>>>>> 3dda41fcf20dc147f7fd896e2e46b376f102aca2
</body>
</html>