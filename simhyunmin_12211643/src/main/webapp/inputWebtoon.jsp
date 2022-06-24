<%@ page contentType="text/html; charset=UTF-8"
			import="java.sql.*"%>
<%
Class.forName("org.mariadb.jdbc.Driver");
String DB_URL = "jdbc:mariadb://localhost:3306/webtoon?useSSL=false";

String DB_USER = "admin";
String DB_PASSWORD= "1234";
Connection con= null;
ResultSet krs = null;
Statement kstmt = null;
try {
	 con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

    kstmt = con.createStatement();
    
    String kquery = "select title from bmw";
    
    krs = kstmt.executeQuery(kquery);
%>

<html>
<head>
<meta charset="UTF-8">
<title>관리자 등록 페이지</title>

<link rel="stylesheet" type="text/css" href="inputWebtoon.css">

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
    <form action="inputWebtoonDo.jsp" method="get">
      <ul class="signup">
        <li>
          <label for="title">만화타이틀</label>
          <input id="title" type="text" name="title" size="40" required>
        </li>
        <li>
          <label for="genre">장르</label>
          <input id="genre" type="text" name="genre" size="40" required>
        </li>
        <li>
          <label for="summary">줄거리</label>
          <input id="summary" type="text" name="summary" size="40" required>
        </li>
        <li>
          <label for="writer">작가명</label>
          <input id="writer" type="text" name="writer" size="40" required>
        </li>
        <li>
          <label for="memo">작가의 말(소개)</label><br>
          <textarea id="memo" name="memo" cols="58" rows="5" required></textarea>
        </li>
        <li>
          <button onclick="alert('등록 완료!');">등록하기</button>
        </li>
      </ul>
    </form>
  </div>
  <%
krs.close();     // ResultSet 종료

    kstmt.close();     // Statement 종료

    con.close(); 	// Connection 종료

    } catch (SQLException e) {
      out.println("err:"+e.toString());
      return;
    } 
%>
</body>
</html>