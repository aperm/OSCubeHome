<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<style type="text/css">

</style>
<script type=text/javascript>
	function page() {
		$("#frm").load("scs_sign_up.jsp");
	}
</script>
</head>
<body id="result">
	<div style="margin: auto; z-index: 1;">
		<br>
		<!-- 이미지DIV  -->
		<div align="center">
			<img src="images/logos/s2food.png" width="65%" class="logoImg"
				onclick="imgClick();" style="margin-top: 36px;">
		</div>
		<!-- 이미지DIV  -->
		<br> <br>

		<form id="frm" name="login" method="post" action="loginconfirm.jsp">
			<h2>로그인</h2>
			<br />
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="email" name="id" /></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pw" /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td id="button" colspan="3" align="center"><input
						type="submit" value="로그인" class="btn1" onclick="return logincheck()"/> <input
						type="reset" value="취소" onclick="imgClick()"/> <input type="button" value="회원가입"
						onclick="page()"/></td>
				</tr>

				<tr>
					<%
						String message = (String) session.getAttribute("message");

						if (message != null) {
					%>
					<td colspan="2">${message}</td>

					<%
						session.removeAttribute("message");
						} else {
					%>
					<td colspan="2"></td>
					<%
						}
					%>
				</tr>
			</table>

			<div id="check"></div>
		</form>
	</div>
</body>
</html>