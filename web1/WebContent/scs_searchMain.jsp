<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*, java.text.*"%>
<jsp:useBean id="searchList2" class="scs.SearchList"/>   
<%
	String keyword = "";
	String chemNameKor = ""; 
	String chemNameEng = "";
	String casNo = "";
	ArrayList<HashMap<String, String>> searchList= searchList2.searchList("keyword","rankList");
%>

<script>
		$(".searchResult").click(function(event) {
			var th = $(this);
			var th_cnk = th.attr('id');
			var th_cas = th.attr('cas');
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
		$(function () {
		    $("#searchWord").keydown(function (key) {
		        if (key.keyCode == 13) {
		            searchBntClick();
		        }
		    });
		});
		function searchBntClick() {
			 var searchWord = $('#searchWord').val();
			 $('html, body').animate({
					scrollTop : 0
				}, 0);
			 $("#divAll").load("scs_searchResult.jsp", {chemNameKor:searchWord});
			 
		}
		
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
							
								<% 
								if(searchList.size()>0){
									for (int i = 0; i < searchList.size(); i++) {
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
									%>
									<a href="#"	class="list-group-item searchResult listRank " id="<%=chemNameKor%>" cas="<%=casNo%>"><%=i+1%>. <%=chemNameKor%><br>&nbsp;&nbsp;(<%=chemNameEng%>)</a>								
									<%
									}
								}
								
								%>
	
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