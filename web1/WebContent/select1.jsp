<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*, java.text.*"%>
<%
	String s = request.getParameter("param");
	// 	System.out.println(s);
%>

<script type="text/javascript">
	$(document).ready(function() {
		// 	$("#range").load("test1.jsp");
		//  	$("#test").load("test1.jsp");
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

#ex1Slider .slider-selection {
	background: #BABABA;
}
</style>

<body>
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
		</div>
		 
	</div>
	<!-- 전체 DIV -->