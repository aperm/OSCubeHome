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
<link rel="shortcut icon" type="image/x-icon"
	href="images/favicon/favicon.ico" />

<link rel="stylesheet" href="/css/bootstrap-theme.css">
<link rel="stylesheet" href="/css/bootstrap.css">
<SCRIPT src="/js/jquery-2.1.3.min.js"></SCRIPT>
<script src="/js/bootstrap.js"></script>
<style type="text/css">
.col-sm-13 {
/* 	position: relative; */
	min-height: 1px;
	padding-right: 20px;
	padding-left: 20px;
}

.col-md-13 {
	width: 50%; 
/* 	text-align:center */
	float: left;
	min-height: 100px;
	margin-left:10px;
}

.imgclass1 .caption {
	padding: 9px;
	color: #333;
}

.container {
	width: 70%;
	height: 70%;
/* 	margin: 40px auto; */
	min-width:1000px;
}

.outer {
	display: table;
	width: 100%;
	height: 100%;
}

.inner {
	display: table-cell;
	vertical-align: middle;
	text-align: center;
}

    h2 { font-size: 40px; }
    h3 { font-size: 25px; }
    div p { font-size: 14px; }
    li{ }
    
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<!-- <meta name="viewport" content="width=device-width" /> -->
<!--모바일페이지크기조절메타태그-->
<script>
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top - 65
			}, 1000);
		});
	});
</script>

<title>OSCube</title>
</head>
<link href='https://fonts.googleapis.com/css?family=Gruppo' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Poiret+One' rel='stylesheet' type='text/css'>
<body style="font-family: 'Poiret One', cursive;">

	<div class="btn-group"
		style="position: fixed; left: 10%; top: 100px; z-index: 100;">
		<button class="btn btn-default btn-lg dropdown-toggle" type="button"
			data-toggle="dropdown" aria-expanded="false">
			MENU <span class="caret"></span>
		</button>
		<ul class="dropdown-menu" role="menu">
			<li><a href="#target1" class="scroll">HOME</a></li>
			<li><a href="#target2" class="scroll">MISSION</a></li>
			<li><a href="#target3" class="scroll">EXPERTISE</a></li>
			<li><a href="#target4" class="scroll">OPEN POSITIONS</a></li>
			<li><a href="#target6" class="scroll">PARTNERS</a></li>
			<li class="divider"></li>
			<li><a href="#target7" class="scroll">CONTACT</a></li>
			<li><a href="#target9" class="scroll">소개</a></li>
		</ul>
	</div>
	
	
	<table id="target0"  background="images/back.png" style="marhin:auto; text-align:center; width:100%;" >
		<tr>
			<td width="25%" background="back.png">
			</td>
			<td style="" align="right" valign="middle">
				<img src="images/main_logo_inverse.png">
			</td>
			<td  width="25%">
			</td>
		</tr>
	
	</table>

	<!-- 전체를 감싸는 div -->
	<div class="container"
		style="margin: auto;  padding: 10px; text-align: center; margin-top: 100px;">
		<div class="outer">
			<div class="inner">
			
<!-- 			<div id="target1" style="margin: 0 auto; height: auto;"> -->
<!-- 				<img src="images/main_logo.png"> -->
<!-- 			</div> -->
			<br><br> <br>
			<div id="target2"
				style="margin: 0 auto; margin-top: 100px; height: auto; ">
				
				<img src="images/mission.png" width="850px">
<!-- 				<font style="font-family: 'Malgun Gothic';" color="#006098"> -->
<!-- 						<h2>From measurement to wisdom,<br> -->
<!-- 						we serve for human health, safety and environment<br> -->
<!-- 					</h2> -->
<!-- 				</font>-->

 <br> <br> <br> <br> 
				

				
			</div>

			<div id="target3" style=" margin-top: 100px;">
				<div class="page-header">
					<h1><b>EXPERTISE</b></h1>
				</div>
				<div style="text-align:left; margin-left:15%">
					<font>
					<h3> 
					<ul>
						<li>Providing certified measurement solutions for chemicals and nanomaterials</li>
						<li>Discovering knowledge & wisdoms on human health, safety, and environment</li>
						<li>Developing predictive analytics technologies for better human life</li>
						<li>Training & consulting service for consumers, business and goverment sectors</li>
					</ul>
						</h3>
					</font>
				</div>
			</div>
			<div id="target4" style="height: 300px; margin-top: 100px;">
				<div class="page-header">
					<h1><b>OPEN POSITIONS</b></h1>
				</div>
				<h3>
				We have open positions for data curator and data analyst<br> 
				who will work on the the predictive analytics of biomedical, safety and environmental data.<br>
				If you are interested in this position,<br>
				Send us your resume or CV directly to oscube.com@gmail.com.<br> 
				</h3>
			</div>

			<div id="target6"
				style="margin: auto;  margin-top: 100px; text-align: center;">
				<div class="page-header">
					<h1><b>PARTNERS</b></h1>
				</div>
				<div class="row" style="text-align:center; margin:auto;">
					<div class="col-sm-13 col-md-13">
						<div class="">
							<img
								src="images/logos/hanyang_1.png" width="100%">
						</div>
					</div>
<!-- 					<div class="col-sm-13 col-md-13"> -->
<!-- 						<div class="imgclass1"> -->
<!-- 						<img -->
<!-- 								src="images/logos/s2nano.png" width=360> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="col-sm-13 col-md-13"> -->
<!-- 						<div class="imgclass1"> -->
<!-- 							<img -->
<!-- 								src="images/logos/to21.png" width=250> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="col-sm-13 col-md-13"> -->
<!-- 						<div class="imgclass1"> -->
<!-- 							<img -->
<!-- 								src="images/logos/kangwon.png" width=250> -->
<!-- 						</div> -->
<!-- 					</div> -->
					<div class="col-sm-13 col-md-13">
						<div class="">
							<img
								src="images/logos/yonsei_1.png" width="100%">
						</div>
					</div>
				</div>
			</div>

			<div id="target7"
				style="margin: 0 auto; margin-top: 100px; height: auto;">
				<div class="page-header">
					<h1><b>CONTACT</b></h1>
				</div>
			</div>

			
				
			</div> <!--  inner -->
		</div>	<!-- 		//outer -->
	</div>	<!-- 		//container -->
	
	
	<table id="target9"  align="center" style=" background-color: gray; marhin:auto; text-align:center; width:100%;" >
		<tr>
			<td width="25%">
			</td>
			<td style="" align="right" valign="middle"  width="50%">
				<img src="images/footer_logo.png" width=80  align="left">
				<small>
					<font color="white">OSCube Co., Ltd.<br>
								#211, E&C Venture Dream Tower #2 Bldg., 55, Digital-ro 33-gil, Guro-gu, Seoul, 08376, Rep. of KOREA <br> 
								+82-2-855-3688 / oscube.com@gmail.com <br> COPYRIGHT ⓒ OSCube. ALL RIGHTS RESERVED.
					</font>
				 </small>
			</td>
			<td  width="25%">
			</td>
		</tr>
		<tr>
			<td height="-1.9em">
		
			</td>
		</tr>
	
	</table>

</body>
</html>