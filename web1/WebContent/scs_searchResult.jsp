<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*, java.text.*"%>
<%@ page import="java.io.IOException"%>
<%@ page
	import="java.sql.SQLException, java.sql.DriverManager, 
        java.sql.Connection, java.sql.Statement, java.sql.ResultSet"%>
        
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1523:scsdbnew", "scsdbrio2", "cube1234");
	Statement stmt = null;
	ResultSet rs = null;
	
	//일반물질 - 물질검색 / 상세검색 
	String chemNameKor = ""; 
	String chemNameEng = "";
	String chemId = "";
	String casNo = "";
// 	String keyword = "";
	 
	if (request.getParameter("param") != null) {
		keyword = request.getParameter("param");
	}

	List list = null;
	ArrayList<HashMap<String, String>> searchList = new ArrayList<HashMap<String, String>>();
	
	StringBuffer strQuery = new StringBuffer();
	strQuery.append("select a.chemid, a.chemnamekor, a.chemnameeng, a.casno from normal_info a where chemid like \'%");
	strQuery.append(keyword);
	strQuery.append("%\' or chemnamekor like \'%");
	strQuery.append(keyword);
	strQuery.append("%\' or casno like \'%");
	strQuery.append(keyword);
	strQuery.append("%\' or upper(chemnameeng) like \'%\'|| upper(\'");
	strQuery.append(keyword);
	strQuery.append("\')||'%\'");
	
	String query = strQuery + "";
	System.out.println(query);
	try {
	
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
		int i = 0; 
		while (rs.next()) {
			
			HashMap<String, String> hm = new HashMap<String, String>();
			chemNameKor = rs.getString("CHEMNAMEKOR");
			chemNameEng = rs.getString("CHEMNAMEENG");
			chemId = rs.getString("CHEMID");
			casNo = rs.getString("CASNO");
			hm.put("chemNameKor", chemNameKor);
			hm.put("chemNameEng", chemNameEng);
			hm.put("chemId", chemId);
			hm.put("casNo", casNo);
			
			searchList.add(hm);
		}
		System.out.println(searchList);
	}

finally {
	try {
		if (rs != null)
			rs.close();
		if (stmt != null)
			stmt.close();
		if (conn != null)
			conn.close();
	} catch (Exception e) {
	}
}
	
%>

<script type="text/javascript">
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

	
	$(".searchResult").click(function(event) {
		var th = $(this);
		var th_id = th.attr('id');
		$('html, body').animate({ 
			scrollTop : 0
		}, 0);
		$("#divAll").load("scs_resultView.jsp", {param : th_id});
	});

	
	$('.pageBack').click(function() {
		$('html, body').animate({
			scrollTop : 0
		}, 0);
		$("#divAll").load("scs_searchMain.jsp");
	});
	
	
	window.onload=function()
	{
		$('html, body').animate({
			scrollTop : 0
		}, 0);
		alert("d");
	}
	
	function searchBntClick() {
		 var searchWord = $('#searchWord').val();
		 $("#divAll").load("scs_searchResult.jsp", {param:searchWord});
		 
	}
	
// 	alert(($(window).height()/5)); 
 	$("#menuBarTable").attr('height',($(window).height()/9));
//  	$("#searchBarTable").attr('height',($(window).height()/10));
 	$("#logoImgId").attr('height',($(window).height()/11));
	
</script>



<style type="text/css">

.list-group-item2 {
  position: relative;
  display: block;
  padding: 10px 15px;
  margin-bottom: -1px;
  background-color: #fff;
  border: 1px solid #ddd;
}

.imgtag{
	background:url(images/footer_logo.png) no-repeat;
	border:none;
	z-index:100;
}
a.list-group-item2 {
  color: #555;
}
a.list-group-item2 .list-group-item2-heading {
  color: #333;
}
a.list-group-item2:hover,
a.list-group-item2:focus {
  color: #555;
  text-decoration: none;
  background-color: #f5f5f5;
}
.labelTag{
 	background-color: #5bc0de;
	width:1000px;
}
td {
  padding-top: 4px;
  padding-bottom: 4px;
}
</style>


