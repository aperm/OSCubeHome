<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*, java.text.*"%>
<%
	String s = request.getParameter("param");
	System.out.println("resultView");
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

	$('.pageBack').click(function() {
		$("#divAll").load("scs_searchResult.jsp",{param:'<%=s%>'});
	});

	// Without JQuery
	var slider = new Slider('#ex1', {
		formatter : function(value) {
			// 			return '������ : ' + value;
		}
	});

	$("#ex1").on("slide", function(slideEvt) {
		// 		$("#ex6SliderVal").text(slideEvt.value);

		$("#weightValue").attr('value', slideEvt.value);

		$("#value1").text((slideEvt.value * 25 / 3).toFixed(1));
		$("#value2").text((slideEvt.value * 25 / 2).toFixed(1));
		$("#value3").text((slideEvt.value * 25 / 0.1).toFixed(1));
		$("#value4").text((slideEvt.value * 25 / 1).toFixed(1));
		$("#value5").text((slideEvt.value * 25 / 1).toFixed(1));
		$("#value6").text((slideEvt.value * 25 / 1).toFixed(1));
		$("#value7").text((slideEvt.value * 25 / 0.4).toFixed(1));
		$("#value8").text((slideEvt.value * 25 / 0.5).toFixed(1));
		$("#value9").text((slideEvt.value * 25 / 0.5).toFixed(1));
		$("#value10").text((slideEvt.value * 25 / 0.05).toFixed(1));
		$("#value11").text((slideEvt.value * 25 / 0.2).toFixed(1));
		$("#value12").text((slideEvt.value * 25 / 1).toFixed(1));
		$("#value13").text((slideEvt.value * 25 / 2).toFixed(1));
		$("#value14").text((slideEvt.value * 25 / 1).toFixed(1));
		$("#value15").text((slideEvt.value * 25 / 1).toFixed(1));

	});

	function searchBntClick() {
		var searchWord = $('#searchWord').val();
		$("#divAll").load("scs_searchResult.jsp", {
			param : searchWord
		});

	}
	function keydownFun() {
		$("#value1").text((slideEvt.value * 25 / 3).toFixed(1));
		$("#value2").text((slideEvt.value * 25 / 2).toFixed(1));
		$("#value3").text((slideEvt.value * 25 / 0.1).toFixed(1));
		$("#value4").text((slideEvt.value * 25 / 1).toFixed(1));
		$("#value5").text((slideEvt.value * 25 / 1).toFixed(1));
		$("#value6").text((slideEvt.value * 25 / 1).toFixed(1));
		$("#value7").text((slideEvt.value * 25 / 0.4).toFixed(1));
		$("#value8").text((slideEvt.value * 25 / 0.5).toFixed(1));
		$("#value9").text((slideEvt.value * 25 / 0.5).toFixed(1));
		$("#value10").text((slideEvt.value * 25 / 0.05).toFixed(1));
		$("#value11").text((slideEvt.value * 25 / 0.2).toFixed(1));
		$("#value12").text((slideEvt.value * 25 / 1).toFixed(1));
		$("#value13").text((slideEvt.value * 25 / 2).toFixed(1));
		$("#value14").text((slideEvt.value * 25 / 1).toFixed(1));
		$("#value15").text((slideEvt.value * 25 / 1).toFixed(1));

	}
	$("#menuBarTable").attr('height', ($(window).height() / 9));
	$("#searchBarTable").attr('height', ($(window).height() / 10));
	$("#contentDown").css('margin-top', ($(window).height() / 5));
	$("#logoImgId").attr('height', ($(window).height() / 11));
	$("#progressBar").attr('width', ($(window).width() / 2.2));
	$("#valueTd").attr('width', ($(window).width() / 5.5));

	function morebutClick(div1, div2) {
		var text1 = document.getElementById(div1);
		var text2 = document.getElementById(div2);

		if (text2.style.display == "block") {
			text2.style.display = "none";
			text1.style.display = "block";
		} else {
			text2.style.display = "block";
			text1.style.display = "none";
		}

	}
</script>



<style type="text/css">

.listBox02 {
	background: #d3d3d3;
	border: 1px solid #e1e1e1;
	padding: 5px;
	-webkit-border-radius: .3125em;
	border-radius: .3125em;
	margin-bottom: 7px;
	margin-top: 7px;
}
.listBox01 {
	background: #f9f9f9;
	border: 1px solid #e1e1e1;
	padding: 3px;
	-webkit-border-radius: .3125em;
	border-radius: .3125em;
	margin-bottom: 7px;
	margin-top: 7px;
}



