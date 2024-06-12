
package com.enotes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;




public class NotesDAO {
	
	private Connection con;

	public NotesDAO(Connection con) {
		super();
		this.con = con;
	}
	
	//Add Notes 
  	public boolean addNotes(Notes app) {
  		boolean f=false;
  		
  		try {
  			String sql="insert into notes(title,content,emailid,creationDate,file) values(?,?,?,?,?)";
  			PreparedStatement ps=con.prepareStatement(sql);
  			ps.setString(1, app.getTitle());
  			ps.setString(2, app.getContent()); 
  			ps.setString(3, app.getEmailid().trim());
  			ps.setString(4, app.getCreationDate());
  			ps.setString(5,app.getFile());
  			int i=ps.executeUpdate();
  			
  			if(i==1) {
  				f=true;
  			}			
  		} catch (Exception e) {
  			e.printStackTrace();
  		}
  		return f;
  	}
  	
  	//View Notes 
  	public List<Notes> getAllNotes(String email) {  		
  		List<Notes> list = new ArrayList<Notes>();
  		Notes b=null;
		
	    try {        
		   String sql="select * from notes where emailid='"+email+"'";
		   PreparedStatement ps = con.prepareStatement(sql);
		   ResultSet rs = ps.executeQuery();
		   
		   while(rs.next()) {
			   
			b=new Notes();
			b.setId(rs.getInt(1));
			b.setTitle(rs.getString(2));
			b.setContent(rs.getString(3));			
			b.setCreationDate(rs.getString(4));
			b.setFile(rs.getString(5));
			b.setEmailid(rs.getString(6));
			list.add(b);			
		   }		   
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return list;
  	}
  	
  	// Update Notes
 	public boolean updateNotes(Notes n) {
 		boolean f = false;
 		try {
 			String sql = "update notes set title=?, content=? where id=?";
 			PreparedStatement ps = con.prepareStatement(sql);
 			ps.setString(1, n.getTitle());
 			ps.setString(2, n.getContent());
 			ps.setInt(3, n.getId());

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
