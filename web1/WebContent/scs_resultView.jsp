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
		
		

		// 		 ������ * ADI (���ϼ���) / ����ġ
		// 		ġ�� 
		$("#value1").text((slideEvt.value * 25 / 3).toFixed(1));
		// 		����
		$("#value2").text((slideEvt.value * 25 / 2).toFixed(1));
		// 		����
		$("#value3").text((slideEvt.value * 25 / 1).toFixed(1));

	});
	
	function searchBntClick() {
		 var searchWord = $('#searchWord').val();
		 $("#divAll").load("scs_searchResult.jsp", {param:searchWord});
		 
	}
	function keydownFun() {
		$("#value1").text((slideEvt.value * 25 / 3).toFixed(1));
		// 		����
		$("#value2").text((slideEvt.value * 25 / 2).toFixed(1));
		// 		����
		$("#value3").text((slideEvt.value * 25 / 1).toFixed(1));

		 
	}

</script>



<style type="text/css">

 
.mytable { border-collapse:collapse; }  
.mytable th, .mytable td { border:1px solid black; }
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
				<table width=100%
					style="text-align: center; align: center; vertical-align: middle; height: 50px;">
					<tr>
						<td width=20%><div class="pageBack">
								<span class="glyphicon glyphicon-chevron-left"
									aria-hidden="true"></span>BACK
							</div></td>
						<td width=60%><img src="/images/logos/s2food.png" width=100px
							onclick="imgClick();"></td>
						<td width=20%>�޴��ڸ�</td>
					</tr>
				</table>
				<!-- 		�˻��޴� -->
				<div id="searchBarDiv"
					style="background-color: #4ba9f5; vertical-align: middle;">
					<table align="center" width=95%
						style="text-align: center; align: center; vertical-align: middle; height: 40px;">
						<tr>
							<td height=5px></td>
							<td></td>
						</tr>
						<tr>
							<!-- �˻��� -->

							<td width=70%><input type="text" id="searchWord"
								style="border-radius: 10px 0px 0px 10px; height: 40px; width: 100%;"
								placeholder="  �˻�� �Է��ϼ���." value="<%=s%>"></td>
							<td width=30%><input type="button" class="searchBnt" onclick="searchBntClick();"
								style="border-radius: 0px 10px 10px 0px; height: 40px; width: 100%;"
								value="�˻�" ></td>

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
			<div class="" style="margin-top: 100px;">
				<table align="center" text-align="center" width=95%>
					<tr>
						<td colspan="2" style="height: 10px;"></td>
					</tr>
					<tr>
						<!-- ���� ��뷮 -->
						<td colspan="2"><input type="button"
							style="height: 50px; width: 100%;" value="1.���� ��뷮"
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
										<td width=20%>ü���Է�</td>
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
										<td colspan="2">ġ���</td>
										<td></td>
										<td align="right"><span id="value1"> 500 </span>g</td>
									</tr>

									<tr style="background-color:#e0ffff">
										<td colspan="2">��������ǰ</td>
										<td></td>
										<td align="right"><span id="value2"> 750 </span>g</td>
									</tr>
									<tr style="background-color:#e0ffff">
										<td colspan="2">������</td>
										<td></td>
										<td align="right"><span id="value3"> 1500 </span>g</td>
									</tr>
									<tr>
										<td></td>
										<td height=40px align="right" colspan="3">
										
										<!-- Button trigger modal -->
												<button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#myModal">
												  �ڼ�������
												</button>
												
												
										
										
										
										
										</td>
									</tr>
									<tr>
										<td colspan="4">- �������</td>
									</tr>
									<tr>
										<td colspan="4">1. �Ҹ������ ��ǰ���� �������� ���Ǵ� õ�� ����ȭ�չ��̴�. ������(Sorbus aucuparia)�� ������ ���ſ��� ó�� �и��Ǿ��� �̿� ���� �̸��� ��������. </td>
									</tr>
									<tr>
										<td colspan="4"><div id="noneDiv1" style="display:none">�Ҹ����� �Ҹ���� ��Ʈ��, �Ҹ���� Į�� �� �Ҹ���� Į���� ���� ���� ������ ���� �� ��������� ���� �������� ���Ǵ� �̻�������������(antimicrobial agent)�� ������, ȿ��, ���շ��� ������ �����ش�. �Ϲ������� ������ ���� �� ��� ������ �� ���º��� ��ȣ�ȴ�.</div>
										
										</td>
									</tr>
									<tr>
									<td colspan="4" align="right"><input type="button" value="������" onclick="butClick('noneDiv1');return false;"></td>
									</tr>
								

								</table>
							</div>
						</td>
					</tr>

					<tr>
						<!-- ���ؼ� ����-->
						<td colspan="2"><input type="button"
							style="height: 50px; width: 100%;" value="2.���ؼ� ����"
							onclick="butClick('div2');return false;"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<div class="list-group" id="div2" style="display: none;">
								<img src="images/grade1.png" >
							
							<table width="100%" style="background-color:#fff0f5">
								<tr>
									<td colspan="4"> - ���ؼ� ���(���谪) </td>
								</tr>
								<tr> 
									<td>������ : </td>
									<td>
										<select name="������">
										    <option value="Rat">Rat</option>
										    <option value="�л�">�л�</option>
										    <option value="ȸ���">ȸ���</option>
										    <option value="��Ÿ">��Ÿ</option>
										</select>
									</td>
									<td>������� : </td>
									<td>
										<select name="���">
										    <option value="�汸">�汸</option>
										    <option value="�л�">�л�</option>
										    <option value="ȸ���">ȸ���</option>
										    <option value="��Ÿ">��Ÿ</option>
										</select>
									</td>
								</tr>
								<tr> 
									<td>������ : </td>
									<td>
										<select name="������">
										    <option value="LD50">LD50</option>
										    <option value="�л�">�л�</option>
										    <option value="ȸ���">ȸ���</option>
										    <option value="��Ÿ">��Ÿ</option>
										</select>
									</td>
									<td>������ġ : </td>
									<td>2,820 mg/kg</td>
								</tr>
								<tr style="background-color:#ffffff">
									<td colspan="4" height=10px> </td>
								</tr>
								
								</table>
								<table width="100%" style="background-color:#90ee90">
								<tr>
									<td colspan="4"> - ���ؼ� ���(������) </td>
								</tr>
								<tr> 
									<td>������ : </td>
									<td>
										<select name="������">
										    <option value="Rat">Rat</option>
										    <option value="�л�">�л�</option>
										    <option value="ȸ���">ȸ���</option>
										    <option value="��Ÿ">��Ÿ</option>
										</select>
									</td>
									<td>������� : </td>
									<td>
										<select name="���">
										    <option value="�汸">�汸</option>
										    <option value="�л�">�л�</option>
										    <option value="ȸ���">ȸ���</option>
										    <option value="��Ÿ">��Ÿ</option>
										</select>
									</td>
								</tr>
								<tr> 
									<td>������ : </td>
									<td>
										<select name="������">
										    <option value="LD50">LD50</option>
										    <option value="�л�">�л�</option>
										    <option value="ȸ���">ȸ���</option>
										    <option value="��Ÿ">��Ÿ</option>
										</select>
									</td>
									<td>������ġ : </td>
									<td>2,820 mg/kg</td>
								</tr>
								<tr style="background-color:#ffffff;">
									<td colspan="4" height=10px align="right"> �� �������� <B>T.E.S.T.</B> ���α׷��� ���� ���� �Ǿ���. <br>���ؼ� ������ ���� ���� ���� ���� ��뷮��<br> 00 mg/kg��bw/day �Դϴ�.</td>
									
								</tr>
								
								<tr style="background-color:#ffffff; height:40px; vertical-align:bottom;">
										<td >- �������</td>
										<td align="right" colspan="3"></td>
									</tr>
									<tr style="background-color:#ffffff">
										<td colspan="4">��, �Ǻ� �� ȣ��⿡ �ڱ����̴�. �ݺ������� �Ǵ� ��Ⱓ �����ϸ� �Ǻ� ������ �߻��� �� �ִ�. </td>
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
						<!-- Ư������-->
						<td colspan="2"><input type="button"
							style="height: 50px; width: 100%;" value="3.Ư�� ����"
							onclick="butClick('div3');return false;"></td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="list-group" id="div3" style="display: none;">
								<table width="100%" class="mytable">
								<tr>
									<td colspan="2"> - �������� </td>
								</tr>
								<tr>
									<td width=30% style="background:#dcdcdc">������</td>
									<td width=70%>�Ҹ����</td>
								</tr>
								<tr>
									<td width=30% style="background:#dcdcdc">CasNo</td>
									<td width=70%>110-44-1</td>
								</tr>
								<tr>
									<td width=30% style="background:#dcdcdc">���ڽ�</td>
									<td width=70%>C6H8O2</td>
								</tr>
								<tr>
									<td width=30% style="background:#dcdcdc">���ڷ�</td>
									<td width=70%>112.13</td>
								</tr>
								<tr>
									<td width=30% style="background:#dcdcdc">�������Թ�ȣ</td>
									<td width=70%>203-768-7</td>
								</tr>
								<tr>
									<td width=30% style="background:#dcdcdc">CCRIS��ȣ</td>
									<td width=70%>5748</td>
								</tr>
								</table>
								
								<table width="100%" class="">
								<tr>
									<td> - �뵵 </td>
								</tr>
								<tr>
									<td >������ �� ȿ�� ������<br> 
										��ǰ(Ư�� ġ��)�� �������� <br>
										������ <br>
										���� ���� ���� Ư�� ���<br> 
										������ �� ��Ȱ���� �߰�����<br>
									</td>
								</tr>
								
								<tr style="background-color:#ffffff; height:40px; vertical-align:bottom;">
										<td >- �������</td>
									</tr>
									<tr style="background-color:#ffffff">
										<td >"�Ҹ������ �����ϴ� ���� ġ���� �� ȭ��ǰ�� ������� �ʾƾ� �Ѵ�. �Ҹ������ ������ ���� ����� ���� ������ �߻��ߴٴ� ���Ŵ� ����.</td>
										 
									</tr>
									
									<tr>
									<td><div id="noneDiv3" style="display:none;">���� �Ҹ������ ������ ��ǰ�� �����ص� �������.
