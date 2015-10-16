<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*, java.text.*"%>
<%
	String s = request.getParameter("param");
	System.out.println("resultView");
%>

<script type="text/javascript">
	
	$('.pageBack').click(function() {
		$("#divAll").load("scs_searchResult.jsp",{param:'<%=s%>'});
	});

	// Without JQuery
	var slider = new Slider('#ex1', {
		formatter : function(value) {
			return 'Current value: ' + value;
		}
	});

	$("#ex1").on("slide", function(slideEvt) {
// 		$("#ex6SliderVal").text(slideEvt.value);

		$("#weightValue").attr('value',slideEvt.value);
		
		

		// 		 몸무게 * ADI (일일섭취) / 기준치
		// 		치즈 
		$("#value1").text((slideEvt.value * 25 / 3).toFixed(1));
		// 		식육
		$("#value2").text((slideEvt.value * 25 / 2).toFixed(1));
		// 		젓갈
		$("#value3").text((slideEvt.value * 25 / 1).toFixed(1));

	});
	
	function searchBntClick() {
		 var searchWord = $('#searchWord').val();
		 $("#divAll").load("scs_searchResult.jsp", {param:searchWord});
		 
	}
	function keydownFun() {
		$("#value1").text((slideEvt.value * 25 / 3).toFixed(1));
		// 		식육
		$("#value2").text((slideEvt.value * 25 / 2).toFixed(1));
		// 		젓갈
		$("#value3").text((slideEvt.value * 25 / 1).toFixed(1));

		 
	}

</script>



