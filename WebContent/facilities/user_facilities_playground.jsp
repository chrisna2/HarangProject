<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jsp"%>
<!-- 해더  삽입  [지우지마세여]------------------------------------------------------------------------------------------------->
<!-- 페이지 헤드 라인 : 제목 -->
<head>
<title>운동장 예약(사용자)</title>
</head>
<!-- 메인 페이지 구역 , 즉 작업 구역 -->
<div class="content-wrapper">
	<!----------------------------------- 메인페이지 헤더 [작업 제목] ------------------------------------------------------------->
	<section class="content-header">
		<h1>
			운동장 예약 <small>[현재 입력할 내용이 없습니다.]</small>
		</h1>
		<ol class="breadcrumb">
			<!-- 페이지 기록 : 메인에서 부터 현재 페이지 까지의 경로 나열 -->
			<li><a href="#"><i class="fa fa-dashboard"></i> 메인</a></li>
			<li class="active">운동장 예약[현재 입력할 내용이 없습니다.]</li>
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
				<div class="box box-primary">
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
					<div class="box-body">
					
						<!-- 사용자 편의를 위한.. 운동장 표시 -->
						<div class="row">
							<div class="col-md-4">
								<label>시설종류</label> <input type="text" class="form-control"
									placeholder="넌 운동장을 골랐어." disabled>
							</div>
						
						 <!-- 시설명(첫번째 카테고리) 선택 -->
						 <div class="form-group col-md-4">
	                  		<label>시설명</label>
	                  		<select class="form-control">
		                    	<option>족구장</option>
		                    	<option>축구장</option>
		                    	<option>농구장</option>
		                    	<option>테니스장</option>
	                    	</select>
	                	</div>
	                	
	                	<!-- 호수(두번째 카테고리) 선택 -->
	                	<div class="form-group col-md-4">
	                  		<label>호수</label>
	                  		<select class="form-control">
		                    	<option>중앙회관옆</option>
		                    	<option>대운동장</option>
		                    	<option>소운동장</option>
		                    	<option>공과대학옆</option>
	                    	</select>
	                	</div>
	                	</div>
					</div>
					
					<!-- Box footer -->
					<div class="box-footer">
						<div class="row" align="center">
							<div class="col-md-3 btn-group"></div>
							<div class="col-md-3 btn-group">
								<input type="button" class="btn btn-block btn-primary"
									value="확인">
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

		<!-- faclities.select -->
		<div class="row">
			<div class="col-md-12">
				<!-- faclities.select.box-->
				<div class="box box-primary">
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
						<div class="row">

							<div class="col-md-4">
								<label>시설종류</label> <input type="text" class="form-control"
									placeholder="운동장 " style="width: 150px" disabled>
							</div>
							
							<div class="col-md-4">
								<label>시설명</label> <input type="text" class="form-control"
									placeholder="족구장" style="width: 150px" disabled>
							</div>
							
							<div class="col-md-4">
								<label>호수</label> <input type="text" class="form-control"
									placeholder="대운동장" style="width: 150px" disabled>
							</div>

						</div>
						<br>
						
						<!-- 시설 정보 두번째줄 -->
						<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<label>시설정보</label>
									<textarea class="form-control" rows="3" placeholder="운동장"
										disabled style="width: 250px">
                  						</textarea>
								</div>
							</div>
							<div class="col-md-4">
								<label>대여 포인트</label> <input type="text" class="form-control"
									placeholder="100포인트" style="width: 150px" disabled>
							</div>
						</div>

						<!-- 날짜 선택줄 -->
						<div class="row">
							<div class="col-md-12" align="center">
								<label>시간 선택</label>
							</div>
							<div class="col-md-12" align="center">

								<div class="btn-group" data-toggle="buttons">
									<label class="btn btn-warning active"> <input
										type="checkbox" autocomplete="off"> 8시
									</label> <label class="btn btn-primary"> <input type="checkbox"
										autocomplete="off"> 9시
									</label> <label class="btn btn-primary"> <input type="checkbox"
										autocomplete="off"> 10시
									</label> <label class="btn btn-primary"> <input type="checkbox"
										autocomplete="off"> 11시
									</label> <label class="btn btn-primary"> <input type="checkbox"
										autocomplete="off"> 12시
									</label> <label class="btn btn-primary"> <input type="checkbox"
										autocomplete="off"> 13시
									</label> <label class="btn btn-primary"> <input type="checkbox"
										autocomplete="off"> 14시
									</label> <label class="btn btn-primary"> <input type="checkbox"
										autocomplete="off"> 15시
									</label> <label class="btn btn-primary"> <input type="checkbox"
										autocomplete="off"> 16시
									</label> <label class="btn btn-primary"> <input type="checkbox"
										autocomplete="off"> 17시
									</label> <label class="btn btn-primary"> <input type="checkbox"
										autocomplete="off"> 18시
									</label> <label class="btn btn-primary"> <input type="checkbox"
										autocomplete="off"> 19시
									</label> <label class="btn btn-primary"> <input type="checkbox"
										autocomplete="off"> 20시
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
									value="확인">
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
				<div class="box box-primary">
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
					<div class="box-body">
						<div class="row ">
							<!-- 사용 시간 -->
							<div class="col-md-3">
								<label>사용시간</label> <input type="text" class="form-control"
									placeholder="17시간" style="width: 150px" disabled>
							</div>
							<!-- 보유 포인트 -->
							<div class="col-md-3">
								<label>보유 포인트</label> <input type="text" class="form-control"
									placeholder="30000" style="width: 150px" disabled>
							</div>
							<!-- 차감 포인트 -->
							<div class="col-md-3">
								<label>차감 포인트</label> <input type="text" class="form-control"
									placeholder="15000" style="width: 150px" disabled>
							</div>

							<!-- 결제 후 포인트-->
							<div class="col-md-3">
								<label>결제후 잔여 포인트</label> <input type="text"
									class="form-control" placeholder="15000" style="width: 150px"
									disabled>
							</div>
						</div>
					</div>

					<!-- 최종결제 box-footer -->
					<div class="box-footer">
						<div class="row" align="center">
							<div class="col-md-3 btn-group"></div>
							<div class="col-md-3 btn-group">
								<input type="button" class="btn btn-block btn-primary"
									value="결제">
							</div>
							<div class="col-md-3 btn-group">
								<input type="button" class="btn btn-block  btn-primary"
									value="다시 선택">
							</div>
						</div>
					</div>

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
	$(function() {

		/* initialize the calendar
		 -----------------------------------------------------------------*/
		//현재 년 월 일 불러 오기
		var date = new Date();
		var d = date.getDate(), m = date.getMonth(), y = date.getFullYear();

		$('#calendar').fullCalendar(
				{
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
							"<font color='blue'>토요일</font>" ],
					dayNamesShort : [ "일", "월", "화", "수", "목", "금", "토" ],
					editable : true
				});
	});
</script>