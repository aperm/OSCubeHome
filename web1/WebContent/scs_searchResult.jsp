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
		$("#divAll").load("select1.jsp", {
			param : th_id
		});
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
		$("#divAll").load("scs_search.jsp");
	});

	// Without JQuery
	var slider = new Slider('#ex1', {
		formatter : function(value) {
			return 'Current value: ' + value;
		}
	});

	$("#ex1").on("slide", function(slideEvt) {
		$("#ex6SliderVal").text(slideEvt.value);

		// 		 몸무게 * ADI (일일섭취) / 기준치
		// 		치즈 
		$("#value1").text((slideEvt.value * 25 / 3).toFixed(1));
		// 		식육
		$("#value2").text((slideEvt.value * 25 / 2).toFixed(1));
		// 		젓갈
		$("#value3").text((slideEvt.value * 25 / 1).toFixed(1));

	});
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

							<td width=70%><input type="text"
								style="border-radius: 10px 0px 0px 10px; height: 40px; width: 100%;"
								placeholder="  검색어를 입력하세요." value="<%=s%>"></td>
							<td width=30%><input type="button"
								style="border-radius: 0px 10px 10px 0px; height: 40px; width: 100%;"
								value="검색" onclick="butClick('testdiv');return false;"></td>

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
				<table align="center" text-align="left" width=95%>
					<tr>
						<td colspan="2" style="height: 10px;"></td>
					</tr>
					<tr>
						<!-- 안전 사용정보 -->
						<td colspan="2"><input type="button"
							style="height: 50px; width: 100%;" value="안전 사용정보"
							onclick="butClick('div1');return false;"></td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="list-group" id="div1" style="display: none;">
								<img src="images/grade1.png" style="margin: auto;">
								<table align="center" width=100%>
									<tr>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>
											<div id="test">
												<input id="ex1" data-slider-id='ex1Slider' type="text"
													data-slider-min="5" data-slider-max="150"
													data-slider-step="1" data-slider-value="60" "/> 몸무게 :
											</div>
										</td>
										<td style="text-align: 'right';"><span
											id="ex6CurrentSliderValLabel"> <span id="ex6SliderVal"></span></span>
											Kg</td>
									</tr>

									<tr>
										<td>치즈류 (3 g/Kg)</td>
										<td><span id="value1"> 500 </span>g</td>
									</tr>

									<tr>
										<td>식육가공품(2 g/Kg)</td>
										<td><span id="value2"> 750 </span>g</td>
									</tr>
									<tr>
										<td>젓갈류 (1 g/kg)</td>
										<td><span id="value3"> 1500 </span>g</td>
									</tr>
									<tr>
										<td>일일섭취 허용량</td>
										<td>25 mg/Kg</td>
									</tr>
									<tr>
										<td>일일섭취 허용량</td>
										<td>25 mg/Kg</td>
									</tr>

								</table>
							</div>
						</td>
					</tr>

					<tr>
						<!-- 유해성 정보(실험+예측)-->
						<td colspan="2"><input type="button"
							style="height: 50px; width: 100%;" value="유해성 정보"
							onclick="butClick('div2');return false;"></td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="list-group" id="div2" style="display: none;">
								<a href="#" class="list-group-item  list-group-item-success"
									id="소르빈산 칼륨">소르빈산 칼륨<br>Potassium sorbate<br>24634-61-5


								
							</div>
						</td>
					</tr>
					<tr>
						<!-- 특성정보-->
						<td colspan="2"><input type="button"
							style="height: 50px; width: 100%;" value="특성 정보"
							onclick="butClick('div3');return false;"></td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="list-group" id="div3" style="display: none;">
								<a href="#" class="list-group-item  list-group-item-success"
									id="소르빈산 칼륨">소르빈산 칼륨<br>Potassium sorbate<br>24634-61-5


								
							</div>
						</td>
					</tr>
					<tr>
						<!-- 용어집-->
						<td colspan="2"><input type="button"
							style="height: 50px; width: 100%" value="용어집"
							onclick="butClick('div4');return false;"></td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="list-group" id="div4" style="display: none;">
								<a href="#" class="list-group-item  list-group-item-success"
									id="소르빈산 칼륨">소르빈산 칼륨<br>Potassium sorbate<br>24634-61-5
								</a> <a href="#" class="list-group-item  list-group-item-success"
									id="에리소르빈산">에리소르빈산<br>Erythorbic acid<br>89-65-6
								</a> <a href="#" class="list-group-item  list-group-item-success"
									id="소르빈산">소르빈산<br>Sorbic acid<br>110-44-1
								</a> <a href="#" class="list-group-item  list-group-item-success"
									id="기타사항">기타사항</a>
							</div>
						</td>
					</tr>


				</table>

			</div>
		</div>
	</div>

	<!-- 전체 DIV -->