<%@ page contentType="text/html; charset=UTF-8"%>
<%
session.invalidate();
String didx = request.getParameter("didx");
out.println("<script>window.location.href = 'P5.jsp?idx="+didx+"';"+"</script>");
%>
