<%@ page  contentType="text/html;charset=utf-8" 
					import="java.sql.*"%>
					
<%

request.setCharacterEncoding("utf-8");
String dtitle = request.getParameter("title");
String didx = request.getParameter("didx");
String sidx = request.getParameter("sidx");

Connection con= null;
Statement stmt = null;

try{
	Class.forName("org.mariadb.jdbc.Driver");
	String DB_URL = "jdbc:mariadb://localhost:3306/webtoon?useSSL=false";
	con = DriverManager.getConnection(DB_URL, "admin", "1234");
	
	String sql = "DELETE FROM "+dtitle+" WHERE idx=?";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, Integer.parseInt(didx)); 
	pstmt.executeUpdate();
	
	pstmt.close();
	con.close();
	
}catch(Exception e){
	out.print(e);
	return;
}
 out.println("<script>window.location.href = 'P5_admin.jsp?idx="+sidx+"';"
		+"</script>");
%>