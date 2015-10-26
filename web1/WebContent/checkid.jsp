<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="scs.Member"%>
<%
	String id = request.getParameter("id");

	Member confirm = new Member();

	int result = confirm.confirmid(id);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function Close() {
		document.login.pw.focus();
		document.getElementById("check").innerHTML = "";
	}

	function Clear() {
		document.login.id.value = "";
		document.login.id.focus();
		document.getElementById("check").innerHTML = "";
	}
</script>
</head>
<body>
	<form method="post" action="checkid.jsp">

		<%
			if (result == -1) {
		%>
		<%=id%>는 사용 할 수 없습니다. <input type="button" value="확인"
			onclick="Clear();" />
		<%
			}
			if (result == 1) {
		%>
		<%=id%>는 사용 가능합니다.<br /> <input type="button" value="확인"
			onclick="Close();" />
		<%
			}
		%>
	</form>
</body>
</html>