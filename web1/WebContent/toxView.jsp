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
	border: 1px solid skyblue;
	min-width:100px;

}

table {
	width: auto;
	height: auto;
	margin: auto;
	min-width: 500px;
	text-align: center;
}

dl{
	width: 90%;
	height: auto;
	margin: auto;
	margin-top: 20px;
	text-align: center;
	min-width: 400px;
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
	String gubun = "";
	//일반물질 - 물질검색 / 상세검색 // 공통변수
	
	String categoryName = "";
	String chemNameKor = "";
	String chemNameEng = "";
	String chemId = "";
	String casNo = "";
	String toxicCode = "";
	String mecha          ="";
	String toxValues      ="";
	String tsendPoint     ="";
	String species        ="";
	String route          ="";
	String dosage         ="";
	String toxEffect      ="";
	String refer          ="";
	String kinMetaInfo    ="";
	String absor          ="";
	String distribu       ="";
	String metabol        ="";
	String elimina        ="";
	String pdfUrl         ="";

	String toxContent ="";
	String tox="Tox";
	//carcin 일 경우 변수 더 포함해서..
	String gubunKor = "";
	
	
	
	
	
	String table = "tox_";
	
	if (request.getParameter("chemId") != null) {
		chemId = request.getParameter("chemId");
	}
	
	if (request.getParameter("gubun") != null) {
		gubun = request.getParameter("gubun");
		table += gubun;
		tox = gubun+tox;
		if(gubun.equals("derma")){
			gubunKor="피부독성";
		}else if(gubun.equals("gastro")){
			gubunKor="소화기계독성정보";
		}else if(gubun.equals("hepa")){
			gubunKor="간독성정보";
		}else if(gubun.equals("cardi")){
			gubunKor="심혈관계독성정보";
		}else if(gubun.equals("renal")){
			gubunKor="신장독성정보";
		}else if(gubun.equals("geno ")){
			gubunKor="유전독성정보";
		}else if(gubun.equals("repro")){
			gubunKor="생식/기형유발성독성정보";
		}else if(gubun.equals("immu")){
			gubunKor="면역독성정보";
		}else if(gubun.equals("iinhl")){
			gubunKor="흡입독성정보";
		}else if(gubun.equals("neuro")){
			gubunKor="신경독성정보";
		}else if(gubun.equals("carcin")){
			gubunKor="발암성정보";
		}else if(gubun.equals("others")){
			gubunKor="기타독성정보";
		}
	}
	
	

	List list = null;
	ArrayList<HashMap<String, String>> selectList = new ArrayList<HashMap<String, String>>();

	StringBuffer strQuery = new StringBuffer();
	strQuery.append("select * from ");
	strQuery.append(table);
	strQuery.append(" where chemid = \'");  
	strQuery.append(chemId+"\'"); 

	String query = strQuery + "";

	try {

		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
		int i = 0; 
		while (rs.next()) {
			
			HashMap<String, String> hm = new HashMap<String, String>();
			categoryName = rs.getString("CATEGORYNAME");
			chemNameKor = rs.getString("CHEMNAMEKOR");
			chemNameEng = rs.getString("CHEMNAMEENG");
			casNo = rs.getString("CASNO");
			toxicCode = rs.getString("TOXICCODE");
			mecha = rs.getString("MECHA");
			toxValues = rs.getString("TOXVALUES");
			tsendPoint = rs.getString("TSENDPOINT");
			species = rs.getString("SPECIES");
			route = rs.getString("ROUTE");
			dosage = rs.getString("DOSAGE");
			toxEffect = rs.getString("TOXEFFECT");
			refer = rs.getString("REFER");
			kinMetaInfo = rs.getString("KINMETAINFO");
			absor = rs.getString("ABSOR");
			distribu = rs.getString("DISTRIBU");
			metabol = rs.getString("METABOL");
			elimina = rs.getString("ELIMINA");
			pdfUrl = rs.getString("PDFURL");
			
			toxContent = rs.getString(tox);

			
			hm.put("categoryName", categoryName);
			hm.put("chemNameKor", chemNameKor);
			hm.put("chemNameEng", chemNameEng);
			hm.put("chemId", chemId);
			hm.put("casNo", casNo);
			hm.put("toxicCode", toxicCode);
			hm.put("tox",toxContent);
			
			hm.put("mecha", mecha);
			hm.put("toxValues", toxValues);
			hm.put("tsendPoint", tsendPoint);
			hm.put("species", species);
			hm.put("route", route);
			hm.put("dosage", dosage);
			hm.put("toxEffect", toxEffect);
			hm.put("refer", refer);
			hm.put("kinMetaInfo", kinMetaInfo);
			hm.put("absor", absor);
			hm.put("distribu", distribu);
			hm.put("metabol", metabol);
			hm.put("elimina", elimina);
			hm.put("pdfUrl", pdfUrl);


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
	
	
	chemId = selectList.get(0).get("chemId");
	chemNameKor = selectList.get(0).get("chemNameKor");
	chemNameEng = selectList.get(0).get("chemNameEng");
	casNo = selectList.get(0).get("casNo");
	categoryName = selectList.get(0).get("categoryName");
	toxicCode = selectList.get(0).get("toxicCode");
	tox = selectList.get(0).get("tox");
	mecha = selectList.get(0).get("mecha");
	toxValues = selectList.get(0).get("toxValues");
	tsendPoint = selectList.get(0).get("tsendPoint");
	species = selectList.get(0).get("species");
	route = selectList.get(0).get("route");
	dosage = selectList.get(0).get("dosage");
	toxEffect = selectList.get(0).get("toxEffect");
	refer = selectList.get(0).get("refer");
	kinMetaInfo = selectList.get(0).get("kinMetaInfo");
	absor = selectList.get(0).get("absor");
	distribu = selectList.get(0).get("distribu");
	metabol = selectList.get(0).get("metabol");
	elimina = selectList.get(0).get("elimina");
	pdfUrl = selectList.get(0).get("pdfUrl");
	
	
	%>

<div class="panel panel-default" style="width:60%; height:auto; margin:auto; margin-top: 20px;">
<div class="panel-heading"><h3>독성물질 상세 정보 보기</h3></div>
<table>
	<tr>
		<td rowspan="2" width=100>물질명</td>
		<td>국문</td>
		<td><%=chemNameKor%></td>
		<td>casNo</td>
		<td><%=casNo %></td>
	</tr>
	<tr>
		<td>영문</td>
		<td><%=chemNameEng%></td>
		<td>toxCode</td>
		<td><%=toxicCode%></td>
	</tr>
	<%
	//카테 고리 여러개 일 경우
	String cateNames = categoryName;
		if(selectList.size()>0){
		for (int i = 0; i < selectList.size(); i++) {
			categoryName = selectList.get(i).get("categoryName");
			cateNames = cateNames + " / " + categoryName;
			}
		}
	%>
	<tr>
		<td  width="100">카테고리</td>
		<td colspan="4"><%=cateNames%></td>
	</tr>
	<tr>
		<td>독성수치</td>
		<td colspan="2"><%=toxValues%></td>
		<td>종말점</td>
		<td><%=tsendPoint%></td>
	</tr>
	<tr>
		<td>동물종</td>
		<td colspan="2"><%=species%></td>
		<td>투여경로</td>
		<td><%=route%></td>
	</tr>
	<tr>
		<td>용량</td>
		<td colspan="4"><%=dosage %></td>
	</tr>
	<tr>
		<td>독성효과</td>
		<td colspan="4"><%=toxEffect %></td>
	</tr>
	<tr>
		<td>흡수</td>
		<td colspan="4"><%=absor%></td>
	</tr>
	<tr>
		<td>분포</td>
		<td colspan="4"><%=distribu%></td>
	</tr>
	<tr>
		<td>대사</td>
		<td colspan="4"><%=metabol%></td>
	</tr>
	<tr>
		<td>배설</td>
		<td colspan="4"><%=elimina %></td>
	</tr>
	<tr>
		<td><%=gubunKor%></td>
		<td colspan="4"><%=toxContent%></td>
	</tr>
	<tr>
		<td>참고자료</td>
		<td colspan="4"><%=refer%></td>
	</tr>
	<tr>
		<td>PDF보기</td>
		<td colspan="4"><a href="<%=pdfUrl%>" target="_blank">PDF파일보기</a></td>
	</tr>
	</table>
	
	
		
		
	
	
	
	
	
</head>
</body>
</html>