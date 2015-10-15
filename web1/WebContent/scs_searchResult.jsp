<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*, java.text.*"%>
<%
	String s = request.getParameter("param");
	// 	System.out.println(s);
%>

<script type="text/javascript">
	$(".searchResult").click(function(event) {
		var th = $(this);
		var th_id = th.attr('id');
		$("#divAll").load("scs_resultView.jsp", {param : th_id});
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
	$('.pageBack').click(function() {
		$("#divAll").load("scs_searchMain.jsp");
	});
	
	
	function searchBntClick() {
		 var searchWord = $('#searchWord').val();
		 $("#divAll").load("scs_searchResult.jsp", {param:searchWord});
		 
	}
</script>



<style type="text/css">
.btnTop {
	display: none;
	overflow: hidden;
	position: fixed;
	bottom: 30px;
	right: 5%;
	z-index: 100;
}
</style>


<body>

	<!-- 	Å¾¹öÆ° -->
	<div class="btn-group btnTop">
		<button type="button" class="btn btn-default btn-xs">
			<span class="glyphicon glyphicon-upload" aria-hidden="true"></span>
			UP
		</button>
	</div>


	<!-- ÀüÃ¼ DIV -->
	<div style="margin: auto;">
		<!-- 		»ó´Ü Åø + °Ë»ö¹Ù -->
		<div>
			<!-- 	»ó´Ü È¨¹Ù -->
			<div id="topMenu" style= "position: fixed; width:100%; background-color:#ffffff;z-index:100; " >
				<table width=100%
					style="text-align: center; align: center; vertical-align: middle; height: 50px;">
					<tr>
						<td width=20%><div class="pageBack">
								<span class="glyphicon glyphicon-chevron-left"
									aria-hidden="true"></span>BACK
							</div></td>
						<td width=60%><img src="/images/logos/s2food.png" width=100px
							onclick="imgClick();"></td>
						<td width=20%>¸Þ´ºÀÚ¸®</td>
					</tr>
					</table>
					<!-- 		°Ë»ö¸Þ´º -->
					<div id="searchBarDiv" style="background-color:#4ba9f5; vertical-align:middle;">
					<table align="center" width=95%
					style="text-align: center; align: center; vertical-align: middle; height: 40px;">
					<tr>
						<td height=5px></td>
						<td></td>
					</tr>
					<tr>
						<!-- °Ë»ö¹Ù -->

						<td width=70%><input type="text" id="searchWord"
							style="border-radius:10px 0px 0px 10px; height: 40px; width: 100%;" placeholder="  °Ë»ö¾î¸¦ ÀÔ·ÂÇÏ¼¼¿ä."
							value="<%=s%>"></td>
						<td width=30%><input type="button"
							style="border-radius:0px 10px 10px 0px; height: 40px; width: 100%;" value="°Ë»ö"
							class="searchBut" onclick="searchBntClick();"></td>
							
					</tr>
					<tr>
						<td height=5px></td>
						<td></td>
					</tr>
				</table>
				</div>
			</div>
			<!-- 		¾Æ·¡ °Ë»ö°á°ú -->
			<br>

			<div class="" style="margin-top:100px;">
				<table align="center" text-align="left" width=95%>
					<tr>
						<td colspan="2" style="height: 10px;">°Ë»ö¾î [<%=s%>]ÀÇ °á°ú´Â [3] °³
							ÀÔ´Ï´Ù.
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="list-group" id="testdiv" style="">
								<a href="#"
									class="list-group-item searchResult"
									id="¼Ò¸£ºó»ê Ä®·ý"><span class="label label-info">±¹¹®¸í</span> ¼Ò¸£ºó»ê
									Ä®·ý<br> <span class="label label-info">¿µ¹®¸í</span> Potassium
									sorbate<br> <span class="label label-info">CAS #</span>
									24634-61-5</a> <a href="#"
									class="list-group-item searchResult list-group-item-info"
									id="¿¡¸®¼Ò¸£ ºó»ê"><span class="label label-info">±¹¹®¸í</span> ¿¡¸£¼Ò¸£
									ºó»ê<br> <span class="label label-info">¿µ¹®¸í</span>
									Erythorbic acid<br> <span class="label label-info">CAS
										#</span> 89-65-6</a> <a href="#"
									class="list-group-item searchResult "
									id="¼Ò¸£ºó»ê"><span class="label label-info">±¹¹®¸í</span> ¼Ò¸£ºó»ê<br>
									<span class="label label-info">¿µ¹®¸í</span> Sorbic acid<br>
									<span class="label label-info">CAS #</span> 110-44-1</a> <a
									href="#"
									class="list-group-item searchResult list-group-item-info"
									id="¼Ò¸£ºó»ê Ä®·ý"><span class="label label-info">±¹¹®¸í</span> ¼Ò¸£ºó»ê
									Ä®·ý<br> <span class="label label-info">¿µ¹®¸í</span> Potassium
									sorbate<br> <span class="label label-info">CAS #</span>
									24634-61-5</a> <a href="#"
									class="list-group-item searchResult "
									id="¿¡¸®¼Ò¸£ ºó»ê"><span class="label label-info">±¹¹®¸í</span> ¿¡¸£¼Ò¸£
									ºó»ê<br> <span class="label label-info">¿µ¹®¸í</span>
									Erythorbic acid<br> <span class="label label-info">CAS
										#</span> 89-65-6</a> 
										<a href="#"
									class="list-group-item searchResult list-group-item-info"
									id="¼Ò¸£ºó»ê"><span class="label label-info">±¹¹®¸í</span> ¼Ò¸£ºó»ê<br>
									<span class="label label-info">¿µ¹®¸í</span> Sorbic acid<br>
									<span class="label label-info">CAS #</span> 110-44-1</a> 
									<a href="#"	class="list-group-item searchResult " id="¼Ò¸£ºó»ê Ä®·ý">
									<span class="label label-info">±¹¹®¸í</span> ¼Ò¸£ºó»ê
									Ä®·ý<br> <span class="label label-info">¿µ¹®¸í</span> Potassium
									sorbate<br> <span class="label label-info">CAS #</span>
									24634-61-5</a>
									<a href="#"
									class="list-group-item searchResult list-group-item-info"
									id="¼Ò¸£ºó»ê"><span class="label label-info">±¹¹®¸í</span> ¼Ò¸£ºó»ê<br>
									<span class="label label-info">¿µ¹®¸í</span> Sorbic acid<br>
									<span class="label label-info">CAS #</span> 110-44-1</a> 
									<a href="#"	class="list-group-item searchResult " id="¼Ò¸£ºó»ê Ä®·ý">
									<span class="label label-info">±¹¹®¸í</span> ¼Ò¸£ºó»ê
									Ä®·ý<br> <span class="label label-info">¿µ¹®¸í</span> Potassium
									sorbate<br> <span class="label label-info">CAS #</span>
									24634-61-5</a>
									<a href="#"
									class="list-group-item searchResult list-group-item-info"
									id="¼Ò¸£ºó»ê"><span class="label label-info">±¹¹®¸í</span> ¼Ò¸£ºó»ê<br>
									<span class="label label-info">¿µ¹®¸í</span> Sorbic acid<br>
									<span class="label label-info">CAS #</span> 110-44-1</a> 
									<a href="#"	class="list-group-item searchResult " id="¼Ò¸£ºó»ê Ä®·ý">
									<span class="label label-info">±¹¹®¸í</span> ¼Ò¸£ºó»ê
									Ä®·ý<br> <span class="label label-info">¿µ¹®¸í</span> Potassium
									sorbate<br> <span class="label label-info">CAS #</span>
									24634-61-5</a>
									<a href="#"
									class="list-group-item searchResult list-group-item-info"
									id="¼Ò¸£ºó»ê"><span class="label label-info">±¹¹®¸í</span> ¼Ò¸£ºó»ê<br>
									<span class="label label-info">¿µ¹®¸í</span> Sorbic acid<br>
									<span class="label label-info">CAS #</span> 110-44-1</a> 
									<a href="#"	class="list-group-item searchResult " id="¼Ò¸£ºó»ê Ä®·ý">
									<span class="label label-info">±¹¹®¸í</span> ¼Ò¸£ºó»ê
									Ä®·ý<br> <span class="label label-info">¿µ¹®¸í</span> Potassium
									sorbate<br> <span class="label label-info">CAS #</span>
									24634-61-5</a>
									<a href="#"
									class="list-group-item searchResult list-group-item-info"
									id="¼Ò¸£ºó»ê"><span class="label label-info">±¹¹®¸í</span> ¼Ò¸£ºó»ê<br>
									<span class="label label-info">¿µ¹®¸í</span> Sorbic acid<br>
									<span class="label label-info">CAS #</span> 110-44-1</a> 
									<a href="#"	class="list-group-item searchResult " id="¼Ò¸£ºó»ê Ä®·ý">
									<span class="label label-info">±¹¹®¸í</span> ¼Ò¸£ºó»ê
									Ä®·ý<br> <span class="label label-info">¿µ¹®¸í</span> Potassium
									sorbate<br> <span class="label label-info">CAS #</span>
									24634-61-5</a> 
								
									
								</div>
						</td>
					</tr>


				</table>

			</div>
		</div>
	</div>

	<!-- ÀüÃ¼ DIV -->