<%@page import="com.enotes.DBConnect"%>
<%@page import="java.sql.*"%>
<%

int id = Integer.parseInt(request.getParameter("id"));
try {
	Connection con = DBConnect.getConn();
	PreparedStatement st = con.prepareStatement("delete from notes where id = " + id + ";");
    st.executeUpdate();
}
catch (Exception e) {
	System.out.println(e);
}
%>
<script>
		alert("Note Deleted Successfully..");
		window.location.assign("viewNotes.jsp");
</script>

