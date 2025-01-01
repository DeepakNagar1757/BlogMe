<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>BlogMe</title>
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

	<!-- Banner -->
	<div class="container-fluid p-0 m-0">
		<div class="jumbotron primarybackground bannerbackground ">
			<div class="container text-center">
				<h3 class="display-4">BlogMe</h3>
				<p>A blog is an informational website consisting of discrete,
					often informal diary-style text entries/posts.</p>
				<p>Posts are typically displayed in reverse chronological order
					so that the most recent post appears first, at the top of the web
					page.</p>
				<p>In the 2000s, blogs were often the work of a single
					individual, occasionally of a small group, and often covered a
					single subject or topic.</p>
				<div class="container">
					<a href="registration.jsp" class="btn btn-outline-dark "><span
						class="far fa-edit"></span> Start! It's Free</a> <a
						href="login_page.jsp" class="btn btn-outline-dark "><span
						class="fas fa-sign-in-alt"></span> Login</a>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row mb-2">
			<div class="col-md-4">
				<div class="card navbar">
					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Java was originally developed by James
							Gosling at Sun Microsystems</p>
						<a href="#" class="btn btn-outline-dark">Read more</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card navbar">
					<div class="card-body">
						<h5 class="card-title">Rust Programming</h5>
						<p class="card-text">Rust was originally developed by James
							Gosling at Sun Microsystems.</p>
						<a href="#" class="btn btn-outline-dark">Read more</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card navbar">
					<div class="card-body">
						<h5 class="card-title">Ruby Programming</h5>
						<p class="card-text">Ruby was originally developed by James
							Gosling at Sun Microsystems.</p>
						<a href="#" class="btn btn-outline-dark">Read more</a>
					</div>
				</div>
			</div>
		</div>

		<div class="row mb-4">
			<div class="col-md-4">
				<div class="card navbar">
					<div class="card-body">
						<h5 class="card-title">C# Programming</h5>
						<p class="card-text">C# was originally developed by James
							Gosling at Sun Microsystems.</p>
						<a href="#" class="btn btn-outline-dark">Read more</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card navbar">
					<div class="card-body">
						<h5 class="card-title">Python Programming</h5>
						<p class="card-text">Python was originally developed by James
							Gosling at Sun Microsystems.</p>
						<a href="#" class="btn btn-outline-dark">Read more</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card navbar">
					<div class="card-body">
						<h5 class="card-title">C++ Programming</h5>
						<p class="card-text">C++ was originally developed by James
							Gosling at Sun Microsystems.</p>
						<a href="#" class="btn btn-outline-dark">Read more</a>
					</div>
				</div>
			</div>
		</div>
	</div>

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