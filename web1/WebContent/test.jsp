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

	
	System.out.println(routeList);
	System.out.println(endpointList);
	System.out.println(dosageList);

	
%>

<script>
$(document).ready(function(){
	var count=0;
	$('.sel1').wrap('<span></span>').hide(); 
	
  $("#hide").click(function(){
    $('.sel1').wrap('<span></span>').hide();
  });
  $("#show").click(function(){
     $('.sel1').unwrap('<span></span>').show();
//      $().unwrap('<span></span>').show();
  });

});

	function change1(form){
		var select = form.subject.value;
// 	 	$('#s').$('.'+select+'').unwrap('<span></span>').show();	
		$('.'+select+'').unwrap('<span></span>').show();
	}
	
	function change2(form){
		var select = form.contents.value;
		$('.'+select+'').unwrap('<span></span>').show();
	}
	
</SCRIPT>


<body >

 <h1>3단 동적 셀렉트 박스 예제</h1>
<button id="hide">Hide</button>
<button id="show">Show</button>
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
<!--   </form> -->
<!--   <form name="form2"> -->
  <select name="contents" onchange="change2(this.form)" class="">
  <div class=""><option class="" value="선택">선택</option></div>
  	<%
  		for(int i=0; i<routeList.size(); i++)
  		{
  			String species = routeList.get(i).get("species");
  			String route = routeList.get(i).get("route");
  	%>
  	<option name="s2" class="<%=species%> sel1" value="<%=route%>"><%=route%></option>
  <%
  		}
  %>
  </select>
<!--  </form> -->
<!--  <form name="form3"> -->
  <select name="components" onChange="">
  <option class="select1" value="선택">선택</option>
  	<%
  		for(int i=0; i<endpointList.size(); i++)
  		{
  			String route = endpointList.get(i).get("route");
  			String endpoint = endpointList.get(i).get("endpoint");
  	%>
  <option name="s3" class="<%=route%> <%=endpoint%> sel1" value="<%=endpoint%>"><%=endpoint%></option>
  <%
  		}
  %>
  </select>
  
 </form>


