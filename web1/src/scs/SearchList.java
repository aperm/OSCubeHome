package scs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

public class SearchList {
	ArrayList<HashMap<String, String>> searchList = new ArrayList<HashMap<String, String>>();
	String query = "";
	String chemNameKor = "";
	String chemNameEng = "";
	String chemId = "";
	String casNo = "";
	String count = "";
	Connection con;
	Statement stmt;
	ResultSet rset;
	StringBuffer strQuery = new StringBuffer();

	public ArrayList searchList(String keyword, String gubun) {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException cnfe) {
			cnfe.printStackTrace();
			System.out.println(cnfe.getMessage());
		}

		try {
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1523:scsdbnew", "scsdbrio2", "cube1234");
			stmt = con.createStatement();
			rset = null;

			if (gubun.equals("searchList")) {
				strQuery.setLength(0);
				strQuery.append(
						"select a.chemid, a.chemnamekor, a.chemnameeng, a.casno from normal_info a where chemid like \'%");
				strQuery.append(keyword);
				strQuery.append("%\' or chemnamekor like \'%");
				strQuery.append(keyword);
				strQuery.append("%\' or casno like \'%");
				strQuery.append(keyword);
				strQuery.append("%\' or upper(chemnameeng) like \'%\'|| upper(\'");
				strQuery.append(keyword);
				strQuery.append("\')||'%\'");

				String query = strQuery + "";
				rset = stmt.executeQuery(query);

				while (rset.next()) {
					HashMap<String, String> hmsl = new HashMap<String, String>();
					chemNameKor = rset.getString("CHEMNAMEKOR");
					chemNameEng = rset.getString("CHEMNAMEENG");
					chemId = rset.getString("CHEMID");
					casNo = rset.getString("CASNO");
					hmsl.put("chemNameKor", chemNameKor);
					hmsl.put("chemNameEng", chemNameEng);
					hmsl.put("chemId", chemId);
					hmsl.put("casNo", casNo);

					searchList.add(hmsl);
				}

			} else if (gubun.equals("rankList")) {

				strQuery.setLength(0);
				strQuery.append(
						"select a.*, rownum rn from (select chemnamekor,chemnameeng,casno, count from normal_detail_info where casno !='null' order by count desc) a where rownum < 4");
				String query = strQuery + "";
				System.out.println(query);
				rset = stmt.executeQuery(query);
				while (rset.next()) {
					HashMap<String, String> hmrl = new HashMap<String, String>();
					chemNameKor = rset.getString("CHEMNAMEKOR");
					chemNameEng = rset.getString("CHEMNAMEENG");
					casNo = rset.getString("CASNO");
					count = rset.getString("COUNT");
					
					hmrl.put("chemNameKor", chemNameKor);
					hmrl.put("chemNameEng", chemNameEng);
					hmrl.put("casNo", casNo);
					hmrl.put("count", count);

					searchList.add(hmrl);
				}
				System.out.println(searchList);
			} else if (gubun.equals("selectView")) {

			}

			rset.close();
			stmt.close();
			con.close();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
			System.out.println(sqle.getMessage());
		}

		return searchList;
	}

	public void countUpdate(String casNo) {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException cnfe) {
			cnfe.printStackTrace();
			System.out.println(cnfe.getMessage());
		}

		try 
		{
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1523:scsdbnew", "scsdbrio2", "cube1234");
			stmt = con.createStatement();
			rset = null;

			query = "update normal_detail_info set count=count+1 where casno ='" + casNo + "'";
			System.out.println(query);
			rset = stmt.executeQuery(query);

			rset.close();
			stmt.close();
			con.close();
		} catch (SQLException sqle)
		{
			sqle.printStackTrace();
			System.out.println(sqle.getMessage());
		}
	}

}