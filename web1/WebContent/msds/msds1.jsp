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
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:TestDB2", "rio2",
			"cube1234");
	Statement stmt = null;
	ResultSet rs = null;
	ResultSet rs2 = null;

	String itemDetail = "";

	String product_name = "";
	String product_advice_use_limit = "";
	String product_advice = "";
	String product_use_limit = "";
	String manufacturer_info = "";
	String manufacturer_name = "";
	String manufacturer_address = "";
	String manufacutrer_phone_number = "";
	
	String chemId = "";
	String query = "";
	String nameKey = "";
	String keyword = "";
	URL url;
	int count = 0;
	//1 성진이 인증키 XDdQwgagRrOoZQaTQPnlX6ODoKuyXZpXXhBnoMLClGwUzCv6dLFjyazFHnL2laDEsYyqEBZGdJ4%2BzL%2BVE%2F2IvA%3D%3D
	//1 성진이 서버용 Y%2BxS%2F3tCi6sMzhfvBCLT74vNM4oBc4w45a8cTIu69UsVMew1%2BRD87hiIfWl18R4o4WexyennCcKAwIpsh6Pv4Q%3D%3D 
	//2 팀장님 인증키 Teex%2F252QFVJdaJ1IG5HHrIqXSLre2RRWPT64DGjzBSKVG2u0jhQBwuRHH2bx%2FOYO%2FGJicNPoY2ICxuCQeljxg%3D%3D
	//3 내꺼서버 인증 drFk8VgT1T1Uv70JdHOnwdH7GE6JnsmUxzNHM5LjABgb0UQzsdjjDF9tDrVJjSRX7DHw9cIuFm5F77Dlh57z5w%3D%3D 
	//4 이사님 인증키 n%2BAIIoN0P8GHHhPVOWHLUHJdXANxhS3GWUPPC8D09Biar7es0apvksy0%2F6Ig5QUO8Mgnh1eFjXDFmZOAH6ZoZw%3D%3D
	//5 연구원님 인증 cr50XEeTxfaDlQMRtEWtgq0Q0nvIeWuoiAXdHQ35PJ76RORq3psX8q6DdXuAu45a3kG56byAnmkRjPthoUweJg%3D%3D
	//6 현민씨 인증 nhbWysI%2FxKFpQmVfN9wFALizbd8mlbxalYTTpn2zgzNhLNzhq9fkB6MuuCoSLB0O6dfozs%2BYNRhc9ZKfg9XdTA%3D%3D
   	//7 내 부계정 vKJZ%2Fgux501a3kCAoCPwWpPzHgE5pLTOQD52zGHCSJrtMl1ueABvlHH6RtWTaxCDoO%2BaaR1rz2haPpnvP30ndg%3D%3D 
   	//8 pwP0HuQ%2By%2BJUamkc1bd7TuXnWhdnOJr%2BbOWggieTOVKmwDopVE%2BHpUEOZI4TpzPtgStYlUJW%2FKXY4Xdw%2BRaXtQ%3D%3D
   	//9 971C1hXOxrJCh%2FjeWTOkXOExyeYLwdmsc5Ko3IF4yDBrw%2B9%2BoMQLM%2FfuezUOJz93yKk0bkuBRQNytja1HH6GSg%3D%3D
   	//10 ymnM1d0wsWLZL7l2NYPAaE7zkrxGp%2BzkiAEMyf4HqtxgGYsrj693U5%2B1U9m0qv4bA6yWkHFuxCKrX%2FjLzYsYXA%3D%3D
   	//11 pcF0Bg87Q%2BXpNvGmudst2k7V8rmA18oA2ztMk46Oiqw0V6VPUjWDYY78QknLPTrZKOhWSE3rYTayffmT%2Blt1TA%3D%3D
   	//12 lwLBez9Jg8BSZPpb99z1XKZDvGejPNs7cXh%2FouTiLes2ej8MvCX2hoeOLhy6vkYLxktAL5Oyc7Bxo5FfHhxA6A%3D%3D
   	
	String key1 = "2M2ml1OFz3uLrlRnWx3BaG5VjWdJ6uGW25aeAnXzUBUqbqfCwavBRDFUz9519qTyKpZRWerMjaERCi2qZhgQ6A%3D%3D";
 	String key2 = "%2FJFEORCpqzhn%2FOcyXw3WqyKDCZ%2FxTGxK3l2tfbLv3pTwOzsV63aHqL0cqqJl1X%2F%2FCSpPU04eMig%2FclQ1d2567Q%3D%3D";
	String key3 = "drFk8VgT1T1Uv70JdHOnwdH7GE6JnsmUxzNHM5LjABgb0UQzsdjjDF9tDrVJjSRX7DHw9cIuFm5F77Dlh57z5w%3D%3D";
	String key4 = "n%2BAIIoN0P8GHHhPVOWHLUHJdXANxhS3GWUPPC8D09Biar7es0apvksy0%2F6Ig5QUO8Mgnh1eFjXDFmZOAH6ZoZw%3D%3D";
	String key5 = "cr50XEeTxfaDlQMRtEWtgq0Q0nvIeWuoiAXdHQ35PJ76RORq3psX8q6DdXuAu45a3kG56byAnmkRjPthoUweJg%3D%3D";
	String key6 = "nhbWysI%2FxKFpQmVfN9wFALizbd8mlbxalYTTpn2zgzNhLNzhq9fkB6MuuCoSLB0O6dfozs%2BYNRhc9ZKfg9XdTA%3D%3D";
	String key7 = "vKJZ%2Fgux501a3kCAoCPwWpPzHgE5pLTOQD52zGHCSJrtMl1ueABvlHH6RtWTaxCDoO%2BaaR1rz2haPpnvP30ndg%3D%3D";
	String key8 = "pwP0HuQ%2By%2BJUamkc1bd7TuXnWhdnOJr%2BbOWggieTOVKmwDopVE%2BHpUEOZI4TpzPtgStYlUJW%2FKXY4Xdw%2BRaXtQ%3D%3D";
	String key9 = "971C1hXOxrJCh%2FjeWTOkXOExyeYLwdmsc5Ko3IF4yDBrw%2B9%2BoMQLM%2FfuezUOJz93yKk0bkuBRQNytja1HH6GSg%3D%3D";
	String key10 = "ymnM1d0wsWLZL7l2NYPAaE7zkrxGp%2BzkiAEMyf4HqtxgGYsrj693U5%2B1U9m0qv4bA6yWkHFuxCKrX%2FjLzYsYXA%3D%3D";
	String key11 = "pcF0Bg87Q%2BXpNvGmudst2k7V8rmA18oA2ztMk46Oiqw0V6VPUjWDYY78QknLPTrZKOhWSE3rYTayffmT%2Blt1TA%3D%3D";
	String key12 = "lwLBez9Jg8BSZPpb99z1XKZDvGejPNs7cXh%2FouTiLes2ej8MvCX2hoeOLhy6vkYLxktAL5Oyc7Bxo5FfHhxA6A%3D%3D";
	
	StringBuffer strAddr = new StringBuffer();
	strAddr.append("http://msds.kosha.or.kr/openapi/service/msdschem/chemdetail01?ServiceKey=");
	strAddr.append(key1);
	strAddr.append("&chemId=");
	
	
	StringBuffer strQuery = new StringBuffer();
	
	
	
	List list = null;
	ArrayList<HashMap<String, String>> nameList = new ArrayList<HashMap<String, String>>();
	String selectQuery = ("select rownum,rn,chemid from (select rownum rn, chemid from msds_data order by chemid) a where 258319 < chemid");
