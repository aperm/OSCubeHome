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

<!--모바일페이지크기조절메타태그-->
<meta name="viewport" content="width=device-width" />

<title>OSCube</title>
</head>
<link href='https://fonts.googleapis.com/css?family=Gruppo' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Poiret+One' rel='stylesheet' type='text/css'>


<body>
	<!-- 전체 DIV -->
	<div style="margin:auto;">
		<!-- 이미지DIV  -->
		<div>
			<img src="images/main_logo_inverse.png" width="100%">
		</div>
		<!-- 이미지DIV  -->
<br><br>
		<div style="text-align: center;">
			<!-- 아래 컨텐츠 -->
			<H3>
				화학물질 정보 서비스
				<a href="scs_search.jsp">현재창으로 열기</a>
			</H3> 
			<br><br>
			<input type="button" class="btn btn-primary " value="FACEBOOK 로그인" style="width:50%" class="but" onclick="butclick();"><br>
			<input type="button" class="btn btn-success" value="NAVER 로그인" style="width:50%"><br>
			<input type="button" class="btn btn-danger" value="Google 로그인"style="width:50%"><br>
		</div>
		<!-- 아래 컨텐츠 -->
	</div>
	<!-- 전체 DIV -->
</body>
</html>