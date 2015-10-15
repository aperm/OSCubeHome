<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*"%>
<%@ page import="java.net.URLEncoder"%>
<!-- JQuery -->
<SCRIPT src="js/jquery-2.1.3.min.js"></SCRIPT>
<!--  부가적인 테마 -->
<link rel="stylesheet" href="css/bootstrap-theme.css">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="css/bootstrap.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="js/bootstrap.js"></script>


<html>
<head>
<style type="text/css">
table, td {
	border: 1px solid blue;
}

table {
	width: 60%;
	height: 250px;
	margin: auto;
	min-width: 500px;
	text-align: center;
	margin-top: 50px;
}

</style>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>OSCube</title>
</head>
<body>
	<table>
		<tr>
			<td>
				<h3>화학물질 일반정보 / 독성정보 서비스 API</h3>
			</td>
		</tr>
		<tr>
			<td>
				<form class="navbar-form" role="search" action="searchView1.jsp">
					<div class="form-group">
						<input type="text" name="keyword" class="form-control" placeholder="국문/영문/casNo" style="color:skyblue; font-weight:bord;">
						<button type="submit" class="btn btn-default">검색</button>
					</div>
					
				</form>
			</td>
		</tr>
	</table>

</body>
</html>