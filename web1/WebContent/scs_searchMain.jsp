<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*, java.text.*"%>
<%
// 	String s = request.getParameter("param");
	// 	System.out.println(s);
%>

<script>
		$(".searchResult").click(function(event) {
			var th = $(this);
			var th_cnk = th.attr('id');
			var th_cas = th.attr('cas')
			$('html, body').animate({ 
				scrollTop : 0
			}, 0);
			$("#divAll").load("scs_resultView.jsp", {chemNameKor : th_cnk, cas : th_cas});
		});
	
		$(window).scroll(function() {
			if ($(this).scrollTop() > 0) {
				$('.btnTop').fadeIn();
			} else {
				$('.btnTop').fadeOut();
			}
		});

		$('.btnTop').click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 450);
			return false;
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
		} else {
		}
	}
	
	function searchBntClick() {
		 var searchWord = $('#searchWord').val();
		 $("#divAll").load("scs_searchResult.jsp", {chemNameKor:searchWord});
		 
	}
	
	
	$(function () {
		
	    $("#searchWord").keydown(function (key) {
	        if (key.keyCode == 13) {
	            alert($("#searchWord").val());
	            $("#searchWord").val("");
	        }
	    });
	
	});
</script>

<body>
	<!-- 전체 DIV -->
	<div style="margin: auto; z-index:1;">
		<br><!-- 이미지DIV  -->
		<div align="center">
			<img src="images/logos/s2food.png" width="65%"  class="logoImg"onclick="imgClick();" style="margin-top:36px;">
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
						<td colspan="2" class=""> </td>
				</tr>				
				<tr>
					<td colspan="2" class="" height=90px>
						<titleText class="titleText">검색 순위</titleText>
				</tr>
				<tr>
					<td colspan="2">
							<div class=""  id="">
									<a href="#"	class="list-group-item searchResult listRank " id="소르빈산" cas="">1. 소르빈산<br>(Sorbic acid)</a>
									<a href="#" class="list-group-item searchResult listRank" id="아질산 나트륨" cas="">2. 아질산 나트륨<br>(Sodium nitrite)</a> 
									<a href="#"	class="list-group-item searchResult listRank" id="수크랄로스" cas="">3. 수크랄로스<br>(Sucralose)</a> 
						</div>
					</td>
				</tr>
				<tr>
					<td style="height:10px;"></td>
				</tr>
			</table>

		</div>
	</div>

	<!-- 전체 DIV -->
</body>