<%@ page contentType="text/html; charset=UTF-8"
			import="java.sql.*"%>
<%
String didx = request.getParameter("idx");     //webtoonlist에서 해당하는 title에 idx 값
try {
	
	Class.forName("org.mariadb.jdbc.Driver");
	String DB_URL ="jdbc:mariadb://localhost:3306/webtoon?useSSL=false";

	
	Connection con = DriverManager.getConnection(DB_URL, "admin", "1234"); 

	
	String sql = "SELECT title, genre, summary, writer, memo FROM webtoonlist WHERE idx=?";  
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, Integer.parseInt(didx)); //webtoonlist에서 해당하는 레코드를 찾기위해 didx setInt
	ResultSet rs = pstmt.executeQuery();
	
	rs.next();
	
	String title = rs.getString("title");
	String genre = rs.getString("genre");
	String summary = rs.getString("summary");
	String memo = rs.getString("memo");
	String writer = rs.getString("writer");
	
	Class.forName("org.mariadb.jdbc.Driver");
	
	con = DriverManager.getConnection(DB_URL, "admin", "1234");
	
	String dsql = "SELECT * from "+title+"";
	PreparedStatement dstmt = con.prepareStatement(dsql);
	ResultSet drs = dstmt.executeQuery();
	
	    ResultSet krs = null;
	    Statement kstmt = null;
	    kstmt = con.createStatement();
	    
	    String kquery = "select title from bmw";
	    
	    krs = kstmt.executeQuery(kquery);
	
	%>
<html>
<head>
<meta charset="UTF-8">
<title>만화 회차별 리스트 출력</title>
<link rel="stylesheet" type="text/css" href="P5.css">
</head>
<body>
<div id="listcartoon">
    <div id="listcartoon_top"><em>이 . 달 . 베</em></div>
    <br> 
    <br>
    <br>
    <ol>
       <%while(krs.next()){ %>
      <li><a href="searchDo.jsp?title=<%=krs.getString("title")%>"><%=krs.getString("title")%></a></li>
      <%} %>

    </ol>
  </div>
  <% 
if(session.getAttribute("id")==null){

%>
	<form action="Comparep5.jsp" method="get">
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
		<input type="hidden" name="didx" value=<%=didx %>>
		</li>
	</ul>
	</div>	
		<a href="input.jsp">회원가입</a>    						
		<button>로그인</button>
	</div>
	</form>
	<%
}else{
	%>
	
	<form method="get" action="logout_p5.jsp">
	<div id="loginView">
	<div id="loginid"><%=session.getAttribute("id") %>님 환영합니다!</div>
	<input type="submit" onclick="alert('로그아웃되었습니다');" value="로그아웃" />
	<input type="hidden" name="didx" value=<%=didx %>>
	</div>
	</form>

<%
}
%>
  <nav>
    <a href="P1.jsp">홈페이지</a>
      <form action="searchDo.jsp" method="get">
      <input type="text" name="title" placeholder="제목으로 검색할 수 있습니다." size="34">
      <button>검색</button>
      </form>
  </nav>
  
    <div id="table">
    <div id="image">
    </div>
   	<div id="detail">
   	</div>
   	<ul id="signup">
        <li>
          <label for="title">만화타이틀</label>
          <input id="title" type="text" name="title" size="40" readonly value=<%=title %>>
        </li>
        <li>
          <label for="genre">장르</label>
          <input id="genre" type="text" name="genre" size="40" readonly value=<%=genre%>>
        </li>
        <li>
          <label for="summary">줄거리</label>
          <input id="summary" type="text" name="summary" size="40" readonly value=<%=summary %>>
        </li>
        <li>
          <label for="memo">작가의 말(소개)</label>
          <textarea id="memo" name="memo" cols="42" rows="4" readonly ><%=memo %></textarea>
        </li>
      </ul>
     <div id="modified">
      </div>
      <div id="catalog">
      <table style="border-collapse:collapse">
       <tr>
        <th></th>
        <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
      	<th>회차별 제목</th>  
      	<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
      	<th>등록일</th>
      	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
      	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
      	</tr>
      	
      	<tr>
        <th></th>
        <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
      	<th></th>  
      	<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
      	<th></th>
      	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
      	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
      	</tr>
      	
     <%
     
     while(drs.next()) {      //while문을 통해 회차별 리스트를 뽑아와서 출력
    	
     %>
      	<tr>
      	<td><%=drs.getInt("episode")%></td>
      
      	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td><%=drs.getString("title")%></td>
		     
		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td><%=drs.getString("date") %></td>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		

		</tr>
		<tr>
        <th></th>
       
        <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
      	<th></th>  
      	
      	<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
      	<th></th>
      	<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
		<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
      	</tr>
		<% } %></table>
      </div>
   	</div>
</body>
</html>
<%
con.close();
rs.close();
pstmt.close();
dstmt.close();
}catch(SQLException e) {
	out.print(e);
	return;
}
%>