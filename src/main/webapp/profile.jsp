<%@page import="com.enotes.DBConnect"%>
<%@page import="java.sql.*"%>
<%
	String email = session.getAttribute("email").toString().trim();
    int uid;
    String fullName = "";
    String about = "";
	String ContactNo = "";	
	String role ="";
	String RegDate = "";
	
	
	try {
		Connection con = DBConnect.getConn();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from userdtls where email='" + email + "'");
		if (rs.next()) {
			uid=rs.getInt(1);
			fullName = rs.getString(2);
			about = rs.getString(3);
			ContactNo = rs.getString(4);
			role = rs.getString(7);
			RegDate = rs.getString(8);
		}
	} catch (Exception e) {
		System.out.println(e);
	}
%>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Enotes</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
       <div class="logo d-flex align-items-center">
        <img src="images/eNotes.png" alt="">
      </div>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">


        <li class="nav-item dropdown pe-3">

          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <span class="d-none d-md-block dropdown-toggle ps-2"><% out.println(fullName);%></span>
          </a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6><% out.println(fullName);%></h6>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="profile.jsp">
                <i class="bi bi-person"></i>
                <span>My Profile</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="changePassword.jsp">
                <i class="bi bi-gear"></i>
                <span>Account Settings</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="logout">
                <i class="bi bi-box-arrow-right"></i>
                <span>Sign Out</span>
              </a>
            </li>

          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->

      </ul>
    </nav><!-- End Icons Navigation -->

  </header><!-- End Header -->

  <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link" href="dashboard.jsp">
          <i class="bi bi-grid"></i>
          <span>Dashboard</span>
        </a>
      </li><!-- End Dashboard Nav -->


      <li class="nav-item">
        <a class="nav-link collapsed" href="profile.jsp">
          <i class="bi bi-person"></i>
          <span>Profile</span>
        </a>
      </li><!-- End Profile Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="addNotes.jsp">
          <i class="bi bi-question-circle"></i>
          <span>Add Notes</span>
        </a>
      </li><!-- End F.A.Q Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="viewNotes.jsp">
          <i class="bi bi-envelope"></i>
          <span>View Notes</span>
        </a>
      </li><!-- End Contact Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="changePassword.jsp">
          <i class="bi bi-card-list"></i>
          <span>Change Password</span>
        </a>
      </li><!-- End Register Page Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="logout">
          <i class="bi bi-box-arrow-in-right"></i>
          <span>Logout</span>
        </a>
      </li><!-- End Login Page Nav -->
    </ul>

  </aside><!-- End Sidebar-->

  <main id="main" class="main">

<%
		String succMsg = (String) session.getAttribute("succMsg");
		String failedMsg = (String) session.getAttribute("failedMsg");

		if (succMsg != null) {
	%>
	<script>
		alert("Profile Updated Successfully..");
		//window.location.assign("profile.jsp");
	</script>
	<%
		session.removeAttribute("succMsg");
		}
	%>
	<%
		if (failedMsg != null) {
	%>
	<script>
		alert("Something wrong on server..!!!");
	</script>
	<%
		session.removeAttribute("failedMsg");
		}
	%>
	
	<div class="pagetitle">
		<h1>Profile</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="dashboard.jsp">Home</a></li>
				<li class="breadcrumb-item active">Profile</li>
			</ol>
		</nav>
	</div>
	<!-- End Page Title -->
	<%
		String emailid = session.getAttribute("email").toString();

		try {
			Connection con = DBConnect.getConn();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from userdtls where email='" + emailid + "'");
			int i = 0;
			while (rs.next()) {
				i++;
	%>
	<section class="section profile">
		<div class="row">
			<div class="col-xl-4">

				<div class="card">
					<div
						class="card-body profile-card pt-4 d-flex flex-column align-items-center">

						<h2><%=rs.getString("fullName")%></h2>
						<h3><%=rs.getString("about")%></h3>
						
					</div>
				</div>
			</div>

			<div class="col-xl-8">

				<div class="card">
					<div class="card-body pt-3">
						<!-- Bordered Tabs -->
						<ul class="nav nav-tabs nav-tabs-bordered">

							<li class="nav-item">
								<button class="nav-link active" data-bs-toggle="tab"
									data-bs-target="#profile-overview">Overview</button>
							</li>

							<li class="nav-item">
								<button class="nav-link" data-bs-toggle="tab"
									data-bs-target="#profile-edit">Edit Profile</button>
							</li>

						</ul>
						<div class="tab-content pt-2">

							<div class="tab-pane fade show active profile-overview"
								id="profile-overview">

								<h5 class="card-title">Profile Details</h5>

								<div class="row">
									<div class="col-lg-3 col-md-4 label ">Full Name</div>
									<div class="col-lg-9 col-md-8"><%=rs.getString("fullName")%></div>
								</div>

								<div class="row">
									<div class="col-lg-3 col-md-4 label ">About</div>
									<div class="col-lg-9 col-md-8"><%=rs.getString("about")%></div>
								</div>

								<div class="row">
									<div class="col-lg-3 col-md-4 label">Email ID</div>
									<div class="col-lg-9 col-md-8"><%=rs.getString("email")%></div>
								</div>

								<div class="row">
									<div class="col-lg-3 col-md-4 label">Contact Number</div>
									<div class="col-lg-9 col-md-8"><%=rs.getString("ContactNo")%></div>
								</div>

								<div class="row">
									<div class="col-lg-3 col-md-4 label">Registration Date</div>
									<div class="col-lg-9 col-md-8"><%=rs.getString("RegDate")%></div>
								</div>
							</div>

							<div class="tab-pane fade profile-edit pt-3" id="profile-edit">

								<!-- Profile Edit Form -->
								<form action="editProfile" method="post">
									<input type="hidden" value="<%=rs.getInt("id")%>" name="id">

									<div class="row mb-3">
										<label class="col-md-4 col-lg-3 col-form-label">Full Name</label>
										<div class="col-md-8 col-lg-9">
											<input name="fullName" type="text" class="form-control"
												value="<%=rs.getString("fullName")%>">
										</div>
									</div>

									<div class="row mb-3">
										<label class="col-md-4 col-lg-3 col-form-label">Phone</label>
										<div class="col-md-8 col-lg-9">
											<input name="ContactNo" type="text" class="form-control"
												value="<%=rs.getString("ContactNo")%>">
										</div>
									</div>

									<div class="row mb-3">
										<label class="col-md-4 col-lg-3 col-form-label">About</label>
										<div class="col-md-8 col-lg-9">
											<input name="about" type="text" class="form-control"
												value="<%=rs.getString("about")%>">
										</div>
									</div>

									<div class="row mb-3">
										<label class="col-md-4 col-lg-3 col-form-label">Email</label>
										<div class="col-md-8 col-lg-9">
											<input name="email" type="email" class="form-control"
												value="<%=rs.getString("email")%>" readonly>
										</div>
									</div>

									<div class="text-center">
										<button type="submit" class="btn btn-primary">Update</button>
									</div>
								</form>
								<!-- End Profile Edit Form -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%
		}
	%>
	<%
		} catch (Exception e) {
			System.out.println(e);
		}
	%>

  </main><!-- End #main -->
  
  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">
     
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/chart.js/chart.min.js"></script>
  <script src="assets/vendor/echarts/echarts.min.js"></script>
  <script src="assets/vendor/quill/quill.min.js"></script>
  <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>
</html>
