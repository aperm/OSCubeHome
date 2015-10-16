<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*, java.text.*"%>

<script>
	jQuery(document).ready(function($) {
		$(".searchResult").click(function(event) {
		 	var th = $(this);
		 	var th_id = th.attr('id');
		 	$("#divAll").load("scs_resultView.jsp", {param:th_id});
		});
	});
	
	
	
	$(document).bind('keydown', function(e) {
		if (e.keyCode == 13) {
			searchTest();
			return false;
		}
	});
	
	function searchTest(){
		var searchVal = jQuery('#searchWord').val();
		
		if (searchVal != '' && searchVal != '검색어를 입력하세요.') {
			jQuery('#keyword').val(jQuery('#searchWord').val());
// 			alert(jQuery('#keyword').val());
		} else {
// 			alert('검색어를 입력하세요.');
		}
	}
	
	function searchBntClick() {
		 var searchWord = $('#searchWord').val();
		 $("#divAll").load("scs_searchResult.jsp", {param:searchWord});
		 
	}
</script>

<body>
	<!-- 전체 DIV -->
	<div style="margin: auto;">
		<br><!-- 이미지DIV  -->
		<div align="center">
			<img src="images/logos/s2food.png" width="65%" style="margin-top:36px;">
		</div>
		<!-- 이미지DIV  -->
		<br> <br>
		<input type="hidden" id="keyword" value="">
		<div class="">
			<table align="center" width=95%>
				<tr>
					<td width=70%><input type="text" id="searchWord" value="" style="border-radius:2px 0px 0px 2px; height: 50px; width:100%;" placeholder="  검색어를 입력하세요."></td>
					<td width=30%><input type="button" style="border-radius:0px 2px 2px 0px; height: 50px; width:100%;" value="검색" onclick="searchBntClick();">
					</td>
				</tr>
				<tr>
						<td colspan="2" class="line30"> </td>
				</tr>				
				<tr>
					<td colspan="2" class="" height=90px>
						<titleText class="titleText">검색 순위</titleText>
				</tr>
				<tr>
					<td colspan="2">
							
							<div class="list-group line40"  id="testdiv" >
								<contentText class="contentText"> 
									<a href="#" class="list-group-item searchResult " id="소르빈산 칼륨">1. 소르빈산 칼륨<br>(Potassium sorbate)</a> 
									<a href="#"	class="list-group-item searchResult " id="에리소르빈산">2. 에리소르빈산<br>(Erythorbic acid)</a> 
									<a href="#"	class="list-group-item searchResult " id="Sorbic acid">3. 소르빈산<br>(Sorbic acid)</a> 
									<a href="#"	class="list-group-item searchResult " id="Sorbic acid">3. 소르빈산<br>(Sorbic acid)</a> 
									<a href="#"	class="list-group-item searchResult " id="Sorbic acid">3. 소르빈산<br>(Sorbic acid)</a> 
								</contentText>
						</div>
					</td>
				</tr>
			</table>

		</div>
	</div>
	<!-- 전체 DIV -->
