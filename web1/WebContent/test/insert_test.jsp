<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language ="java" import="java.sql.*,java.sql.DriverManager.*" %>
<%
 
 Class.forName("oracle.jdbc.driver.OracleDriver");
 Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.36:1521:SCSDBRIO","scsdbrio","cube1234");
//  Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@166.104.53.50:1521:SCSDB","scsdb","cube1234");
//  Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:TestDB","rio","cube1234");
 Statement stmt = null;
 ResultSet rs = null;
//  String query = "create table testTable1 (abc varchar(100))";
 String query = "insert into testtable1(abc) values('개인 pc 에서 넣는 4번째 자료')";
//  String query = "insert into USERTBL(username,userage,userid,phone) values('''테스트5','15','id1','010-010')";
 String str="";
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
 
<%
try{
    stmt = conn.createStatement();
    rs = stmt.executeQuery(query);
 
//     while(rs.next()){
//         String name = rs.getString("USERNAME");
//         int age = rs.getInt("USERAGE");
//         String id = rs.getString("USERID");
//         String phone = rs.getString("PHONE");
        
//         out.println("이름 : " + name + ", 나이 : " + age + ", ID : " + id + ", 폰 : " + phone + "<br />");
//     }
    %>
    <%=query %>
    <%
} catch(Exception e) {
} finally {    
    try{
        if(rs != null) rs.close();
        if(stmt != null) stmt.close();
        if(conn != null) conn.close();
    } catch(Exception e){}
}
%>

</body>
</html>