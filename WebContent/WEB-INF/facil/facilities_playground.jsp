<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jsp"%>
<!-- 해더  삽입  [지우지마세여]------------------------------------------------------------------------------------------------->
<!-- 페이지 헤드 라인 : 제목 -->
<head>
<title>운동장 예약</title>
<style>
.fc-day:hover {
	background: lightblue;
	cursor: pointer;
}
</style>
<c:if test="${tradecheck eq 'overpoint'}">
    <script type="text/javascript">
    alert("입력 포인트가 보유 포인트를 초과 합니다.");
    location.href = "/HarangProject/facil?cmd=FacilPGreserv";
    </script>
</c:if>    
</head>
<!-- 메인 페이지 구역 , 즉 작업 구역 -->
<div class="content-wrapper">
	<!----------------------------------- 메인페이지 헤더 [작업 제목] ------------------------------------------------------------->
	<section class="content-header">
		<h1>
			운동장 예약 <small>예약 페이지</small>
		</h1>
		<ol class="breadcrumb">
			<!-- 페이지 기록 : 메인에서 부터 현재 페이지 까지의 경로 나열 -->
			<li><a href="#"><i class="fa fa-dashboard"></i> 메인</a></li>
			<li class="active">운동장 예약</li>
		</ol>
	</section>
	<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
	<section class="content">
		<div class="row">
			<!-- 달력의 크기 조정 -->
			<div class="col-md-12">
				<!-- calendar box -->
				<div class="box box-primary">
					<div class="box-header">
						<h3 class="box-title">예약 날짜 선택</h3>
						<div class="box-tools pull-right">
							<button class="btn btn-box-tool" data-widget="collapse">
								<i class="fa fa-minus"></i>
							</button>
						</div>
					</div>

					<div class="box-body no-padding">
						<!-- THE CALENDAR -->
						<div id="calendar"></div>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /. calendar box -->
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->

		<!-- 시설 선택 -->
		<div class="row">
			<div class="col-md-12">
				<!-- Box -->
				<div class="box box-primary" id="reser01" hidden="hidden">
					<!-- Box header -->
					<div class="box-header">
						<h3 class="box-title">예약 시설 선택</h3>
						<div class="box-tools pull-right">
							<button class="btn btn-box-tool" data-widget="collapse">
								<i class="fa fa-minus"></i>
							</button>
						</div>
					</div>

					<!-- Box body -->
					<form name="select09">
						<div class="box-body">

							<!-- 사용자 편의를 위한.. 운동장 표시 -->
							<div class="row">
								<div class="col-md-4">
									<label>예약할 날짜</label> <input id="Reser" type="text"
										class="form-control" readonly="readonly">
								</div>

								<!-- 시설명(첫번째 카테고리) 선택 -->
								<div class="form-group col-md-4">
									<label>시설명</label> <select class="form-control" name="pg_type"
										id="pg_type" onchange="selectfacil()">

										<option>시설을 선택하세요.</option>

										<c:forEach items="${pglist}" var="s">
											<option value="${s.pg_type}">${s.pg_type}</option>
										</c:forEach>
									</select>
								</div>

								<!-- 호수(두번째 카테고리) 선택 -->
								<div class="form-group col-md-4">
									<label>호수</label> <select class="form-control" id="pg_name"
										name="pg_name" onchange="select02()">
										<option>호수를 선택하세요.</option>
									</select>
								</div>
							</div>

							<!-- 시설 정보 두번째줄 -->
							<div class="row">
								<div class="col-md-4">
									<div class="form-group" id="pg_content" name="pg_content">
										<label>시설정보</label>
										<textarea class="form-control" rows="3" placeholder="운동장"
											disabled style="width: 250px">
                  						</textarea>
									</div>
								</div>
								<div class="col-md-4">
									<label>대여 포인트</label> <input id="pg_point" type="text"
										class="form-control" readonly="readonly" style="width: 150px">
								</div>

								<div class="col-md-4">
									<label>시설번호</label> <input id="pg_num" type="text"
										class="form-control" readonly="readonly" style="width: 150px">
										
								</div>

							</div>
						</div>
					</form>

					<!-- Box footer -->
					<div class="box-footer">
						<div class="row" align="center">
							<div class="col-md-3 btn-group"></div>
							<div class="col-md-3 btn-group">
								<input type="button" class="btn btn-block btn-primary"
									onclick="goSelectTime()" value="예약 시간 선택">
							</div>
							<div class="col-md-3 btn-group">
								<input type="button" class="btn btn-block btn-primary"
									value="날짜 다시 선택">
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>

		<!-- faclities.select -->
		<div class="row">
			<div class="col-md-12">
				<!-- faclities.select.box-->
				<div class="box box-primary" id="reser02" hidden="hidden">
					<!-- faclities.select.box header -->
					<div class="box-header">
						<h3 class="box-title">예약 시간 선택</h3>
						<div class="box-tools pull-right">
							<button class="btn btn-box-tool" data-widget="collapse">
								<i class="fa fa-minus"></i>
							</button>
						</div>

					</div>
					<!-- faclities.select.box body -->
					<div class="box-body">
						<!-- 시설 정보 [위에 선택 정보 받아옴]  -->
						<!-- 시설 정보 첫줄 -->
						<br>

						<!-- 날짜 선택줄 -->
						<div class="row">
							<div class="col-md-12" align="center">

								<div class="btn-group" data-toggle="buttons">

									<label class="btn btn-primary" id="l0"> <input
										type="checkbox" id="b0" value="8">
										8시
									</label> <label class="btn btn-primary" id="l1"> <input
										type="checkbox"  id="b1" value="9">
										9시
									</label> <label class="btn btn-primary" id="l2"> <input
										type="checkbox"  id="b2" value="10">
										10시
									</label> <label class="btn btn-primary" id="l3"> <input
										type="checkbox"  id="b3" value="11">
										11시
									</label> <label class="btn btn-primary" id="l4"> <input
										type="checkbox"  id="b4" value="12">
										12시
									</label> <label class="btn btn-primary" id="l5"> <input
										type="checkbox"  id="b5" value="13">
										13시
									</label> <label class="btn btn-primary" id="l6"> <input
										type="checkbox"  id="b6" value="14">
										14시
									</label> <label class="btn btn-primary" id="l7"> <input
										type="checkbox"  id="b7" value="15">
										15시
									</label> <label class="btn btn-primary" id="l8"> <input
										type="checkbox"  id="b8" value="16">
										16시
									</label> <label class="btn btn-primary" id="l9"> <input
										type="checkbox"  id="b9" value="17">
										17시
									</label> <label class="btn btn-primary" id="l10"> <input
										type="checkbox"  id="b10" value="18">
										18시
									</label> <label class="btn btn-primary" id="l11"> <input
										type="checkbox"  id="b11" value="19">
										19시
									</label> <label class="btn btn-primary" id="l12"> <input
										type="checkbox"  id="b12" value="20">
										20시
									</label>



								</div>
							</div>
						</div>
					</div>
					<!-- faclities.select.box footer  -->
					<div class="box-footer">
						<div class="row" align="center">
							<div class="col-md-3 btn-group"></div>
							<div class="col-md-3 btn-group">
								<input type="button" class="btn btn-block btn-primary"
									value="확인" onclick="countTime()">
							</div>
							<div class="col-md-3 btn-group">
								<input type="button" class="btn btn-block btn-primary"
									value="다시 선택">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 최종 결제 부분 -->
		<div class="row">
			<div class="col-md-12">
				<!-- 최종결제 box -->
				<div class="box box-primary" id="reser03" hidden="hidden">
					<!-- 최종결제 box-header -->
					<div class="box-header">
						<h3 class="box-title">결제</h3>
						<div class="box-tools pull-right">
							<button class="btn btn-box-tool" data-widget="collapse">
								<i class="fa fa-minus"></i>
							</button>
						</div>
					</div>

					<!-- 최종결제 box-body -->
					<!-- <form method="post" action="/HarangProject/facil?cmd=FacilPGreserv"> -->
					
					<form method="post" action="/HarangProject/facil?cmd=FacilPGreserv">
						<div class="box-body ">
							<div class="row ">
								<!-- 사용 시간 -->
								<div class="col-md-3">
									<label>사용시간</label> <input type="text" class="form-control"
										readonly="readonly" style="width: 150px" id="count">
										
										<input type="hidden" id="spgm_date" name="spgm_date" />
										<input type="hidden" id="spg_num" name="spg_num" />
										<input type="hidden" id="spgm_timecode" name="spgm_timecode" />
										<input type="hidden" id="minuspoint" name="minuspoint">
										<input type="hidden" name="checkout" value="yes"/>
								</div>
								<!-- 보유 포인트 -->
								<div class="col-md-3">
									<label>보유 포인트</label> <input type="text" class="form-control"
										readonly="readonly" style="width: 150px" id="mypoint">
								</div>
								<!-- 차감 포인트 -->
								<div class="col-md-3">
									<label>차감 포인트</label> <input type="text" class="form-control"
										readonly="readonly" style="width: 150px" id="checkpoint">
								</div>
	
								<!-- 결제 후 포인트-->
								<div class="col-md-3">
									<label>결제후 잔여 포인트</label> <input type="text"
										class="form-control" readonly="readonly" 
										style="width: 150px" id="beforepoint"
										>
								</div>
							</div>
						</div>
					

					<!-- 최종결제 box-footer -->
					<div class="box-footer">
						<div class="row" align="center">
							<div class="col-md-3 btn-group"></div>
							<div class="col-md-3 btn-group">
								<input type="submit" class="btn btn-block btn-primary"
									value="결제" onclick="artest()">
							</div>
							<div class="col-md-3 btn-group">
								<input type="button" class="btn btn-block  btn-primary"
									value="다시 선택">
							</div>
						</div>
					</div>
					</form>
					
				</div>
			</div>
		</div>
	</section>
	<!-- /.content -->
	<!------------------------------------------------------------------------------------------------------------------->
