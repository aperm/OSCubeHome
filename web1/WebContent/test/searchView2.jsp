<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.io.IOException"%>
<%@ page
	import="java.sql.SQLException, java.sql.DriverManager, java.sql.Connection, java.sql.Statement, java.sql.ResultSet"%>
<!-- <SCRIPT type="text/JavaScript" src="/js/bootstrap.js"></SCRIPT> -->


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>물질검색 결과 페이지</title>
<head>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:TestDB", "rio", "cube1234");
	Statement stmt = null;
	ResultSet rs = null;
	System.out.println("두번째에요");
	//일반물질 - 물질검색 / 상세검색 
	String chemId         ="";
	String categoryName   ="";
	String chemNameKor    ="";
	String chemNameEng    ="";
	String casNo          ="";
	String toxicCode      ="";
	String mecha          ="";
	String toxValues      ="";
	String tsendPoint       ="";
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
	String dermaTox       ="";
	String carcinStatus   ="";
	String stArc          ="";
	String stNtp          ="";
	String stAcgih        ="";
	String stOsha         ="";
	String stOthers       ="";
	String mutaData 	  ="";
	
	String checkCid = "";
	if (request.getParameter("chemId") != null) {
		chemId = request.getParameter("chemId");
	}
// 	chemId= new String(chemId.getBytes("8859_1"),"utf-8");



	List list = null;
	ArrayList<HashMap<String, String>> selectList = new ArrayList<HashMap<String, String>>();

	StringBuffer strQuery = new StringBuffer();
	
	
	
	
	
	strQuery.append("select a.* from ");
	strQuery.append(table);
	strQuery.append(" a where chemid in (select chemid from n1to9 where chemid like \'%");
	strQuery.append(keyword);
	strQuery.append("%\') or chemnamekor in (select chemnamekor from n1to9 where chemnamekor like \'%");
	strQuery.append(keyword);
	strQuery.append("%\') or casno in (select casno from n1to9 where casno like \'%");
	strQuery.append(keyword);
	strQuery.append("%\') or chemnameeng in (select chemnameeng from n1to9 where chemnameeng like \'%");
	strQuery.append(keyword);
	strQuery.append("%\')");

	System.out.println(strQuery); 

	String query = strQuery + "";

	try {

		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
		
		
		while (rs.next()) {
			HashMap<String, String> hm = new HashMap<String, String>();
			
			chemId = rs.getString("CHEMID");
			categoryName = rs.getString("CATEGORYNAME");
			chemNameKor = rs.getString("CHEMNAMEKOR");
			chemNameEng = rs.getString("CHEMNAMEENG");
			casNo = rs.getString("CASNO");
			toxicCode = rs.getString("TOXICCODE");
			mecha = rs.getString("MECHA");
			toxValues = rs.getString("TOXVALUES");
			endPoint = rs.getString("ENDPOINT");
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
			dermaTox = rs.getString("DERMATOX");
			carcinStatus = rs.getString("CARCINSTATUS");
			stArc = rs.getString("STARC");
			stNtp = rs.getString("STNTP");
			stAcgih = rs.getString("STACGIH");
			stOsha = rs.getString("STOSHA");
			stOthers = rs.getString("STOTHERS");
			
			hm.put("chemId",chemId);
			hm.put("categoryName",categoryName);
			hm.put("chemNameKor",chemNameKor);
			hm.put("chemNameEng",chemNameEng);
			hm.put("casNo",casNo);
			hm.put("toxicCode",toxicCode);
			hm.put("mecha",mecha);
			hm.put("toxValues",toxValues);
			hm.put("endPoint",endPoint);
			hm.put("species",species);
			hm.put("route",route);
			hm.put("dosage",dosage);
			hm.put("toxEffect",toxEffect);
			hm.put("refer",refer);
			hm.put("kinMetaInfo",kinMetaInfo);
			hm.put("absor",absor);
			hm.put("distribu",distribu);
			hm.put("metabol",metabol);
			hm.put("elimina",elimina);
			hm.put("pdfUrl",pdfUrl);
			hm.put("dermaTox",dermaTox);
			hm.put("carcinStatus",carcinStatus);
			hm.put("stArc",stArc);
			hm.put("stNtp",stNtp);
			hm.put("stAcgih",stAcgih);
			hm.put("stOsha",stOsha);
			hm.put("stOthers",stOthers);
			
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

<style>
  table {
    width: 80%;
  }
  td {
    border: 1px solid #bcbcbc;
  }
</style>
<title>Insert title here</title>
</head>
<body align="center">
<table align="center">
<%
		if(selectList.size()>0)
		{
			int j = selectList.size();
			if(selectList.size()>10)
			{
				j = 10;
			}
		for (int i = 0; i < j ; i++) {
//  		for (int i = 0; i < selectList.size() ; i++) {
			chemId = selectList.get(i).get("chemId");
			categoryName = selectList.get(i).get("categoryName");
			chemNameKor = selectList.get(i).get("chemNameKor");
			chemNameEng = selectList.get(i).get("chemNameEng");
			casNo = selectList.get(i).get("casNo");
			toxicCode = selectList.get(i).get("toxicCode");
			mecha = selectList.get(i).get("mecha");
			toxValues = selectList.get(i).get("toxValues");
			endPoint = selectList.get(i).get("endPoint");
			species = selectList.get(i).get("species");
			route = selectList.get(i).get("route");
			dosage = selectList.get(i).get("dosage");
			toxEffect = selectList.get(i).get("toxEffect");
			refer = selectList.get(i).get("refer");
			kinMetaInfo = selectList.get(i).get("kinMetaInfo");
			absor = selectList.get(i).get("absor");
			distribu = selectList.get(i).get("distribu");
			metabol = selectList.get(i).get("metabol");
			elimina = selectList.get(i).get("elimina");
			pdfUrl = selectList.get(i).get("pdfUrl");
			dermaTox = selectList.get(i).get("dermaTox");
			carcinStatus = selectList.get(i).get("carcinStatus");
			stArc = selectList.get(i).get("stArc");
			stNtp = selectList.get(i).get("stNtp");
			stAcgih = selectList.get(i).get("stAcgih");
			stOsha = selectList.get(i).get("stOsha");
			stOthers = selectList.get(i).get("stOthers");
			
			
			// 여기에 테이블 작성!!!
			%>
				<tr>
					<td style="height:30px" colspan='4' bgcolor='gray'><%=i+1%>번째 자료</td>
				</tr>
				<tr>
					<td>카테고리</td> 
					<td colspan='3'><%=categoryName%></td>
				</tr>
				
				<tr>
					<td width=100>물질명(국문)</td> 
					<td width=300><%=chemNameKor %></td>
					<td width=100>물질명(영문)</td> 
					<td width=300><%=chemNameEng %></td>
				</tr>
				<tr>
					<td>chemId</td> 
					<td><%=chemId%></td>
					<td>casNo</td> 
					<td><%=casNo%></td>
				</tr>
				<tr>
					<td>참고문헌</td> 
					<td colspan='3'><%=refer%></td>
				</tr>
				<tr>
					<td>기전</td>
					<td colspan='3'><%=mecha %></td>
				</tr>
				<tr>
					<td>피부독성</td>
					<td colspan='3'><%=dermaTox %></td>
				</tr>
				<tr>
					<td>독성수치</td>
					<td><%=toxValues%></td>
					<td>종말점</td>
					<td><%=endPoint%></td>
				</tr>
				<tr>
					<td>동물종</td>
					<td><%=species%></td>
					<td>투여경로</td>
					<td><%=route%></td>
				</tr>
				<tr>
					<td>용량</td>
					<td><%=dosage%></td>
					<td>독성효과</td>
					<td><%=toxEffect%></td>
				</tr>
				<tr>
					<td>약동력학 및 대사정보</td>
					<td colspan='3'><%=kinMetaInfo%></td>
				</tr>
				<tr>
					<td>분포</td>
					<td colspan='3'><%=distribu%></td>
				</tr>
				<tr>
					<td>흡수</td>
					<td colspan='3'><%=absor%></td>
				</tr>
				<tr>
					<td>배설</td>
					<td colspan='3'><%=elimina%></td>
				</tr>
				<tr>
					<td>대사</td>
					<td colspan='3'><%=metabol%></td>
				</tr>
				<tr>
					<td>독성코드</td> 
					<td><%=toxicCode%></td>
					<td>PDF파일</td>
					<td><a href="<%=pdfUrl%>" target="_blank">PDF파일보기</a></td>
				</tr>
			
			<%
			
		} // 검색결과 리스트 만큼 도는 for문 
	}
	else 
	{
		%>
		검색 결과 없음
		<%
		} 
		%>
		</table>
</body>
</html>