<style type="text/css">

 
.mytable { border-collapse:collapse; }  
.mytable th, .mytable td { border:1px solid black; }
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
				<table width=100%
					style="text-align: center; align: center; vertical-align: middle; height: 50px;">
					<tr>
						<td width=20%><div class="pageBack">
								<span class="glyphicon glyphicon-chevron-left"
									aria-hidden="true"></span>BACK
							</div></td>
						<td width=60%><img src="/images/logos/s2food.png" width=100px
							onclick="imgClick();"></td>
						<td width=20%>메뉴자리</td>
					</tr>
				</table>
				<!-- 		검색메뉴 -->
				<div id="searchBarDiv"
					style="background-color: #4ba9f5; vertical-align: middle;">
					<table align="center" width=95%
						style="text-align: center; align: center; vertical-align: middle; height: 40px;">
						<tr>
							<td height=5px></td>
							<td></td>
						</tr>
						<tr>
							<!-- 검색바 -->

							<td width=70%><input type="text" id="searchWord"
								style="border-radius: 10px 0px 0px 10px; height: 40px; width: 100%;"
								placeholder="  검색어를 입력하세요." value="<%=s%>"></td>
							<td width=30%><input type="button" class="searchBnt" onclick="searchBntClick();"
								style="border-radius: 0px 10px 10px 0px; height: 40px; width: 100%;"
								value="검색" ></td>

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
			<div class="" style="margin-top: 100px;">
				<table align="center" text-align="center" width=95%>
					<tr>
						<td colspan="2" style="height: 10px;"></td>
					</tr>
					<tr>
						<!-- 섭취 허용량 -->
						<td colspan="2"><input type="button"
							style="height: 50px; width: 100%;" value="1.섭취 허용량"
							onclick="butClick('div1');return false;"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
						
							<div class="list-group" id="div1" style="display: none;">
								
								<table align="center" width=100%>
									<tr>
										<td colspan="4" height=10px></td>
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
										<td align="right" width=20%><input type="text" style="width:30px;"id="weightValue" value="" onkeydown="keydownFun();">Kg</td>
									</tr>
									
									<tr style="background-color:#e0ffff">
										<td colspan="2">치즈류</td>
										<td></td>
										<td align="right"><span id="value1"> 500 </span>g</td>
									</tr>

									<tr style="background-color:#e0ffff">
										<td colspan="2">식육가공품</td>
										<td></td>
										<td align="right"><span id="value2"> 750 </span>g</td>
									</tr>
									<tr style="background-color:#e0ffff">
										<td colspan="2">젓갈류</td>
										<td></td>
										<td align="right"><span id="value3"> 1500 </span>g</td>
									</tr>
									<tr>
										<td></td>
										<td height=40px align="right" colspan="3">
										
										<!-- Button trigger modal -->
												<button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#myModal">
												  자세히보기
												</button>
												
												
										
										
										
										
										</td>
									</tr>
									<tr>
										<td colspan="4">- 요약정보</td>
									</tr>
									<tr>
										<td colspan="4">1. 소르빈산은 식품에서 보존제로 사용되는 천연 유기화합물이다. 마가목(Sorbus aucuparia)의 덜익은 열매에서 처음 분리되었고 이에 따라 이름이 지어졌다. </td>
									</tr>
									<tr>
										<td colspan="4"><div id="noneDiv1" style="display:none">소르빈산과 소르빈산 나트륨, 소르빈산 칼륨 및 소르빈산 칼슘과 같은 무기 염류는 음식 및 음료수에서 종종 보존제로 사용되는 미생물생육억제제(antimicrobial agent)로 곰팡이, 효모, 진균류의 성장을 막아준다. 일반적으로 염류는 물에 잘 녹기 때문에 산 형태보다 선호된다.</div>
										
										</td>
									</tr>
									<tr>
									<td colspan="4" align="right"><input type="button" value="더보기" onclick="butClick('noneDiv1');return false;"></td>
									</tr>
								

								</table>
							</div>
						</td>
					</tr>

					<tr>
						<!-- 유해성 정보-->
						<td colspan="2"><input type="button"
							style="height: 50px; width: 100%;" value="2.유해성 정보"
							onclick="butClick('div2');return false;"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<div class="list-group" id="div2" style="display: none;">
								<img src="images/grade1.png" >
							
							<table width="100%" style="background-color:#fff0f5">
								<tr>
									<td colspan="4"> - 유해성 결과(실험값) </td>
								</tr>
								<tr> 
									<td>동물종 : </td>
									<td>
										<select name="동물종">
										    <option value="Rat">Rat</option>
										    <option value="학생">학생</option>
										    <option value="회사원">회사원</option>
										    <option value="기타">기타</option>
										</select>
									</td>
									<td>투여경로 : </td>
									<td>
										<select name="경로">
										    <option value="경구">경구</option>
										    <option value="학생">학생</option>
										    <option value="회사원">회사원</option>
										    <option value="기타">기타</option>
										</select>
									</td>
								</tr>
								<tr> 
									<td>종말점 : </td>
									<td>
										<select name="종말점">
										    <option value="LD50">LD50</option>
										    <option value="학생">학생</option>
										    <option value="회사원">회사원</option>
										    <option value="기타">기타</option>
										</select>
									</td>
									<td>독성수치 : </td>
									<td>2,820 mg/kg</td>
								</tr>
								<tr style="background-color:#ffffff">
									<td colspan="4" height=10px> </td>
								</tr>
								
								</table>
								<table width="100%" style="background-color:#90ee90">
								<tr>
									<td colspan="4"> - 유해성 결과(예측값) </td>
								</tr>
								<tr> 
									<td>동물종 : </td>
									<td>
										<select name="동물종">
										    <option value="Rat">Rat</option>
										    <option value="학생">학생</option>
										    <option value="회사원">회사원</option>
										    <option value="기타">기타</option>
										</select>
									</td>
									<td>투여경로 : </td>
									<td>
										<select name="경로">
										    <option value="경구">경구</option>
										    <option value="학생">학생</option>
										    <option value="회사원">회사원</option>
										    <option value="기타">기타</option>
										</select>
									</td>
								</tr>
								<tr> 
									<td>종말점 : </td>
									<td>
										<select name="종말점">
										    <option value="LD50">LD50</option>
										    <option value="학생">학생</option>
										    <option value="회사원">회사원</option>
										    <option value="기타">기타</option>
										</select>
									</td>
									<td>독성수치 : </td>
									<td>2,820 mg/kg</td>
								</tr>
								<tr style="background-color:#ffffff;">
									<td colspan="4" height=10px align="right"> 위 예측값은 <B>T.E.S.T.</B> 프로그램을 통해 예측 되었음. <br>유해성 정보로 부터 정한 일일 섭취 허용량은<br> 00 mg/kg·bw/day 입니다.</td>
									
								</tr>
								
								<tr style="background-color:#ffffff; height:40px; vertical-align:bottom;">
										<td >- 요약정보</td>
										<td align="right" colspan="3"></td>
									</tr>
									<tr style="background-color:#ffffff">
										<td colspan="4">눈, 피부 및 호흡기에 자극적이다. 반복적으로 또는 장기간 접촉하면 피부 감작이 발생할 수 있다. </td>
									</tr>
									
							</table>
							
							</div>
						</td>
					</tr>
					<tr>
						<td>
							
						</td>
					</tr>
					
					<tr>
						<!-- 특성정보-->
						<td colspan="2"><input type="button"
							style="height: 50px; width: 100%;" value="3.특성 정보"
							onclick="butClick('div3');return false;"></td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="list-group" id="div3" style="display: none;">
								<table width="100%" class="mytable">
								<tr>
									<td colspan="2"> - 물질정보 </td>
								</tr>
								<tr>
									<td width=30% style="background:#dcdcdc">물질명</td>
									<td width=70%>소르빈산</td>
								</tr>
								<tr>
									<td width=30% style="background:#dcdcdc">CasNo</td>
									<td width=70%>110-44-1</td>
								</tr>
								<tr>
									<td width=30% style="background:#dcdcdc">분자식</td>
									<td width=70%>C6H8O2</td>
								</tr>
								<tr>
									<td width=30% style="background:#dcdcdc">분자량</td>
									<td width=70%>112.13</td>
								</tr>
								<tr>
									<td width=30% style="background:#dcdcdc">유럽연함번호</td>
									<td width=70%>203-768-7</td>
								</tr>
								<tr>
									<td width=30% style="background:#dcdcdc">CCRIS번호</td>
									<td width=70%>5748</td>
								</tr>
								</table>
								
								<table width="100%" class="">
								<tr>
									<td> - 용도 </td>
								</tr>
								<tr>
									<td >곰팡이 및 효모 억제제<br> 
										식품(특히 치즈)의 정진균제 <br>
										보존제 <br>
										저온 고무의 제분 특성 향상<br> 
										가소제 및 윤활제의 중간물질<br>
									</td>
								</tr>
								
								<tr style="background-color:#ffffff; height:40px; vertical-align:bottom;">
										<td >- 요약정보</td>
									</tr>
									<tr style="background-color:#ffffff">
										<td >"소르빈산을 함유하는 국소 치료제 및 화장품은 사용하지 않아야 한다. 소르빈산을 함유한 음식 섭취로 인해 습진이 발생했다는 증거는 없다.</td>
										 
									</tr>
									
									<tr>
									<td><div id="noneDiv3" style="display:none;">따라서 소르빈산을 함유한 식품을 섭취해도 상관없다.