</div>
<!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->

<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------>
<%@ include file="../include/footer.jsp"%>

<script type="text/javascript">
	// 일단 전역 변수로 만들었는데...이거참...
	var vardate;

	$(function() {
		/* initialize the calendar
		 -----------------------------------------------------------------*/
		//현재 년 월 일 불러 오기
		var date = new Date();
		var d = date.getDate(), m = date.getMonth(), y = date.getFullYear();
		$('#calendar').fullCalendar(
				{
					locale : 'kr',
					header : {
						left : 'prev,next',
						center : 'title',
						right : 'today'
					},
					buttonText : {
						today : '오늘날짜',
						month : '월별',
						week : '주별',
						day : '일별'
					},
					titleFormat : {
						month : 'YYYY년 MMMM'
					},
					monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월",
							"8월", "9월", "10월", "11월", "12월" ],
					monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월",
							"7월", "8월", "9월", "10월", "11월", "12월" ],
					dayNames : [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일",
							"토요일" ],
					dayNamesShort : [ "일", "월", "화", "수", "목", "금", "토" ],
					allDayDefault : false,
					editable : false,
					dayClick : function(date, jsEvent, view) {
						// 이날짜를 바탕으로 쿼리문을 날려서 예약결제로 넘어가도록 한다.
						document.getElementById('Reser').setAttribute('value',
								date.format());
						vardate = date.format();
						$("#reser01").slideUp();
						$("#reser02").slideUp();
						$("#reser03").slideUp();
						$("#reser01").slideDown();

					}
				});

		$("#closeup").click(function() {
			$("#menuinfobox").slideUp();
		});
	});

	//시설 선택을 셀렉트 생성. pg_type을 바탕으로 pg_name의 list를 출력한다.
	function selectfacil() {

		var wpg_type = document.getElementById('pg_type').value;
		
		$.getJSON("/HarangProject/ajax?cmd=selectPg", {
			pg_type : encodeURIComponent(wpg_type)
		}, function(data) {
			$("#pg_name option").remove();
			$("#pg_name").append("<option>호수를 입력하세요.</option>");
			$(data).each(
					function(index, pglist) {
						$("#pg_name").append(
								"<option value='"+pglist.pg_name+"'>"
										+ pglist.pg_name + "</option>");

					});
		});
	}

	// selectfacil()을 바탕으로 pg_content와 포인트, 시설번호를 불러온다.
	function select02() {
		var varpg_type = document.getElementById('pg_type').value;
		var varpg_name = select09.pg_name.value;

		$
				.getJSON("/HarangProject/ajax?cmd=selectPg",
						{
							pg_type : encodeURIComponent(varpg_type),
							pg_name : encodeURIComponent(varpg_name),
							check : 1
						},
						function(data) {
							$("#pg_content textarea").remove();
							$(data)
									.each(
											function(index, pglist) {
												$("#pg_content")
														.append(
																"<textarea readonly='readonly' class='form-control' rows='3' style='width: 250px'>"
																		+ pglist.pg_content
																		+ "</textarea>");
												$("#pg_point").attr("value",
														pglist.pg_point);
												$("#pg_num").attr("value",
														pglist.pg_num);
											});
						});
	}
	
	/* 예약할 시설의 '날짜' 시설타입(pg_type), 시설호수(pg_name)을 바탕으로 Ajax JSON을 활용하여 데이터를 가지고 와서
	   timecode를 바탕으로 예약시간 선택 창을 생성한다.
	*/
	function goSelectTime() {
		var vardate2 = this.vardate;
		var varpg_num = document.getElementById('pg_num').value;
		var varpg_type = document.getElementById('pg_type').value;
		
		// 선택 날짜와 시설번호.
		$("#spgm_date").attr("value",vardate2);
		$("#spg_num").attr("value",varpg_num);

		// 디버깅용.	
		//alert(vardate2 + "," + varpg_type + "," + varpg_num);

		$.getJSON("/HarangProject/ajax?cmd=selectPg", {
			pg_type : encodeURIComponent(varpg_type),
			pg_num : encodeURIComponent(varpg_num),
			pgm_date : vardate2,
			check : 2
			},
			
			function(data) {
			$(data).each(
					function(index, pglist) {
						var timecode = pglist.pgm_timecode;
						$("#reser02").slideUp();
						$("#reser02").slideDown();

						//타임코드 버튼 초기화.
						for (i = 0; i < 13; i++) {
							$("#l" + i).attr("class", "btn btn-primary");

						}

						var arraytimecode = timecode.split("");
						for (i = 0; i < 13; i++) {
							if (arraytimecode[i] == 1) {
								$("#l" + i).attr("class", "btn btn-danger")
										.attr("disabled", "disabled");

							}
						}

					});

		});

	}

	function insertDate() {
		return date.format();
	}

	// 시간 예약 선택시 active값을 바탕으로 timecode를 만든다.
	function countTime() {
		
		$("#reser03").slideDown();
		var timecode = "A";
		var count = 0;
		var pg_point = $("#pg_point").val();
		
		for (var i = 0; i < 13; i++) {
			
			 if ($("#l" + i).attr("class") == "btn btn-primary active") {
				timecode += "1";
				count++;
			} 
			else{
				timecode += "0";
			}
			
		}
		
		var checkpoint = count * pg_point;
		var mypoint = "${member.m_point}";
		var beforepoint = mypoint - checkpoint;
		
		// 일단 초기화.
		$("#count").attr("value"," ");
		$("#mypoint").attr("value"," ");
		$("#checkpoint").attr("value"," ");
		$("#beforepoint").attr("value"," ");
		
		// 폼태그속 hidden을 통해 전송할 타임코드
		$("#spgm_timecode").attr("value",timecode);
		$("#minuspoint").attr("value",checkpoint);
		
		// 사용시간 보내기, 포인트와 합산해서 보내기. 태그로.
		// 포인트 출력 내용.
		$("#count").attr("value",count);
		$("#mypoint").attr("value",mypoint);
		$("#checkpoint").attr("value",checkpoint);
		$("#beforepoint").attr("value",beforepoint);
	}
	
	/*	
	디버깅용 함수.
 	function artest(){
		alert($("#spgm_date").val());
		alert($("#spg_num").val());
		alert($("#spgm_timecode").val());
	}  */
</script>