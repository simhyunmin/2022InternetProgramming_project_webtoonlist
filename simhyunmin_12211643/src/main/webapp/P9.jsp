<%@ page contentType="text/html; charset=UTF-8"%>

<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회차 등록 페이지</title>
  <link rel="stylesheet" type="text/css" href="P9.css">
  <script>
    function information(){
      var obj1 = document.getElementById("title");
      var obj2 = document.getElementById("day");
      var obj3 = document.getElementById("update");
      var obj4 = document.getElementById("upload");
      var str = "";
      str = "회차제목: " + obj1.value + "\n"
      		+"이미지: " + obj4.value + "\n"
            +"등록일: "+ obj2.value +"\n"
            +"업로드: " + obj3.value + "\n";
      alert(str);
    }
  </script>
</head>
<body>
  <div id="login">  
    <div id="dis">admin님 환영합니다!</div>
    <button onclick="location.href='P5.jsp'" >로그아웃</button>
  </div>

  <nav>
    <a href="P1.html">홈페이지</a>
      <input type="text" placeholder="제목/작가로 검색할 수 있습니다." size="34">
      <button>검색</button>
  </nav>

  <div id="listcartoon">
    <div id="listcartoon_top"><em>이 . 달 . 베</em></div>
    <br> 
    <br>
    <br>
    <ol>
      <li><a href="P1.html">웹툰 제목</a></li>
      <li></li>
      <li></li>
      <li></li>
      <li></li>
      <li></li>
      <li></li>
      <li></li>
      <li></li>

    </ol>
  </div>
  <div id="table">
    <section id="episode"><ins>*회차</ins></section>
    <section id="imageborder">
    </section>
    <div id="image">
      <input type="file" id="upload" name="upload" value="수정/등록">
    </div>
    <form>
    <ol class="list">
      <li>
          <label for="title">회차제목</label>
          <input id="title" type="text" size="40">
      </li>
      <li>
        <label for="day">등록일</label>
        <input id="day" type="date" size="40">
      </li>
      <li>
        <label for="update">업로드</label>
        <input id="update" type="file" name="checkload" value="업로드">
      </li>
      <li>
        <input type="button" name="submit" value="등록하기" onclick="location.href='P5_admin.jsp'">
      </li>
    </ol>
    </form>
  </div>
</body>
</html>