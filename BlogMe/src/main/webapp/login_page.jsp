<%@page import="org.eclipse.jdt.internal.compiler.ast.IfStatement"%>
<%@page import="com.blogme.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<style>
.bannerbackground {
	clip-path: polygon(20% 0%, 80% 0%, 100% 0, 100% 94%, 76% 100%, 34% 94%, 0 100%, 0 0
		);
}

.darkcyan {
	background: #548687;
}

.primarybackground {
	background: #FCAA67;
}

.navbar {
	background: #B0413E;
}

.dropdownaction {
	background: #B0413E;
}

.searcharea {
	background: #473335;
	color: black;
}

.searcharea::placeholder {
	color: white;
}
</style>
</head>
<body>

	<%@include file="default_navbar.jsp"%>

	<main
		class="d-flex align-items-center primarybackground bannerbackground"
		style="height: 90vh">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div
							class="card-header navbar rounded d-flex justify-content-center pb-2">
							<h5>
								<span class="fas fa-user-circle fa-2x d-block text-center"></span>Login
							</h5>
						</div>
						
						<%
							Message m=(Message)session.getAttribute("msg");
							if(m!=null){
						%>
						<div class="alert <%=m.getCssClass() %> mb-0 text-center" role="alert">
							<%=
								m.getContent()
							%>
						</div>
						 <%
						 session.removeAttribute("msg");
							}
						 %>
						 
						<div class="card-body navbar rounded d-block">
							<form action="LoginServlet" method="post">
								<div class="form-group">
									<label for="exampleInputEmail1 ">Email address </label> <input
										type="email" name="email" required
										class="form-control searcharea" id="exampleInputEmail1"
										aria-describedby="emailHelp" placeholder="Enter email">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" name="password" required
										class="form-control searcharea" id="exampleInputPassword1"
										placeholder="Password">
								</div>
								<div class="container text-center">
									<button type="submit" class="btn btn-outline-dark">Submit</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>