<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="layout/navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>ViewRetailer</title>
<!-- <script> -->
<!--  $(function(){ -->
<!--      var $li = $('ul.tab-title li'); -->
<!--          $($li. eq(0) .addClass('active').find('a').attr('href')).siblings('.tab-inner').hide(); -->
    
<!--          $li.click(function(){ -->
<!--              $($(this).find('a'). attr ('href')).show().siblings ('.tab-inner').hide(); -->
<!--             $(this).addClass('active'). siblings ('.active').removeClass('active'); -->
<!--          }); -->
<!--      }); -->
<!-- </script> -->
<!-- <script type="text/javascript"> -->
<!-- 	var firstTabEl = document.querySelector('#myTab li:last-child a') -->
<!-- 	var firstTab = new bootstrap.Tab(firstTabEl) -->
	
<!-- 	firstTab.show() -->
<!-- </script> -->
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
			#tab-4:target ~ #tab > ul li a[href$="#tab-4"] {
			    background: #fff;
			    border-radius: 5px 5px 0 0;
			}
			
			span ~ #tab > ul li:first-child a::before,
			#tab-1:target ~ #tab > ul li a[href$="#tab-1"]::before,
			#tab-2:target ~ #tab > ul li a[href$="#tab-2"]::before,
			#tab-3:target ~ #tab > ul li a[href$="#tab-3"]::before,
			#tab-4:target ~ #tab > ul li a[href$="#tab-4"]::before {
			    background-color: white;
			    height: 100%;
			}
			
			/*頁籤內容顯示&第一筆*/
			span ~ #tab > div:first-of-type,
			#tab-1:target ~ #tab > div.tab-content-1,
			#tab-2:target ~ #tab > div.tab-content-2,
			#tab-3:target ~ #tab > div.tab-content-3,
			#tab-4:target ~ #tab > div.tab-content-4 {
			    visibility: visible;
			    height: auto;
			    background: #fff;
			}
			
			span {
			    display: none;
			}
	</style>
</head>
<body>
	<header>
		<div align="center">店家一覽</div>

	</header>
	<main>
	<div class="container" align="center">
		<span id="tab-1">主頁</span>
		<span id="tab-2">頁面1</span>
		<span id="tab-3">頁面2</span>
		<span id="tab-4">頁面3</span>
		
		<!-- 頁籤按鈕 -->
		<div id="tab">
		    <ul>
		        <li><a href="#tab-1">主頁</a></li>
		        <li><a href="#tab-2">j開頭</a></li>
		        <li><a href="#tab-3">A開頭</a></li>
		        <li><a href="#tab-4">W開頭</a></li>
		    </ul>
		
		    <!-- 頁籤的內容區塊 -->
		    <div class="tab-content-1">
<!-- 		     <div class="container" > -->
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
<!-- 			</div> -->
		    </div>
		    <div class="tab-content-2">
		      <div class="row" align="center">
					<c:forEach items="${listRetailer}" var="retailer">
					<c:if test='${fn:startsWith(retailer.rName,"j")||fn:startsWith(retailer.rName,"J")}'>
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
		    </div>
		    <div class="tab-content-3">
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
		    </div>
		    
		    <div class="tab-content-4">
		       <div class="row" align="center">
					<c:forEach items="${listRetailer}" var="retailer">
					<c:if test='${fn:startsWith(retailer.rName,"W")}'>
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
		    </div>
	</div>
<!-- 	<ul class="nav nav-tabs" id="myTab" role="tablist"> -->
<!-- 	  <li class="nav-item" role="presentation"> -->
<!-- 	    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">Home</button> -->
<!-- 	  </li> -->
<!-- 	  <li class="nav-item" role="presentation"> -->
<!-- 	    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">Profile</button> -->
<!-- 	  </li> -->
<!-- 	  <li class="nav-item" role="presentation"> -->
<!-- 	    <button class="nav-link" id="messages-tab" data-bs-toggle="tab" data-bs-target="#messages" type="button" role="tab" aria-controls="messages" aria-selected="false">Messages</button> -->
<!-- 	  </li> -->
<!-- 	  <li class="nav-item" role="presentation"> -->
<!-- 	    <button class="nav-link" id="settings-tab" data-bs-toggle="tab" data-bs-target="#settings" type="button" role="tab" aria-controls="settings" aria-selected="false">Settings</button> -->
<!-- 	  </li> -->
<!-- 	</ul> -->

<!-- 	<div class="tab-content"> -->
<!-- 	  <div class="tab-pane active" id="home" role="tabpanel" aria-labelledby="home-tab"> -->
<!-- 	  <div class="container" align="center"> -->
<!-- 		<div class="row"> -->
<%-- 			<c:forEach items="${listRetailer}" var="retailer"> --%>
<!-- 				<div class="card" style="width: 18rem;"> -->
<%-- 					<a href="${contextRoot}/retailerGetAllItem?id=${retailer.rid}"> --%>
<%-- 					<img src="${contextRoot}/showlogo/${retailer.rid}"  --%>
<!-- 					class="card-img-top" alt="..."> -->
<!-- 					</a> -->
<!-- 					<div class="card-body"> -->
<%-- 						<p class="card-text">${retailer.rName}</p> --%>
<!-- 					</div> -->

<!-- 				</div> -->
<%-- 			</c:forEach> --%>
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	  </div> -->
<!-- 	  <div class="tab-pane" id="profile" role="tabpanel" aria-labelledby="profile-tab">...</div> -->
<!-- 	  <div class="tab-pane" id="messages" role="tabpanel" aria-labelledby="messages-tab">...</div> -->
<!-- 	  <div class="tab-pane" id="settings" role="tabpanel" aria-labelledby="settings-tab">...</div> -->
<!-- 	</div> -->


<!-- 	<div class="container" align="center"> -->
<!-- 		<div class="row"> -->
<%-- 			<c:forEach items="${listRetailer}" var="retailer"> --%>
<!-- 				<div class="card" style="width: 18rem;"> -->
<%-- 					<a href="${contextRoot}/retailerGetAllItem?id=${retailer.rid}"> --%>
<%-- 					<img src="${contextRoot}/showlogo/${retailer.rid}"  --%>
<!-- 					class="card-img-top" alt="..."> -->
<!-- 					</a> -->
<!-- 					<div class="card-body"> -->
<%-- 						<p class="card-text">${retailer.rName}</p> --%>
<!-- 					</div> -->

<!-- 				</div> -->
<%-- 			</c:forEach> --%>
<!-- 		</div> -->
<!-- 	</div> -->

	</main>
<!-- 	<script type="text/javascript"> -->
<!--          $(".nav-link").click(function(){ -->
<!--          	console.log("xx"); -->
<!--          	$($(this).addClass('active').find('button').attr('data-bs-target')).siblings('.tab-pane fade').hide(); -->
<!--              $($(this).find('button'). attr ('aria-controls')).show().siblings ('.tab-pane').hide(); -->
<!--              $(this).addClass('active'). siblings ('.active').removeClass('active'); -->
<!--          }); -->

<!-- </script> -->
</body>
</html>