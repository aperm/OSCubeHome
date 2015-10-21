<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*, java.text.*"%>
<jsp:useBean id="searchList2" class="scs.SearchList"/>
<% 
	String keyword="";
	String casNo="";
	if (request.getParameter("chemNameKor") != null) {
		keyword = request.getParameter("chemNameKor");
	}
	if (request.getParameter("cas") != null) {
		casNo= request.getParameter("cas");
	}
	
	searchList2.countUpdate(casNo);
		
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
		$('html, body').animate({
			scrollTop : 0
		}, 0);
		$("#divAll").load("scs_searchResult.jsp",{chemNameKor:'<%=keyword%>'});
	});

	// Without JQuery
	var slider = new Slider('#ex1', {
		formatter : function(value) {
			// 			return '몸무게 : ' + value;
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
		$('html, body').animate({
			scrollTop : 0
		}, 0);
		var searchWord = $('#searchWord').val();
		$("#divAll").load("scs_searchResult.jsp", {chemNameKor : searchWord});

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
	$(function () {
	    $("#searchWord").keydown(function (key) {
	        if (key.keyCode == 13) {
	            searchBntClick();
	        }
	    });
	});
	function searchBntClick() {
		 var searchWord = $('#searchWord').val();
		 $("#divAll").load("scs_searchResult.jsp", {chemNameKor:searchWord});
		 
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

.titleTextLine {border-top:1px solid #d9d9d9; padding:30px 5px 15px; color:#666; margin-top:10px;line-height:10px;letter-spacing:-1px; text-shadow:0 0 0 !important; }


td {
  padding-top: 4px;
  padding-bottom: 4px;
}
</style>


<body>

	<!-- 	탑버튼 -->
	<div class="btn-group btnTop">
		<button type="button" class="btn btn-default btn-xs">
			<span class="glyphicon glyphicon-upload" aria-hidden="true"></span>
			UP
		</button>
	</div>


	<!-- 전체 DIV -->
	<div style="margin: auto;">
		<!-- 		상단 툴 + 검색바 -->
		<div>
			<!-- 	상단 홈바 -->
			<div id="topMenu"
				style="position: fixed; width: 100%; background-color: #ffffff; z-index: 100;">
				<table id="menuBarTable" width=100% style="text-align: center; align: center; vertical-align: middle;">
					<tr>
						<td width=20%><div class="pageBack">
								<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>BACK
							</div></td>
						<td width=60% style="padding-right: 5%; padding-left: 3%;">
						<img src="/images/logos/s2food.png" id="logoImgId" class="logoImg" onclick="imgClick();"></td>
						<td width=20%>MENU</td>
					</tr>
				</table>
				<!-- 		검색메뉴 -->
					<div id="searchBarDiv" style="background-color:#4ba9f5; vertical-align:middle;">
					<table id="searchBarTable" class="searchBarTable" align="center" width=95% height=56px
					style="text-align: center; align: center; vertical-align: middle; " >
					<tr>
						<td height=5px></td>
						<td></td>
					</tr>
					<tr>
						<!-- 검색바 -->

						<td width=70%><input type="text" id="searchWord"
							style="border-radius:2px 0px 0px 2px; height: 40px; width: 100%;" placeholder="  검색어를 입력하세요."
							value="<%=keyword %>"></td>
						<td width=30%><input type="button"
							style="border-radius:0px 2px 2px 0px; height: 40px; width: 100%;" value="검색"
							class="searchBut" onclick="searchBntClick();"></td>
							
					</tr>
					<tr>
						<td height=5px></td>
						<td></td> 
					</tr>
				</table>
				</div>
			</div>
			<br>
			<!-- 			아래내용 -->
			<div class="" id="contentDown">
				<table align="center" text-align="center" width=95% >
					<tr>
						<td colspan="2" height=10px></td>
					</tr>
					<tr>
						<!-- 섭취 허용량 -->
						<td colspan="2"><input type="button" class="scroll"
							style="height: 50px; width: 100%;" value="1.섭취 허용량"
							onclick="butClick('div1');return false;"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">

							<div class="list-group listBox01" id="div1"
								style="display: none;">

								<table align="center" width=100%>
									<tr>
										<td colspan="4" height=10px class="titleText">섭취허용량 산출</td>
									</tr>
									<tr>
										<td width=20%>체중입력</td>
										
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
										<td colspan="4" ><font size=2pt>체중 조절 시 제품군별 섭취허용량이 계산됩니다.</font></td>
									</tr>
									<tr>
										<td colspan="4">
											<div class="listBox02" >
												<table style="text-align: center; vertical-align: middle;" width="100%" >
												<font size=2pt>
													<tr>
														<td colspan="2">치즈류</td>
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
														<td colspan="2">식육가공품</td>
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
														<td colspan="2"><font size=2pt>콜라겐케이싱</font></td>
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
														<td colspan="2">젓갈류</td>
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
														<td colspan="2"><font size=2pt>알로에전잎 및 건강기능식품</font></td>
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
														<td colspan="2">농충과실습</td>
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
														<td colspan="2">잼류</td>
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
														<td colspan="2"><font size=2pt>건조과실류,케첩</font></td>
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
														<td colspan="2">식초절임</td>
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
														<td colspan="2">발효음료류</td>
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
														<td colspan="2">과실주</td>
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
														<td colspan="2">마가린</td>
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
														<td colspan="2"><font size=2pt>저지방마가린</font></td>
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
														<td colspan="2">당류가공품</td>
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
														<td colspan="2"><font size=2pt>향신료조제품</font></td>
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
														<td height=40px align="center" colspan="1"> 
														<!-- Button trigger modal -->
															<button type="button" class="btn btn-primary btn-sm"
																data-toggle="modal" data-target="#myModal2">
																사용기준</button>
														</td>
														<td align="right" colspan="3">
															<!-- Button trigger modal -->
															<button type="button" class="btn btn-primary btn-sm"
																data-toggle="modal" data-target="#myModal">
																산출방법</button>
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
										<td colspan="4"><div class="titleText titleTextLine">요약정보</div></td>
									</tr>
									<tr>
										<td colspan="4"><div id="Span1">
												&nbsp소르빈산은 식품에서 보존제로 사용되는 천연 유기화합물이다. 마가목(Sorbus aucuparia)의 덜익은
												열매에서 처음 분리되었고 이에 ...
												<span onclick="morebutClick('Span1','noneSpan1');return false;"><font color=blue> <u>더보기</u></font></span>
											</div>
											<div id="noneSpan1" style="display: none">
												&nbsp소르빈산은 식품에서 보존제로 사용되는 천연 유기화합물이다. 마가목(Sorbus aucuparia)의 덜익은
												열매에서 처음 분리되었고 이에 따라 이름이 지어졌다. 소르빈산과 소르빈산 나트륨, 소르빈산 칼륨 및 소르빈산
												칼슘과 같은 무기 염류는 음식 및 음료수에서 종종 보존제로 사용되는 미생물생육억제제(antimicrobial
												agent)로 곰팡이, 효모, 진균류의 성장을 막아준다. 일반적으로 염류는 물에 잘 녹기 때문에 산 형태보다
												선호된다.
												<span onclick="morebutClick('Span1','noneSpan1');return false;"><font color=blue> <u>감추기</u></font></span>
											</div></td>
									</tr>
								</table>
							</div>
						</td>
					</tr>
									<tr>
										<td colspan="2" height=10px value="버튼간격"></td>
									</tr>
					<tr>
						<!-- 안전성 정보-->
						<td colspan="2"><input type="button" class="" style="height: 50px; width: 100%;" value="2.안전성 정보" onclick="butClick('div2');return false;"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<div class="list-group listBox01" id="div2" style="display: none;">
								<div class="titleText" align="left">일일 섭취 허용량 등급</div>
									<div style="margin-top:10px; margin-bottom:10px;"><img src="images/grade1.png"></div>
									<div align="left" style="margin-top:10px; margin-bottom:10px;">
										<font size=4pt>
											안전성 정보로 부터 정한 일일 섭취 허용량은 <b><u>25 mg/kg·bw/day</u></b> 입니다.
										</font>
									</div>
								
								<div  class="listBox02" >

								<table width="100%">
									<tr>
										<td colspan="4"><div class="titleText titleTextBox">안전성 결과(실험값)</div></td>
									</tr>
									<tr>
										<td>동물종 :</td>
										<td><select name="동물종" style="width:80px;">
												<option value="Rat">Rat</option>
												<option value="Mouse">Mouse</option>
												<option value="Rabbit">Rabbit</option>
												<option value="fethead minnow">fethead minnow</option>
												<option value="Daphnia magna">Daphnia magna</option>
												<option value="T.pyriformis">T.pyriformis</option>
										</select></td>
										<td>&nbsp;투여경로 :</td>
										<td><select name="경로">
												<option value="피부">피부</option>
												<option value="복강">복강</option>
												<option value="경구">경구</option>
												<option value="피하">피하</option>
										</select></td>
									</tr>
									<tr>
										<td>종말점 :</td>
										<td><select name="종말점" style="width:80px;">
												<option value="LD">LD</option>
												<option value="LD50">LD50</option>
												<option value="LC50">LC50</option>
												<option value="IGC50">IGC50</option>
										</select></td>
										<td>&nbsp;독성수치 :</td>
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
										<td colspan="4"><div class="titleText titleTextBox">안전성 결과(예측값)</div></td>
									</tr>
									<tr>
										<td>동물종 :</td>
										<td><select name="동물종" style="width:80px;">
												<option value="Rat">Rat</option>
												<option value="Mouse">Mouse</option>
												<option value="Rabbit">Rabbit</option>
												<option value="fethead minnow">fethead minnow</option>
												<option value="Daphnia magna">Daphnia magna</option>
												<option value="T.pyriformis">T.pyriformis</option>
										</select></td>
										<td>&nbsp;투여경로 :</td>
										<td><select name="경로">
												<option value="경구">경구</option>
												<option value="피부">피부</option>
												<option value="복강">복강</option>
												<option value="피하">피하</option>
										</select></td>
									</tr>
									<tr>
										<td>종말점 :</td>
										<td><select name="종말점" style="width:80px;">
												<option value="LD50">LD50</option>
												<option value="LC50">LC50</option>
												<option value="IGC50">IGC50</option>
												<option value="LD">LD</option>
										</select></td>
										<td>&nbsp;독성수치 :</td>
										<td>5,651 mg/L</td>
									</tr>
									<tr>
										<td colspan="4" height=10px value="버튼간격"></td>
										
									</tr>
									
									<tr>
										<td colspan="4" height=10px align="right"><font size=2pt>위 예측값은 <B>T.E.S.T.</B>
											프로그램을 통해 예측 되었음. <br>
											</font>
										</td>
									</tr>
								</table>
								</div>
								
								<table width="100%" >
									<tr>
										<td colspan="4" height=10px;></td>
									</tr>
									<tr style="height: 40px; vertical-align: bottom;">
										<td><div class="titleText titleTextLine">요약정보</div></td>
										<td align="right" colspan="3"></td>
									</tr>
									<tr style="">
										<td colspan="4"><div id="Span2">&nbsp소르빈산의 LD50 값은 10~7.4g/kg으로 추측되어지며, 이 값은 매우 높은 값이다....<span onclick="morebutClick('Span2','noneSpan2');return false;"><font color=blue> <u>더보기</u></font></span></div>
										<div id="noneSpan2" style="display:none">&nbsp소르빈산의 LD50 값은 10~7.4g/kg으로 추측되어지며, 이 값은 매우 높은 값이다. 따라서 소르빈산을 함유한 식품을 섭취해도 위험성은 없는 것으로 여겨진다.[1] 하지만, 소르빈산이 함유된 국소 치료제 및 화장품의 경우 눈, 피부 및 호흡기에 자극적이며, 반복적으로 또는 장기간 접촉하면 피부 감작이 발생할 수 있다.[2] 
										<br> 출처 : [1] 위키피디아 <br>[2] 식품의약품안전처 <span onclick="morebutClick('Span2','noneSpan2');return false;"><font color=blue> <u>감추기</u></font></span></div></td> 
									</tr>
								</table>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2" height=10px value="버튼간격"></td>
					</tr>
					<tr>
						<!-- 추가정보-->
						<td colspan="2"><input type="button" class=""
							style="height: 50px; width: 100%;" value="3.추가 정보"
							onclick="butClick('div3');return false;"></td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="list-group listBox01" id="div3" style="display: none;">
								
								<table width="100%" class="mytable" style="text-align:center">
									
									<tr>
										<td colspan="2" class="titleText titleTextLine">물질정보</td>
									</tr>
									<tr>
										<td width=40% style="background: #dcdcdc">물질명</td>
										<td width=60%>소르빈산 (Sorbic Acid)</td>
									</tr>
									<tr>
										<td style="background: #dcdcdc">CasNo</td>
										<td>110-44-1</td>
									</tr>
									<tr>
										<td style="background: #dcdcdc">분자식</td>
										<td>C<sub>6</sub>H<sub>8</sub>O<sub>2</sub></td>
									</tr>
									<tr>
										<td style="background: #dcdcdc">분자량</td>
										<td>112.13</td>
									</tr>
									<tr>
										<td style="background: #dcdcdc">밀도</td>
										<td>1.347 g/cm3</td>
									</tr>
									<tr>
										<td style="background: #dcdcdc">산성도</td>
										<td>4.76</td>
									</tr>
									<tr>
										<td style="background: #dcdcdc">유럽연합번호</td>
										<td>203-768-7</td>
									</tr>
									<tr>
										<td style="background: #dcdcdc">CCRIS번호</td>
										<td>5748</td>
									</tr>
								</table>

								<table width="100%" class="">
									<tr>
										<td height=10px;></td>
									</tr>
									<tr>
										<td class="titleText titleTextLine">용도</td>
									</tr>
									<tr>
										<td>
											<li>곰팡이 및 효모 억제제</li>
											<li>식품(특히 치즈)의 정진균제</li>
											<li>보존제</li>
											<li>저온 고무의 제분 특성 향상</li>
											<li>가소제 및 윤활제의 중간물질</li>
										</td>
									</tr>

									<tr
										style="height: 40px; vertical-align: bottom;">
										<td><div class="titleText titleTextLine">기타정보</div></td>
									</tr>
									<tr style="">
										<td><div id="Span3">“대형마트 판매 반려동물 간식·배합사료 내 소르빈산·아질산염, 안전해”-데일리벳...<span onclick="morebutClick('Span3','noneSpan3');return false;"><font color=blue> <u>더보기</u></font></span></div></td>

									</tr>

									<tr>
										<td><div id="noneSpan3" style="display: none;">
										“대형마트 판매 반려동물 간식·배합사료 내 소르빈산·아질산염, 안전해”-데일리벳<br/>
										울산보건환경연구원이 “대형마트에서 판매중인 반려동물 간식류 및 배합사료 제품을 검사한 결과, 
										간식류 및 배합사료를 통한 반려동물의 소르빈산 및 아질산염 섭취가 	안전한 것으로 생각된다”고 밝혔다.<br>
										<a href="http://www.dailyvet.co.kr/news/academy/49240" target="_blank">링크:원문기사</a><span onclick="morebutClick('Span3','noneSpan3');return false;"><font color=blue> <u>감추기</u></font></span></div></td>
									</tr>

								</table>







							</div>
						</td>
					</tr>
									<tr>
										<td colspan="2" height=10px value="버튼간격"></td>
									</tr>
					
					<tr>
						<!-- 용어집-->
						<td colspan="2"><input type="button" class="scroll"
							style="height: 50px; width: 100%" value="4.용어집"
							onclick="butClick('div4');return false;"></td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="list-group listBox01" id="div4" style="display: none;">
								
								<div class="listBox02">								
									<div class="titleText" >1. 섭취 허용량</div>
										<li><b>일일 섭취 허용량(ADI)</b></li>	
										<div style="padding-left:10px;">
										&nbsp;인간이 한평생 매일 섭취하더라도 장해가 인정되지 않는다고 생각되는 화학물질의 1일 섭취량(mg/kg · bw/day)을 의미하고 식품첨가물, 농약 등에 대하여 잘 사용한다.<br>
<info value="http://terms.naver.com/entry.nhn?docId=296210&cid=42412&categoryId=42412"/>출처 : 네이버 식품과학기술대사전</div>
								</div>
								

								
								<div class="listBox02">								
									<div class="titleText" >2. 안전성 정보</div>
										<li><b>LD50(반수 치사량)</b></li>	
										<div style="padding-left:10px;">
										&nbsp;피 실험동물에 실험대상물질을 투여할 때 피 실험동물의 절반이 죽게 되는 양을 말한다.
독성물질의 경우, 해당 약물의 LD50을 나타낼 때는 체중 kg당 mg으로 나타낸다. 예를 들어 니코틴의 경우 LD50은 50 mg/kg이며, 아스피린의 경우 LD50은 200 mg/kg이다. 
대체로 설치류 등의 시험동물에 시험물질을 한 번 투여하고 2주일 동안의 사망률을 관찰해 반수치사량을 계산한다. 
LD50은 유해화학물질관리법의 유독물과 특정유독물 지정기준으로 이용되는데, 
경구투여를 이용한 설치류 실험에서 해당 약물의 LD50이 300㎎/㎏이하이면 유독물, 
15㎎/㎏ 이하이면 특정유독물로 지정한다. <br> 
출처 : 위키피디아<info value="https://ko.wikipedia.org/wiki/반수_치사량"/></div>
								</div>
								
								
								<div class="listBox02">								
									<div class="titleText" >3. 추가정보</div>
										<li><B>CAS Number(CAS 등록번호)</B></li>	
										<div style="padding-left:10px;">
										&nbsp;알려진 모든 화합물, 중합체 등을 기록하는 번호이다. 미국 화학회에서 운영하는 서비스이며, 모든 화학 물질을 중복 없이 찾을 수 있도록 한다. <br>
<info value="https://ko.wikipedia.org/wiki/CAS_등록번호"></info>출처:위키피디아</div>
								</div>


							</div>
						</td>
					</tr>


				</table>

			</div>
		</div>
	</div>

	<!-- 전체 DIV -->

	<!-- 자세히보기 Modal -->
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
						소르빈산 의 섭취 허용량 산출
					</h4>
				</div>
				<div class="modal-body">
				<table cellspacing="0" border="1" style="border-collapse:collapse; border:0px gray solid;text-align:center;" >
					
					<tr>
						<td colspan="2">예시) 체중 60 kg 인 사람의 소르빈산의 섭취 허용량 산출 방법
						</td>
					</tr>
					<tr>
						<td width=65px>단계 1</td>
						<td>일일 섭취 허용량 <br>-> 25 mg/kg (출처 : JECFA)</td>
					</tr>
					<tr>
						<td>단계 2</td>
						<td>체중 반영 일일 섭취 허용량<br> -> 1.5 g</td>
					</tr>
					<tr>
						<td>단계 3</td>
						<td>소르빈산의 사용 규격<br>
						치즈류 -> 3.0g/kg 이하</td>
					</tr>
					<tr>
						<td>단계 4</td>
						<td>각 제품군의 섭취 허용량<br>
						치즈류 -> 500g 이하</td>
					</tr>
					<tr>
						<td colspan="2"> <font size=3pt>*실제 식품에 사용하는 첨가물은 <br>
						 기준 규격 보다 훨씬 낮게 사용 됩니다.<br></font>
						</td>
					</tr>
					 
					 </table>
				</div>
				<div class="modal-footer">
					<div align="right"> <button type="button" class="btn btn-default" data-dismiss="modal">Close</button></div> 
					
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	<!-- 식품군 Modal -->
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
						소르빈산 의 사용기준
					</h4>
				</div>
				<div class="modal-body">
					<li>자연치즈, 가공치즈 : 3.0 g/kg 이하</li>
					<li>식육가공품: 2.0 g/kg 이하</li>
					<li>콜라겐케이싱: 0.1 g/kg 이하</li>
					<li>젓갈류: 1.0 g/kg 이하</li>
					<li>알로에전잎 및 건강기능식품: 1.0 g/kg 이하</li>
					<li>농축과실즙: 1.0 g/kg 이하</li>
					<li>잼류: 0.4 g/kg 이하</li>
					<li>건조과실류, 케첩: 0.5 g/kg 이하</li>
					<li>식초절임: 0.5 g/kg 이하</li>
					<li>발효음료류: 0.05 g/kg 이하</li>
					<li>과실주: 0.2 g/kg 이하</li>
					<li>마가린: 1.0 g/kg 이하</li>
					<li>저지방마가린: 2.0 g/kg 이하</li>
					<li>당류가공품: 1.0 g/kg 이하</li>
					<li>향신료조제품: 1.0 g/kg 이하</li>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>