미국 NIOSH(NOES Survey 1981~1983)에서는 59,131명의 작업자(이 중 19,061명은 여성)가 소르빈산에 잠재적으로 노출되어 있다고 통계적으로 추정했다. 소르빈산을 생산하거나 사용하는 작업장에서 분진 입자의 흡입 및 피부 접촉을 통하여 소르빈산에 노출될 수 있다. 일반인들은 음식 및 기타 소르빈산을 함유하는 제품을 통해 소르빈산에 노출된다.“</div></td>
									</tr>
									
									<tr>
									<td align="right"><input type="button" value="더보기" onclick="butClick('noneDiv3');return false;"></td>
									</tr>
								</table>
	






							</div>
						</td>
					</tr>
					<tr>
						<!-- 용어집-->
						<td colspan="2"><input type="button"
							style="height: 50px; width: 100%" value="4.용어집"
							onclick="butClick('div4');return false;"></td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="list-group" id="div4" style="display: none;">
								<table>
									<tr style="background-color:#ffffff; height:40px; vertical-align:bottom;">
										<td>1. 섭취 허용량
										</td>
										<td>
										</td>
									</tr>
									<tr>
										<td>
											<li>1번째</li>
											<li>2번째</li>
											<li>3번째</li>
										</td>
										<td>
										</td>
									</tr>
									<tr style="background-color:#ffffff; height:40px; vertical-align:bottom;">
										<td>2. 유해성 정보
										</td>
										<td>
										</td>
									</tr>
									<tr>
										<td>
											<li>1번째</li>
											<li>2번째</li>
											<li>3번째</li>
										</td>
										<td>
										</td>
									</tr>
									<tr style="background-color:#ffffff; height:40px; vertical-align:bottom;">
										<td>3. 특성 정보
										</td>
										<td>
										</td>
									</tr>
									<tr>
										<td>
											<li>1번째</li>
											<li>2번째</li>
											<li>3번째</li>
										</td>
										<td>
										</td>
									</tr>
								
								
								
								</table>
							
							
							</div>
						</td>
					</tr>


				</table>

			</div>
		</div>
	</div>

	<!-- 전체 DIV -->
	
	
	
	<!-- Modal -->
												<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
												  <div class="modal-dialog">
												    <div class="modal-content">
												      <div class="modal-header">
												        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
												        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
												      </div>
												      <div class="modal-body">
												        		[<%=s%>] 물질의 <br>
												        		일일 섭취 허용량은  25 mg/kg·bw/day 입니다.<br> 
												        		(출처 : JECFA )<br>
												        		그림<br>
												        		*실제 식품에 사용하는 첨가물은 <br>
												        		기준 규격 보다 훨씬 낮게 사용 됩니다.<br>
												      </div>
												      <div class="modal-footer">
												        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
												      </div>
												    </div>
												  </div>
												</div>