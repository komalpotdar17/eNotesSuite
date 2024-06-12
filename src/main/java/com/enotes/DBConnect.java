package com.enotes;

import java.sql.*;

public class DBConnect {
  private static Connection con;
  public static Connection getConn() {
	  try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/enotesjsp","root","root");		  		  
	  } catch (Exception e) {
		  e.printStackTrace();
	}
	  return con;
  }  
}