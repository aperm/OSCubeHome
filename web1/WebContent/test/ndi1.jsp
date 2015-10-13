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
<%@ page import="java.sql.SQLException, java.sql.DriverManager, 
        java.sql.Connection, java.sql.Statement, java.sql.ResultSet"%>
<%@ page import="java.net.URLEncoder" %>

<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:TestDB", "rio", "cube1234");
	Statement stmt = null;
	ResultSet rs = null;
	ResultSet rs2 = null;
	String categoryName = "";
	String chemNameKor = "";
	String chemNameEng = "";
	String chemId = "";
	String casNo = "";
	String toxicCode = "";
	String strForPath = "";
	String strForImg = "";
	String imgUrl = "";
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
	String num="";
	String checkCid="";
	//1 성진이 인증키 XDdQwgagRrOoZQaTQPnlX6ODoKuyXZpXXhBnoMLClGwUzCv6dLFjyazFHnL2laDEsYyqEBZGdJ4%2BzL%2BVE%2F2IvA%3D%3D
	//1 성진이 서버용 Y%2BxS%2F3tCi6sMzhfvBCLT74vNM4oBc4w45a8cTIu69UsVMew1%2BRD87hiIfWl18R4o4WexyennCcKAwIpsh6Pv4Q%3D%3D 
	//2 팀장님 인증키 Teex%2F252QFVJdaJ1IG5HHrIqXSLre2RRWPT64DGjzBSKVG2u0jhQBwuRHH2bx%2FOYO%2FGJicNPoY2ICxuCQeljxg%3D%3D
	//3 내꺼 일반인증 XiAabOLQvlMH9G0Gx1V2jZtR%2FRgRjXn9hiArkoB4FvzIPErVCZQ4qPjrpdyiD6eNJqcL0fBzLPWfU66kJNfc7Q%3D%3D
	//3 내꺼서버 인증 drFk8VgT1T1Uv70JdHOnwdH7GE6JnsmUxzNHM5LjABgb0UQzsdjjDF9tDrVJjSRX7DHw9cIuFm5F77Dlh57z5w%3D%3D 
	//4 이사님 인증키 n%2BAIIoN0P8GHHhPVOWHLUHJdXANxhS3GWUPPC8D09Biar7es0apvksy0%2F6Ig5QUO8Mgnh1eFjXDFmZOAH6ZoZw%3D%3D
	//5 연구원님 인증 cr50XEeTxfaDlQMRtEWtgq0Q0nvIeWuoiAXdHQ35PJ76RORq3psX8q6DdXuAu45a3kG56byAnmkRjPthoUweJg%3D%3D
		
	String key1 = "XDdQwgagRrOoZQaTQPnlX6ODoKuyXZpXXhBnoMLClGwUzCv6dLFjyazFHnL2laDEsYyqEBZGdJ4%2BzL%2BVE%2F2IvA%3D%3D";
	String key2 = "Teex%2F252QFVJdaJ1IG5HHrIqXSLre2RRWPT64DGjzBSKVG2u0jhQBwuRHH2bx%2FOYO%2FGJicNPoY2ICxuCQeljxg%3D%3D";