.mytable {
	border-collapse: collapse;
}

.mytable th, .mytable td {
	border: 1px solid black;
}

.searchBarTable {
	max-height: 60px;
}

.progress2 {
	height: 20px;
	margin-bottom: 0px;
	overflow: hidden;
	background-color: #f5f5f5;
	border-radius: 4px;
	-webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, .1);
	box-shadow: inset 0 1px 2px rgba(0, 0, 0, .1);
}

.progress-bar2 {
	float: center;
	width: 0;
	height: 100%;
	font-size: 12px;
	line-height: 20px;
	color: #fff;
	text-align: center;
	vertical-align: center;
	background-color: #337ab7;
	-webkit-box-shadow: inset 0 -1px 0 rgba(0, 0, 0, .15);
	box-shadow: inset 0 -1px 0 rgba(0, 0, 0, .15);
	-webkit-transition: width .6s ease;
	-o-transition: width .6s ease;
	transition: width .6s ease;
}

.titleTextLine {border-top:1px solid #d9d9d9; padding:10px 3px; color:#666; margin-top:15px; margin-bottom:9px;line-height:23px;letter-spacing:-1px; text-shadow:0 0 0 !important; }



.btn-custom2 {
  background-color: hsl(188, 88%, 57%) !important;
  background-repeat: repeat-x;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#caf5fb", endColorstr="#30d8f1");
  background-image: -khtml-gradient(linear, left top, left bottom, from(#caf5fb), to(#30d8f1));
  background-image: -moz-linear-gradient(top, #caf5fb, #30d8f1);
  background-image: -ms-linear-gradient(top, #caf5fb, #30d8f1);
  background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #caf5fb), color-stop(100%, #30d8f1));
  background-image: -webkit-linear-gradient(top, #caf5fb, #30d8f1);
  background-image: -o-linear-gradient(top, #caf5fb, #30d8f1);
  background-image: linear-gradient(#caf5fb, #30d8f1);
  border-color: #30d8f1 #30d8f1 hsl(188, 88%, 49%);
  color: #333 !important;
  text-shadow: 0 1px 1px rgba(255, 255, 255, 0.52);
  -webkit-font-smoothing: antialiased;
}

.btn-custom3 {
  background-color: hsl(161, 12%, 50%) !important;
  background-repeat: repeat-x;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#b4c4bf", endColorstr="#708e85");
  background-image: -khtml-gradient(linear, left top, left bottom, from(#b4c4bf), to(#708e85));
  background-image: -moz-linear-gradient(top, #b4c4bf, #708e85);
  background-image: -ms-linear-gradient(top, #b4c4bf, #708e85);
  background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #b4c4bf), color-stop(100%, #708e85));
  background-image: -webkit-linear-gradient(top, #b4c4bf, #708e85);
  background-image: -o-linear-gradient(top, #b4c4bf, #708e85);
  background-image: linear-gradient(#b4c4bf, #708e85);
  border-color: #708e85 #708e85 hsl(161, 12%, 44%);
  color: #333 !important;
  text-shadow: 0 1px 1px rgba(255, 255, 255, 0.39);
  -webkit-font-smoothing: antialiased;
}

.btn-custom4 {
  background-color: hsl(168, 100%, 87%) !important;
  background-repeat: repeat-x;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#bcfff1", endColorstr="#bcfff1");
  background-image: -khtml-gradient(linear, left top, left bottom, from(#bcfff1), to(#bcfff1));
  background-image: -moz-linear-gradient(top, #bcfff1, #bcfff1);
  background-image: -ms-linear-gradient(top, #bcfff1, #bcfff1);
  background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #bcfff1), color-stop(100%, #bcfff1));
  background-image: -webkit-linear-gradient(top, #bcfff1, #bcfff1);
  background-image: -o-linear-gradient(top, #bcfff1, #bcfff1);
  background-image: linear-gradient(#bcfff1, #bcfff1);
  border-color: #bcfff1 #bcfff1 hsl(168, 100%, 87%);
  color: #333 !important;
  text-shadow: 0 1px 1px rgba(255, 255, 255, 0.00);
  -webkit-font-smoothing: antialiased;
}

td {
  padding-top: 4px;
  padding-bottom: 4px;
}
</style>


<body>

	<!-- 	ž��ư -->
	<div class="btn-group btnTop">
		<button type="button" class="btn btn-default btn-xs">
			<span class="glyphicon glyphicon-upload" aria-hidden="true"></span>
			UP
		</button>
	</div>


	<!-- ��ü DIV -->
	<div style="margin: auto;">
		<!-- 		��� �� + �˻��� -->
		<div>
			<!-- 	��� Ȩ�� -->
			<div id="topMenu"
				style="position: fixed; width: 100%; background-color: #ffffff; z-index: 100;">
				<table id="menuBarTable" width=100% style="text-align: center; align: center; vertical-align: middle;">
					<tr>
						<td width=20%><div class="pageBack">
								<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>BACK
							</div></td>
						<td width=60% style="padding-right: 5%; padding-left: 3%;">
						<img src="/images/logos/s2food.png" id="logoImgId" class="logoImg" onclick="imgClick();"></td>
						<td width=20%>�޴�</td>
					</tr>
				</table>
				<!-- 		�˻��޴� -->
				<div id="searchBarDiv" style="background-color: #4ba9f5; vertical-align: middle;">
					<table id="searchBarTable" class="searchBarTable" align="center" width=95% style="text-align: center; align: center; vertical-align: middle;">
						<tr>
							<td height=5px></td>
							<td></td>
						</tr>
						<tr>
							<!-- �˻��� -->

							<td width=70%><input type="text" id="searchWord" style="border-radius: 2px 0px 0px 2px; height: 40px; width: 100%;"	placeholder="  �˻�� �Է��ϼ���." value="<%=s%>"></td>
							<td width=30%><input type="button" style="border-radius: 0px 2px 2px 0px; height: 40px; width: 100%;" value="�˻�" class="searchBut" onclick="searchBntClick();"></td>

						</tr>
						<tr>
							<td height=5px></td>
							<td></td>
						</tr>
					</table>
				</div>
			</div>
			<br>
			<!-- 			�Ʒ����� -->
			<div class="" id="contentDown">
				<table align="center" text-align="center" width=95% >
					<tr>
						<td colspan="2" height=10px></td>
					</tr>
					<tr>
						<!-- ���� ��뷮 -->
						<td colspan="2"><input type="button" class=""
							style="height: 50px; width: 100%;" value="1.���� ��뷮"
							onclick="butClick('div1');return false;"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">

							<div class="list-group listBox01" id="div1"
								style="display: none;">

								<table align="center" width=100%>
									<tr>
										<td colspan="4" height=10px class="titleText">������뷮 ����</td>
									</tr>
									<tr>
										<td width=20%>ü���Է�</td>
										<td colspan="2">
											<div id="test">
												<input id="ex1" data-slider-id='ex1Slider' type="text"
													data-slider-min="5" data-slider-max="150"
													data-slider-step="1" data-slider-value="60" "/>
											</div>
										</td>
										<td align="right" width=20%><input type="text"
											style="width: 30px;" id="weightValue" value="60"> Kg</td>
									</tr>
									<tr>
										<td colspan="4">
											<div class="listBox02" >
												<table style="text-align: center; vertical-align: middle;" width="100%" >
												<font size=2pt>
													<tr>
														<td colspan="2">ġ���</td>
														<td style="" id="progressBar">
															<div class="progress2">
																<div class="progress-bar2" id="progressRateBar1"
																	role="progressbar" aria-valuenow="0.6" aria-valuemin="0"
																	aria-valuemax="100" style="width: 0.6%;">
																	<!-- 													     <span id="progressRate1">13</span>%</div> -->
																</div>
														</td>
														<td align="right" id="valueTd" width="100px"><span id="value1">
																500 </span>g</td>
													</tr>

													<tr>
														<td colspan="2">��������ǰ</td>
														<td style="" id="progressBar">
															<div class="progress2">
																<div class="progress-bar2" role="progressbar"
																	aria-valuenow="1" aria-valuemin="0"
																	aria-valuemax="100" style="width: 1%;">
																	<!-- 													     <span id="progressRate2">20</span>%</div> -->
																</div>
														</td>
														<td align="right"><span id="value2"> 750 </span>g</td>
													</tr>
													<tr>
														<td colspan="2"><font size=2pt>�ݶ�����̽�</font></td>
														<td style="" id="progressBar">
															<div class="progress2">
																<div class="progress-bar2" role="progressbar"
																	aria-valuenow="20" aria-valuemin="0"
																	aria-valuemax="100" style="width: 20%;">
																	<!-- 													     <span id="progressRate3">40</span>%</div> -->
																</div>
														</td>
														<td align="right"><span id="value3"> 15000 </span>g</td>
													</tr>
													
													<tr>
														<td colspan="2">������</td>
														<td style="" id="progressBar">
															<div class="progress2">
																<div class="progress-bar2" role="progressbar"
																	aria-valuenow="2" aria-valuemin="0"
																	aria-valuemax="100" style="width: 2%;">
																	<!-- 													     <span id="progressRate3">40</span>%</div> -->
																</div>
														</td>
														<td align="right"><span id="value4"> 1500 </span>g</td>
													</tr>
													
													<tr>
														<td colspan="2"><font size=2pt>�˷ο����� �� �ǰ���ɽ�ǰ</font></td>
														<td style="" id="progressBar">
															<div class="progress2">
																<div class="progress-bar2" role="progressbar"
																	aria-valuenow="2" aria-valuemin="0"
																	aria-valuemax="100" style="width: 2%;">
																	<!-- 													     <span id="progressRate3">40</span>%</div> -->
																</div>
														</td>
														<td align="right"><span id="value5"> 1500 </span>g</td>
													</tr>
													
													<tr>
														<td colspan="2">������ǽ�</td>
														<td style="" id="progressBar">
															<div class="progress2">
																<div class="progress-bar2" role="progressbar"
																	aria-valuenow="2" aria-valuemin="0"
																	aria-valuemax="100" style="width: 2%;">
																	<!-- 													     <span id="progressRate3">40</span>%</div> -->
																</div>
														</td>
														<td align="right"><span id="value6"> 1500 </span>g</td>
													</tr>
													
													<tr>
														<td colspan="2">���</td>
														<td style="" id="progressBar">
															<div class="progress2">
																<div class="progress-bar2" role="progressbar"
																	aria-valuenow="5" aria-valuemin="0"
																	aria-valuemax="100" style="width: 5%;">
																	<!-- 													     <span id="progressRate3">40</span>%</div> -->
																</div>
														</td>
														<td align="right"><span id="value7"> 3750 </span>g</td>
													</tr>
													
													<tr>
														<td colspan="2"><font size=2pt>�������Ƿ�,��ø</font></td>
														<td style="" id="progressBar">
															<div class="progress2">
																<div class="progress-bar2" role="progressbar"
																	aria-valuenow="4" aria-valuemin="0"
																	aria-valuemax="100" style="width: 4%;">
																	<!-- 													     <span id="progressRate3">40</span>%</div> -->
																</div>
														</td>
														<td align="right"><span id="value8"> 3000 </span>g</td>
													</tr>
													
													<tr>
														<td colspan="2">��������</td>
														<td style="" id="progressBar">
															<div class="progress2">
																<div class="progress-bar2" role="progressbar"
																	aria-valuenow="4" aria-valuemin="0"
																	aria-valuemax="100" style="width: 4%;">
																	<!-- 													     <span id="progressRate3">40</span>%</div> -->
																</div>
														</td>
														<td align="right"><span id="value9"> 3000 </span>g</td>
													</tr>
													
													<tr>
														<td colspan="2">��ȿ�����</td>
														<td style="" id="progressBar">
															<div class="progress2">
																<div class="progress-bar2" role="progressbar"
																	aria-valuenow="40" aria-valuemin="0"
																	aria-valuemax="100" style="width: 40%;">
																	<!-- 													     <span id="progressRate3">40</span>%</div> -->
																</div>
														</td>
														<td align="right"><span id="value10"> 30000 </span>g</td>
													</tr>
													
													<tr>
														<td colspan="2">������</td>
														<td style="" id="progressBar">
															<div class="progress2">
																<div class="progress-bar2" role="progressbar"
																	aria-valuenow="10" aria-valuemin="0"
																	aria-valuemax="100" style="width: 10%;">
																	<!-- 													     <span id="progressRate3">40</span>%</div> -->
																</div>
														</td>
														<td align="right"><span id="value11"> 7500 </span>g</td>
													</tr>
													
													<tr>
														<td colspan="2">������</td>
														<td style="" id="progressBar">
															<div class="progress2">
																<div class="progress-bar2" role="progressbar"
																	aria-valuenow="2" aria-valuemin="0"
																	aria-valuemax="100" style="width: 2%;">
																	<!-- 													     <span id="progressRate3">40</span>%</div> -->
																</div>
														</td>
														<td align="right"><span id="value12"> 1500 </span>g</td>
													</tr>
													
													<tr>
														<td colspan="2"><font size=2pt>�����渶����</font></td>
														<td style="" id="progressBar">
															<div class="progress2">
																<div class="progress-bar2" role="progressbar"
																	aria-valuenow="1" aria-valuemin="0"
																	aria-valuemax="100" style="width: 1%;">
																	<!-- 													     <span id="progressRate3">40</span>%</div> -->
																</div>
														</td>
														<td align="right"><span id="value13"> 750 </span>g</td>
													</tr>
													
													<tr>
														<td colspan="2">�������ǰ</td>
														<td style="" id="progressBar">
															<div class="progress2">
																<div class="progress-bar2" role="progressbar"
																	aria-valuenow="2" aria-valuemin="0"
																	aria-valuemax="100" style="width: 2%;">
																	<!-- 													     <span id="progressRate3">40</span>%</div> -->
																</div>
														</td>
														<td align="right"><span id="value14"> 1500 </span>g</td>
													</tr>
													
													<tr>
														<td colspan="2"><font size=2pt>��ŷ�����ǰ</font></td>
														<td style="" id="progressBar">
															<div class="progress2">
																<div class="progress-bar2" role="progressbar"
																	aria-valuenow="2" aria-valuemin="0"
																	aria-valuemax="100" style="width: 2%;">
																	<!-- 													     <span id="progressRate3">40</span>%</div> -->
																</div>
														</td>
														<td align="right"><span id="value15"> 1500 </span>g</td>
													</tr>
													
													
													<tr>
														<td height=40px align="left" colspan="2"> 
														<!-- Button trigger modal -->
															<button type="button" class="btn btn-primary btn-xs"
																data-toggle="modal" data-target="#myModal2">
																������ ��ȸ</button>
														</td>
														<td align="right" colspan="2">
															<!-- Button trigger modal -->
															<button type="button" class="btn btn-primary btn-xs"
																data-toggle="modal" data-target="#myModal">
																�ڼ�������</button>
														</td>
													</tr>
													
												</table>
											</div>



										</td>
									</tr>
									
									<tr>
										<td colspan="2" height=10px></td>
									</tr>
					

									<tr >
										<td colspan="4"><div class="titleText titleTextLine">�������</div></td>
									</tr>
									<tr>
										<td colspan="4"><div id="Span1">
												&nbsp�Ҹ������ ��ǰ���� �������� ���Ǵ� õ�� ����ȭ�չ��̴�. ������(Sorbus aucuparia)�� ������
												���ſ��� ó�� �и��Ǿ��� �̿� ...
												<span onclick="morebutClick('Span1','noneSpan1');return false;"><font color=blue> <u>������</u></font></span>
											</div>
											<div id="noneSpan1" style="display: none">
												&nbsp�Ҹ������ ��ǰ���� �������� ���Ǵ� õ�� ����ȭ�չ��̴�. ������(Sorbus aucuparia)�� ������
												���ſ��� ó�� �и��Ǿ��� �̿� ���� �̸��� ��������. �Ҹ����� �Ҹ���� ��Ʈ��, �Ҹ���� Į�� �� �Ҹ����
												Į���� ���� ���� ������ ���� �� ��������� ���� �������� ���Ǵ� �̻�������������(antimicrobial
												agent)�� ������, ȿ��, ���շ��� ������ �����ش�. �Ϲ������� ������ ���� �� ��� ������ �� ���º���
												��ȣ�ȴ�.
												<span onclick="morebutClick('Span1','noneSpan1');return false;"><font color=blue> <u>���߱�</u></font></span>
											</div></td>
									</tr>
								</table>
							</div>
						</td>
					</tr>
									<tr>
										<td colspan="2" height=10px value="��ư����"></td>
									</tr>
					<tr>
						<!-- ������ ����-->
						<td colspan="2"><input type="button" class="" style="height: 50px; width: 100%;" value="2.������ ����" onclick="butClick('div2');return false;"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<div class="list-group listBox01" id="div2" style="display: none;">
								<img src="images/grade1.png">
								<div  class="listBox02" >

								<table width="100%">
									<tr>
										<td colspan="4" height=10px;></td>
									</tr>
									<tr>
										<td colspan="4"><div class="titleText titleTextBox">������ ���(���谪)</div></td>
									</tr>
									<tr>
										<td>������ :</td>
										<td><select name="������" style="width:80px;">
												<option value="Rat">Rat</option>
												<option value="Mouse">Mouse</option>
												<option value="Rabbit">Rabbit</option>
												<option value="fethead minnow">fethead minnow</option>
												<option value="Daphnia magna">Daphnia magna</option>
												<option value="T.pyriformis">T.pyriformis</option>
										</select></td>
										<td>&nbsp;������� :</td>
										<td><select name="���">
												<option value="�Ǻ�">�Ǻ�</option>
												<option value="����">����</option>
												<option value="�汸">�汸</option>
												<option value="����">����</option>
										</select></td>
									</tr>
									<tr>
										<td>������ :</td>
										<td><select name="������" style="width:80px;">
												<option value="LD">LD</option>
												<option value="LD50">LD50</option>
												<option value="LC50">LC50</option>
												<option value="IGC50">IGC50</option>
										</select></td>
										<td>&nbsp;������ġ :</td>
										<td>2,820 mg/kg</td>
									</tr>
									<tr>
										<td colspan="4" height=10px></td>
									</tr>

								</table>
								</div>
								<div style="margin-top:30px;"></div>
								<div class="listBox02"> 
								<table width="100%" >
									<tr>
										<td colspan="4" height=10px;></td>
									</tr>
									<tr>
										<td colspan="4"><div class="titleText titleTextBox">������ ���(������)</div></td>
									</tr>
									<tr>
										<td>������ :</td>
										<td><select name="������" style="width:80px;">
												<option value="Rat">Rat</option>
												<option value="Mouse">Mouse</option>
												<option value="Rabbit">Rabbit</option>
												<option value="fethead minnow">fethead minnow</option>
												<option value="Daphnia magna">Daphnia magna</option>
												<option value="T.pyriformis">T.pyriformis</option>
										</select></td>
										<td>&nbsp;������� :</td>
										<td><select name="���">
												<option value="�汸">�汸</option>
												<option value="�Ǻ�">�Ǻ�</option>
												<option value="����">����</option>
												<option value="����">����</option>
										</select></td>
									</tr>
									<tr>
										<td>������ :</td>
										<td><select name="������" style="width:80px;">
												<option value="LD50">LD50</option>
												<option value="LC50">LC50</option>
												<option value="IGC50">IGC50</option>
												<option value="LD">LD</option>
										</select></td>
										<td>&nbsp;������ġ :</td>
										<td>5,651 mg/L</td>
									</tr>
									<tr>
										<td colspan="4" height=10px value="��ư����"></td>
										
									</tr>
									
									<tr>
										<td colspan="4" height=10px align="right"><font size=2pt>�� �������� <B>T.E.S.T.</B>
											���α׷��� ���� ���� �Ǿ���. <br>
											</font>
										</td>
									</tr>
								</table>
								</div>
								<font size=3.5pt>
								������ ������ ���� ���� ���� ���� ��뷮��<br>
											25 mg/kg��bw/day �Դϴ�.
											</font>
								<table width="100%" >
									<tr>
										<td colspan="4" height=10px;></td>
									</tr>
									<tr style="height: 40px; vertical-align: bottom;">
										<td><div class="titleText titleTextLine">�������</div></td>
										<td align="right" colspan="3"></td>
									</tr>
									<tr style="">
										<td colspan="4"><div id="Span2">&nbsp�Ҹ������ LD50 ���� 10~7.4g/kg���� �����Ǿ�����, �� ���� �ſ� ���� ���̴�....<span onclick="morebutClick('Span2','noneSpan2');return false;"><font color=blue> <u>������</u></font></span></div>
										<div id="noneSpan2" style="display:none">&nbsp�Ҹ������ LD50 ���� 10~7.4g/kg���� �����Ǿ�����, �� ���� �ſ� ���� ���̴�. ���� �Ҹ������ ������ ��ǰ�� �����ص� ���輺�� ���� ������ ��������.[1] ������, �Ҹ������ ������ ���� ġ���� �� ȭ��ǰ�� ��� ��, �Ǻ� �� ȣ��⿡ �ڱ����̸�, �ݺ������� �Ǵ� ��Ⱓ �����ϸ� �Ǻ� ������ �߻��� �� �ִ�.[2] 
										<br> ��ó : [1] ��Ű�ǵ�� <br>[2] ��ǰ�Ǿ�ǰ����ó <span onclick="morebutClick('Span2','noneSpan2');return false;"><font color=blue> <u>���߱�</u></font></span></div></td> 
									</tr>
								</table>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2" height=10px value="��ư����"></td>
					</tr>
					<tr>
						<!-- �߰�����-->
						<td colspan="2"><input type="button" class=""
							style="height: 50px; width: 100%;" value="3.�߰� ����"
							onclick="butClick('div3');return false;"></td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="list-group listBox01" id="div3" style="display: none;">
								
								<table width="100%" class="mytable">
									
									<tr>
										<td colspan="2" class="titleText titleTextLine">��������</td>
									</tr>
									<tr>
										<td width=40% style="background: #dcdcdc">������</td>
										<td width=60%>�Ҹ���� (Sorbic Acid)</td>
									</tr>
									<tr>
										<td style="background: #dcdcdc">CasNo</td>
										<td>110-44-1</td>
									</tr>
									<tr>
										<td style="background: #dcdcdc">���ڽ�</td>
										<td>C<sub>6</sub>H<sub>8</sub>O<sub>2</sub></td>
									</tr>
									<tr>
										<td style="background: #dcdcdc">���ڷ�</td>
										<td>112.13</td>
									</tr>
									<tr>
										<td style="background: #dcdcdc">�е�</td>
										<td>1.347 g/cm3</td>
									</tr>
									<tr>
										<td style="background: #dcdcdc">�꼺��</td>
										<td>4.76</td>
									</tr>
									<tr>
										<td style="background: #dcdcdc">�������չ�ȣ</td>
										<td>203-768-7</td>
									</tr>
									<tr>
										<td style="background: #dcdcdc">CCRIS��ȣ</td>
										<td>5748</td>
									</tr>
								</table>

								<table width="100%" class="">
									<tr>
										<td height=10px;></td>
									</tr>
									<tr>
										<td class="titleText titleTextLine">�뵵</td>
									</tr>
									<tr>
										<td>
											<li>������ �� ȿ�� ������</li>
											<li>��ǰ(Ư�� ġ��)�� ��������</li>
											<li>������</li>
											<li>���� ���� ���� Ư�� ���</li>
											<li>������ �� ��Ȱ���� �߰�����</li>
										</td>
									</tr>

									<tr
										style="background-color: #ffffff; height: 40px; vertical-align: bottom;">
										<td><div class="titleText titleTextLine">��Ÿ����</div></td>
									</tr>
									<tr style="background-color: #ffffff">
										<td><div id="Span3">��������Ʈ �Ǹ� �ݷ����� ���ġ����ջ�� �� �Ҹ���ꡤ�����꿰, �����ء�-���ϸ���...<span onclick="morebutClick('Span3','noneSpan3');return false;"><font color=blue> <u>������</u></font></span></div></td>

									</tr>

									<tr>
										<td><div id="noneSpan3" style="display: none;">
										��������Ʈ �Ǹ� �ݷ����� ���ġ����ջ�� �� �Ҹ���ꡤ�����꿰, �����ء�-���ϸ���<br/>
										��꺸��ȯ�濬������ ��������Ʈ���� �Ǹ����� �ݷ����� ���ķ� �� ���ջ�� ��ǰ�� �˻��� ���, 
										���ķ� �� ���ջ�Ḧ ���� �ݷ������� �Ҹ���� �� �����꿰 ���밡 	������ ������ �����ȴ١��� ������.<br>
										<a href="http://www.dailyvet.co.kr/news/academy/49240" target="_blank">��ũ:�������</a><span onclick="morebutClick('Span3','noneSpan3');return false;"><font color=blue> <u>���߱�</u></font></span></div></td>
									</tr>

								</table>







							</div>
						</td>
					</tr>
									<tr>
										<td colspan="2" height=10px value="��ư����"></td>
									</tr>
					
					<tr>
						<!-- �����-->
						<td colspan="2"><input type="button"
							style="height: 50px; width: 100%" value="4.�����"
							onclick="butClick('div4');return false;"></td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="list-group listBox01" id="div4" style="display: none;">
								
								<div class="listBox02">								
									<div class="titleText" >1. ���� ��뷮</div>
										<li>���� ���� ��뷮(ADI)</li>	
										<div style="padding-left:10px;">
										�ΰ��� ����� ���� �����ϴ��� ���ذ� �������� �ʴ´ٰ� �����Ǵ� ȭ�й����� 1�� ���뷮(mg/kg �� bw/day)�� �ǹ��ϰ� ��ǰ÷����, ��� � ���Ͽ� �� ����Ѵ�.<br>
<info value="http://terms.naver.com/entry.nhn?docId=296210&cid=42412&categoryId=42412"/>��ó : ���̹� ��ǰ���б�������</div>
								</div>
								

								
								<div class="listBox02">								
									<div class="titleText" >2. ������ ����</div>
										<li>LD50(�ݼ� ġ�緮)</li>	
										<div style="padding-left:10px;">
										�� ���赿���� ���������� ������ �� �� ���赿���� ������ �װ� �Ǵ� ���� ���Ѵ�.
���������� ���, �ش� �๰�� LD50�� ��Ÿ�� ���� ü�� kg�� mg���� ��Ÿ����. ���� ��� ����ƾ�� ��� LD50�� 50 mg/kg�̸�, �ƽ��Ǹ��� ��� LD50�� 200 mg/kg�̴�. 
��ü�� ��ġ�� ���� ���赿���� ���蹰���� �� �� �����ϰ� 2���� ������ ������� ������ �ݼ�ġ�緮�� ����Ѵ�. 
LD50�� ����ȭ�й����������� �������� Ư�������� ������������ �̿�Ǵµ�, 
�汸������ �̿��� ��ġ�� ���迡�� �ش� �๰�� LD50�� 300��/�������̸� ������, 
15��/�� �����̸� Ư���������� �����Ѵ�. <br> 
��ó : ��Ű�ǵ��<info value="https://ko.wikipedia.org/wiki/�ݼ�_ġ�緮"/></div>
								</div>
								
								
								<div class="listBox02">								
									<div class="titleText" >3. �߰�����</div>
										<li>CAS Number(CAS ��Ϲ�ȣ)</li>	
										<div style="padding-left:10px;">
										�˷��� ��� ȭ�չ�, ����ü ���� ����ϴ� ��ȣ�̴�. �̱� ȭ��ȸ���� ��ϴ� �����̸�, ��� ȭ�� ������ �ߺ� ���� ã�� �� �ֵ��� �Ѵ�. <br>
<info value="https://ko.wikipedia.org/wiki/CAS_��Ϲ�ȣ"></info>��ó:��Ű�ǵ��</div>
								</div>


							</div>
						</td>
					</tr>


				</table>

			</div>
		</div>
	</div>

	<!-- ��ü DIV -->

	<!-- �ڼ������� Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						[<%=s%>] �� ADI
					</h4>
				</div>
				<div class="modal-body">
					25 mg/kg��bw/day<br> (��ó : JECFA )<br> �׸�<br> *���� ��ǰ��
					����ϴ� ÷������ <br> ���� �԰� ���� �ξ� ���� ��� �˴ϴ�.<br>
				</div>
				<div class="modal-footer">
					<div align="left">ADI : ���� ���� ��뷮</div> 
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	<!-- ��ǰ�� Modal -->
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						[<%=s%>] �� ������
					</h4>
				</div>
				<div class="modal-body">
					- �ڿ�ġ��, ����ġ�� : 3.0 g/kg ����<br>
					- ��������ǰ : 2.0 g/kg ����<br>
					- �ݶ�����̽� : 0.1 g/kg ����<br>
					- ������ : 1.0 g/kg ����<br>
					- �˷ο����� �� �ǰ���ɽ�ǰ : 1.0 g/kg ����<br>
					- ����� ���� : 1.0 g/kg ����<br>
					- ��� : 0.4 g/kg ����<br>
					- �������Ƿ�, ��ø : 0.5 g/kg ����<br>
					- �������� : 0.5 g/kg ����<br>
					- ��ȿ����� : 0.05 g/kg ����<br>
					- ������ : 0.2 g/kg ����<br>
					- ������ : 1.0 g/kg ����<br>
					- �����渶���� : 2.0 g/kg ����<br>
					- �������ǰ : 1.0 g/kg ����<br>
					- ��ŷ�����ǰ : 1.0 g/kg ����<br>
					
					
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>