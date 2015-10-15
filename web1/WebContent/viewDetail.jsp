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
// 	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:TestDB2", "rio2", "cube1234");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1523:scsdbnew", "scsdbrio2", "cube1234");
	Statement stmt = null;
	ResultSet rs = null;
	//일반물질 - 물질검색 / 상세검색 // 공통변수
	String categoryName = "";
	String chemNameKor = "";
	String chemNameEng = "";
	String chemId = "";
	String casNo = "";
	
	String dermaYn = "";
	String cardiYn = "";
	String carcinYn = "";
	String gastroYn = "";
	String hepaYn = "";
	String iinhlYn = "";
	String immuYn = "";
	String neuroYn = "";
	String genoYn = "";
	String othersYn = "";
	String renalYn = "";
	String reproYn = "";
	
	
	if (request.getParameter("chemId") != null) {
		chemId = request.getParameter("chemId");
	}
	
	List list = null;
	ArrayList<HashMap<String, String>> selectList = new ArrayList<HashMap<String, String>>();

	StringBuffer strQuery = new StringBuffer();
	strQuery.append("select chemid, CATEGORYNAME, CHEMNAMEKOR, CHEMNAMEENG, CASNO, TOXICCODE, ");
	strQuery.append("decode(chemid,(select distinct(chemid) from tox_derma where chemid = \'");
	strQuery.append(chemId+"\'),\'Y\',\'N\') dermaYN,");
	strQuery.append("decode(chemid,(select distinct(chemid) from tox_cardi where chemid = \'");
	strQuery.append(chemId+"\'),\'Y\',\'N\') cardiYN,");
	strQuery.append("decode(chemid,(select distinct(chemid) from tox_carcin where chemid = \'");
	strQuery.append(chemId+"\'),\'Y\',\'N\') carcinYN,");
	strQuery.append("decode(chemid,(select distinct(chemid) from tox_gastro where chemid = \'");
	strQuery.append(chemId+"\'),\'Y\',\'N\') gastroYN,");
	strQuery.append("decode(chemid,(select distinct(chemid) from tox_hepa where chemid = \'");
	strQuery.append(chemId+"\'),\'Y\',\'N\') hepaYN,");
	strQuery.append("decode(chemid,(select distinct(chemid) from tox_iinhl where chemid = \'");
	strQuery.append(chemId+"\'),\'Y\',\'N\') iinhlYN,");
	strQuery.append("decode(chemid,(select distinct(chemid) from tox_immu where chemid = \'"); 
	strQuery.append(chemId+"\'),\'Y\',\'N\') immuYN,");
	strQuery.append("decode(chemid,(select distinct(chemid) from tox_neuro where chemid = \'");
	strQuery.append(chemId+"\'),\'Y\',\'N\') neuroYN,");
	strQuery.append("decode(chemid,(select distinct(chemid) from tox_geno where chemid = \'");
	strQuery.append(chemId+"\'),\'Y\',\'N\') genoYN,");
	strQuery.append("decode(chemid,(select distinct(chemid) from tox_others where chemid = \'");
	strQuery.append(chemId+"\'),\'Y\',\'N\') othersYN,");
	strQuery.append("decode(chemid,(select distinct(chemid) from tox_renal where chemid = \'");
	strQuery.append(chemId+"\'),\'Y\',\'N\') renalYN,");
	strQuery.append("decode(chemid,(select distinct(chemid) from tox_repro where chemid = \'");
	strQuery.append(chemId+"\'),\'Y\',\'N\') reproYN ");
	strQuery.append("from normal_info where chemid = \'");  
	strQuery.append(chemId+"\'"); 


	System.out.println(strQuery);

	String query = strQuery + "";

	try {

		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
		int i = 0; 
		while (rs.next()) {
			
			HashMap<String, String> hm = new HashMap<String, String>();
			chemNameKor = rs.getString("CHEMNAMEKOR");
			chemNameEng = rs.getString("CHEMNAMEENG");
			casNo = rs.getString("CASNO");
			
			dermaYn = rs.getString("DERMAYN");
			cardiYn = rs.getString("CARDIYN");
			carcinYn = rs.getString("CARCINYN");
			gastroYn = rs.getString("GASTROYN");
			hepaYn = rs.getString("HEPAYN");
			iinhlYn = rs.getString("IINHLYN");
			immuYn = rs.getString("IMMUYN");
			neuroYn = rs.getString("NEUROYN");
			genoYn = rs.getString("GENOYN");
			othersYn = rs.getString("OTHERSYN");
			renalYn = rs.getString("RENALYN");
			reproYn = rs.getString("REPROYN");

			
			hm.put("chemNameKor", chemNameKor);
			hm.put("chemNameEng", chemNameEng);
			hm.put("chemId", chemId);
			hm.put("casNo", casNo);
			
			hm.put("dermaYn", dermaYn);
			hm.put("cardiYn", cardiYn);
			hm.put("carcinYn", carcinYn);
			hm.put("gastroYn", gastroYn);
			hm.put("hepaYn", hepaYn);
			hm.put("iinhlYn", iinhlYn);
			hm.put("immuYn", immuYn);
			hm.put("neuroYn", neuroYn);
			hm.put("genoYn", genoYn);
			hm.put("othersYn", othersYn);
			hm.put("renalYn", renalYn);
			hm.put("reproYn", reproYn);

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
	
	
	%>


<table>
	<tr>
		<td colspan="8" align="center">
		<form action="searchView1.jsp" name="form">
			<div class="row">
				<div class="col-lg-6">
					<div class="input-group">
						<input name="keyword" type="text" class="form-control" placeholder="<%=chemId%>"><span class="input-group-btn">
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
	
	</tr>
	</table>
	<dl>
		<div class="list-group">
	<%
		if(selectList.size()>0){
		for (int i = 0; i < selectList.size(); i++) {
			chemId = selectList.get(i).get("chemId");
			chemNameKor = selectList.get(i).get("chemNameKor");
			chemNameEng = selectList.get(i).get("chemNameEng");
			casNo = selectList.get(i).get("casNo");
			
			dermaYn = selectList.get(i).get("dermaYn");
			gastroYn = selectList.get(i).get("gastroYn");
			hepaYn = selectList.get(i).get("hepaYn");
			cardiYn = selectList.get(i).get("cardiYn");
			renalYn = selectList.get(i).get("renalYn");
			genoYn = selectList.get(i).get("genoYn");
			reproYn = selectList.get(i).get("reproYn");
			immuYn = selectList.get(i).get("immuYn");
			iinhlYn = selectList.get(i).get("iinhlYn");
			neuroYn = selectList.get(i).get("neuroYn");
			carcinYn = selectList.get(i).get("carcinYn");
			othersYn = selectList.get(i).get("othersYn");

			
			if(dermaYn.equals("Y"))
			{
	%>
				<a href="toxView.jsp?chemId=<%=chemId%>&gubun=derma" target="_blank"  class="list-group-item list-group-item-warning" style="width:200px">피부독성</a>
	<%		}
			if(gastroYn.equals("Y"))
			{
	%>
				<a href="toxView.jsp?chemId=<%=chemId%>&gubun=gastro" target="_blank"  class="list-group-item list-group-item-warning" style="width:200px">소화기계독성</a>
	<%		}
			if(hepaYn.equals("Y"))
			{
	%>
				<a href="toxView.jsp?chemId=<%=chemId%>&gubun=hepa"  target="_blank" class="list-group-item list-group-item-warning" style="width:200px">간독성</a>
	<%		}
			if(cardiYn.equals("Y"))
			{
	%>
				<a href="toxView.jsp?chemId=<%=chemId%>&gubun=cardi"  target="_blank" class="list-group-item list-group-item-warning" style="width:200px">심혈관계독성</a>
	<%		}
			if(renalYn.equals("Y"))
			{
	%>
				<a href="toxView.jsp?chemId=<%=chemId%>&gubun=renal"  target="_blank" class="list-group-item list-group-item-warning" style="width:200px">신장독성</a>
	<%		}
			if(genoYn.equals("Y"))
			{
	%>
				<a href="toxView.jsp?chemId=<%=chemId%>&gubun=geno"  target="_blank" class="list-group-item list-group-item-warning" style="width:200px">유전독성</a>
	<%		}
			if(reproYn.equals("Y"))
			{
	%>
				<a href="toxView.jsp?chemId=<%=chemId%>&gubun=repro" target="_blank"  class="list-group-item list-group-item-warning" style="width:200px">생식/기형유발성독성</a>
	<%		}
			if(immuYn.equals("Y"))
			{
	%>
				<a href="toxView.jsp?chemId=<%=chemId%>&gubun=immu" target="_blank"  class="list-group-item list-group-item-warning" style="width:200px">면역독성</a>
	<%		}
			if(iinhlYn.equals("Y"))
			{
	%>
				<a href="toxView.jsp?chemId=<%=chemId%>&gubun=iinhl" target="_blank"  class="list-group-item list-group-item-warning" style="width:200px">흡입독성</a>
	<%		}
			if(neuroYn.equals("Y"))
			{
	%>
				<a href="toxView.jsp?chemId=<%=chemId%>&gubun=neuro"  target="_blank" class="list-group-item list-group-item-warning" style="width:200px">신경독성</a>
	<%		}
			if(carcinYn.equals("Y"))
			{
	%>
				<a href="toxView.jsp?chemId=<%=chemId%>&gubun=carcin" target="_blank"  class="list-group-item list-group-item-warning" style="width:200px">발암성</a>
	<%		}
			if(othersYn.equals("Y"))
			{
	%>
				<a href="toxView.jsp?chemId=<%=chemId%>&gubun=others" target="_blank" class="list-group-item list-group-item-warning" style="width:200px">기타독성</a>
	<%		}
		}
	}
	
	%>
	
		</div>
	</dl>

</body>
</html>