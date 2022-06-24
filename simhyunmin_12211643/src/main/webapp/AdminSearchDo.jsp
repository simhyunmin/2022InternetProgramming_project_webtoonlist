<%@ page contentType="text/html; charset=UTF-8"
			import="java.sql.*"%>
<%
String title = request.getParameter("title");
try {
	
	Class.forName("org.mariadb.jdbc.Driver");
	String DB_URL ="jdbc:mariadb://localhost:3306/webtoon?useSSL=false";

	
	Connection con = DriverManager.getConnection(DB_URL, "admin", "1234"); 

	
	String sql = "SELECT idx FROM webtoonlist WHERE title='"+title+"'";  //입력된 title로 webtoonlist에서 웹툰 search
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()){
	
	String didx = rs.getString("idx");
	
	out.println("<script>window.location.href = 'P5_admin.jsp?idx="+didx+"';</script>");
	}    								//관리자는 로그인 했을 때 다른 페이지로 이동하므로 searchDo도 사용자와 달리
	else{								//따로 jsp를 구현
		out.println("<script>alert('검색 결과가 없습니다.');history.back();</script>");
	}
con.close();
rs.close();
pstmt.close();
}catch(SQLException e) {
	out.print(e);
	return;
}
%>