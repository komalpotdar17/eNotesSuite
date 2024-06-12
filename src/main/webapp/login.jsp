<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Form</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" type="text/css" href="component/login.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
</head>
<body>

	<%
		String validMsg = (String) session.getAttribute("validMsg");
		String invalidMsg = (String) session.getAttribute("invalidMsg");

		if (validMsg != null) {
	%>
	<script>
		alert("Successfully Login...");
		window.location.assign("dashboard.jsp");
	</script>
	<%
		session.removeAttribute("validMsg");
		}
	%>
	<%
		if (invalidMsg != null) {
	%>
	<script>
		alert("Something went Wrong..!!");
		window.location.assign("login.jsp");
	</script>
	<%
		session.removeAttribute("invalidMsg");
		}
	%>
	
<div class="container">
    <div class="row px-3">
        <div class="col-lg-10 col-xl-9 card flex-row mx-auto px-0">
            <div class="img-left d-none d-md-flex"></div>

            <div class="card-body">
                <h4 class="title text-center mt-4">
                    Login
                </h4>
                <form class="form-box px-3" action="login" method="post">
                    
                    <div class="form-input">
                        <span><i class="fa fa-envelope-o"></i></span>
                        <input type="email" name="email" placeholder="Email Address" tabindex="10" required>
                    </div>
                    <div class="form-input">
                        <span><i class="fa fa-key"></i></span>
                        <input type="password" name="password" placeholder="Password" required>
                    </div>

                    <div class="mb-3">
                        <button type="submit" class="btn btn-block text-uppercase">
                            Login
                        </button>
                    </div>


                    <div class="text-center mb-3">

                    </div>

                    <div class="row mb-3">
                            <a href="index.jsp" class="btn btn-block btn-social btn-facebook">
                                Back to Home
                            </a>
                    </div>

                    <hr class="my-4">

                    <div class="text-center mb-2">
                        Don't have an account?
                        <a href="register.jsp" class="register-link">
                            Register here
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>