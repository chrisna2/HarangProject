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
     <script type="text/javascript">
     function checkIt() {

    	 var f_point = menuinfo.f_point.value;
    	 var m_point = menuinfo.m_point.value;
    	   
    	  if(0<f_point-m_point){
    		 alert("현재 보유 포인트가 부족합니다. 포인트를 더 벌어 오세요!")
    		      return false;
             } 
         
         var buy = confirm("식권을 구매 하시겠습니까?\n해당 식권은 1인 1매 한정이며 한번 사용하면 재사용 불가 합니다.\n환불은 판매일 2일 전 가능합니다.");
         
         if(buy){
               return true;
         }
         else{
               return false;
         }
       
   }
     </script>
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
            <div class="col-md-9">
            <!-- 리스트 사용시  -->
            <form role="form" name="menuinfo" method="post" action="/HarangProject/food?cmd=ticket_proc" onsubmit="return checkIt()">
              <div class="box" id="menuinfobox" hidden="hidden">
                <div class="box-header">
                  <h3 class="box-title">식권 구매</h3>
                   <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
                </div><!-- /.box-header -->
                 <!-- form 시작 -->
                <div class="box-body">
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-location-arrow"></i> 메뉴 제목</span>
                    <input type="text" name="f_title" class="form-control" value="" readonly="readonly">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-location-arrow"></i> 메뉴 판매일</span>
                    <input type="text" name="f_selldate" class="form-control" value="" readonly="readonly">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-location-arrow"></i> 메뉴 상세 정보</span>
                    <textarea class="form-control" name="f_content" rows="10" readonly="readonly">
                    </textarea>
                   </div>
                    <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-location-arrow"></i> 식권  구매 포인트</span>
                    <input type="text" name="f_point" class="form-control" readonly="readonly">
                    <span class="input-group-addon bg-gray"> 포인트</span>
                  </div>
                  <br>
                </div><!-- /.box-body -->
                 <div class="box-footer clearfix" align="right">
                      <input type="hidden" name="member_id" value="${member.m_id}">
                      <input type="hidden" name="m_point" value="${member.m_point}">
                      <input type="hidden" name="f_num">
                      <input type="button" id="closeup" class="btn btn-gray" value="닫기">
                      <input type="submit" id="buybtn" class="btn btn-success" value="구매">
                </div>
              </div><!-- /.box -->
            </form>
            <!-- 달력 메뉴 판 보이기 -->
              <div class="box box-primary">
                <div class="box-body no-padding">
                  <!-- THE CALENDAR -->
                  <div id="calendar"></div>
                </div><!-- /.box-body -->
              </div><!-- /. box -->
            <!-- 메뉴 판 클릭 후 메뉴 상세 정보 팝업 -->  
            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->
<!-- 푸터(footer) 삽입 [지우지 마세여] --------------------------------------------------------------------------------------> 
      </div><!-- /.content-wrapper -->
      <form id="goprint" method="post">
        <input type="hidden" id="f_num" name="f_num" value="">
      </form>
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
//DB에 값을 접근합니다. ajax 서블릿 commandFactory에 경로를 따로 만들어야 합니다. 
           events : "/HarangProject/ajax?cmd=food&check=umenu",
           //입력 글자 색
           eventTextColor: '#000000',
           eventMouseover: function(calEvent, jsEvent, view) {
        	   if(calEvent.isuse == 'used'){
                   $(this).css('background-color', '#40464f');
                   $(this).css('cursor','pointer');
               }
               else if(calEvent.isuse == 'return'){
                   $(this).css('background-color', '#f4305e');
                   $(this).css('cursor','pointer');
               }
               else if(calEvent.isuse == 'unuse'){
                   $(this).css('background-color', '#4e71fc');
                   $(this).css('cursor','pointer');
               }
               else{
                   $(this).css('background-color', '#CCFF66');
                   $(this).css('cursor','pointer');
               }
           },
           eventMouseout: function(calEvent, jsEvent, view) {
        	   if(calEvent.isuse == 'used'){
                   
                   $(this).css('background-color', '#616872');
               }
               else if(calEvent.isuse == 'return'){

                   $(this).css('background-color', '#ff7f9d');
               }
               else if(calEvent.isuse == 'unuse'){

                   $(this).css('background-color', '#7793ff');
               }
               else{
                   $(this).css('background-color', '#F9FFAB');
               }
           },
           eventClick: function(calEvent, jsEvent, view) {

        	    if(calEvent.isuse == 'used'){
        	        alert("이미 사용한 식권입니다.");
        	        $("#buybtn").hide();
        	        $(".box-title").text("메뉴 조회");
            	}
        	    else if(calEvent.isuse == 'return'){
        	        alert("한번 환불 된 식권은 다시 구매 할수 없습니다.");
        	        $("#buybtn").hide();
        	        $(".box-title").text("메뉴 조회");

            	}
        	    else if(calEvent.isuse == 'unuse'){
        	    	var choice = confirm("이미 구매한 식권입니다. 해당 식권 페이지로 가시겠습니까?");
        	        if(choice){
            	        $("#f_num").val(calEvent.id);
            	        $("#goprint")
            	        .attr("action", "/HarangProject/food?cmd=ticket_print")
            	        .submit();
            	    }
        	        else{
        	        	$("#buybtn").hide();
                        $(".box-title").text("메뉴 조회");
            	    }
            	}
        	    else{
        	    	$("#buybtn").show();
                    $(".box-title").text("식권 구매");
                }
                    //날짜를 클릭 했을 때 해당 날짜에 포함된 데이터를 불러 옵니다. 위와 마찮가지..
                    $.getJSON("/HarangProject/ajax?cmd=foodinfo",
                            {f_num:calEvent.id},
                            function(data){
                                 $("#menuinfobox").slideUp();
                                 $("#menuinfobox").slideDown();
                                 $(data).each(function(index, flist){
                                     menuinfo.f_title.value = flist.f_title;
                                     menuinfo.f_selldate.value = flist.f_selldate;
                                     menuinfo.f_content.value = flist.f_content;
                                     menuinfo.f_point.value = flist.f_point;
                                     menuinfo.f_num.value = flist.f_num;
                            });
                  });
              }
        });
       $("#closeup").click(function(){
    	   $("#menuinfobox").slideUp();
       });

      });
    </script>