<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.io.IOException"%>
<%@ page
	import="java.sql.SQLException, java.sql.DriverManager, java.sql.Connection, java.sql.Statement, java.sql.ResultSet"%>
<!-- <SCRIPT type="text/JavaScript" src="/js/bootstrap.js"></SCRIPT> -->

<!-- JQuery -->
<SCRIPT src="js/jquery-2.1.3.min.js"></SCRIPT>
<!--  부가적인 테마 -->
<link rel="stylesheet" href="css/bootstrap-theme.css">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="css/bootstrap.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="js/bootstrap.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>물질검색 결과 페이지</title>
<head>
<style type="text/css">
table, td {
	border: 1px solid blue;
/* 	width:12.5%; */
	
}

table {
	width: 60%;
	height: auto;
	margin: auto;
	min-width: 500px;
	margin-top: 50px;
	text-align: center;
}

dl{
	width: 80%;
	height: auto;
	margin: auto;
	min-width: 500px;
	margin-top: 20px;
	text-align: center;
}
</style>

<script>
	var form = document.searchForm;
	
	function reFind(f){
		location.href="viewDetail.jsp?keyword="+f.keyword.value;
	}
</script>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:TestDB2", "rio2", "cube1234");
	Statement stmt = null;
	ResultSet rs = null;

	//일반물질 - 물질검색 / 상세검색 
	String categoryName = "";
	String chemNameKor = "";
	String chemNameEng = "";
	String chemId = "";
	String casNo = "";
	String chemNameKor_count = "";
	String chemNameEng_count = "";
	String chemId_count = "";
	String casNo_count = "";
	String keyword = "";
	String checkCid = "";

	if (request.getParameter("keyword") != null) {
		keyword = request.getParameter("keyword");
	}
	keyword = new String(keyword.getBytes("8859_1"), "utf-8");

	List list = null;
	ArrayList<HashMap<String, String>> selectList = new ArrayList<HashMap<String, String>>();

	StringBuffer strQuery = new StringBuffer();
	strQuery.append("select a.chemid, (select count(chemid) from normal_info where chemid like \'%");
	strQuery.append(keyword);
	strQuery.append(
			"%\') chemid_count,	a.chemnamekor, (select count(chemnamekor) from normal_info where chemnamekor like \'%");
	strQuery.append(keyword);
	strQuery.append(
			"%\') chemnamekor_count, a.chemnameeng, (select count(chemnameeng) from normal_info where upper(chemnameeng) like \'%\'||upper(\'");
	strQuery.append(keyword);
	strQuery.append(
			"\')||'%\') chemnameeng_count, a.casno, (select count(casno) from normal_info where casno like \'%");
	strQuery.append(keyword);
	strQuery.append("%\') casno_count from normal_info a where chemid like \'%");
	strQuery.append(keyword);
	strQuery.append("%\' or chemnamekor like \'%");
	strQuery.append(keyword);
	strQuery.append("%\' or casno like \'%");
	strQuery.append(keyword);
	strQuery.append("%\' or upper(chemnameeng) like \'%\'|| upper(\'");
	strQuery.append(keyword);
	strQuery.append("\')||'%\'");


	String query = strQuery + "";

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
			if(i == 0){
				chemNameKor_count = rs.getString("CHEMNAMEKOR_COUNT");
				chemNameEng_count = rs.getString("CHEMNAMEENG_COUNT");
				chemId_count = rs.getString("CHEMID_COUNT");
				casNo_count = rs.getString("CASNO_COUNT");
				hm.put("chemNameKor_count", chemNameKor_count);
				hm.put("chemNameEng_count", chemNameEng_count);
				hm.put("chemId_count", chemId_count);
				hm.put("casNo_count", casNo_count);
				i=1;
			}

			hm.put("chemNameKor", chemNameKor);
			hm.put("chemNameEng", chemNameEng);
			hm.put("chemId", chemId);
			hm.put("casNo", casNo);
			
			
			selectList.add(hm);
			
			
		}

	}

	//왜 에러인지
	// 	catch (IOException e) {
	// 		// TODO Auto-generated catch block
	// 		e.printStackTrace();
	// 	} 
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
	
	if(selectList.size()>0)
	{
		chemNameKor_count = selectList.get(0).get("chemNameKor_count");
		chemNameEng_count = selectList.get(0).get("chemNameEng_count");
		casNo_count = selectList.get(0).get("casNo_count");
		chemId_count = selectList.get(0).get("chemId_count");
	}
	%>


<table>
	<tr>
		<td colspan="8" align="center">
		<form action="searchView1.jsp" name="form">
			<div class="row">
				<div class="col-lg-6">
					<div class="input-group">
						<input name="keyword" type="text" class="form-control" placeholder="<%=keyword%>"><span class="input-group-btn">
							<button class="btn btn-default" type="submit" >재검색</button>
							<button class="btn btn-default" type="button" onclick="viewDetail(form)">상세검색</button>
						</span>
					</div>		<!-- /input-group -->
				</div>	<!-- /.col-lg-6 -->
			</div>	<!-- /.row -->
			</form>
		</td>
	</tr>
	<tr>
		<td colspan="2"><button class="btn btn-primary" type="button">국문결과 <span class="badge"><%=chemNameKor_count %></span></button></td>
		<td colspan="2"><button class="btn btn-primary" type="button">영문결과 <span class="badge"><%=chemNameEng_count %></span></button></td>
		<td colspan="2"><button class="btn btn-primary" type="button">casNo결과 <span class="badge"><%=casNo_count %></span></button></td>
		<td colspan="2"><button class="btn btn-primary" type="button">chemId결과 <span class="badge"><%=chemId_count %></span></button></td>
	</tr>
	</table>
	<dl>
		<div class="list-group">
	<%
		if(selectList.size()>0){
		for (int i = 0; i < selectList.size(); i++) {
			chemId = selectList.get(i).get("chemId");
			chemNameKor = selectList.get(i).get("chemNameKor");
			if(chemNameKor.equals("null"))
			{
				chemNameKor = "자료없음";
			}
			chemNameEng = selectList.get(i).get("chemNameEng");
			if(chemNameEng.equals("null"))
			{
				chemNameEng = "자료없음";
			}
			casNo = selectList.get(i).get("casNo");
			if(casNo.equals("null"))
			{
				casNo = "자료없음";
			}
	%>
	
			<a href="viewDetail.jsp?chemId=<%=chemId%>" class="list-group-item list-group-item-success"><%=chemNameKor %> / <%=chemNameEng %> / <%=casNo%> / <%=chemId%></a>
		
	
	<%		}
		}else{
	%>
			<div class="alert alert-warning" role="alert">[<%=keyword %>] 에 대한 검색 결과가 없습니다.</div>
	<%}%>
	
		</div>
	</dl>

</body>
</html>