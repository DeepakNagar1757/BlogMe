<%@page import="java.util.List"%>

<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.blogme.entities.Catagory"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.blogme.helper.ConnectionProvider"%>
<%@page import="com.blogme.dao.PostDao"%>
<%@page import="com.blogme.entities.User"%>
<%@ page import="com.blogme.entities.Message"%>
<%@page errorPage="error_page.jsp"%>
<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login_page.jsp");
} else {

}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
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
	<!-- Navbar -->


	<!------------- navbar ----------->
	<nav class="navbar navbar-expand-lg navbar-light navbar">
		<a class="navbar-brand" href="index.jsp"><span
			class="fab fa-alipay" style="font-size: 25px;"></span> BlogMe</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp"><span class="fas fa-home"></span> Home <span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link" href="#"><span
						class="fas fa-users"></span> About Us</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> More </a>
					<div class="dropdown-menu dropdownaction"
						aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Blogs</a> <a
							class="dropdown-item" href="#">Community</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Contact Us</a>
					</div>
				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#add-post-modal"><span
						class="fa-solid fa-blog"></span> <b>POST</b></a></li>
				</li>
			</ul>
			<ul class="navbar-nav mr-right">
				<li class="nav-item"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#profile-modal"><%=user.getName()%></a></li>
				<li class="nav-item"><a class="nav-link" href="LogoutServlet"><span
						class="fa-solid fa-right-from-bracket"></span>Logout</a></li>
			</ul>
		</div>
	</nav>


	<!-- Navbatr End -->

	<%
	Message m = (Message) session.getAttribute("msg");
	if (m != null) {
	%>
	<div class="alert <%=m.getCssClass()%> mb-0 text-center" role="alert">
		<%=m.getContent()%>
	</div>
	<%
	session.removeAttribute("msg");
	}
	%>

	<!-- start of profile modal -->


	<!-- Modal -->
	<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primarybackground">
					<h5 class="modal-title" id="exampleModalLabel">BlogMe</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="profile_pics/<%=user.getProfile()%>" class="img-fluid "
							style="border-radius: 50%; height: 120px; width: 150px; background: rgba(255, 0, 0, 0.5);">
						<h5 class="modal-title mt-3" id="exampleModalLabel"><%=user.getName()%></h5>

						<!-- Details of User -->
						<div id="profile-detail">

							<table class="table">

								<tbody>
									<tr>
										<th scope="row">ID :</th>
										<td><%=user.getIdUser()%></td>

									</tr>
									<tr>
										<th scope="row">Email :</th>
										<td><%=user.getEmail()%></td>

									</tr>
									<tr>
										<th scope="row">Gender :</th>
										<td><%=user.getGender()%></td>

									</tr>
								</tbody>
							</table>
						</div>

						<!-- end of details -->
						<!-- Edit profile -->
						<div id="profile-edit" style="display: none;"">
							<h3 class="mt-2">PLease Edit Carefully</h3>
							<form action="EditServlet" method="post"
								enctype="multipart/form-data">
								<table class="table">
									<tr>
										<td>ID :</td>
										<td><%=user.getIdUser()%></td>
									</tr>
									<tr>
										<td>EMAIL :</td>
										<td><input type="email" class="form-control	"
											name="user_email" value="<%=user.getEmail()%>"></td>
									</tr>
									<tr>
										<td>NAME :</td>
										<td><input type="text" class="form-control	"
											name="user_name" value="<%=user.getName()%>"></td>
									</tr>
									<tr>
										<td>PASSWORD :</td>
										<td><input type="password" class="form-control	"
											name="user_password" value="<%=user.getPassword()%>"></td>
									</tr>
									<tr>
										<td>GENDER :</td>
										<td><%=user.getGender()%></td>
									</tr>
									<tr>
										<td>NEW PROFILE :</td>
										<td><input type="file" name="image" class="form-control"></td>
									</tr>
								</table>
								<div class="container">
									<button type="submit" class="btn btn-outline-dark">
										SAVE</button>
								</div>
							</form>
						</div>
						<!-- Edit profile -->

					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-dark"
						data-dismiss="modal">Close</button>
					<button id="edit-profile-btn" type="button"
						class="btn btn-outline-dark">Edit</button>
				</div>
			</div>
		</div>
	</div>


	<!-- End of profile modal -->


	<!-- Start of post generation modal -->

	<!-- Modal -->
	<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Create Post</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="add-post-form" action="AddPostServlet" method="post">
						<div class="form-group">
							<select class="form-control" name="cid">
								<option selected disabled>---Select Catagory---</option>
								<%
									PostDao postD=new PostDao(ConnectionProvider.getConnection());
									 ArrayList<Catagory> list=postD.getAllCategories();
									 for(Catagory c:list)
									 {		 
								%>
								<option value="<%= c.getIdcatagories() %>"><%=c.getName() %></option>
								<%
								}
								%>
							</select>
						</div>

						<div class="form-group">
							<input type="text" name="ptitle" placeholder="Title" class="form-control">
						</div>
						<div class="form-group">
							<textarea rows="5" name="pcontent" class="form-control"
								placeholder="Content"></textarea>
						</div>
						<div class="form-group">
							<textarea rows="5" name="pcode" class="form-control"
								placeholder="Code(if any)"></textarea>
						</div>
						<div>
							<label>Select Image</label> <br> <input type="file" name="pic">
						</div>
						<br>
						<div class="container text-center">
							<button type="submit" class="btn btn-outline-dark">Post</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- End of post genreation modal -->

	<!--css script -->
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

			let editStatus = false;

			$('#edit-profile-btn').click(function() {
				if (editStatus == false) {
					$('#profile-detail').hide()

					$('#profile-edit').show();
					editStatus = true;
					$(this).text("Back")
				} else {
					$('#profile-detail').show()

					$('#profile-edit').hide();
					editStatus = false;
					$(this).text("Edit")
				}
			})
		});
	</script>
	
	<!-- adding java script for post -->
	
	<script>
    $(document).ready(function (e) {
    	#("add-post-form").on("submit",function(event){
    		event.preventDefault();
    		
    		let form=new FormData(this);
    		
    		$.ajax({
    			url:"AddPostServlet",
    			type:"Post",
    			data:form,
    			success:function (data,textStatus,jqXHR){
    				console.log("data submitted")
    			},
    			error:function (jqXHR,textStatus,errorThrown){
    				
    			},
    			processData:false,
    			contentType:false
    		})
    	})	
    })
</script>

	
	<!-- End of java script for post -->
	
</body>
</html>