<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*" %>
<%@ page import="java.net.URLEncoder"%>

<!-- <SCRIPT type="text/JavaScript" src="/js/bootstrap.js"></SCRIPT> -->
<script>
	var form = document.searchForm;
	var f_selbox = new Array('일반물질','독성물질');
	var f_selbox_val = new Array('normal','tox');
	
	var s_selbox = new Array();
	s_selbox[0] = new Array("물질검색","상세정보검색");
	s_selbox[1] = new Array("피부독성정보 조회","소화기계독성정보 조회","간독성정보 조회","심혈관계독성정보 조회", "신장독성정보 조회", "유전독성정보 조회", "생식/기형유발성독성정보 조회", "면역독성정보 조회", "흡입독성정보 조회", "신경독성정보 조회", "발암성정보 조회", "기타독성정보 조회");
	
	var s_selbox_val = new Array(); 
	s_selbox_val[0] = new Array("nor1","nor2");
	s_selbox_val[1] = new Array("tox1", "tox2", "tox3", "tox4", "tox5", "tox6", "tox7", "tox8", "tox9", "tox10", "tox11", "tox12");


	function init(f){
		var f_sel = f.first;
		var s_sel = f.second;

		for(var i =0; i<f_selbox.length; i++){
			f_sel.options[i+1] = new Option(f_selbox[i], f_selbox_val[i]);
		}
	}

	function itemChange(f){
		var f_sel = f.first;
		var s_sel = f.second;

		var sel = f_sel.selectedIndex;
		for(var i=s_sel.length; i>=0; i--){
			s_sel.options[i] = null;
		}
		s_sel.options[0] = new Option("선택", "");
		
		if(sel != 0){
			for(var i=0; i<s_selbox[sel-1].length; i++){
				s_sel.options[i+1] = new Option(s_selbox[sel-1][i], s_selbox_val[sel-1][i]);
			}
			f.action="searchView"+sel+".jsp";
		}
		
		
	}	
	
</script>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
   
<title>물질검색</title>
</head>
<body align="center">

<br><br>
화학물질 일반정보/독성정보 서비스 API

	<form name="searchForm" id="searchForm" action="searchView1.jsp"   method="post"  style="padding:50px;" >
		<table bordercolor="skyblue" width=400 align="center" >
			<tr height="100" style="margin-left:20px;">
				<td align="left" width=150>
					검색할 물질 선택
				</td>
				<td>
					<select id="first" name="first" onchange="itemChange(this.form);" style="width:100px;">	
						<option value="">선택</option>
						<option value="normal">일반물질</option>
						<option value="tox">독성물질</option>	
					</select>
				</td>
				</tr>
				<tr>
				<td align="left" width=150> 세부항목 선택 </td>
				<td>
					<select name="second" id="second"  style="width:210px;" >
						<option value="">선택</option>
					</select>			
				</td>
			</tr>
   			<tr height="100">
   			<td align="left" width=150>
		   		검색할 물질 : 
		   		</td>
		   		<td>
		   			<input type="text" name="keyword" placeholder="물질명 또는 casNo" >
		   		</td> 
		   	</tr>
		   	<tr><td></td>
		   		<td align="center">
					<input type="submit" value="확인">
				</td>	
			</tr>
		</table>
	</form>
</body>
</html>