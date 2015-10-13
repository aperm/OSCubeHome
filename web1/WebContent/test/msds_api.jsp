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

	//xml 변수 그대로 
	String chemId = "";
	String chemNameKor = "";
	String casNo = "";
	String enNo ="";
	String keNo ="";
	String unNo ="";
	String lastDate="";
	String koshaConfirm = "";
	String openYn =	"";
	
	String searchWrd = "";
	String totalCount = "1";
	
	int totalC = 1;
	int pageNo = 1;
	URL url;
	String nameEng="";
	String rownum="";
	int count=0;
	//1 성진이 인증키 XDdQwgagRrOoZQaTQPnlX6ODoKuyXZpXXhBnoMLClGwUzCv6dLFjyazFHnL2laDEsYyqEBZGdJ4%2BzL%2BVE%2F2IvA%3D%3D
	//1 성진이 서버용 Y%2BxS%2F3tCi6sMzhfvBCLT74vNM4oBc4w45a8cTIu69UsVMew1%2BRD87hiIfWl18R4o4WexyennCcKAwIpsh6Pv4Q%3D%3D 
	//2 팀장님 인증키 Teex%2F252QFVJdaJ1IG5HHrIqXSLre2RRWPT64DGjzBSKVG2u0jhQBwuRHH2bx%2FOYO%2FGJicNPoY2ICxuCQeljxg%3D%3D
	//3 내꺼 일반인증 XiAabOLQvlMH9G0Gx1V2jZtR%2FRgRjXn9hiArkoB4FvzIPErVCZQ4qPjrpdyiD6eNJqcL0fBzLPWfU66kJNfc7Q%3D%3D
	//3 내꺼서버 인증 drFk8VgT1T1Uv70JdHOnwdH7GE6JnsmUxzNHM5LjABgb0UQzsdjjDF9tDrVJjSRX7DHw9cIuFm5F77Dlh57z5w%3D%3D 
	//4 이사님 인증키 n%2BAIIoN0P8GHHhPVOWHLUHJdXANxhS3GWUPPC8D09Biar7es0apvksy0%2F6Ig5QUO8Mgnh1eFjXDFmZOAH6ZoZw%3D%3D
	//5 연구원님 인증 cr50XEeTxfaDlQMRtEWtgq0Q0nvIeWuoiAXdHQ35PJ76RORq3psX8q6DdXuAu45a3kG56byAnmkRjPthoUweJg%3D%3D
		
	String key1 = "XDdQwgagRrOoZQaTQPnlX6ODoKuyXZpXXhBnoMLClGwUzCv6dLFjyazFHnL2laDEsYyqEBZGdJ4%2BzL%2BVE%2F2IvA%3D%3D";
	String key2 = "Teex%2F252QFVJdaJ1IG5HHrIqXSLre2RRWPT64DGjzBSKVG2u0jhQBwuRHH2bx%2FOYO%2FGJicNPoY2ICxuCQeljxg%3D%3D";
	//String key3 = "XiAabOLQvlMH9G0Gx1V2jZtR%2FRgRjXn9hiArkoB4FvzIPErVCZQ4qPjrpdyiD6eNJqcL0fBzLPWfU66kJNfc7Q%3D%3D";
	String key3 = "drFk8VgT1T1Uv70JdHOnwdH7GE6JnsmUxzNHM5LjABgb0UQzsdjjDF9tDrVJjSRX7DHw9cIuFm5F77Dlh57z5w%3D%3D";
	String key4 = "n%2BAIIoN0P8GHHhPVOWHLUHJdXANxhS3GWUPPC8D09Biar7es0apvksy0%2F6Ig5QUO8Mgnh1eFjXDFmZOAH6ZoZw%3D%3D";
	String key5 = "cr50XEeTxfaDlQMRtEWtgq0Q0nvIeWuoiAXdHQ35PJ76RORq3psX8q6DdXuAu45a3kG56byAnmkRjPthoUweJg%3D%3D";
		
	StringBuffer strAddr = new StringBuffer();
	strAddr.append("http://msds.kosha.or.kr/openapi/service/msdschem/chemlist?searchCnd=1&numOfRows=1000&ServiceKey=");
	strAddr.append(key3);
	strAddr.append("&searchWrd=");

	List list = null;
	ArrayList<HashMap<String, String>> nameList = new ArrayList<HashMap<String, String>>();

	try {
		SAXBuilder parser = new SAXBuilder();
		parser.setValidation(false);
		parser.setIgnoringElementContentWhitespace(true);

		stmt = conn.createStatement();

		for (int j = 2; j < 10; j++) {

			for (int k = 1; k < totalC + 1; k++) {
				count++;
				url = new URL(strAddr + ""+j + "&pageNo=" + pageNo);

				InputSource is = new InputSource(url.openStream());
				Document doc = parser.build(is);

				// 우선 root 엘리먼트를 가져온다. 여기서는 inventory
				Element root = doc.getRootElement();
				Element eBody = root.getChild("body");
				Element items = eBody.getChild("items");
				list = items.getChildren("item");
				
				// 전체 검색 개수 많을 때 3으로 나눠서 페이지 이동 하는 부분 
				totalCount = eBody.getChildText("totalCount");
// 				System.out.println(totalCount);
				totalC = (int) Math.ceil((double) (Integer.parseInt(totalCount)) / 1000);
				System.out.println(totalC);
				if (totalC > pageNo) {
					pageNo++;
				} else if (totalC == pageNo) {
					pageNo = 1;
				}

				for (int i = 0; i < list.size(); i++) {
					Element el = (Element) list.get(i);
					chemId = el.getChildText("chemId");
					chemNameKor = el.getChildText("chemNameKor");
					if (chemNameKor != null) {
						chemNameKor = chemNameKor.replace("\'", "\''").replace("\"", "\\\"");
					}
					casNo = el.getChildText("casNo");
					enNo = el.getChildText("enNo");
					keNo = el.getChildText("keNo");
					unNo = el.getChildText("unNo");
					lastDate= el.getChildText("lastDate");
					koshaConfirm = el.getChildText("koshaConfirm");
					openYn = el.getChildText("openYn");
					
					String query = "insert into msds_data(cas_no,chemid,chem_name_kor,en_no,ke_no,un_no,lastdate,koshaconfirm,openyn) values ('"+casNo+ "','" + chemId+ "','" + chemNameKor + "','"+ enNo + "','" + keNo+ "','" + unNo+ "','" + lastDate+ "','"+ koshaConfirm+ "','" + openYn+"')";
					rs = stmt.executeQuery(query);
				}
				System.out.println(j + " : " + chemId+"  "+count+ "   "+pageNo);
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
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
		}
	}
%>






