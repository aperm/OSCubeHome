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