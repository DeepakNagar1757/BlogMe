<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sorry something went wrong...!!</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<!-- Internal Css for content--->
<style>
.bannerbackground {
	clip-path: polygon(20% 0%, 80% 0%, 100% 0, 100% 94%, 76% 100%, 34% 94%, 0 100%, 0 0
		);
}
.primarybackground {
	background: #FCAA67;
}
</style>
</head>
<body>
	<div class="container text-center">
		<img src="images/system.png" class="img-fluid mt-5" style="max-width: 300px; height: auto;">
		<h3 class="display-3">Oops..!!Something went wrong..</h3>
		<%= exception %>
		<br>
		<a href="index.jsp" class="btn primarybackground btn-lg text-white mt-3">Home</a>
	</div>
</body>
</html>