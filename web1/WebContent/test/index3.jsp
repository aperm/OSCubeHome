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
	location.href="scs_search.jsp";
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

<!-- JQuery mobile -->
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>



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
			</H3> 
			<br><br>
			<input type="button" value="FACEBOOK 로그인" style="width:50%" class="but" onclick="butclick();"><br>
			<input type="button" value="NAVER 로그인" style="width:50%"><br>
			<input type="button" value="Google 로그인"style="width:50%"><br>
		</div>
		<!-- 아래 컨텐츠 -->
	</div>
	<!-- 전체 DIV -->
</body>
</html>

===
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*, java.text.*"%>

<html>
<head>
<link rel="shortcut icon" type="image/x-icon"
	href="images/favicon/favicon.ico" />
<link rel="stylesheet" href="/css/bootstrap-theme.css">
<link rel="stylesheet" href="/css/bootstrap.css">


<script type="text/javascript">
	function butClick(idMyDiv) {
		 var objDiv = document.getElementById(idMyDiv);

	     if(objDiv.style.display=="block"){ objDiv.style.display = "none"; }
	     else{ objDiv.style.display = "block"; }
	}
</script>


<!--모바일페이지크기조절메타태그-->
<meta name="viewport" content="width=device-width" />

<title>OSCube</title>
</head>

<SCRIPT src="/js/jquery-2.1.3.min.js"></SCRIPT>
<script src="js/bootstrap.js"></script>

<style>
#searchDiv {
	width: 50%;
	float: left;
}

#center-box {
	text-align: center;
	background-color: yellow;
	margin: 0 auto;
}

#searchBut {
	width: 50%;
	float: right;
	text-align: right;
}

#searchButId {
	height: 30px;
	height: 40px !important;
}
</style>



<body>
	<!-- 전체 DIV -->
	<div style="margin: auto;">
		<!-- 이미지DIV  -->
		<div>
			<img src="images/main_logo_inverse.png" width="100%">
		</div>
		<!-- 이미지DIV  -->
		<br> <br>
		
		<div class="">
			<table align="center">
				<tr>
					<td><input type="text" style="height: 50px;"
						placeholder="검색어입력하시오"></td>
					<td><input type="button" style="height: 50px;" value="검색" onclick="butClick('testdiv');return false;">
					</td>
				</tr>

				<tr>
					<td colspan="2">
						<div class="list-group"  id="testdiv" style="display:none;">
							<a href="select1.jsp" class="list-group-item list-group-item-success">Dapibus
								ac facilisis in</a> <a href="#"
								class="list-group-item list-group-item-info">Cras sit amet
								nibh libero</a> <a href="#"
								class="list-group-item list-group-item-warning">Porta ac
								consectetur ac</a> <a href="#"
								class="list-group-item list-group-item-danger">Vestibulum at
								eros</a>
						</div>
					</td>
				</tr>
			</table>

		</div>
	</div>
	<!-- 전체 DIV -->
</body>
</html>
===
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*, java.text.*"%>

<html>
<head>
<link rel="shortcut icon" type="image/x-icon"
	href="images/favicon/favicon.ico" />
<link rel="stylesheet" href="/css/bootstrap-theme.css">
<link rel="stylesheet" href="/css/bootstrap.css">


<script type="text/javascript">
	function butClick(idMyDiv) {
		 var objDiv = document.getElementById(idMyDiv);

	     if(objDiv.style.display=="block"){ objDiv.style.display = "none"; }
	     else{ objDiv.style.display = "block"; }
	}
</script>


<!--모바일페이지크기조절메타태그-->
<meta name="viewport" content="width=device-width" />

<title>OSCube</title>
</head>

<SCRIPT src="/js/jquery-2.1.3.min.js"></SCRIPT>
<script src="js/bootstrap.js"></script>


<body>
	<!-- 전체 DIV -->
	<div style="margin: auto;">
		<br> <br>
		
		<div class="">
			<table align="center">
				<tr>
					<td><input type="text" style="height: 50px;"
						placeholder="검색어입력하시오"></td>
					<td><input type="button" style="height: 50px;" value="검색" onclick="butClick('testdiv');return false;">
					</td>
				</tr>

				<tr>
					<td colspan="2">
						<div class="list-group"  id="testdiv" style="display:none;">
							<a href="select1.jsp" class="list-group-item list-group-item-success">Dapibus
								ac facilisis in</a> <a href="#"
								class="list-group-item list-group-item-info">Cras sit amet
								nibh libero</a> <a href="#"
								class="list-group-item list-group-item-warning">Porta ac
								consectetur ac</a> <a href="#"
								class="list-group-item list-group-item-danger">Vestibulum at
								eros</a>
						</div>
					</td>
				</tr>
			</table>

		</div>
	</div>
	<!-- 전체 DIV -->
</body>
</html>