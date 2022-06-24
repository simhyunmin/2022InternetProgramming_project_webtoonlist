<%@ page contentType="text/html; charset=UTF-8"
				import="java.sql.*"%>
<%    //P5.jsp에서 Compare.jsp로 동작하는 jsp 코드 P5.jsp로 돌아가야하기 때문에 Compare.jsp와 차이점은 돌아가는 페이지가 P1이냐 P5이냐 차이 밖에 없다. 
request.setCharacterEncoding("utf-8");
String didx = request.getParameter("didx");
String id = request.getParameter("id");
String pass = request.getParameter("pwd");
Class.forName("org.mariadb.jdbc.Driver");

String DB_URL = "jdbc:mariadb://localhost:3306/webtoon?useSSL=false";

String DB_USER = "admin";
String DB_PASSWORD= "1234";

Connection con= null;
Statement stmt = null;
ResultSet rs   = null;
try{
	 con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

	    //4. Statement 객체를 생성한다.
	    stmt = con.createStatement();

	    String query = "SELECT * FROM member where id='"+id+"' and pwd='"+pass+"' "; 
	    rs = stmt.executeQuery(query);
	    
	if(rs.next()){  
	if(rs.getString("id").equals("admin") && rs.getString("pwd").equals("1234")){
			out.println("<script> window.location.href = 'P5_admin.jsp?idx="+didx+"';"
					+"</script>");
	}
	else if(rs.getString("id").equals(id) == true && rs.getString("pwd").equals(pass) == true){
	session.setAttribute("id", id);
	out.println("<script>window.location.href = 'P5.jsp?idx="+didx+"';"+"</script>");
 	}
	
	}else{
		out.println("<script>alert('아이디 또는 비밀번호가 틀렸습니다.'); window.location.href = 'P5.jsp?idx="+didx+"';"
				+"</script>");
		}

}catch(Exception e){
	out.println(e);
	return;
}

stmt.close();
con.close();

%>