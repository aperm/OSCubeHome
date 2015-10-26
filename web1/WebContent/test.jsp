<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.*, java.text.*"%>
<jsp:useBean id="searchList2" class="scs.SearchList" />
<SCRIPT src="/js/jquery-2.1.3.min.js"></SCRIPT>
<%
	String casNo = "110-44-1";
	ArrayList<HashMap<String, String>> speciesList2 = searchList2.searchList(casNo, "species");
	ArrayList<HashMap<String, String>> routeList = searchList2.searchList(casNo, "route");
	ArrayList<HashMap<String, String>> endpointList = searchList2.searchList(casNo, "endpoint");
	ArrayList<HashMap<String, String>> dosageList = searchList2.searchList(casNo, "dosage");
%>
<script>
$(document).ready(function(){
 	$('.sel2').attr('style','display:none'); 
 	$('.sel3').attr('style','display:none'); 
});

	function change1(form){
		var select = form.subject.value;
  		$('.sel2').attr('style','display:none'); 
		$('.'+select+'').attr('style','display:');
		$(form.contents).val('first');
		$(form.components).val('first');
	}
	
	function change2(form){
		var select = form.contents.value;
		$('.sel3').attr('style','display:none');
		$('.'+select+'').attr('style','display:');
		$(form.components).val('first');
	}
	
</SCRIPT>

 <h1>3단 동적 셀렉트 박스 예제</h1>
 <form name="form" method="get" action="#">
  <select name="subject" onchange="change1(this.form)"> 
  <option class="select1" value="선택">선택</option>
  <%
  		for(int i=0; i<speciesList2.size(); i++)
  		{
  			String species = speciesList2.get(i).get("species");
  	%>
  <option name="s1" value="<%=species%>"><%=species%></option>
  <%
  		}
  %>
  </select>
  <select name="contents" onchange="change2(this.form)" class="">
  <div class=""><option value="first">선택</option></div>
  	<%
  		for(int i=0; i<routeList.size(); i++)
  		{
  			String species = routeList.get(i).get("species");
  			String route = routeList.get(i).get("route");
  	%>
  	<option name="s2" class="<%=species%> sel2" value="<%=route%>"><%=route%></option>
  <%
  		}
  %>
  </select>
  <select name="components" onChange="">
  <option value="first">선택</option>
  	<%
  		for(int i=0; i<endpointList.size(); i++)
  		{
  			String route = endpointList.get(i).get("route");
  			String endpoint = endpointList.get(i).get("endpoint");
  	%>
  <option name="s3" class="<%=route%> <%=endpoint%> sel3" value="<%=endpoint%>"><%=endpoint%></option>
  <%
  		}
  %>
  </select>
 </form>

<br><br><br><br><br>



