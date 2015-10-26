function check() {
	var id = document.login.id.value;
	var pw = document.login.pw.value;
	var pw1 = document.login.pw1.value;
	if (id == "") {
		document.getElementById("check").innerHTML = "아이디를 입력하지 않았습니다.";
		document.login.id.focus();
		return false;
	}
	if (pw == "") {
		document.getElementById("check").innerHTML = "비밀번호를 입력하지 않았습니다.";
		document.login.pw.focus();
		return false;
	}
	if (pw1 != pw) {
		document.getElementById("check").innerHTML = "비밀번호가 일치하지 않습니다.";
		document.login.pw.focus();
		return false;
	}
	if(id !=null && pw != null){
		$("#check").load("signup.jsp?id=" + id + "&pw=" + pw);
		return false;
	}
}


function overlap() {
	var id = document.login.id.value;
	if (id != "") {
		$("#check").load("checkid.jsp?id=" + id);
	}
}

function logincheck(){
	var id = document.login.id.value;
	var pw = document.login.pw.value;
	if (id == "") {
		document.getElementById("check").innerHTML = "아이디를 입력하지 않았습니다.";
		document.login.id.focus();
		return false;
	}
	if (pw == "") {
		document.getElementById("check").innerHTML = "비밀번호를 입력하지 않았습니다.";
		document.login.pw.focus();
		return false;
	}
	
	if(id != "" && pw != ""){
		$("#result").load("login.jsp?id=" + id + "&pw=" + pw);
	}
}