<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*, java.text.*"%>
<%
	System.out.println();
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
	String today = formatter.format(new java.util.Date());
	System.out.println(today);
	System.out.println("Remote Addr: " + request.getRemoteAddr());
	System.out.println("Remote Host: " + request.getRemoteHost());
	System.out.println("X-Forwarded-For: " + request.getHeader("x-forwarded-for"));
%>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="images/favicon/favicon.ico" />
<link rel="stylesheet" href="/css/bootstrap-theme.css">
<link rel="stylesheet" href="/css/bootstrap.css">


<script type="text/javascript">
function butclick() {
	parent.location.href="scs_search.jsp";
}
</script>
<SCRIPT src="/js/jquery-2.1.3.min.js"></SCRIPT>
<script src="/js/bootstrap.js"></script>

<!--�����������ũ��������Ÿ�±�-->
<meta name="viewport" content="width=device-width" />

<title>OSCube</title>
</head>
<link href='https://fonts.googleapis.com/css?family=Gruppo' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Poiret+One' rel='stylesheet' type='text/css'>


<body>
	<!-- ��ü DIV -->
	<div style="margin:auto;">
		<!-- �̹���DIV  -->
		<div>
			<img src="images/main_logo_inverse.png" width="100%">
		</div>
		<!-- �̹���DIV  -->
<br><br>
		<div style="text-align: center;">
			<!-- �Ʒ� ������ -->
			<H3>
				ȭ�й��� ���� ����
				<a href="scs_search.jsp">����â���� ����</a>
			</H3> 
			<br><br>
			<input type="button" class="btn btn-primary " value="FACEBOOK �α���" style="width:50%" class="but" onclick="butclick();"><br>
			<input type="button" class="btn btn-success" value="NAVER �α���" style="width:50%"><br>
			<input type="button" class="btn btn-danger" value="Google �α���"style="width:50%"><br>
		</div>
		<!-- �Ʒ� ������ -->
	</div>
	<!-- ��ü DIV -->
</body>
</html>