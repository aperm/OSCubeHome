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
html,body{height:100%;
font-size:13pt;}
body{margin:0}
#body{min-height:100%}
#divAll{padding-bottom:5.0em}

#foot{margin-top:-4.79em;height:1.0em;}


.titleText{
	font-weight:bold;
	font-size:20pt;
	height:50px;
	color:#666;
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

.line20{
	height:20px;
}

.line30{
	height:30px;
}

.line40{
	height:40px;
}


.btnTop {
	display: none;
	overflow: hidden;
	position: fixed;
	bottom: 30px;
	right: 5%;
	z-index: 100;
}

</style>
<!--�����������ũ��������Ÿ�±�-->
<meta name="viewport" content="width=device-width" />

<title>OSCube</title>
</head>


<SCRIPT src="/js/jquery-2.1.3.min.js"></SCRIPT>
<script src="/js/bootstrap.js"></script>
<script src="/js/bootstrap_slider.js"></script>

<body>
<!-- 	ž��ư -->

	<div id="body">
	<div class="btn-group btnTop">
		<button type="button" class="btn btn-default btn-xs">
			<span class="glyphicon glyphicon-upload" aria-hidden="true"></span>
			UP
		</button>
	</div>
	<!-- ��ü DIV -->
	<div style="margin:auto;" id="divAll">
		<!-- �̹���DIV  -->
		<br>
		<div align="center">
			<img src="images/logos/s2food.png" width="65%" style="margin-top:36px;" >
		</div>
		<!-- �̹���DIV  -->
<br><br>
		<div style="text-align: center;">
			<!-- �Ʒ� ������ -->
			<H2>
				������Ǫ��
				<h3>Sustainable Safety for Food</h3>
			</H2> 
			<br>
			<input type="button" class="btn btn-primary " value="FACEBOOK �α���" style="width:50%" class="but" onclick="loginclick();"><br>
			<input type="button" class="btn btn-success" value="NAVER �α���" style="width:50%"><br>
			<input type="button" class="btn btn-danger" value="Google �α���"style="width:50%"><br>
			<br>
			<input type="button" class="btn " value="ȸ������"style="width:50%"><br>
			<input type="button" class="btn " value="Guest ����" style="width:50%; background-color:#ffdab9;"><br>
			
		</div>
		<!-- �Ʒ� ������ -->
	</div>
	<!-- ��ü DIV -->
	</div>
	
	<% 
		if(first==0)
		{
	%>
	
	<div id="foot" style="text-align:center; font-size:10px;">
		<font size=2.5pt>version 1.0</font><br>
			<div style="background-color:#4ba9f5; line-height:30px; vertical-align:middle;">
			<font size=2.5pt color="white">COPYRIGHT �� OSCube. ALL RIGHTS RESERVED. </font><img src="images/footer_logo_inverse.png" width=20px>
		 </div>
	</div>
	<% 
		}
	%>
	
</body>
</html>