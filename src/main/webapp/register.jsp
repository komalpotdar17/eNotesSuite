<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Form</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" type="text/css" href="component/login.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
</head>
<body>

<%
	String msg = request.getParameter("msg");
	if ("valid".equals(msg)) {
%>
<script>
	alert("Registration Successfully..");
	window.location.assign("login.jsp");
</script>
<%
	}
%>

	<div class="container">
		<div class="row px-3">
			<div class="col-lg-10 col-xl-9 card flex-row mx-auto px-0">
				<div class="img-left d-none d-md-flex"></div>

				<div class="card-body">
					<h4 class="title text-center mt-4">Registration Form</h4>
					<form class="form-box px-3" action="register" method="post">

						<div class="form-input">
							<span><i class="fa fa-user"></i></span> <input type="text"
								name="fullName" placeholder="Enter Full Name" required>
						</div>

						<div class="form-input">
							<span><i class="fa fa-envelope-o"></i></span> <input type="email"
								name="email" placeholder="Email Address" required>
						</div>

						<div class="form-input">
							<span><i class="fa fa-key"></i></span> <input type="password"
								name="password" placeholder="Password" required>
						</div>

						<div class="form-input">
							<span><i class="fa fa-phone"></i></span> <input type="text"
								name="ContactNo" placeholder="Enter Contact No." maxlength="10"
								required>
						</div>

						<div class="form-input">
							<span><i class="fa fa-address-card"></i></span>
							<textarea name="about" placeholder="About...." required></textarea>
						</div>

						<div class="mb-3">
							<button type="submit" class="btn btn-block text-uppercase">
								Submit</button>
						</div>

						<div class="row mb-3">
							<a href="index.jsp" class="btn btn-block btn-social btn-facebook">
								Back to Home </a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>