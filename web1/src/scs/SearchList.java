package scs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

public class SearchList {
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
		ArrayList<HashMap<String, String>> searchList = new ArrayList<HashMap<String, String>>();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException cnfe) {
			cnfe.printStackTrace();
			System.out.println(cnfe.getMessage());
		}

		try {
			
			// my
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1523:scsdbnew", "scsdbrio2", "cube1234");
			
			// server
//			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:scsdbrio", "scsdbrio", "cube1234");
			stmt = con.createStatement();
			rset = null;

			// search list count up
			if (gubun.equals("searchList")) {
				searchList.clear();
				strQuery.setLength(0);
				strQuery.append("select c.* from (select b.*, rownum rn from (select a.chemid, a.chemnamekor, a.chemnameeng, a.casno, a.count from normal_detail_info a where chemid like \'%");
				strQuery.append(keyword);
				strQuery.append("%\' or chemnamekor like \'%");
				strQuery.append(keyword);
				strQuery.append("%\' or casno like \'%");
				strQuery.append(keyword);
				strQuery.append("%\' or upper(chemnameeng) like \'%\'|| upper(\'");
				strQuery.append(keyword);
				strQuery.append("\')||'%\' order by count desc) b) c");

				String query = strQuery + "";
				System.out.println(query);
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

			}
			// selectCasNo info
			else if (gubun.equals("selectCasNo")) 
			{
				searchList.clear();
				strQuery.setLength(0);
				strQuery.append("select chemnamekor, chemnameeng, casno, molfor, molwgt, den from normal_detail_info where casno = '"+ keyword + "'");
				String query = strQuery + "";
				// System.out.println(query);
				rset = stmt.executeQuery(query);
				while (rset.next()) {
					HashMap<String, String> hmsc = new HashMap<String, String>();
					chemNameKor = rset.getString("CHEMNAMEKOR");
					chemNameEng = rset.getString("CHEMNAMEENG");
					casNo = rset.getString("CASNO");
					String molfor = rset.getString("MOLFOR");
					String molwgt = rset.getString("MOLWGT");
					String den = rset.getString("DEN");

					hmsc.put("chemNameKor", chemNameKor);
					hmsc.put("chemNameEng", chemNameEng);
					hmsc.put("casNo", casNo);
					hmsc.put("molfor", molfor);
					hmsc.put("molwgt", molwgt);
					hmsc.put("den", den);

					searchList.add(hmsc);
				}
			}
			// main top3
			else if (gubun.equals("rankList")) {
				searchList.clear();
				strQuery.setLength(0);
				strQuery.append("select a.*, rownum rn from (select chemnamekor,chemnameeng,casno, count from normal_detail_info where casno !='null' order by count desc) a where rownum < 4");
				String query = strQuery + "";
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
			}
			else if (gubun.equals("selectView")) {

			}
			else if (gubun.equals("species")) {
				searchList.clear();
				strQuery.setLength(0);
				strQuery.append("select distinct species,casno from pdf_values where casno='"+keyword+"'");
				String query = strQuery + "";
				rset = stmt.executeQuery(query);
				while (rset.next()) {
					HashMap<String, String> hms = new HashMap<String, String>();
					String species = rset.getString("SPECIES");
					casNo = rset.getString("CASNO");
					hms.put("species", species);
					hms.put("casNo", casNo);
					searchList.add(hms);
					System.out.println("i");
				}
			}
			else if (gubun.equals("route")) {
				searchList.clear();
				strQuery.setLength(0);
				strQuery.append("select distinct species, route from pdf_values where casno='"+keyword+"'");
				String query = strQuery + "";
				rset = stmt.executeQuery(query);
				while (rset.next()) {
					HashMap<String, String> hmr = new HashMap<String, String>();
					String species = rset.getString("SPECIES");
					String route = rset.getString("ROUTE");
					hmr.put("species", species);
					hmr.put("route", route);
					searchList.add(hmr);
				}
			}
			else if (gubun.equals("endpoint")) {
				searchList.clear();
				strQuery.setLength(0);
				strQuery.append("select distinct route, endpoint  from pdf_values where casno='"+keyword+"'");
				String query = strQuery + "";
				rset = stmt.executeQuery(query);
				while (rset.next()) {
					HashMap<String, String> hme = new HashMap<String, String>();
//					String species = rset.getString("SPECIES");
					String route = rset.getString("ROUTE");
					String endpoint = rset.getString("ENDPOINT");
//					hme.put("species", species);
					hme.put("route", route);
					hme.put("endpoint", endpoint);
					searchList.add(hme);
				}
			}
			else if (gubun.equals("dosage")) {
				searchList.clear();
				strQuery.setLength(0);
				strQuery.append("select distinct endpoint,dosage from pdf_values where casno='"+keyword+"'");
				String query = strQuery + "";
				rset = stmt.executeQuery(query);
				while (rset.next()) {
					HashMap<String, String> hmd = new HashMap<String, String>();
//					String species = rset.getString("SPECIES");
//					String route = rset.getString("ROUTE");
					String endpoint = rset.getString("ENDPOINT");
					String dosage = rset.getString("DOSAGE");
//					hmd.put("species", species);
//					hmd.put("route", route);
					hmd.put("endpoint", endpoint);
					hmd.put("dosage", dosage);
					searchList.add(hmd);
				}
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

	public void countUp(String casNo) {
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
			
			query = "update normal_detail_info set count=count+1 where casno ='" + casNo + "'";
			rset = stmt.executeQuery(query);

			rset.close();
			stmt.close();
			con.close();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
			System.out.println(sqle.getMessage());
		}
	}
}