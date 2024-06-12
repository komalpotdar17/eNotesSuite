<%@page import="com.enotes.DBConnect"%>
<%@page import="java.sql.*"%>
<%
	String email = session.getAttribute("email").toString();
	String oldPassword = request.getParameter("oldpassword");
	String newPassword = request.getParameter("newpassword");
	String confirmPassword = request.getParameter("confirmpassword");

	if (!confirmPassword.equals(newPassword))
		response.sendRedirect("changePassword.jsp?msg=notMatch");
	else {
		int check = 0;
		try {
			Connection con = DBConnect.getConn();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(
					"select * from userdtls where email='" + email + "' and password='" + oldPassword + "'");
			while (rs.next()) {
				check = 1;
				st.executeUpdate("update userdtls set password='" + newPassword + "' where email='" + email + "'");
				response.sendRedirect("changePassword.jsp?msg=done");
			}
			if (check == 0)
				response.sendRedirect("changePassword.jsp?msg=wrong");
		} catch (Exception e) {
			System.out.println(e);
		}
	}
%>