<body>

	<!-- 전체 DIV -->
	<div style="margin: auto; z-index: 100;">
		<!-- 		상단 툴 + 검색바 -->
		<div>
			<!-- 	상단 홈바 -->
			<div id="topMenu" style= "position: fixed; width:100%; background-color:#ffffff;z-index:100;" >
				<table id="menuBarTable" width=100%
					style="text-align: center; align: center; vertical-align: middle;">
					<tr>
						<td width=20%><div class="pageBack">
								<span class="glyphicon glyphicon-chevron-left"
									aria-hidden="true"></span>BACK
							</div></td>
						<td width=60% style="padding-right:5%;padding-left:3%;">
						<img src="/images/logos/s2food.png" id="logoImgId" class="logoImg"
							onclick="imgClick();"></td>
						<td width=20%></td>
					</tr>
					</table>
					<!-- 		검색메뉴 -->
					<div id="searchBarDiv" style="background-color:#4ba9f5; vertical-align:middle;">
					<table id="searchBarTable" class="" align="center" width=95% height=52px
					style="text-align: center; align: center; vertical-align: middle; " >
					<tr>
						<td height=5px></td>
						<td></td>
					</tr>
					<tr>
						<!-- 검색바 -->

						<td width=70%><input type="text" id="searchWord"
							style="border-radius:2px 0px 0px 2px; height: 40px; width: 100%;" placeholder="  검색어를 입력하세요."
							value="소르빈산"></td>
						<td width=30%><input type="button"
							style="border-radius:0px 2px 2px 0px; height: 40px; width: 100%;" value="검색"
							class="searchBut" onclick="searchBntClick();"></td>
							
					</tr>
					<tr>
						<td height=5px></td>
						<td></td> 
					</tr>
				</table>
				</div>
			</div>
			<!-- 		아래 검색결과 -->
			<br>

			<div class="" style="margin-top:100px;">
				<table align="center" text-align="left" width=95%>
					<tr>
						<td colspan="2" height=15px> </td>
					</tr>
					<tr>
						<td colspan="2" style="height: 10px;">검색어 [소르빈산]의 결과는 [7] 개
							입니다.
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="list-group" id="testdiv" style="">
								<% 
// 									여기에 포문
								
								
								
								%>
								
								<a href="#" class="list-group-item searchResult" id="소르빈산">
								<span class="label label-info">국문명</span> 소르빈산<br>
								<span class="label label-info">영문명</span> Sorbic acid<br>
								<span class="label label-info">CAS #</span> 110-44-1</a>
								
								<a href="#" class="list-group-item searchResult list-group-item-info" id="d-소르비톨">
								<span class="label label-info">국문명</span> d-소르비톨<br>
								<span class="label label-info">영문명</span> D-Sorbitol<br>
								<span class="label label-info">CAS #</span> 50-70-4</a> 
								
								<a href="#"	class="list-group-item searchResult " id="레소르시놀">
								<span class="label label-info">국문명</span> 레소르시놀<br> 
								<span class="label label-info">영문명</span> Resorcinol<br>
								<span class="label label-info">CAS #</span> 108-46-3</a> 
								
								<a href="#"	class="list-group-item searchResult list-group-item-info" id="질산 이소소르비드">
								<span class="label label-info">국문명</span> 질산 이소소르비드<br> 
								<span class="label label-info">영문명</span> Isosorbide dinitrate<br>
								<span class="label label-info">CAS #</span> 87-33-2</a> 
								
								<a href="#" class="list-group-item searchResult" id="소르빈산 칼슘" >
								<span class="label label-info">국문명</span> 소르빈산 칼슘<br>
								<span class="label label-info">영문명</span> Calcium sorbate<br>
								<span class="label label-info">CAS #</span> 7492-55-9</a>
								
								<a href="#"	class="list-group-item searchResult list-group-item-info" id="에리소르 빈산">
								<span class="label label-info">국문명</span> 에르소르 빈산<br> 
								<span class="label label-info">영문명</span> Erythorbic acid<br>
								<span class="label label-info">CAS #</span> 89-65-6</a> 
								
								<a href="#"	class="list-group-item2 searchResult" id="소르빈산 칼륨">
								<alt class="labelTag" style="">국문명</alt> 소르빈산 칼륨<br>
								<span class="label label-info">영문명</span> Potassium sorbate<br> 
								<span class="label label-info">CAS #</span> 24634-61-5</a> 
								
									
								</div>
						</td>
					</tr>


				</table>

			</div>
		</div>
	</div>

	<!-- 전체 DIV -->
	</body>