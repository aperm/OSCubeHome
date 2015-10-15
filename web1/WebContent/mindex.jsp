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
	int first = 0;
	if(request.getParameter("first")==null)
	{
		first = 0;
	}else 
	{
		first = 1;
	}
%>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="images/favicon/favicon.ico" />
<link rel="stylesheet" href="/css/bootstrap-theme.css">
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="/css/bootstrap_slider.css">

<script type="text/javascript">
$(document).ready(function() {
	$(window).scroll(function() {
		if ($(this).scrollTop() > 0) {
			$('.btnTop').fadeIn();
		} else {
			$('.btnTop').fadeOut();
		}
	});

	$('.btnTop').click(function() {
		$('html, body').animate({
			scrollTop : 0
		}, 450);
		return false;
	});
	
});
function butClick(idMyDiv) {
	var objDiv = document.getElementById(idMyDiv);

	if (objDiv.style.display == "block") {
		objDiv.style.display = "none";
	} else {
		objDiv.style.display = "block";
	}
}
function imgClick(){
	$("#body").load("mindex.jsp",{first:"no"});
}
function loginclick() {
	$("#divAll").load("scs_searchMain.jsp");
}

</script>

<style type="text/css">
html,body{height:100%}
body{margin:0}
#body{min-height:100%}
#divAll{padding-bottom:2.0em}

#foot{margin-top:-2.0em;height:2.0em}

</style>
<!--모바일페이지크기조절메타태그-->
<meta name="viewport" content="width=device-width" />

<title>OSCube</title>
</head>


<SCRIPT src="/js/jquery-2.1.3.min.js"></SCRIPT>
<script src="/js/bootstrap.js"></script>
<script src="/js/bootstrap_slider.js"></script>

<body>
	<div id="body">
	<!-- 전체 DIV -->
	<div style="margin:auto;" id="divAll">
		<!-- 이미지DIV  -->
		<div align="center">
			<img src="images/logos/s2food.png" width="86%" style="margin-top:36px;" >
		</div>
		<!-- 이미지DIV  -->
<br><br>
		<div style="text-align: center;">
			<!-- 아래 컨텐츠 -->
			<H3>
				화학물질 정보 서비스
<!-- 				<a href="scs_search.jsp">현재창으로 열기</a> -->
			</H3> 
			<br><br>
			<input type="button" class="btn btn-primary " value="FACEBOOK 로그인" style="width:50%" class="but" onclick="loginclick();"><br>
			<input type="button" class="btn btn-success" value="NAVER 로그인" style="width:50%"><br>
			<input type="button" class="btn btn-danger" value="Google 로그인"style="width:50%"><br>
		</div>
		<!-- 아래 컨텐츠 -->
	</div>
	<!-- 전체 DIV -->
	</div>
	
	<% 
		if(first==0)
		{
	%>
	<div id="foot" style="text-align:center; background-color:black; line-height:30px; vertical-align:middle;">
		<font color="white">오에스큐브 저작권 표시 </font><img src="images/footer_logo.png" width=20px>
	</div>
	<% 
		}
	%>
	
</body>
</html>