<%@ page contentType="text/html; charset=UTF-8"
			import="java.sql.*"%>
<%
String didx = request.getParameter("idx");
try {
	
	Class.forName("org.mariadb.jdbc.Driver");
	String DB_URL ="jdbc:mariadb://localhost:3306/webtoon?useSSL=false";

	
	Connection con = DriverManager.getConnection(DB_URL, "admin", "1234"); 

	
	String sql = "SELECT title, genre, summary, writer, memo FROM webtoonlist WHERE idx=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, Integer.parseInt(didx));
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
<link rel="stylesheet" type="text/css" href="P5_admin.css">
</head>
<body>
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
<form method="get" action="logout_p5.jsp">
 <div id="login">  
    <div id="dis">admin님 환영합니다!</div>
    <input type="submit" onclick="alert('로그아웃되었습니다');" value="로그아웃" />
	<input type="hidden" name="didx" value=<%=didx %>>
    </div>
    </form>

	
  <nav>
    <a href="P1_admin.jsp">홈페이지</a>
     <form action="AdminSearchDo.jsp" method="get">
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
      <button id="inputepi" onclick="location.href='inputepisode.jsp?title=<%=title%>&idx=<%=didx%>'">등록</button>
      <table style="border-collapse:collapse">
       <tr>
        <th></th>
        <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
      	<th>회차별 제목</th>  
      	<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
      	<th>등록일</th>
      	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
      	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		
		<td></td>
		<th></th>
      	</tr>
      	
      	<tr>
        <th></th>
        <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
      	<th></th>  
      	<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
      	<th></th>
      	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
      	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		
		<td></td>
		<th></th>
      	</tr>
      	
     <%
     
     while(drs.next()) {
    	
     %>
      	<tr>
      	<td><%=drs.getInt("episode")%></td>
      
      	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td><%=drs.getString("title")%></td>
		     
		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td><%=drs.getString("date") %></td>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		
		<td><button onclick="location.href='modifyepisode.jsp?title=<%=title%>&didx=<%=drs.getInt("idx")%>&sidx=<%=didx %>'">수정</button></td>
		<td><button onclick="alert('삭제 완료!');location.href='deleteepisode.jsp?title=<%=title%>&didx=<%=drs.getInt("idx")%>&sidx=<%=didx %>'">삭제</button></td>
		</tr>
		<tr>
        <th></th>
       
        <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
      	<th></th>  
      	
      	<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
      	<th></th>
      	<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
		<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
		
		<th></th>
		<th></th>
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