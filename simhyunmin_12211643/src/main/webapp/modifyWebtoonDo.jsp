<%@ page contentType="text/html;charset=utf-8" 
			import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");


String didx = request.getParameter("idx");
String stitle = request.getParameter("title");
String genre = request.getParameter("genre");
String summary = request.getParameter("summary");
String writer = request.getParameter("writer");
String memo = request.getParameter("memo");
try{
Class.forName("org.mariadb.jdbc.Driver");
String DB_URL ="jdbc:mariadb://localhost:3306/webtoon?useSSL=false";


Connection con = DriverManager.getConnection(DB_URL, "admin", "1234");

String sql = "UPDATE webtoonlist SET title=?, genre=?, summary=?, writer=?, memo=? WHERE idx=?";

PreparedStatement pstmt = con.prepareStatement(sql);

pstmt.setString(1, stitle);
pstmt.setString(2, genre);
pstmt.setString(3, summary);
pstmt.setString(4, writer);
pstmt.setString(5, memo);
pstmt.setString(6, didx);

pstmt.executeQuery();

pstmt.close();
con.close();

}
catch(SQLException e) {
out.print(e);
return;
}
 out.println("<script>window.location.href = 'P1_admin.jsp';"
		+"</script>"); 
%>

