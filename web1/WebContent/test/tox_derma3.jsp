<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.net.URL"%>
<%@ page import="org.jdom.*"%>
<%@ page import="org.jdom.Document"%>
<%@ page import="org.jdom.Element"%>
<%@ page import="org.jdom.input.SAXBuilder"%>
<%@ page import="org.xml.sax.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.io.IOException"%>
<%@ page
	import="java.sql.SQLException, java.sql.DriverManager, 
        java.sql.Connection, java.sql.Statement, java.sql.ResultSet"%>
<%@ page import="java.net.URLEncoder"%>

<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:TestDB", "rio", "cube1234");
	Statement stmt = null;
	ResultSet rs = null;
	ResultSet rs2 = null;

	String chemId = "";
	String tox_type = "";
	String categoryName = "";
	String chemNameKor = "";
	String chemNameEng = "";
	String casNo = "";
	String toxicCode = "";
	String mecha = "";
	String toxValues = "";
	String endPoint = "";
	String species = "";
	String route = "";
	String dosage = "";
	String toxEffect = "";
	String refer = "";
	String kinMetaInfo = "";
	String absor = "";
	String distribu = "";
	String metabol = "";
	String elimina = "";
	String pdfUrl = "";
	String neuroTox = "";
	String tsendPoint = "";
	String carcinStatus = "";
	String stArc = "";
	String stNtp = "";
	String stAcgih = "";
	String stOsha = "";
	String stOthers = "";
	String mutaData = "";
	String nameKey = "";
	String keyword = "";
	String totalCount = "1";
	int totalC = 1;
	int pageNo = 1;
	URL url;
	String nameEng="";
	String rownum="";
	int count=0;

		
	StringBuffer strAddr = new StringBuffer();
	strAddr.append("http://www.nifds.go.kr/toxinfo/openapi/openapi/service/rest/ChmclsGnrlToxctyInfoService/getNeuroToxctyInfoInqire?numOfRows=3&ServiceKey=");
	strAddr.append(key3);
	strAddr.append("&gubun=2&keyword=");

	
	List list = null;
	ArrayList<HashMap<String, String>> nameList = new ArrayList<HashMap<String, String>>();
	String selectQuery = ("select * from (select rownum rn, a.* from (select chemid,CHEMNAMEENG,chemnamekor from normal_info order by chemid) a)");

	try {
		SAXBuilder parser = new SAXBuilder();
		parser.setValidation(false);
		parser.setIgnoringElementContentWhitespace(true);

		stmt = conn.createStatement();
		rs2 = stmt.executeQuery(selectQuery);
		while (rs2.next()) {
			HashMap<String, String> hm = new HashMap<String, String>();
			rownum = rs2.getString("RN");
			nameEng = rs2.getString("CHEMNAMEENG");
			hm.put("rn", rownum);
			hm.put("nameEng", nameEng);
			nameList.add(hm);
		}

		for (int j = 942; j < nameList.size(); j++) {

			for (int k = 1; k < totalC + 1; k++) {
				count++;
				nameKey = nameList.get(j).get("nameEng");
				keyword = URLEncoder.encode(nameKey, "UTF-8");
				url = new URL(strAddr + keyword + "&pageNo=" + pageNo);

				InputSource is = new InputSource(url.openStream());
				Document doc = parser.build(is);

				// 우선 root 엘리먼트를 가져온다. 여기서는 inventory
				Element root = doc.getRootElement();
				Element eBody = root.getChild("body");
				Element items = eBody.getChild("items");
				list = items.getChildren("item");
				
				// 전체 검색 개수 많을 때 3으로 나눠서 페이지 이동 하는 부분 
				totalCount = eBody.getChildText("totalCount");
				totalC = (int) Math.ceil((double) (Integer.parseInt(totalCount)) / 3);
				if (totalC > pageNo) {
					pageNo++;
				} else if (totalC == pageNo) {
					pageNo = 1;
				}

				for (int i = 0; i < list.size(); i++) {
					Element el = (Element) list.get(i);
					chemId = el.getChildText("chemId");
					categoryName = el.getChildText("categoryName");
					if (categoryName != null) {
						categoryName = categoryName.replace("\'", "\''").replace("\"", "\\\"");
					}
					chemNameKor = el.getChildText("chemNameKor");
					if (chemNameKor != null) {
						chemNameKor = chemNameKor.replace("\'", "\''").replace("\"", "\\\"");
					}
					chemNameEng = el.getChildText("chemNameEng");
					if (chemNameEng != null) {
						chemNameEng = chemNameEng.replace("\'", "\''").replace("\"", "\\\"");
					}
					casNo = el.getChildText("casNo");
					toxicCode = el.getChildText("toxicCode");
					mecha = el.getChildText("mecha");
					if (mecha != null) {
						mecha = mecha.replace("\'", "\''").replace("\"", "\\\"");
					}
					toxValues = el.getChildText("toxValues");
					if (toxValues != null) {
						toxValues = toxValues.replace("\'", "\''").replace("\"", "\\\"");
					}
					endPoint = el.getChildText("endPoint");
					if (endPoint != null) {
						endPoint = endPoint.replace("\'", "\''").replace("\"", "\\\"");
					}
					species = el.getChildText("species");
					if (species != null) {
						species = species.replace("\'", "\''").replace("\"", "\\\"");
					}
					route = el.getChildText("route");
					if (route != null) {
						route = route.replace("\'", "\''").replace("\"", "\\\"");
					}
					dosage = el.getChildText("dosage");
					if (dosage != null) {
						dosage = dosage.replace("\'", "\''").replace("\"", "\\\"");
					}
					toxEffect = el.getChildText("toxEffect");
					if (toxEffect != null) {
						toxEffect = toxEffect.replace("\'", "\''").replace("\"", "\\\"");
					}
					refer = el.getChildText("refer");
					if (refer != null) {
						refer = refer.replace("\'", "\''").replace("\"", "\\\"");
					}
					kinMetaInfo = el.getChildText("kinMetaInfo");
					if (kinMetaInfo != null) {
						kinMetaInfo = kinMetaInfo.replace("\'", "\''").replace("\"", "\\\"");
					}
					absor = el.getChildText("absor");
					if (absor != null) {
						absor = absor.replace("\'", "\''").replace("\"", "\\\"");
					}
					distribu = el.getChildText("distribu");
					if (distribu != null) {
						distribu = distribu.replace("\'", "\''").replace("\"", "\\\"");
					}
					metabol = el.getChildText("metabol");
					if (metabol != null) {
						metabol = metabol.replace("\'", "\''").replace("\"", "\\\"");
					}
					elimina = el.getChildText("elimina");
					if (elimina != null) {
						elimina = elimina.replace("\'", "\''").replace("\"", "\\\"");
					}
					pdfUrl = el.getChildText("pdfUrl");
					if (pdfUrl != null) {
						pdfUrl = pdfUrl.replace("\'", "\''").replace("\"", "\\\"");
					}
					neuroTox = el.getChildText("neuroTox");
					if (neuroTox != null) {
						neuroTox = neuroTox.replace("\'", "\''").replace("\"", "\\\"");
					}
					tsendPoint = el.getChildText("tsendPoint");
					carcinStatus = el.getChildText("carcinStatus");
					if (carcinStatus != null) {
						carcinStatus = carcinStatus.replace("\'", "\''").replace("\"", "\\\"");
					}
					stArc = el.getChildText("stArc");
					if (stArc != null) {
						stArc = stArc.replace("\'", "\''").replace("\"", "\\\"");
					}
					stNtp = el.getChildText("stNtp");
					if (stNtp != null) {
						stNtp = stNtp.replace("\'", "\''").replace("\"", "\\\"");
					}
					stAcgih = el.getChildText("stAcgih");
					if (stAcgih != null) {
						stAcgih = stAcgih.replace("\'", "\''").replace("\"", "\\\"");
					}
					stOsha = el.getChildText("stOsha");
					if (stOsha != null) {
						stOsha = stOsha.replace("\'", "\''").replace("\"", "\\\"");
					}
					stOthers = el.getChildText("stOthers");
					if (stOthers != null) {
						stOthers = stOthers.replace("\'", "\''").replace("\"", "\\\"");
					}
					
					String query = "insert into tox_neuro(chemId,categoryName,chemNameKor,chemNameEng,casNo,toxicCode,mecha,toxValues,endPoint,species,route,dosage,toxEffect,refer,kinMetaInfo,absor,distribu,metabol,elimina,pdfUrl,neuroTox,tsendPoint,carcinStatus,stArc,stNtp,stAcgih,stOsha,stOthers) values ('"+ chemId + "','" + categoryName + "','" + chemNameKor + "','"+ chemNameEng + "','" + casNo + "','" + toxicCode + "','" + mecha + "','"+ toxValues + "','" + endPoint + "','" + species + "','" + route + "','" + dosage+ "','" + toxEffect + "','" + refer + "','" + kinMetaInfo + "','" + absor + "','"	+ distribu + "','" + metabol + "','" + elimina + "','" + pdfUrl + "','" + neuroTox+ "','" + tsendPoint + "','" + carcinStatus + "','" + stArc + "','" + stNtp + "','" + stAcgih + "','"+ stOsha + "','" + stOthers + "')";
					rs = stmt.executeQuery(query);
				}
				System.out.println(j + " : " + chemId+"  "+count);
			} //pageNo 에 따른 포문
		}
	} catch (JDOMException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		try {
			if (rs != null)
				rs.close();
			if (rs2 != null)
				rs2.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
		}
	}
%>






