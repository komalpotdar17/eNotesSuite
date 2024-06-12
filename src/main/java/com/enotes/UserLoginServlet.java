package com.enotes;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/login")
public class UserLoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String pass = req.getParameter("password");
		
		UserDAO dao = new UserDAO(DBConnect.getConn());
		UserDtls u = dao.loginUser(email, pass);
		
		HttpSession session = req.getSession();
		if(u!=null) {
			session.setAttribute("email", email);
			session.setAttribute("userId", u.getId());
			session.setAttribute("validMsg", "Successfully Login...");
			resp.sendRedirect("login.jsp");			
		}
		else {
			session.setAttribute("invalidMsg", "Invalid Email & Password");
			resp.sendRedirect("login.jsp");			
		}
	}

}