<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<%@ include file="../include/header.jsp" %>
<!-- 페이지 헤드 라인 : 제목 -->
 <head>
     <title>학식 메뉴 조회</title>
     <style type="text/css">
	    .fc-sat{
	       background-color: #D5E5FF;
	       color: #0047C3; 	       
	    }
	    .fc-sun{
	       background-color: #FFDDDD;
	       color: #D71A1A;
	    }  
	    .fc-today{
           background: #D5FFD3 !important;;
           color: #047A00;
        }   
     </style>
</head>   
 
    <div class="content-wrapper">
  <!----------------------------------- 메인페이지 헤더 [작업 제목] ------------------------------------------------------------->
        <section class="content-header">
          <h1>
                         학식 메뉴 조회
            <small>오늘 뭐 먹지? 고민 말고 하랑 레스토랑!</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> 메인</a></li>
            <li><a href="#"> 하랑 레스토랑</a></li>
            <li class="active"> 학식 메뉴 조회</li>
          </ol>
        </section>
 <!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>       
        <!-- 달력 모양 -->
        <section class="content">
          <div class="row">
            <!-- 달력의 크기 조정 -->
            <div class="col-md-12">
            
            <!-- 달력 메뉴 판 보이기 -->
              <div class="box box-primary">
                <div class="box-body no-padding">
                  <!-- THE CALENDAR -->
                  <div id="calendar"></div>
                </div><!-- /.box-body -->
              </div><!-- /. box -->
              
            <!-- 메뉴 판 클릭 후 메뉴 상세 정보 팝업 -->  
             <!-- 리스트 사용시  -->
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">식권 구매</h3>
                   <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
                </div><!-- /.box-header -->
                 <!-- form 시작 -->
                <form role="form">
                
                <div class="box-body">
                
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-location-arrow"></i> 메뉴 제목</span>
                    <input type="text" name="m_addr1" class="form-control" value="스시" readonly="readonly">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-location-arrow"></i> 메뉴 판매일</span>
                    <input type="text" name="m_addr1" class="form-control" value="2017-06-22" readonly="readonly">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-location-arrow"></i> 메뉴 상세 정보</span>
                    <textarea class="form-control" rows="10" readonly="readonly">
  [3일간의 일식 파티! : 한정 메뉴] 
    새우 초밥
    광어 초밥
    연어 초밥
    참치 초밥
    군함 말이
    오징어 초밥
    한치 초밥
    등등.... 30가지 초밥을 골라 먹을 수 있음
                       
    원산지 : 모두 국내산                             
                    </textarea>
                   </div>
                    <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-location-arrow"></i> 식권  구매 포인트</span>
                    <input type="text" name="m_addr1" class="form-control" value="6000" readonly="readonly">
                    <span class="input-group-addon bg-gray"> 포인트</span>
                  </div>
                  <br>
                </div><!-- /.box-body -->
                 <div class="box-footer clearfix" align="right">
                      <input type="submit" class="btn btn-gray" value="닫기">
                      <input type="submit" class="btn btn-success" value="구매">
                </div>
                </form>
              </div><!-- /.box -->
              
              
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

          //여기서  ajax 처리함  
          dayClick: function(date, jsEvent, view) {

              //스크립트로 인벤트 처리 합니다. 
        	  alert('클릭한 날짜: ' + date.format());
        	  
          },
          locale: 'kr',
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
          dayNames:["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
          dayNamesShort:["일","월","화","수","목","금","토"],
          allDayDefault:false,
          editable: false,
//달력에 글자 입력 가능
//DB에 값을 접근합니다.
          events : [
              {
              title : '순대국',
              start : '2017-06-02',
              allDay : true
              },
              {
              title : '립아이스테이크',
              start : '2017-06-05',
              allDay : true
              },
              {
              title : '유린기',
              start : '2017-06-06',
              allDay : true
              },
              {
              title : '청라면',
              start : '2017-06-07',
              allDay : true
              },
              {
              title : '김치찌개',
              start : '2017-06-08',
              allDay : true
              },
              {
              title : '철판 볶음',
              start : '2017-06-09',
              allDay : true
              },
              {
              title : '삼계탕',
              start : '2017-06-12',
              allDay : true
              },
              {
              title : '알비오올리오',
              start : '2017-06-13',
              allDay : true
              },
              {
              title : '순대볶음',
              start : '2017-06-14',
              allDay : true
              },
              {
              title : '수제 햄버거',
              start : '2017-06-15',
              allDay : true
              },
              {
              title : '감자탕',
              start : '2017-06-16',
              allDay : true
              },
              {
              title : '갈비탕',
              start : '2017-06-19',
              allDay : true
              },
              {
              title : '스키야키',
              start : '2017-06-20',
              allDay : true
              },
              {
              title : '오야코동',
              start : '2017-06-21',
              allDay : true
              },
              {
              title : '스시',
              start : '2017-06-22',
              allDay : true
              },
              {
              title : '굴라시',
              start : '2017-06-23',
              allDay : true
              },
              {
              title : '퐁듀',
              start : '2017-06-26',
              allDay : true
              },
              {
              title : '닭도리탕',
              start : '2017-06-27',
              allDay : true
              },
              {
              title : '안동찜닭',
              start : '2017-06-28',
              allDay : true
              },
              {
              title : '탕수육',
              start : '2017-06-29',
              allDay : true
              },
              {
              title : '유린기',
              start : '2017-06-30',
              allDay : true
              }
           ],
           //입력 글자 뒷 배경 색
           eventColor: '#F9FFAB',
           //입력 글자 색
           eventTextColor: '#000000'
        });
      });
    </script>