�̱� NIOSH(NOES Survey 1981~1983)������ 59,131���� �۾���(�� �� 19,061���� ����)�� �Ҹ���꿡 ���������� ����Ǿ� �ִٰ� ��������� �����ߴ�. �Ҹ������ �����ϰų� ����ϴ� �۾��忡�� ���� ������ ���� �� �Ǻ� ������ ���Ͽ� �Ҹ���꿡 ����� �� �ִ�. �Ϲ��ε��� ���� �� ��Ÿ �Ҹ������ �����ϴ� ��ǰ�� ���� �Ҹ���꿡 ����ȴ�.��</div></td>
									</tr>
									
									<tr>
									<td align="right"><input type="button" value="������" onclick="butClick('noneDiv3');return false;"></td>
									</tr>
								</table>
	






							</div>
						</td>
					</tr>
					<tr>
						<!-- �����-->
						<td colspan="2"><input type="button"
							style="height: 50px; width: 100%" value="4.�����"
							onclick="butClick('div4');return false;"></td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="list-group" id="div4" style="display: none;">
								<table>
									<tr style="background-color:#ffffff; height:40px; vertical-align:bottom;">
										<td>1. ���� ��뷮
										</td>
										<td>
										</td>
									</tr>
									<tr>
										<td>
											<li>1��°</li>
											<li>2��°</li>
											<li>3��°</li>
										</td>
										<td>
										</td>
									</tr>
									<tr style="background-color:#ffffff; height:40px; vertical-align:bottom;">
										<td>2. ���ؼ� ����
										</td>
										<td>
										</td>
									</tr>
									<tr>
										<td>
											<li>1��°</li>
											<li>2��°</li>
											<li>3��°</li>
										</td>
										<td>
										</td>
									</tr>
									<tr style="background-color:#ffffff; height:40px; vertical-align:bottom;">
										<td>3. Ư�� ����
										</td>
										<td>
										</td>
									</tr>
									<tr>
										<td>
											<li>1��°</li>
											<li>2��°</li>
											<li>3��°</li>
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

	<!-- ��ü DIV -->
	
	
	
	<!-- Modal -->
												<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
												  <div class="modal-dialog">
												    <div class="modal-content">
												      <div class="modal-header">
												        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
												        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
												      </div>
												      <div class="modal-body">
												        		[<%=s%>] ������ <br>
												        		���� ���� ��뷮��  25 mg/kg��bw/day �Դϴ�.<br> 
												        		(��ó : JECFA )<br>
												        		�׸�<br>
												        		*���� ��ǰ�� ����ϴ� ÷������ <br>
												        		���� �԰� ���� �ξ� ���� ��� �˴ϴ�.<br>
												      </div>
												      <div class="modal-footer">
												        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
												      </div>
												    </div>
												  </div>
												</div>