//	String key3 = "XiAabOLQvlMH9G0Gx1V2jZtR%2FRgRjXn9hiArkoB4FvzIPErVCZQ4qPjrpdyiD6eNJqcL0fBzLPWfU66kJNfc7Q%3D%3D";
	String key3 = "drFk8VgT1T1Uv70JdHOnwdH7GE6JnsmUxzNHM5LjABgb0UQzsdjjDF9tDrVJjSRX7DHw9cIuFm5F77Dlh57z5w%3D%3D";
	String key4 = "n%2BAIIoN0P8GHHhPVOWHLUHJdXANxhS3GWUPPC8D09Biar7es0apvksy0%2F6Ig5QUO8Mgnh1eFjXDFmZOAH6ZoZw%3D%3D";
	String key5 = "cr50XEeTxfaDlQMRtEWtgq0Q0nvIeWuoiAXdHQ35PJ76RORq3psX8q6DdXuAu45a3kG56byAnmkRjPthoUweJg%3D%3D";
	
	List list = null;
	ArrayList<HashMap<String,String>> chemIdList = new ArrayList<HashMap<String,String>>();
	String selectQuery = ("select * from (select rownum rn, a.* from (select chemid,CHEMNAMEENG,chemnamekor from n1to9 order by chemid) a)");
	
	StringBuffer strAddr = new StringBuffer();
	strAddr.append("http://www.nifds.go.kr/toxinfo/openapi/openapi/service/rest/ChmclsGnrlInfoInqireService/getChmclsGnrlListAcctoDetailInqire?numOfRows=3&pageNo=1&ServiceKey=");
	strAddr.append(key3);
	strAddr.append("&chemId=");
	
	try {
		SAXBuilder parser = new SAXBuilder();
		parser.setValidation(false);
		parser.setIgnoringElementContentWhitespace(true);

		stmt = conn.createStatement();
		rs2 = stmt.executeQuery(selectQuery);
		while(rs2.next())
		{
			HashMap<String,String> hm = new HashMap<String, String>();
			checkCid = rs2.getString("CHEMID");
			hm.put("checkCid",checkCid);
			chemIdList.add(hm);
		}
		
		
		for (int j = 1000; j <chemIdList.size() ; j++) {
			num = chemIdList.get(j).get("checkCid");
			//num = String.format("%06d", num);
			// key 값만 바꿔줘
			URL url = new URL(strAddr+num);
			InputSource is = new InputSource(url.openStream());
			Document doc = parser.build(is);

			// 우선 root 엘리먼트를 가져온다. 여기서는 inventory
			Element root = doc.getRootElement();
			Element eBody = root.getChild("body");
			Element items = eBody.getChild("items");

			list = items.getChildren("item");

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
				strForPath = el.getChildText("strForPath");
				if (strForPath != null) {
					strForPath = strForPath.replace("\'", "\''").replace("\"", "\\\"");
				}
				strForImg = el.getChildText("strForImg");
				imgUrl = el.getChildText("imgUrl");
				molFor = el.getChildText("molFor");
				molWgt = el.getChildText("molWgt");
				if (molWgt != null) {
					molWgt = molWgt.replace("\'", "\''").replace("\"", "\\\"");
				}
				comName = el.getChildText("comName");
				if (comName != null) {
					comName = comName.replace("\'", "\''").replace("\"", "\\\"");
				}
				color = el.getChildText("color");
				odir = el.getChildText("odir");
				bolPoint = el.getChildText("bolPoint");
				frePoint = el.getChildText("frePoint");
				melPoint = el.getChildText("melPoint");
				vapPres = el.getChildText("vapPres");
				den = el.getChildText("den");
				speGrv = el.getChildText("speGrv");
				solub = el.getChildText("solub");
				if (solub != null) {
					solub = solub.replace("\'", "\''").replace("\"", "\\\"");
				}
				refer = el.getChildText("refer");
				if (refer != null) {
					refer = refer.replace("\'", "\''").replace("\"", "\\\"");
				}
				pdfUrl = el.getChildText("pdfUrl");

				query = "insert into normal_detail_info(chemId,categoryName,chemNameKor,chemNameEng,casNo,toxicCode,strForPath,strForImg,molFor,molWgt,comName,color,odir,bolPoint,frePoint,melPoint,vapPres,den,speGrv,solub,refer,pdfUrl,imgUrl) values ('"+ chemId + "','" + categoryName + "','" + chemNameKor + "','" + chemNameEng + "','"+ casNo + "','" + toxicCode + "','" + strForPath + "','" + strForImg + "','" + molFor+ "','" + molWgt + "','" + comName + "','" + color + "','" + odir + "','" + bolPoint+ "','" + frePoint + "','" + melPoint + "','" + vapPres + "','" + den + "','" + speGrv+ "','" + solub + "','" + refer + "','" + pdfUrl + "','"+imgUrl + "')";
				rs = stmt.executeQuery(query);
			}
			System.out.println(j + " : " + chemId);
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






