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
	String categoryName = "";
	String chemNameKor = "";
	String chemNameEng = "";
	String chemId = "";
	String casNo = "";
	String toxicCode = "";
	String strForPath = "";
	String strForImg = "";
	String molFor = "";
	String molWgt = "";
	String comName = "";
	String color = "";
	String odir = "";
	String bolPoint = "";
	String frePoint = "";
	String melPoint = "";
	String vapPres = "";
	String den = "";
	String speGrv = "";
	String solub = "";
	String refer = "";
	String pdfUrl = "";
	String query = "";
	String num = "";
	String totalCount = "1";
	int totalC = 1;
	int pageNo = 1;
	URL url;
	//1 성진이 인증키 XDdQwgagRrOoZQaTQPnlX6ODoKuyXZpXXhBnoMLClGwUzCv6dLFjyazFHnL2laDEsYyqEBZGdJ4%2BzL%2BVE%2F2IvA%3D%3D
	//2 팀장님 인증키 Teex%2F252QFVJdaJ1IG5HHrIqXSLre2RRWPT64DGjzBSKVG2u0jhQBwuRHH2bx%2FOYO%2FGJicNPoY2ICxuCQeljxg%3D%3D
	//3 내꺼 일반 인증 키 XiAabOLQvlMH9G0Gx1V2jZtR%2FRgRjXn9hiArkoB4FvzIPErVCZQ4qPjrpdyiD6eNJqcL0fBzLPWfU66kJNfc7Q%3D%3D
	// 내꺼 서버용 인증키 vyDqCuh1EQGYlTkbQgKDxSZzbSBEAL0YOidNGiIIoaj%2FSJxJk%2FOFmWpOWYVLQ2Zeg%2FMaRkd0FECWrKLXJWF4wA%3D%3D
	//4 이사님 인증키 n%2BAIIoN0P8GHHhPVOWHLUHJdXANxhS3GWUPPC8D09Biar7es0apvksy0%2F6Ig5QUO8Mgnh1eFjXDFmZOAH6ZoZw%3D%3D
	//5 진배씨 인증키 W0OYJqJls6iiQ581GSrgVRWoEhP%2BLLUnqS%2FkgTHVYxyk1Qvl7t5zdZs13wocmUKaqrzn%2Fkn%2B76mVEMdhDge9HQ%3D%3D
	
	String key1 = "XDdQwgagRrOoZQaTQPnlX6ODoKuyXZpXXhBnoMLClGwUzCv6dLFjyazFHnL2laDEsYyqEBZGdJ4%2BzL%2BVE%2F2IvA%3D%3D";
	String key2 = "Teex%2F252QFVJdaJ1IG5HHrIqXSLre2RRWPT64DGjzBSKVG2u0jhQBwuRHH2bx%2FOYO%2FGJicNPoY2ICxuCQeljxg%3D%3D";
	String key3 = "XiAabOLQvlMH9G0Gx1V2jZtR%2FRgRjXn9hiArkoB4FvzIPErVCZQ4qPjrpdyiD6eNJqcL0fBzLPWfU66kJNfc7Q%3D%3D";
	String key4 = "n%2BAIIoN0P8GHHhPVOWHLUHJdXANxhS3GWUPPC8D09Biar7es0apvksy0%2F6Ig5QUO8Mgnh1eFjXDFmZOAH6ZoZw%3D%3D";
	String key5 = "W0OYJqJls6iiQ581GSrgVRWoEhP%2BLLUnqS%2FkgTHVYxyk1Qvl7t5zdZs13wocmUKaqrzn%2Fkn%2B76mVEMdhDge9HQ%3D%3D";
	List list = null;

	StringBuffer strAddr = new StringBuffer();  
	strAddr.append("http://www.nifds.go.kr/toxinfo/openapi/openapi/service/rest/ChmclsGnrlInfoInqireService/getChmclsGnrlIntegSearchListInqire?numOfRows=3&gubun=0&ServiceKey=");
	strAddr.append(key2);
 
	try {
		SAXBuilder parser = new SAXBuilder();
		parser.setValidation(false);
		parser.setIgnoringElementContentWhitespace(true);

		stmt = conn.createStatement();

		for (int j = 3; j < 4; j++) {
			for (int k = 1; k < totalC + 1; k++) {

				url = new URL(strAddr +"&pageNo=" + pageNo+"&keyword="+j);

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
				// 			    System.out.println("처음  k:"+k+"  totalC:"+totalC+"   totalCount:"+totalCount+"  pageNo:"+pageNo);			
				if (totalC > pageNo) {
					pageNo++;
				} else if (totalC == pageNo) {
					pageNo = 1;
				}

				for (int i = 0; i < list.size(); i++) {
					Element el = (Element) list.get(i);
					categoryName = el.getChildText("categoryName");
					chemNameKor = el.getChildText("chemNameKor");
					if (chemNameKor != null) {
						chemNameKor = chemNameKor.replace("\'", "\''").replace("\"", "\\\"");
					}
					chemNameEng = el.getChildText("chemNameEng");
					if (chemNameEng != null) {
						chemNameEng = chemNameEng.replace("\'", "\''").replace("\"", "\\\"");
					}
					chemId = el.getChildText("chemId");
					casNo = el.getChildText("casNo");
					toxicCode = el.getChildText("toxicCode");

					query = "insert into normal_info(chemId,categoryName,chemNameKor,chemNameEng,casNo,toxicCode) values ('"+ chemId + "','" + categoryName + "','" + chemNameKor + "','" + chemNameEng + "','"	+ casNo + "','" + toxicCode + "')";
					rs = stmt.executeQuery(query);
					
				}
				System.out.println(j + " : " + chemId);
			}
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
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
		}
	}
%>






