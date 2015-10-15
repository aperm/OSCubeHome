<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*, java.text.*"%>


<style>
#searchDiv {
	width: 50%;
	float: left;
}

#center-box {
	text-align: center;
	background-color: yellow;
	margin: 0 auto;
}

#searchBut {
	width: 50%;
	float: right;
	text-align: right;
}

#searchButId {
	height: 30px;
	height: 40px !important;
}
</style>
<script type="text/javascript">
	function searchButClick() {
		 var searchWord = $('#searchWord').val();
		 $("#divAll").load("scs_search2.jsp", {param:searchWord});
		 
	}
</script>


<script>
	jQuery(document).ready(function($) {
		$(".searchResult").click(function(event) {
		 	var th = $(this);
		 	var th_id = th.attr('id');
		 	$("#divAll").load("scs_searchResult.jsp", {param:th_id});
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
		
		if (searchVal != '' && searchVal != '�˻�� �Է��ϼ���.') {
			jQuery('#keyword').val(jQuery('#searchWord').val());
// 			alert(jQuery('#keyword').val());
		} else {
// 			alert('�˻�� �Է��ϼ���.');
		}
	}
	
	
</script>

<body>
	<!-- ��ü DIV -->
	<div style="margin: auto;" id="divAll">
		<br><br> <br><!-- �̹���DIV  -->
		<div align="center">
			<img src="images/logos/s2food.png" width="86%" style="margin-top:36px;">
		</div>
		<!-- �̹���DIV  -->
		<br> <br>
		<input type="hidden" id="keyword" value="">
		<div class="">
			<table align="center" width=95%>
				<tr>
					<td width=70%><input type="text" id="searchWord" value="" style="border-radius:10px 0px 0px 10px; height: 50px; width:100%;" placeholder="  �˻�� �Է��ϼ���."></td>
					<td width=30%><input type="button" style="border-radius:0px 10px 10px 0px; height: 50px; width:100%;" value="�˻�" onclick="searchButClick();">
					</td>
				</tr>

				<tr>
					<td colspan="2">
					<br><br>
						<div class="list-group"  id="testdiv" style="">
						�˻� ���� 
							<a href="#" class="list-group-item searchResult list-group-item-success" id="�Ҹ���� Į��">1. �Ҹ���� Į��</a> 
							<a href="#"	class="list-group-item searchResult list-group-item-success" id="�����Ҹ����">2. �����Ҹ����</a> 
							<a href="#"	class="list-group-item searchResult list-group-item-success" id="Sorbic acid">3. Sorbic acid</a> 
							<a href="#"	class="list-group-item searchResult list-group-item-success" id="����">4. ����</a>
						</div>
					</td>
				</tr>
			</table>

		</div>
	</div>
	<!-- ��ü DIV -->
