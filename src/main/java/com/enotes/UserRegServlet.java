package com.enotes;

import java.io.IOException;
import java.util.Date;  
import java.text.SimpleDateFormat;  

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/register")
public class UserRegServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
	    Date date = new Date(); 
		
		String fullName = req.getParameter("fullName");
		String email = req.getParameter("email");
        String password = req.getParameter("password");
        String ContactNo = req.getParameter("ContactNo");
        String about = req.getParameter("about");       
        String role = "ROLE_USER";
        String RegDate = formatter.format(date);
               
        try {
            UserDtls u=new UserDtls(fullName,email,password,ContactNo,about,role,RegDate);
            UserDAO.regUser(u);
            resp.sendRedirect("register.jsp?msg=valid");
        } catch (Exception e) {
            resp.getWriter().println("Error " + e.getMessage());
        }
	}	
}
