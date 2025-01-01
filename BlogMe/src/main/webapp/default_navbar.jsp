

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
			<li class="nav-item active"><a class="nav-link" href="index.jsp"><span
					class="fas fa-home"></span> Home <span class="sr-only">(current)</span></a>
			</li>
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
				</div></li>
		</ul>
		<form class="form-inline my-2 my-lg-0 ">
			<input class="form-control mr-sm-2 searcharea" type="search"
				placeholder="Search" aria-label="Search">
			<button class="btn btn-outline-dark my-2 my-sm-0" type="submit">
				<b>Search</b>
			</button>
		</form>
	</div>
</nav>