<%@ page contentType="text/html; charset=UTF-8"
  						import="java.sql.*"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("utf-8");
%>
<%
String idx = request.getParameter("idx");
Connection con = null;
PreparedStatement pstmt = null;
String dtitle = request.getParameter("dtitle");
String jdbc_driver = "org.mariadb.jdbc.Driver";
String jdbc_url = "jdbc:mariadb://localhost:3306/webtoon?useUnicode=true&characterEncoding=utf8&useSSL=false";

try{
	Class.forName(jdbc_driver);
	
	con = DriverManager.getConnection(jdbc_url,"admin", "1234");
	
	String sql = "INSERT INTO "+dtitle+"(episode, title, date) VALUES(?, ?, ?)";
	pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, request.getParameter("episode"));
	pstmt.setString(2, request.getParameter("title"));
	pstmt.setString(3, request.getParameter("date"));
	pstmt.executeUpdate();
	out.println("<script>window.location.href = 'P5_admin.jsp?idx="+idx+"';</script>");
}catch(Exception e){
	out.println(e);
	return;
}
%>