// 	String selectQuery = ("select rownum,rn,chemid from (select rownum rn, chemid from msds_data order by chemid) a");

	try {
		SAXBuilder parser = new SAXBuilder();
		parser.setValidation(false);
		parser.setIgnoringElementContentWhitespace(true);

		stmt = conn.createStatement();
		rs2 = stmt.executeQuery(selectQuery);
		while (rs2.next()) {
			HashMap<String, String> hm = new HashMap<String, String>();
			chemId = rs2.getString("CHEMID");
			hm.put("chemId", chemId);
			nameList.add(hm);
		}
		
		for (int j = 0; j < nameList.size(); j++) {
			keyword = nameList.get(j).get("chemId");
		
			strQuery.setLength(0);
			strQuery.append("insert into msds_data_detail(chemId,product_name,product_advice_use_limit,product_advice,product_use_limit,manufacturer_info,manufacturer_name,manufacturer_address,manufacutrer_phone_number) values ('"+keyword);
			url = new URL(strAddr + keyword);
// 			System.out.println(url);
			InputSource is = new InputSource(url.openStream());
			Document doc = parser.build(is);

			// 우선 root 엘리먼트를 가져온다. 여기서는 inventory
			Element root = doc.getRootElement();
			Element eBody = root.getChild("body");
			Element items = eBody.getChild("items");
			list = items.getChildren("item");

			for (int i = 0; i < list.size(); i++) {
				Element el = (Element) list.get(i);
				itemDetail = el.getChildText("itemDetail");
				if (itemDetail != null) {
					itemDetail = itemDetail.replace("\'", "\''").replace("\"", "\\\"");
				}else if(itemDetail==null)
				{
					itemDetail = "자료없음";			
				}
				
				strQuery.append("','"+itemDetail);
			}
			strQuery.append("')");
			query = strQuery+"";
			rs = stmt.executeQuery(query);

			System.out.println(j + " : " + keyword);
		} //pageNo 에 따른 포문

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






