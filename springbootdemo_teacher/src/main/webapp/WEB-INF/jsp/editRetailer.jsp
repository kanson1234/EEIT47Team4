<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>修改使用者資料</title>
</head>
<body>
	<main>
	<div class = "container" align="center">
		<form
			action="${contextRoot}/Retailer/editRetailer?id=${Retailerinfo.rid}"
			method="post" enctype="multipart/form-data">
			<table class="table">
				<thead>
				<template>
				<img width="150"
							src="${contextRoot}/showlogo/${Retailerinfo.rid}"
							class="bd-placeholder-img rounded-circle ">
				</template>
				</thead>
				
				<tbody> 
					<tr>
						<td>Shop Name : <input type="text" id="rName" name="rName"
							value="${Retailerinfo.rName}"></td>
					</tr>
					<tr>
						<td>Account:<input type="text" id="rAccount" name="rAccount"
							value="${Retailerinfo.raccount}"></td>
					</tr>
					<tr>
						<td>Password:<input type="text" id="rPwd" name="rPwd"
							value="${Retailerinfo.rpwd}"></td>
					</tr>
					<tr>
						<td>phone Number:<input type="text" id="rPhone" name="rPhone"
							value="${Retailerinfo.rphone}"></td>
					</tr>
					<tr>
						<td><label for="rInfo">information:</label>
						<textarea id="rInfo" name="rInfo" rows="5" cols="33">${Retailerinfo.rinfo}</textarea>
						</td>
					</tr>
					<tr>
						<td>Logo :<input type="file" name="logo">
						</td>
						</tr>
						<tr>
						<td><img width="150"
							src="${contextRoot}/showlogo/${Retailerinfo.rid}"></td>
					</tr>
					<tr>
					</tr>
					<tr>
						<td>Photo:<input type="file" name="photo">
						</td>
						</tr>
						<tr>
						<td><img width="150"
							src="${contextRoot}/showphoto/${Retailerinfo.rid}"></td>
					</tr>
					<tr>
						<td><input type="submit" value="修改"></td>
					</tr>
				</tbody>
			</table>
			<div>
			<a href = "${contextRoot}/Retailer/RetailerCRUD">
					回到查詢頁
			</a>
			</div>
		</form>
		</div>
	</main>
</body>
</html>