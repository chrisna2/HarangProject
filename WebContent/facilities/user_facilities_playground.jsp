<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/header.jsp" %>
<!-- 해더  삽입  [지우지마세여]------------------------------------------------------------------------------------------------->
<!-- 페이지 헤드 라인 : 제목 -->
<head>
     <title>운동장 예약</title>
</head>
	  <!-- 메인 페이지 구역 , 즉 작업 구역 -->
      <div class="content-wrapper">
<!----------------------------------- 메인페이지 헤더 [작업 제목] ------------------------------------------------------------->
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
		
		<!-- faclities.select -->
		<div class="row">
			<div class="col-md-12">
				<!-- faclities.select.box-->
				<div class="box">
					<!-- faclities.select.box header -->
					<div class="box-header">
						<h3 class="box-title">예약 상세 선택</h3>
						<div class="box-tools pull-right">
							<button class="btn btn-box-tool" data-widget="collapse">
								<i class="fa fa-minus"></i>
							</button>
						</div>
					
					</div>
					<!-- faclities.select.box body -->
					<div class="box-body">
						<div class="row">
							<div class="col-md-6">11111</div>
							<div class="col-md-6">11111</div>
						</div>
						<div class="row">
							<div class="col-md-12">2222</div>
						</div>
					</div>
					<!-- faclities.select.box footer  -->
					<div class="box-footer">
						<div class="row">
							<div class="col-md-6">33333</div>
							<div class="col-md-6">33333</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- /.content -->
<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
        <section class="content">
          <!-- 세로 길이 수정 -->
          <div class="row">
           <!-- 너비 사이즈 수정  : col-->
           <div class="col-md-12">
        
        
        



              </div><!-- /.col -->
           </div><!-- /.row -->
        </section><!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->        
      </div><!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->
      
<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------> 
<%@ include file="../include/footer.jsp" %>

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