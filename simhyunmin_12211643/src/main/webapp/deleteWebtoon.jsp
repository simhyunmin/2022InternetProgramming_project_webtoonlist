<%@ page  contentType="text/html;charset=utf-8" 
					import="java.sql.*"%>
					
<%
request.setCharacterEncoding("utf-8");

String didx = request.getParameter("idx");

Connection con= null;
Statement stmt = null;

try{
	Class.forName("org.mariadb.jdbc.Driver");
	String DB_URL = "jdbc:mariadb://localhost:3306/webtoon?useSSL=false";
	con = DriverManager.getConnection(DB_URL, "admin", "1234");
	
	String sql = "DELETE FROM webtoonlist WHERE idx=?";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, didx); 
	pstmt.executeUpdate();
	
	pstmt.close();
	con.close();
	
}catch(Exception e){
	out.print(e);
	return;
}
 out.println("<script>window.location.href = 'P1_admin.jsp';"
		+"</script>"); 
%>