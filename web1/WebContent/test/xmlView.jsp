<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/xml; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.URLEncoder"%>

<%
 String first= request.getParameter("first");
 String second = request.getParameter("second");
 String numOfRows = request.getParameter("numOfRows");
 String pageNo = request.getParameter("pageNo");
 String keyword = "";
 
 if(request.getParameter("keyword")!=null)
 {
 	keyword = request.getParameter("keyword");
 }
 
 //기본 url 주소 
 String url = "http://www.nifds.go.kr/toxinfo/openapi/openapi/service/rest/";
 url = url+first+"/"+second+"?ServiceKey=XiAabOLQvlMH9G0Gx1V2jZtR%2FRgRjXn9hiArkoB4FvzIPErVCZQ4qPjrpdyiD6eNJqcL0fBzLPWfU66kJNfc7Q%3D%3D";

 //일반물질 인 경우 
 if(first.equals("ChmclsGnrlInfoInqireService")){
	 // 일반물질 - 물질검색 keyword (eng / casNo) / gubun 필수 (0 통합+casNo)
	 if(second.equals("getChmclsGnrlIntegSearchListInqire")){
		 url += "&gubun=0&keyword="+keyword;
	 }
	// 일반물질 - 상세검색 chemId 필수 6자리
	 else if(second.equals("getChmclsGnrlListAcctoDetailInqire")){
		url += "&chemId="+keyword;		 
	 }
	// 일반물질 - 요약검색  keyword (kor) / gubun 필수
	 else if(second.equals("getChmclsGnrlListAcctoDetailInqire")){
		 url += "&gubun=3&keyword="+keyword;
	 }
	 
 }
 
 // 독성물질 인 경우
 else if(first.equals("ChmclsGnrlToxctyInfoService")){
	 
	 
 }
 
 
 
 

 //한글 깨짐 방지이나 한글 검색 아직 안됨..
 String s = URLEncoder.encode(keyword);
 
 System.out.println(s);
%>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript" src="httpRequest.js"></script>
<script type="text/javascript">
		function loadWeather() {
			sendRequest("weather2.jsp?stnId=109", null, loadedWeather, "GET");
		}
		function loadedWeather() {
			if (httpRequest.readyState == 4) {
				if (httpRequest.status == 200) {
					var xmlDoc = httpRequest.responseXML;
					var locList = xmlDoc.getElementsByTagName("location");
					//출처
					var ctg = xmlDoc.getElementsByTagName("title").item(0).firstChild.nodeValue;
					document.getElementById('name').innerHTML = ctg;
					//예보발표시간
					var tm = xmlDoc.getElementsByTagName("tm").item(0).firstChild.nodeValue;
                    tm = getTime(tm);
                    document.getElementById('time').innerHTML = tm;
                    //기상전망
                    var wf = xmlDoc.getElementsByTagName("wf").item(0).firstChild.nodeValue;
                    document.getElementById('wf').innerHTML = wf;

                    var cityInfo = ""; 
                    var cityInfo2 = ""; 
					var data = "";
					var dataList = "";
					var numEf = ""; //n일 후 예보
					var tmEf = "";  //년월일
					var wf = "";    //날씨예보
					var tmn = "";   //최저온도
					var tmx = "";   //최고온도
					var reliability = "";  //신뢰도
					
					for(var i = 0; i < locList.length; i++){
						
						cityInfo = locList.item(i).getElementsByTagName("city").item(0).firstChild.nodeValue;
						dataList = locList.item(i).getElementsByTagName("data");
						document.getElementById('detail').innerHTML += cityInfo+"<br />";
						for(var k = 0; k < dataList.length; k++){
						    data = dataList.item(k);
							tmEf = getTagValue(data,"tmEf");
							numEf = getTagValue(data,"numEf");
							tmn = getTagValue(data,"tmn");
							tmx = getTagValue(data,"tmx");
							wf = getTagValue(data,"wf");
							reliability = getTagValue(data,"reliability");
							document.getElementById('detail').innerHTML += tmEf +" , 신뢰도:"+reliability+" , "+wf;
							document.getElementById('detail').innerHTML += " , 최저기온:"+tmn+" , 최고기온:"+tmx;
							document.getElementById('detail').innerHTML += "<br />";
					    }
						document.getElementById('detail').innerHTML += "<hr />"
					}

				}
			}
		}
		/*
	//id속성에 따른 태그값 입력	
	function printText(eid,text) {
		document.getElementById(eid).innerHTML = text;
		
	}
	*/
	function getTime(tm){
        var re = "";
		var year = tm.substring(0,4);
		var mon = tm.substring(4,6);
		var day = tm.substring(6,8);
		var hour = tm.substring(8,10);
		var time = tm.substring(10,12);
		re = year+"년"+mon+"월"+day+"일"+hour+"시"+time+"분";
		return re;
	}
	//source 아래에 있는 tagName이라는 태그의 텍스트 추출
	function getTagValue(source,tagName) {
		var result = "";
		var tag = source.getElementsByTagName(tagName).item(0);
		if(tag.firstChild && tag.firstChild.nodeValue){
			result = tag.firstChild.nodeValue;
		}
		return result;
	}
	
		window.onload = function() {
			loadWeather();
		}
		
	</script>
</head>
<body>
  <h1><span id="name"></span></h1>
  <h2>발표시간 : <span id="time"></span></h2>
  <h3>
         기상전망 <br />
    <span id="wf"></span>
  </h3>
  <h4><span id="detail"></span></h4>
  

  
</body>
</html>