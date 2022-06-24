<%@ page contentType="text/html; charset=UTF-8"
  						import="java.sql.*"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("utf-8");
%>
<%
Connection con = null;
PreparedStatement pstmt = null;
PreparedStatement dstmt = null;

String jdbc_driver = "org.mariadb.jdbc.Driver";
String jdbc_url = "jdbc:mariadb://localhost:3306/webtoon?useUnicode=true&characterEncoding=utf8&useSSL=false";

try{
	Class.forName(jdbc_driver);
	
	con = DriverManager.getConnection(jdbc_url,"admin", "1234");
	
	String sql = "INSERT INTO webtoonlist(title, genre, summary, writer, memo) VALUES(?, ?, ?, ?, ?)";
	pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, request.getParameter("title"));
	pstmt.setString(2, request.getParameter("genre"));
	pstmt.setString(3, request.getParameter("summary"));
	pstmt.setString(4, request.getParameter("writer"));
	pstmt.setString(5, request.getParameter("memo"));
	pstmt.executeUpdate();

	out.println("<script>window.location.href = 'P1_admin.jsp';</script>");
}catch(Exception e){
	out.println(e);
	return;
}
%>