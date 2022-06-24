<%@ page contentType="text/html; charset=UTF-8"
			import="java.sql.*"%>
<%
String title = request.getParameter("title");
String idx = request.getParameter("idx");   //P5_admin.jsp 로 돌아갈 때 전달해줄 파라미터
Class.forName("org.mariadb.jdbc.Driver");
String DB_URL = "jdbc:mariadb://localhost:3306/webtoon?useSSL=false";

String DB_USER = "admin";
String DB_PASSWORD= "1234";

Connection con= null;

try {
    
	
    con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

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
  <title>회차 등록 페이지</title>
  <link rel="stylesheet" type="text/css" href="inputepisode.css">
</head>
<body>
  <div id="login">  
    <div id="dis">admin님 환영합니다!</div>
    <button onclick="location.href='P5.jsp'" >로그아웃</button>
  </div>

  <nav>
    <a href="P1_admin.jsp">홈페이지</a>
      <input type="text" placeholder="제목으로 검색할 수 있습니다." size="34">
      <button>검색</button>
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
    <section id="imageborder">
    </section>
    <div id="image">
      <input type="file" id="upload" name="upload" value="수정/등록">
    </div>
    <form action="inputepisodeDo.jsp" method="get">
    <ol class="list">
      <li>
          <label for="episode">회차수</label>
          <input id="episode" name="episode" type="text" size="5">
          <br>
      </li>
      <li>
          <label for="title">회차제목</label>
          <input id="title" name="title" type="text" size="40">
      </li>
      <li>
        <label for="day">등록일</label>
        <input id="date" name="date" type="date" size="40">
      </li>
      <li>
        <label for="update">업로드</label>
        <input id="update" type="file" name="checkload" value="업로드">
      </li>
      <li>
        <input type="hidden" name="idx" value=<%=idx %>>
        <input type="hidden" name="dtitle" value=<%=title %>>
        <button onclick="alert('등록완료')">등록하기</button>
      </li>
    </ol>
    </form>
  </div>
</body>
</html>
<%
	krs.close();   

    kstmt.close();    

    con.close(); 	

    } catch (Exception e) {
      out.println("err:"+e.toString());
      return;
    } 
%>