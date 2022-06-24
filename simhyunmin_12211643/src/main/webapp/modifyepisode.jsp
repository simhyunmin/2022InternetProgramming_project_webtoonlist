<%@ page contentType="text/html;charset=utf-8" 
			import="java.sql.*"%>
<%
String title = request.getParameter("title");
String didx = request.getParameter("didx");     //webtoonlist 테이블에서 웹툰의 idx
											    //원래 페이지인 P5_admin.jsp로 돌아갈 때 웹툰의 상세정보를 출력하기 위한
											    //파라미터를 받기 때문에 didx를 전달받아 웹툰의 위치를 저장하고 있어야한다.
String sidx = request.getParameter("sidx");		//title명을 가지고 있는 table 에서의 해당 회차의 idx 값
try {
	
	Class.forName("org.mariadb.jdbc.Driver");
	String DB_URL ="jdbc:mariadb://localhost:3306/webtoon?useSSL=false";

	
	Connection con = DriverManager.getConnection(DB_URL, "admin", "1234"); 

	
	String sql = "SELECT * FROM "+title+" WHERE idx=?";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, Integer.parseInt(didx));
	ResultSet rs = pstmt.executeQuery();
	
	rs.next();
	
	String depisode = rs.getString("episode");
	String dtitle = rs.getString("title");
	String ddate = rs.getString("date");
	
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
  <link rel="stylesheet" type="text/css" href="modifyepisode.css">
 
</head>
<body>
  <div id="login">  
    <div id="dis">admin님 환영합니다!</div>
    <button onclick="location.href='P5.jsp'" >로그아웃</button>
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
    <section id="episode"><ins><%=depisode %> 회차</ins></section>
    <section id="imageborder">
    </section>
    <div id="image">
      <input type="file" id="upload" name="upload" value="수정/등록">
    </div>
    <form action="modifyepisodeDo.jsp" method="get">
    <ol class="list">
      <li>
          <label for="dtitle">회차제목</label>
          <input id="dtitle" name="dtitle" type="text" size="40" value=<%=dtitle %>>
      </li>
      <li>
        <label for="day">등록일</label>
        <input id="day" name="date" type="date" size="40" value=<%=ddate %>>
      </li>
      <li>
        <label for="update">업로드</label>
        <input type="hidden" name="title" value=<%=title %>>
        <input type="hidden" name="sidx" value=<%=sidx %> >
        <input type="hidden" name="didx" value=<%=didx %>>
        <input id="update" type="file" name="checkload" value="업로드">
      </li>
      <li>
        <button onclick="alert('수정 완료!')">수정하기</button>
      </li>
    </ol>
    </form>
  </div>
</body>
</html>
<%
krs.close();
kstmt.close();
        	
rs.close();
pstmt.close();
con.close();

}catch(SQLException e) {
	out.print(e);
	return;
}
%>
