<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%> 
<%@ page import="java.util.*, java.text.*"%>
<jsp:useBean id="searchList2" class="scs.SearchList"/>
<%
	String keyword = "";
	String chemNameKor = ""; 
	String chemNameEng = "";
	String chemId = "";
	String casNo = "";
	 
	if (request.getParameter("chemNameKor") != null) {
		keyword = request.getParameter("chemNameKor");
	}
	
	ArrayList<HashMap<String, String>> searchList= searchList2.searchList(keyword,"searchList");
	
	for (int i = 0; i < 4; i++) {
		chemId = searchList.get(i).get("chemId");
		chemNameKor = searchList.get(i).get("chemNameKor");
		if(chemNameKor.equals("null"))
		{
			chemNameKor = "자료없음";
		}
		chemNameEng = searchList.get(i).get("chemNameEng");
		if(chemNameEng.equals("null"))
		{
			chemNameEng = "자료없음";
		}
		casNo = searchList.get(i).get("casNo");
		if(casNo.equals("null"))
		{
			casNo = "자료없음";
		}
	
	if(i%2 == 0 || i%2==2)
	{
	%>
		<a href="#" class="list-group-item searchResult" id="<%=chemNameKor%>" cas="<%=casNo%>">
	<%
	}
	else if(i%2==1)
	{
	%>
		<a href="#" class="list-group-item searchResult list-group-item-info" id="<%=chemNameKor%>" cas="<%=casNo%>">
	<%
	}
	%>
	<span class="label label-info">국문명</span> <%=chemNameKor%><br>
	<span class="label label-info">영문명</span> <%=chemNameEng%><br>
	<span class="label label-info">CAS #</span> <%=casNo%></a>
	<%	
	}
%>

