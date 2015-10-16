<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*, java.text.*"%>
<%
	String s = request.getParameter("param");
	// 	System.out.println(s);
%>

<script type="text/javascript">
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

	
	$(".searchResult").click(function(event) {
		var th = $(this);
		var th_id = th.attr('id');
		$("#divAll").load("scs_resultView.jsp", {param : th_id});
	});

	
	$('.pageBack').click(function() {
		$("#divAll").load("scs_searchMain.jsp");
	});
	
	
	function searchBntClick() {
		 var searchWord = $('#searchWord').val();
		 $("#divAll").load("scs_searchResult.jsp", {param:searchWord});
		 
	}
	
// 	alert(($(window).height()/5)); 
 	$("#menuBarTable").attr('height',($(window).height()/9));
 	$("#searchBarTable").attr('height',($(window).height()/10));
 	$("#logoImgId").attr('height',($(window).height()/11));
	
</script>



<style type="text/css">

.label-info{
	min-width:100px;
}
.labelTag{
 	background-color: #5bc0de;
	min-width:1000px;
	width:1000px;
}
.logoImg{
/* 	max-height:20%; */
	
}

.searchBarTable{
	max-height:60px;
}
</style>


<body>

	<!-- ��ü DIV -->
	<div style="margin: auto; z-index: 100;">
		<!-- 		��� �� + �˻��� -->
		<div>
			<!-- 	��� Ȩ�� -->
			<div id="topMenu" style= "position: fixed; width:100%; background-color:#ffffff;z-index:100;" >
				<table id="menuBarTable" width=100%
					style="text-align: center; align: center; vertical-align: middle;">
					<tr>
						<td width=20%><div class="pageBack">
								<span class="glyphicon glyphicon-chevron-left"
									aria-hidden="true"></span>BACK
							</div></td>
						<td width=60% style="padding-right:5%;padding-left:3%;"><img src="/images/logos/s2food.png" id="logoImgId" class="logoImg"
							onclick="imgClick();"></td>
						<td width=20%>�޴�</td>
					</tr>
					</table>
					<!-- 		�˻��޴� -->
					<div id="searchBarDiv" style="background-color:#4ba9f5; vertical-align:middle;">
					<table id="searchBarTable" class="searchBarTable" align="center" width=95%
					style="text-align: center; align: center; vertical-align: middle; " >
					<tr>
						<td height=5px></td>
						<td></td>
					</tr>
					<tr>
						<!-- �˻��� -->

						<td width=70%><input type="text" id="searchWord"
							style="border-radius:2px 0px 0px 2px; height: 40px; width: 100%;" placeholder="  �˻�� �Է��ϼ���."
							value="<%=s%>"></td>
						<td width=30%><input type="button"
							style="border-radius:0px 2px 2px 0px; height: 40px; width: 100%;" value="�˻�"
							class="searchBut" onclick="searchBntClick();"></td>
							
					</tr>
					<tr>
						<td height=5px></td>
						<td></td> 
					</tr>
				</table>
				</div>
			</div>
			<!-- 		�Ʒ� �˻���� -->
			<br>

			<div class="" style="margin-top:100px;">
				<table align="center" text-align="left" width=95%>
					<tr>
						<td colspan="2" height=15px> </td>
					</tr>
					<tr>
						<td colspan="2" style="height: 10px;">�˻��� [<%=s%>]�� ����� [3] ��
							�Դϴ�.
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="list-group" id="testdiv" style="">
								<a href="#"
									class="list-group-item searchResult"
									id="�Ҹ���� Į��"><alt class="labelTag" style="width:1000px;" >������</alt> �Ҹ����
									Į��<br> <span class="label label-info">������</span> Potassium
									sorbate<br> <span class="label label-info">CAS #</span>
									24634-61-5</a> <a href="#"
									class="list-group-item searchResult list-group-item-info"
									id="�����Ҹ� ���"><span class="label label-info">������</span> �����Ҹ�
									���<br> <span class="label label-info">������</span>
									Erythorbic acid<br> <span class="label label-info">CAS
										#</span> 89-65-6</a> <a href="#"
									class="list-group-item searchResult "
									id="�Ҹ����"><span class="label label-info">������</span> �Ҹ����<br>
									<span class="label label-info">������</span> Sorbic acid<br>
									<span class="label label-info">CAS #</span> 110-44-1</a> <a
									href="#"
									class="list-group-item searchResult list-group-item-info"
									id="�Ҹ���� Į��"><span class="label label-info">������</span> �Ҹ����
									Į��<br> <span class="label label-info">������</span> Potassium
									sorbate<br> <span class="label label-info">CAS #</span>
									24634-61-5</a> <a href="#"
									class="list-group-item searchResult "
									id="�����Ҹ� ���"><span class="label label-info">������</span> �����Ҹ�
									���<br> <span class="label label-info">������</span>
									Erythorbic acid<br> <span class="label label-info">CAS
										#</span> 89-65-6</a> 
										<a href="#"
									class="list-group-item searchResult list-group-item-info"
									id="�Ҹ����"><span class="label label-info">������</span> �Ҹ����<br>
									<span class="label label-info">������</span> Sorbic acid<br>
									<span class="label label-info">CAS #</span> 110-44-1</a> 
									<a href="#"	class="list-group-item searchResult " id="�Ҹ���� Į��">
									<span class="label label-info">������</span> �Ҹ����
									Į��<br> <span class="label label-info">������</span> Potassium
									sorbate<br> <span class="label label-info">CAS #</span>
									24634-61-5</a>
									<a href="#"
									class="list-group-item searchResult list-group-item-info"
									id="�Ҹ����"><span class="label label-info">������</span> �Ҹ����<br>
									<span class="label label-info">������</span> Sorbic acid<br>
									<span class="label label-info">CAS #</span> 110-44-1</a> 
									<a href="#"	class="list-group-item searchResult " id="�Ҹ���� Į��">
									<span class="label label-info">������</span> �Ҹ����
									Į��<br> <span class="label label-info">������</span> Potassium
									sorbate<br> <span class="label label-info">CAS #</span>
									24634-61-5</a>
									<a href="#"
									class="list-group-item searchResult list-group-item-info"
									id="�Ҹ����"><span class="label label-info">������</span> �Ҹ����<br>
									<span class="label label-info">������</span> Sorbic acid<br>
									<span class="label label-info">CAS #</span> 110-44-1</a> 
									<a href="#"	class="list-group-item searchResult " id="�Ҹ���� Į��">
									<span class="label label-info">������</span> �Ҹ����
									Į��<br> <span class="label label-info">������</span> Potassium
									sorbate<br> <span class="label label-info">CAS #</span>
									24634-61-5</a>
									<a href="#"
									class="list-group-item searchResult list-group-item-info"
									id="�Ҹ����"><span class="label label-info">������</span> �Ҹ����<br>
									<span class="label label-info">������</span> Sorbic acid<br>
									<span class="label label-info">CAS #</span> 110-44-1</a> 
									<a href="#"	class="list-group-item searchResult " id="�Ҹ���� Į��">
									<span class="label label-info">������</span> �Ҹ����
									Į��<br> <span class="label label-info">������</span> Potassium
									sorbate<br> <span class="label label-info">CAS #</span>
									24634-61-5</a>
									<a href="#"
									class="list-group-item searchResult list-group-item-info"
									id="�Ҹ����"><span class="label label-info">������</span> �Ҹ����<br>
									<span class="label label-info">������</span> Sorbic acid<br>
									<span class="label label-info">CAS #</span> 110-44-1</a> 
									<a href="#"	class="list-group-item searchResult " id="�Ҹ���� Į��">
									<span class="label label-info">������</span> �Ҹ����
									Į��<br> <span class="label label-info">������</span> Potassium
									sorbate<br> <span class="label label-info">CAS #</span>
									24634-61-5</a> 
								
									
								</div>
						</td>
					</tr>


				</table>

			</div>
		</div>
	</div>

	<!-- ��ü DIV -->