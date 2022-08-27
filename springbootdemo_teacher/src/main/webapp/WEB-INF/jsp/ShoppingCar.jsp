<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
				<!doctype html>
				<html lang="en">

				<jsp:include page="layout/navbar.jsp" />
				<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

				<head>
					<script src="/js/jquery-3.6.0.min.js"></script>
					<meta charset="utf-8">
					<meta name="viewport" content="width=device-width, initial-scale=1">
					<meta name="description" content="">
					<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
					<meta name="generator" content="Hugo 0.88.1">
					<title>會員中心</title>

					<!-- <link rel="canonical" href="https://bootstrap5.hexschool.com/docs/5.1/examples/dashboard/"> -->

					<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
						rel="stylesheet"
						integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
						crossorigin="anonymous">
					<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
						integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
						crossorigin="anonymous"></script>

					<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0"
                    crossorigin="anonymous"> -->
					<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
						integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
						crossorigin="anonymous"></script>










					<!-- Custom styles for this template -->
					<!-- <link href="dashboard.css" rel="stylesheet"> -->
				</head>

				<body>
					<!-- C1SearchBar -->
					<jsp:include page="C1Bar\C1SearchBar.jsp" />
					<!-- C1SearchBar -->

					<div class="container-fluid">
						<div class="row">

							<!-- C1SideBar -->
							<jsp:include page="C1Bar\C1SideBar.jsp" />
							<!-- C1SideBar -->

							<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
								<c:if test="${!empty findAllToA1}">
									<h2>購物紀錄</h2>
								</c:if>

								<div class="table-responsive">
									<table class="table table-striped table-sm" id="SCtable">
										<thead>
											<tr>
												<th scope="col"
													style="vertical-align: middle; text-align: center; vertical-align: top">
													商品名稱</th>
												<th scope="col"
													style="vertical-align: middle; text-align: center; vertical-align: top">
													商品圖片</th>
												<th scope="col"
													style="vertical-align: middle; text-align: center; vertical-align: top">
													價格</th>
												<th scope="col"
													style="vertical-align: middle; text-align: center; vertical-align: top">
													購買數量</th>
												<th scope="col"
													style="vertical-align: middle; text-align: center; vertical-align: top">
													廠商名稱</th>
												<th scope="col"
													style="vertical-align: middle; text-align: center; vertical-align: top">
												</th>
											</tr>
										</thead>

										<h2>我的購物車</h2>
										<tbody>

											<% int z=0; %>
												<c:forEach items="${data}" var="findall">
													<tr>
														<td id="a<%=z%>" style="display:none ;">${findall.shophousebean.id}</td>
														<td style="vertical-align: middle; text-align: center;">
															${findall.shophousebean.itemName}</td>
														<td style="vertical-align: middle; text-align: center;"><a
																href="${pageContext.request.contextPath}/ShopHouse/itemDetail/"
																+${findall.shophousebean.id}> <img width="150"
																	src="${pageContext.request.contextPath}/downloadImg/${findall.shophousebean.id}"></a>
														</td>
														<td style="vertical-align: middle; text-align: center;"
															id="b<%=z%>">${findall.shophousebean.price}</td>
															
															<td style="vertical-align: middle; text-align: center;"> <input  style="width: 50px " type="number" id="c<%=z%>" value="${findall.scCount}"> </td>
															
															
<!-- 														<td style="vertical-align: middle; text-align: center;" -->
<%-- 															id="c<%=z%>">${findall.scCount}</td> --%>
															
															
															
															
															
														<td style="vertical-align: middle; text-align: center;"><a
																href="${pageContext.request.contextPath}/retailerGetAllItem?id=${findall.shophousebean.retailerBean.rid }">
																${findall.shophousebean.retailerBean.rName} </a></td>
														<td style="vertical-align: middle; text-align: center;"><a
																href="${pageContext.request.contextPath}/ShoppingCar/removebyscid?scid=${findall.scId }">
																<button>刪除</button>
															</a></td>
														<% z++; %>
													</tr>
												</c:forEach>

										</tbody>

									</table>
									<button id="stepsubmit">送出</button>

									<script>
										$(document).ready(function () {

											var table = document.getElementById("SCtable");

											var tbodyRowCount = table.tBodies[0].rows.length;
											console.log(tbodyRowCount);

											$("#stepsubmit").click(function () {
												
												var sclistArray = [];
											
												for (var i = 0; i < tbodyRowCount; i++) {
													var sclist = {};
													sclist.scid = $("#a" + i).text()
													sclist.price = $("#b" + i).text()
													sclist.sccount = $("#c" + i).text()
													sclist.scTotalPrice = ($("#b" + i).text() * $("#c" + i).text())
													
													sclistArray.push(sclist)
												}
												console.log(sclistArray)
												
												var JSONsc = JSON.stringify(sclistArray);
												console.log(JSONsc)
												
												$.ajax({
												url: 'http://localhost:8080/ShoppingCar/checkout',
												contentType: 'application/json', // 送過去的資料型別
												dataType: "text", // 回傳回來的資料型別
												method: 'post',
												data: JSONsc,
												success:function (result){
<<<<<<< HEAD
													alert(result);
=======
													alert(result)
>>>>>>> 1f186395f41f3665bd8479f4fc6bf1b484b2bec1
													window.location.href="http://localhost:8080/Member/MemberCenter"
												}


												})

											})
										})
									</script>



								</div>
							</main>
						</div>
					</div>


					<script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
						integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
						crossorigin="anonymous"></script>
					<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"
						integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha"
						crossorigin="anonymous"></script>
				</body>

				</html>