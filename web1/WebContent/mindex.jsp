<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%> 
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

<script>
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
</script>
<script type="text/javascript">

function butClick(idMyDiv) {
	var objDiv = document.getElementById(idMyDiv);
	var topMargin;
	if (objDiv.style.display == "block") {
		objDiv.style.display = "none";
	} else {
		objDiv.style.display = "block";
		
		topMargin = ($(window).height() / 9)+  ($(window).height() / 10) +70;
		
		$('html,body').animate({
	        scrollTop: ($(objDiv).offset().top - topMargin)
	    }, 2);
	}
	
}


function imgClick(){
	$("#body").load("mindex.jsp",{first:"no"});
}
function loginclick() {
	$("#divAll").load("scs_searchMain.jsp");
// 	$("#divAll").load("scs_resultView.jsp");
}

</script>

<style type="text/css">
html,body{height:100%;
font-size:13pt;}
body{margin:0}
#body{min-height:100%}
#divAll{padding-bottom:5.0em}

#foot{margin-top:-4.79em;height:1.0em;}
.pageBack{
	cursor:pointer;
}
.logoImg{
	cursor:pointer;
}
.titleText{
	font-weight:bold;
	font-size:20pt;
	color:#666;
	vertical-align:bottom;
	text-shadow:0 0 0 !important;
}

.contentText{
	font-size:13pt;

}

#searchWord{
	padding : 0 0 0 10px;
}

.labelTag{
  display: inline;
  padding: .2em .6em .3em;
  font-size: 75%;
  font-weight: bold;
  line-height: 1;
  color: #fff;
  text-align: center;
  white-space: nowrap;
  vertical-align: baseline;
  border-radius: .25em;
}

.btnTop {
	display: none;
	overflow: hidden;
	position: fixed;
	bottom: 30px;
	right: 5%;
	z-index: 100;
}

.listRank{
  
  padding: 5px 15px !important;
  
}


</style>
<!--모바일페이지크기조절메타태그-->
<meta name="viewport" content="width=device-width" />

<title>OSCube</title>
</head>


<SCRIPT src="/js/jquery-2.1.3.min.js"></SCRIPT>
<script src="/js/bootstrap.js"></script>
<script src="/js/bootstrap_slider.js"></script>

<body>
<!-- 	탑버튼 -->

	<div id="body">
	<div class="btn-group btnTop">
		<button type="button" class="btn btn-default btn-xs">
			<span class="glyphicon glyphicon-upload" aria-hidden="true"></span>
			UP
		</button>
	</div>
	<!-- 전체 DIV -->
	<div style="margin:auto;" id="divAll">
		<!-- 이미지DIV  -->
		<br>
		<div align="center">
			<img src="images/logos/s2food.png" width="65%" class="logoImg"onclick="imgClick();" style="margin-top:36px;" >
		</div>
		<!-- 이미지DIV  -->
<br><br>
		<div style="text-align: center;">
			<!-- 아래 컨텐츠 -->
			<H2>
				에스투푸드
				<h3></h3>
			</H2> 
			<br>
			
			<input type="button" class="btn " value="Guest 접속" style="width:50%; background-color:#ffdab9;" onclick="loginclick();"><br>
			<input type="button" class="btn " value="회원가입"style="width:50%"><br>
			<br>
			<input type="button" class="btn btn-primary " value="FACEBOOK 로그인" style="width:50%" class="but" ><br>
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
	
	<div id="foot" style="text-align:center; font-size:10px;">
		<font size=2.5pt>version 1.0</font><br>
			<div style="background-color:#4ba9f5; line-height:30px; vertical-align:middle;">
			<font size=2.5pt color="white">COPYRIGHT ⓒ OSCube. ALL RIGHTS RESERVED. </font><img src="images/footer_logo_inverse.png" width=20px>
		 </div>
	</div>
	<% 
		}
	%>
	
</body>
</html>