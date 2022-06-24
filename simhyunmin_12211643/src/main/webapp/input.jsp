<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<link rel="stylesheet" href="input.css" type="text/css">
</head>

<body>
<div id="table">
<form action="saveTableinfo_Prepare.jsp" method="get">
<ul>
<li>ID : <input type="text" name="id" maxlength="40" size="8"></li>
<li>성명 : <input type="text" name="name" maxlength="40" size="12"></li>
<li>암호 : <input type="password" name="pwd" maxlength="40" size="8"></li>
<li><input type="submit" value=" 회원가입 "></li>
</ul>
</form>
</div>


</body>
</html>