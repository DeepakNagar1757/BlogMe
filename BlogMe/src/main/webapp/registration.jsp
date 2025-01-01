<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>Regitration Page</title>
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
		style="height: 110vh">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div
							class="card-header navbar rounded d-flex justify-content-center pb-2">
							<h5>
								<span class="fas fa-user-circle fa-2x d-block text-center"></span>Registration
								Page
							</h5>
						</div>
						<div class="card-body navbar rounded d-block">
							<form id="reg-form" action="RegServlet" method="post">
								<div class="form-group">
									<label for="exampleInputEmail1 ">User Name </label> <input
										name="user_name" type="text" class="form-control searcharea"
										placeholder="Enter User Name">
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1 ">Email address </label> <input
										name="user_email" type="email" class="form-control searcharea"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										placeholder="Enter email">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										name="user_password" type="password"
										class="form-control searcharea" id="exampleInputPassword1"
										placeholder="Password">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Gender</label><br> <input
										type="radio" name="gender" id="gender" value="Male">
									Male <input type="radio" name="gender" id="gender"
										value="Female"> Female
								</div>
								<div class="form-check">
									<input name="check" type="checkbox" class="form-check-input "
										id="exampleCheck1"> <label class="form-check-label"
										for="exampleCheck1" required>Terms and Condition</label>
								</div>
								<br>
								<button type="submit" class="btn btn-outline-dark">Submit</button>
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
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script>
		$(document).ready(function() {
			console.log("Loaded...");

			$('#reg-form').on('submit', function(event) {
				event.preventDefault();
				
				if (!$('#exampleCheck1').is(':checked')) {
		            Swal.fire({
		                title: "Please accept the Terms and Conditions",
		                icon: "warning"
		            });
		            return; // Stop the submission if not checked
		        }
				
				let form = new FormData(this);
				// Send to register servlet
				$.ajax({
					url : "RegServlet",
					type : 'post',
					data : form,
					success : function(data, textStatus, jqXHR) {
						console.log(data);
						
						 Swal.fire({
			                    title: "You have been Registered..! ",
			                    icon: "success"
			                }).then(() => {
			                    // Redirect after the user acknowledges the alert
			                    window.location = "login_page.jsp";
			                });
						// Handle success (e.g., redirect or show a success message)
					},
					error : function(jqXHR, textStatus, errorThrown) {
						 console.log("AJAX call failed");
						console.log(jqXHR);
						// Handle error (e.g., show an error message)
						Swal.fire({
		                    title: "Registration Failed",
		                    text: "Please try again.",
		                    icon: "error"
		                });
					},
					processData : false,
					contentType : false
				});
			});
		});
	</script>

</body>
</html>