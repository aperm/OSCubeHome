<%@ page import="scs.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	Member mem = new Member();

	int result = mem.login(id, pw);

	if (result == 1) {
		session.setAttribute("userid",id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("mindex.jsp");
		dispatcher.forward(request, response);
	}else if(result == -1){
		session.setAttribute("message","로그인 정보 불일치");
		RequestDispatcher dispatcher = request.getRequestDispatcher("mindex.jsp");
		dispatcher.forward(request, response);
	}
%>