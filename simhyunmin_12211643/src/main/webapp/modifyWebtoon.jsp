<%@ page contentType="text/html;charset=utf-8" 
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
	
	 ResultSet krs = null;
	    Statement kstmt = null;
	    kstmt = con.createStatement();
	    
	    String kquery = "select title from bmw";
	    
	    krs = kstmt.executeQuery(kquery);
	krs.close();
	kstmt.close();
	rs.close();
	pstmt.close();
	con.close();
	
%>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 수정 페이지</title>

<link rel="stylesheet" type="text/css" href="modifyWebtoon.css">

</head>
<body>
 <div id="login">  
    <div id="dis">admin님 환영합니다!</div>
    <button onclick="location.href='P1.jsp';alert('로그아웃되었습니다');" >로그아웃</button>
  </div>

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

  <nav>
     <a href="P1_admin.jsp">홈페이지</a>
      <form action="AdminSearchDo.jsp" method="get">
      <input type="text" name="title" placeholder="제목으로 검색할 수 있습니다." size="34">
      <button>검색</button>
      </form>
  </nav>
  <div id="table">
    <div id="image">
      <input type="file" id="upload" name="upload">
    </div>
    <form action="modifyWebtoonDo.jsp?" method="get">
      <ul class="signup">
        <li>
          <label for="title">만화타이틀</label>
          <textarea id="title" name="title" cols="40"><%=title%></textarea>
        </li>
        <li>
          <label for="genre">장르</label>
          <textarea id="genre" name="genre" cols="40"><%=genre%></textarea>
        </li>
        <li>
          <label for="summary">줄거리</label>
          <textarea id="summary" name="summary" cols="40" ><%=summary%></textarea>
        </li>
        <li>
          <label for="writer">작가명</label>
          <textarea id="writer" name="writer" cols="40" ><%=writer%></textarea>
        </li>
        <li>
          <label for="memo">작가의 말(소개)</label><br>
          <textarea id="memo" name="memo" cols="58" rows="5"><%=memo%></textarea>
        </li>
        <li>
          <input type="hidden" id="abtitle" name="abtitle" value=<%=title %>>
          <input type="hidden" id="idx" name="idx" value=<%=didx %>>
          <button onclick="alert('수정 완료!');">수정</button>
        </li>
      </ul>
    </form>
    <button id="deleteButton" onclick="location.href='deleteWebtoon.jsp?idx=<%=didx%>';alert('삭제 완료!');">삭제</button>
  </div>
  
</body>
</html>
<%
}catch(SQLException e) {
	out.print(e);
	return;
}
%>