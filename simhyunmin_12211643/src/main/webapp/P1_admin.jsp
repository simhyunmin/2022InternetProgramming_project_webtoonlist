<%@ page contentType="text/html; charset=UTF-8"
			import="java.sql.*"%>
<%
Class.forName("org.mariadb.jdbc.Driver");
String DB_URL = "jdbc:mariadb://localhost:3306/webtoon?useSSL=false";

String DB_USER = "admin";
String DB_PASSWORD= "1234";

Connection con= null;
Statement stmt = null;
ResultSet rs   = null;

try {
    
	
    con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

   
    stmt = con.createStatement();

    
    String query = "SELECT * FROM webtoonlist"; 
    
    rs = stmt.executeQuery(query);
    
    ResultSet krs = null;
    Statement kstmt = null;
    kstmt = con.createStatement();
    
    String kquery = "select title from bmw";
    
    krs = kstmt.executeQuery(kquery);
%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>웹툰 만화리스트 출력</title>
<link rel="stylesheet" href="P1_admin.css" type="text/css">
</head>
<body>
<div id="login">  
    <div id="dis">admin님 환영합니다!</div>
    <button onclick="location.href='P1.jsp';alert('로그아웃되었습니다');" >로그아웃</button>
    </div>
    
    
	<nav>
    <a href="P1_admin.jsp">홈페이지</a>
      <form action="AdminSearchDo.jsp" method="get">
      <input type="text" name="title" placeholder="제목으로 검색할 수 있습니다." size="34">
      <button>검색</button>
      </form>
  </nav>

	<div id="listcartoon">
    <div id="listcartoon_top"><em>이 . 달 . 베</em></div>
    <br> 
    <br>
    <br>
    <ol>
      <%while(krs.next()){ %>   
      <li><a href="AdminSearchDo.jsp?title=<%=krs.getString("title")%>"><%=krs.getString("title")%></a></li>
      <%} %>
    </ol>
  </div>

	


<div id="table">
	 <a id="addWebtoon" href="inputWebtoon.jsp">추가</a>
	<ul id="cartoonlist">
	<%if(rs.next()) {%>
		<li id="block">
			<div id="stack">
			
				대표이미지
			</div>
			<ul>
				<li><a href="P5_admin.jsp?idx=<%=rs.getInt("idx")%>">제목:<%=rs.getString("title")%></a></li>
				
				<li>작가명:<%=rs.getString("writer")%></li>
				<li>&nbsp;</li>
				<li><a id="modifyblock" href="modifyWebtoon.jsp?idx=<%=rs.getInt("idx")%>" >수정</a></li>
			</ul>
		</li>
		<%} %>
		<%if(rs.next()) {%>
		<li  id="block">
			<div id="stack">
			
				대표이미지
			</div>
			<ul>
				<li><a href="P5_admin.jsp?idx=<%=rs.getInt("idx")%>">제목:<%=rs.getString("title")%></a></li>
				
				<li>작가명:<%=rs.getString("writer")%></li>
				<li>&nbsp;</li>
				<li><a id="modifyblock" href="modifyWebtoon.jsp?idx=<%=rs.getInt("idx")%>" >수정</a></li>
			</ul>
		</li>
		<%} %>
		<%if(rs.next()) {%>
		<li  id="block">
			<div id="stack">
				대표이미지
			</div>
			<ul>
				<li><a href="P5_admin.jsp?idx=<%=rs.getInt("idx")%>">제목:<%=rs.getString("title")%></a></li>
				
				<li>작가명:<%=rs.getString("writer")%></li>
				<li>&nbsp;</li>
				<li><a id="modifyblock" href="modifyWebtoon.jsp?idx=<%=rs.getInt("idx")%>" >수정</a></li>
			</ul>
		</li>
		<%} %>
	   <%if(rs.next()) {%>
		<li  id="block">
			<div id="stack">
				대표이미지
			</div>
			<ul>
				<li><a href="P5_admin.jsp?idx=<%=rs.getInt("idx")%>">제목:<%=rs.getString("title")%></a></li>
				
				<li>작가명:<%=rs.getString("writer")%></li>
				<li>&nbsp;</li>
				<li><a id="modifyblock" href="modifyWebtoon.jsp?idx=<%=rs.getInt("idx")%>" >수정</a></li>
			</ul>
		</li>
		<%} %>
		<%if(rs.next()) {%>
		<li  id="block">
			<div id="stack">
				대표이미지
			</div>
			<ul>
				<li><a href="P5_admin.jsp?idx=<%=rs.getInt("idx")%>">제목:<%=rs.getString("title")%></a></li>
				
				<li>작가명:<%=rs.getString("writer")%></li>
				<li>&nbsp;</li>
				<li><a id="modifyblock" href="modifyWebtoon.jsp?idx=<%=rs.getInt("idx")%>" >수정</a></li>
			</ul>
		</li>
		<%} %>
		<%if(rs.next()) {%>
		<li  id="block">
			<div id="stack">
				대표이미지
			</div>
			<ul>
				<li><a href="P5_admin.jsp?idx=<%=rs.getInt("idx")%>">제목:<%=rs.getString("title")%></a></li>
				
				<li>작가명:<%=rs.getString("writer")%></li>
				<li>&nbsp;</li>
				<li><a id="modifyblock" href="modifyWebtoon.jsp?idx=<%=rs.getInt("idx")%>" >수정</a></li>
			</ul>
		</li>
		<%} %>
		<%if(rs.next()) {%>
		<li  id="block">
			<div id="stack">
				대표이미지
			</div>
			<ul>
				<li><a href="P5_admin.jsp?idx=<%=rs.getInt("idx")%>">제목:<%=rs.getString("title")%></a></li>
				
				<li>작가명:<%=rs.getString("writer")%></li>
				<li>&nbsp;</li>
				<li><a id="modifyblock" href="modifyWebtoon.jsp?idx=<%=rs.getInt("idx")%>" >수정</a></li>
			</ul>
		</li>
		<%} %>
		<%if(rs.next()) {%>
		<li  id="block">
			<div id="stack">
				대표이미지
			</div>
			<ul>
				<li><a href="P5_admin.jsp?idx=<%=rs.getInt("idx")%>">제목:<%=rs.getString("title")%></a></li>
				
				<li>작가명:<%=rs.getString("writer")%></li>
				<li>&nbsp;</li>
				<li><a id="modifyblock" href="modifyWebtoon.jsp?idx=<%=rs.getInt("idx")%>" >수정</a></li>
			</ul>
		</li>
		<%} %>
	</ul>
</div>
<%
rs.close();     // ResultSet 종료

    stmt.close();     // Statement 종료

    con.close(); 	// Connection 종료

    } catch (SQLException e) {
      out.println("err:"+e.toString());
      return;
    } 
%>
</body>
</html>