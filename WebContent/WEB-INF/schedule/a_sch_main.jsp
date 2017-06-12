<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<!-- 페이지 헤드 라인 : 제목 -->
<head>
<%@ include file="../include/a_header.jsp"%>
<title>달력 기본 값 페이지</title>
</head>

<div class="content-wrapper">
	<!----------------------------------- 메인페이지 헤더 [작업 제목] ------------------------------------------------------------->
	<section class="content-header">
		<h1>
			달력 기본값 <small>달력 조정</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> 메인</a></li>
			<li class="active">달력 기본값</li>
		</ol>
	</section>
	<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
	<!-- 달력 모양 -->
	<section class="content">
		<div class="row">
			<!-- 달력의 크기 조정 -->
			<div class="col-md-9">



				<div class="box box-primary">
					<div class="box-body no-padding">
						<!-- THE CALENDAR -->
						<div id="calendar"></div>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /. box -->



			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</section>
	<!-- /.content -->
	<!-- 여기까지 달력 -->

	<!--  여기부터 본문 -->

	<section class="content">
		<!-- 세로 길이 수정 -->
		<div class="row">
			<!-- 너비 사이즈 수정  : col-->
			<div class="col-md-9">
				<!-- Default box -->
				<div align="center">

					<button class="btn btn-primary" data-toggle="collapse"
						data-widget="collapse" title="Collapse" data-target="#schcon">
						본문 보기/닫기
					</button>
				</div>
				<br>
				<br>
				<div class="box" id="schcon">
					<div class="box-header with-border">
						<h1 class="box-title">국문인의 밤</h1>

					</div>
					<div class="box-body">

						참가신청 기간 : xx월 xx일 ~ yy월 yy일<br> 행사 기간 : zz월 zz일 ~ zz월 ZZ일 <br>
						지급 포인트 : 1000 <br>
						<hr />
						하는 온갖 과실이 어디 있으랴? 이상! 우리의 청춘이 가장 많이 품고 있는 이상! 이것이야말로 무한한 가치를 가진
						것이다 사람은 크고 작고 간에 이상이 있음으로써 용감하고 굳세게 살 수 있는 것이다 석가는 무엇을 하는 온갖 과실이
						어디 있으랴? 이상! 우리의 청춘이 가장 많이 품고 있는 이상! 이것이야말로 무한한 가치를 가진 것이다 사람은 크고
						작고 간에 이상이 있음으로써 용감하고 굳세게 살 수 있는 것이다 석가는 무엇을 하는 온갖 과실이 어디 있으랴? 이상!
						우리의 청춘이 가장 많이 품고 있는 이상! 이것이야말로 무한한 가치를 가진 것이다 사람은 크고 작고 간에 이상이
						있음으로써 용감하고 굳세게 살 수 있는 것이다 석가는 무엇을 하는 온갖 과실이 어디 있으랴? 이상! 우리의 청춘이 가장
						많이 품고 있는 이상! 이것이야말로 무한한 가치를 가진 것이다 사람은 크고 작고 간에 이상이 있음으로써 용감하고 굳세게
						살 수 있는 것이다 석가는 무엇을 하는 온갖 과실이 어디 있으랴? 이상! 우리의 청춘이 가장 많이 품고 있는 이상!
						이것이야말로 무한한 가치를 가진 것이다 사람은 크고 작고 간에 이상이 있음으로써 용감하고 굳세게 살 수 있는 것이다
						석가는 무엇을 하는 온갖 과실이 어디 있으랴? 이상! 우리의 청춘이 가장 많이 품고 있는 이상! 이것이야말로 무한한
						가치를 가진 것이다 사람은 크고 작고 간에 이상이 있음으로써 용감하고 굳세게 살 수 있는 것이다 석가는 무엇을

					</div>
					<!-- /.box-body -->
					<div class="box-footer ">

						<button type="submit" class="btn btn-danger">삭제</button>

					</div>
					<!-- /.box-footer-->
				</div>
				<!-- /.box -->

				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">학사 일정</h3>
								<div class="box-tools">
									<div class="input-group">

										<button type="button" class="btn btn-primary pull-right">일정등록</button>
									</div>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body table-responsive no-padding">
								<table class="table table-hover">
									<tr>
										<th></th>
										<th>번호</th>
										<th>학과</th>
										<th>시작일</th>
										<th>제목</th>
										<th>참가학년</th>
										<th align="center">포인트 지급</th>

									</tr>
									<tr>
										<td><input type="checkbox" /></td>
										<td>183</td>
										<td>[국문과]</td>
										<td>2017년 6월 8일</td>
										<td><a href="#" class="" style="color: black">국문인의 밤</a></td>
										<td>전체</td>
										<td align="center">Y</td>

									</tr>
									<tr>
										<td><input type="checkbox" /></td>
										<td>219</td>
										<td>[국문과]</td>
										<td>2017년 4월 30일</td>
										<td><a href="#" class="" style="color: black">국문과
												체육대회</a></td>
										<td>전체 학년</td>
										<td align="center">Y</td>

									</tr>
									<tr>
										<td><input type="checkbox" /></td>
										<td>657</td>
										<td>[전체]</td>
										<td>2017년 5월 20일</td>
										<td><a href="#" class="" style="color: black">성공취업
												세미나</a></td>
										<td>3,4 학년</td>
										<td align="center">Y</td>

									</tr>
									<tr>
										<td><input type="checkbox" /></td>
										<td>175</td>
										<td>[전체]</td>
										<td>2017년 3월 8일</td>
										<td><a href="#" class="" style="color: black">신입생을 위한
												도서관 이용 교육</a></td>
										<td>1 학년</td>
										<td align="center">Y</td>

									</tr>
								</table>
							</div>
							<!-- /.box-body -->

							<div class="box-footer clearfix">


								<button type="button" class="btn btn-danger pull-left">삭제</button>



								<ul class="pagination pagination-sm no-margin pull-right">
									<li><a href="#">&laquo;</a></li>
									<li><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">&raquo;</a></li>
								</ul>

								<div class="input-group">
									<input type="text" name="table_search"
										class="form-control input-sm pull-right" style="width: 150px;"
										placeholder="Search" /> <select
										class="form-control input-sm pull-right" style="width: 150px;">
										<option></option>
										<option>포인트 지급</option>
										<option>학과</option>
										<option>제목</option>

									</select>
									<div class="input-group-btn">
										<button class="btn btn-sm btn-default">
											<i class="fa fa-search"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
						<!-- /.box -->
					</div>
				</div>










			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</section>
	<!-- /. 작업 공간 끝! -->
	<!--  본문 끝 -->
	<!-- 푸터(footer) 삽입 [지우지 마세여] -------------------------------------------------------------------------------------->
</div>
<!-- /.content-wrapper -->
<%@ include file="../include/footer.jsp"%>

<!-- ★★★Ajax를 배우면 이해 할 수 있는 곳 : 여기에 데이터를 삽입합니다. -->
<script type="text/javascript">
      $(function () {

        /* initialize the calendar
         -----------------------------------------------------------------*/
         //현재 년 월 일 불러 오기
        var date = new Date();
        var d = date.getDate(),
            m = date.getMonth(),
            y = date.getFullYear();
        
        $('#calendar').fullCalendar({
          header: {
            left: 'prev,next',
            center: 'title',
            right: 'today'
          },
          buttonText: {
            today: '오늘날짜',
            month: '월별',
            week: '주별',
            day: '일별'
          },
          titleFormat: {
            month: 'YYYY년 MMMM'
          },
          monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
          monthNamesShort:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
          dayNames:["일요일","월요일","화요일","수요일","목요일","금요일","<font color='blue'>토요일</font>"],
          dayNamesShort:["일","월","화","수","목","금","토"],
          editable: true
        });
      });
    </script>