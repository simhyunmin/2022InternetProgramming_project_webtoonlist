<%@ page contentType="text/html;charset=utf-8" 
			import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");


String sidx = request.getParameter("sidx");
String didx = request.getParameter("didx");
String title = request.getParameter("title");
String dtitle = request.getParameter("dtitle");
String date = request.getParameter("date");
try{
Class.forName("org.mariadb.jdbc.Driver");
String DB_URL ="jdbc:mariadb://localhost:3306/webtoon?useSSL=false";


Connection con = DriverManager.getConnection(DB_URL, "admin", "1234");
String sql = "UPDATE "+title+" SET title=?, date=? WHERE idx=?";

PreparedStatement pstmt = con.prepareStatement(sql);

pstmt.setString(1, dtitle);
pstmt.setString(2, date);
pstmt.setString(3, didx);

pstmt.executeQuery();

pstmt.close();
con.close();

}
catch(SQLException e) {
out.print(e);
return;
}
 out.println("<script>window.location.href = 'P5_admin.jsp?idx="+sidx+"';"
		+"</script>"); 
%>

