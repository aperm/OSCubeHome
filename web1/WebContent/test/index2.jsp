<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String mainUrl = "/WEB-INF/common/";
	
	if(request.getParameter("mainUrl") != null && ((String)request.getParameter("mainUrl")).length() > 0)
	{
		mainUrl = mainUrl+(String)request.getParameter("mainUrl") + ".jsp";
		System.out.println("if 문 안쪽 여기");
	}else{
	mainUrl = mainUrl + "main"+".jsp";
	}
	System.out.println(request.getParameter("mainUrl"));
	System.out.println(mainUrl);
%>

<html>
<head>


<link rel="stylesheet" 	href="/web1/css/bootstrap-theme.css">
<link rel="stylesheet" 	href="/web1/css/bootstrap.css">
<SCRIPT src="/web1/js/jquery-2.1.3.min.js"></SCRIPT>
<script src="/web1/js/bootstrap.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>OSCube</title>
</head>
<body align="center">
<TABLE align="center" width="85%" cellspacing="0" cellpadding="0" border="0">
			<tr>
			<td colspan="3" height="100" bgcolor="red">
				
			</td>
			</tr>
			<TR>
				<TD colspan="3" bgcolor="blue" height="60">
					<jsp:include page="/WEB-INF/common/top.jsp"  />
				</TD>
			</TR>
			<TR>
				<TD colspan="3" bgcolor="orange" width=100%>
					<jsp:include page="<%=mainUrl%>" flush="true" />
				</TD>
			</TR>
			<TR>
				<TD colspan="3" width="1000" align="center"  bgcolor="#a08baf">
					<jsp:include page="/WEB-INF/common/bottom.jsp" />
				</TD>
			</TR>
		</TABLE>
</body>
</html>