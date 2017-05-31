<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<%@ include file="../include/header.jsp" %>
<!-- 페이지 헤드 라인 : 제목 -->
 <head>
     <title>달력 기본 값 페이지</title>
</head>   
 
    <div class="content-wrapper">
  <!----------------------------------- 메인페이지 헤더 [작업 제목] ------------------------------------------------------------->
        <section class="content-header">
          <h1>
                         달력 기본값
            <small>달력 조정</small>
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
                </div><!-- /.box-body -->
              </div><!-- /. box -->
              
              
              
            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->
<!-- 푸터(footer) 삽입 [지우지 마세여] --------------------------------------------------------------------------------------> 
      </div><!-- /.content-wrapper -->
<%@ include file="../include/footer.jsp" %>

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