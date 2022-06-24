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
    
    ResultSet drs = null;
    Statement dstmt = null;
    dstmt = con.createStatement();
    
    String dquery = "select title from bmw";
    
    drs = dstmt.executeQuery(dquery);
    
%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>웹툰 만화리스트 출력</title>
<link rel="stylesheet" href="P1.css" type="text/css">
</head>
<body>
	<nav>
    <a href="P1.jsp">홈페이지</a>
      <form action="searchDo.jsp" method="get">
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
      <%while(drs.next()){ %>         <!-- 이 . 달 . 베 출력 부분 while문을 통해 반복적으로 리스트를 출력 -->   
      <li><a href="searchDo.jsp?title=<%=drs.getString("title")%>"><%=drs.getString("title")%></a></li>
      <%} %>
					
    </ol>
  </div>
  <% 
if(session.getAttribute("id")==null){        /* 세션이 설정 안돼있다면 로그인 또는 회원가입을 할 수 있다. */

%>
	<form action="Compare.jsp" method="get">
	<div id="login">
		<div id="dis">
		<ul>
		<li>
		<label for="id">ID:</label>
		<input type="text" value="" name="id" id="id" required>
		</li>
		<li>
		<label for="password">Password:</label>
		<input type="password" value="" name="pwd" id="password" required>
		</li>
	</ul>
	</div>	
		<a href="input.jsp">회원가입</a>    						<!-- 회원가입 부분 -->
		<button>로그인</button>
	</div>
	</form>
	<%
}else{      /* 세션이 설정된 경우 로그아웃 버튼만 클릭 가능 */
	%>
	
	<form method="post" action="02_logout.jsp">
	<div id="loginView">
	<div id="loginid"><%=session.getAttribute("id") %>님 환영합니다!</div>
	<input type="submit" onclick="alert('로그아웃되었습니다');" value="로그아웃" />
	</div>
	</form>

<%
}
%>


<div id="table">
	<ul id="cartoonlist">
	<%if(rs.next()) {%>			<!-- 만약 if문 안에 rs.next()가 없는 레코드를 가르킨다면 false이므로 출력되지 않는다. -->
		<li id="block">					<!-- true일 때만 출려되게끔 구현하였습니다. -->
			<div id="stack">
			
				대표이미지
			</div>
			<ul>
				<li><a href="P5.jsp?idx=<%=rs.getInt("idx")%>">제목:<%=rs.getString("title")%></a></li>
				
				<li>작가명:<%=rs.getString("writer")%></li>
				
			</ul>
		</li>
		<%} %>
		<%if(rs.next()) {%>
		<li  id="block">
			<div id="stack">
			
				대표이미지
			</div>
			<ul>
				<li><a href="P5.jsp?idx=<%=rs.getInt("idx")%>">제목:<%=rs.getString("title")%></a></li>
				
				<li>작가명:<%=rs.getString("writer")%></li>
			</ul>
		</li>
		<%} %>
		<%if(rs.next()) {%>
		<li  id="block">
			<div id="stack">
				대표이미지
			</div>
			<ul>
				<li><a href="P5.jsp?idx=<%=rs.getInt("idx")%>">제목:<%=rs.getString("title")%></a></li>
				
				<li>작가명:<%=rs.getString("writer")%></li>
			</ul>
		</li>
		<%} %>
	<%if(rs.next()) {%>
		<li  id="block">
			<div id="stack">
				대표이미지
			</div>
			<ul>
				<li><a href="P5.jsp?idx=<%=rs.getInt("idx")%>">제목:<%=rs.getString("title")%></a></li>
				
				<li>작가명:<%=rs.getString("writer")%></li>
			</ul>
		</li>
		<%} %>
		<%if(rs.next()){ %>
		<li  id="block">
			<div id="stack">
				대표이미지
			</div>
			<ul>
				<li><a href="P5.jsp?idx=<%=rs.getInt("idx")%>">제목:<%=rs.getString("title")%></a></li>
				
				<li>작가명:<%=rs.getString("writer")%></li>
			</ul>
		</li>
		<%} %>
		<%if(rs.next()){ %>
		<li  id="block">
			<div id="stack">
				대표이미지
			</div>
			<ul>
				<li><a href="P5.jsp?idx=<%=rs.getInt("idx")%>">제목:<%=rs.getString("title")%></a></li>
				
				<li>작가명:<%=rs.getString("writer")%></li>
			</ul>
		</li>
		<%} %>
		<%if(rs.next()){ %>
		<li  id="block">
			<div id="stack">
				대표이미지
			</div>
			<ul>
				<li><a href="P5.jsp?idx=<%=rs.getInt("idx")%>">제목:<%=rs.getString("title")%></a></li>
				
				<li>작가명:<%=rs.getString("writer")%></li>
			</ul>
		</li>
		<%} %>
		<%if(rs. next()) {%>
		<li  id="block">
			<div id="stack">
				대표이미지
			</div>
			<ul>
				<li><a href="P5.jsp?idx=<%=rs.getInt("idx")%>">제목:<%=rs.getString("title")%></a></li>
				
				<li>작가명:<%=rs.getString("writer")%></li>
			</ul>
		</li>
		<%} %>
	</ul>
</div>
<%
rs.close();     // ResultSet 종료

    stmt.close();     // Statement 종료

    con.close(); 	// Connection 종료
    drs.close();
    dstmt.close();

    } catch (SQLException e) {
      out.println("err:"+e.toString());
      return;
    } 
%>
</body>
</html>