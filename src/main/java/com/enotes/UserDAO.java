package com.enotes;

import java.sql.*;

public class UserDAO {

	private Connection con;

	public UserDAO(Connection con) {
		super();
		this.con = con;
	}

	// Insert User Details
	public static void regUser(UserDtls u) throws Exception {
		Connection con = DBConnect.getConn();
		PreparedStatement ps = con.prepareStatement(
				"INSERT into userdtls(fullName,about,ContactNo,email,password,role,RegDate) VALUES(?,?,?,?,?,?,?)");
		ps.setString(1, u.getFullName());
		ps.setString(2, u.getAbout());
		ps.setString(3, u.getContactNo());
		ps.setString(4, u.getEmail());
		ps.setString(5, u.getPassword());
		ps.setString(6, u.getRole());
		ps.setString(7, u.getRegDate());

		ps.executeUpdate();
		con.close();
	}

	// insert user login
	public UserDtls loginUser(String e, String p) {
		UserDtls user = null;
		try {
			String sql = "select * from userdtls where email=? and password=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, e);
			ps.setString(2, p);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				user = new UserDtls();
				user.setId(rs.getInt(1));
				user.setFullName(rs.getString(2));
				user.setAbout(rs.getString(3));
				user.setContactNo(rs.getString(4));
				user.setEmail(rs.getString(5));
				user.setPassword(rs.getString(6));
				user.setRole(rs.getString(7));
				user.setRegDate(rs.getString(8));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return user;
	}

	// Update edit User code here
	public boolean updateUserProfile(UserDtls u) {
		boolean f = false;
		try {
			String sql = "update userdtls set fullName=?, about=?, ContactNo=? where id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, u.getFullName());
			ps.setString(2, u.getAbout());
			ps.setString(3, u.getContactNo());
			ps.setInt(4, u.getId());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}
