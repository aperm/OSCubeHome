<%@page import="scs.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Member sign = new Member();

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	int result = sign.signup(id, pw);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 성공</title>
</head>
<body>
	<%
		if (result == 1) {
			session.setAttribute("loginuser", id);
	%>

	<%=id%>님 회원가입 성공

	<input type="button" value="확인" onclick="loginclick()" />

	<%
		}
		if (result == -1) {
	%>

	회원가입 실패

	<%
		}
	%>
</body>
</html>