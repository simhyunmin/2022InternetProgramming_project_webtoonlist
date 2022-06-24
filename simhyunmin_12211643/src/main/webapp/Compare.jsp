<%@ page contentType="text/html; charset=UTF-8"
				import="java.sql.*"%>
<%   //로그인할 때 회원가입 되어있는지 확인하는 jsp 코드
request.setCharacterEncoding("utf-8");

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

	    
	    stmt = con.createStatement();

	    String query = "SELECT * FROM member where id='"+id+"' and pwd='"+pass+"' "; //id와 pass를 P1.jsp로부터 파라미터로 받아 member에 일치하는 레코드를 찾는다.
	    rs = stmt.executeQuery(query);
	    
	if(rs.next()){  
	if(rs.getString("id").equals("admin") && rs.getString("pwd").equals("1234")){  //관리자 일치하면 관리자 페이지로 보내준다.
			out.println("<script> window.location.href = 'P1_admin.jsp';"
					+"</script>");
	}
	else if(rs.getString("id").equals(id) == true && rs.getString("pwd").equals(pass) == true){
	session.setAttribute("id", id);   //만약 관리자 계정이 아니고 일반 사용자 계정이면 세션 설정후에 기존 페이지로 보내준다. 
	out.println("<script>window.location.href = 'P1.jsp';"+"</script>");
 	}
	
	}else{   //만약 일치하는 레코드가 없다면 else문으로 빠져서 아이디 비밀번호가 틀렸다는 문구 출력후 원래페이지로 돌아간다.
		out.println("<script>alert('아이디 또는 비밀번호가 틀렸습니다.'); window.location.href = 'P1.jsp';"
				+"</script>");
		}

}catch(Exception e){
	out.println(e);
	return;
}

stmt.close();
con.close();

%>