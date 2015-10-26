<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<style type="text/css">
table {
	align: center;
	width: 95%;
}

.front {
	font-size: 15px;
}
</style>
<SCRIPT src="/js/idcheck.js"></SCRIPT>

</head>
<body>

	<h2>회원가입</h2>
	<table>
		<tr>
			<td class="front">이메일</td>
			<td><input type="email" name="id" id="id" /></td>
			<td><input type="button" value="중복확인" onclick="overlap()" /></td>
		</tr>
		<tr>
			<td class="front">비밀번호</td>
			<td><input type="password" name="pw" id="pw" /></td>
		</tr>
		<tr>
			<td class="front">비밀번호 확인</td>
			<td><input type="password" name="pw1" id="pw1" /></td>
		</tr>
		<tr>
			<td><input type="button" value="확인" onclick="return check();" /></td>
			<td><input type="reset" value="취소" onclick="imgClick();" /></td>
		</tr>
	</table>
	<br />
	<div id="check"></div>
</body>
</html>