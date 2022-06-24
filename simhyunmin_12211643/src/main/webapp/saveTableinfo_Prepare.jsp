<%@ page contentType="text/html;charset=utf-8" import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%
Connection con = null;
PreparedStatement pstmt = null;
Statement stmt = null;

ResultSet rs = null;

String jdbc_driver = "org.mariadb.jdbc.Driver";
String jdbc_url = "jdbc:mariadb://localhost:3306/webtoon?useUnicode=true&characterEncoding=utf8&useSSL=false";

try{
	Class.forName(jdbc_driver);
	
	con = DriverManager.getConnection(jdbc_url,"admin", "1234");
	
	String sql = "INSERT INTO member(id, name, pwd) VALUES(?, ?, ?)";
	pstmt = con.prepareStatement(sql);
	
			pstmt.setString(1, request.getParameter("id"));
			pstmt.setString(2, request.getParameter("name"));
			pstmt.setString(3, request.getParameter("pwd"));
			pstmt.executeUpdate();
			out.println("<script>alert('회원가입 성공!');window.location.href = 'P1.jsp';"
					+"</script>");
}
catch(Exception e){
	out.println(e);
	return;
}
pstmt.close();
con.close();
%>


