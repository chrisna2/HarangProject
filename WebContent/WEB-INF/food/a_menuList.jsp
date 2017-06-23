<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<%@ include file="../include/a_header.jsp" %>
<!-- 페이지 헤드 라인 : 제목 -->
 <head>
     <title>학식 메뉴 조회</title>
<c:if test="${result eq 'update'}">
    <script type="text/javascript">
    alert("해당 메뉴를 수정햇습니다.");
    //새로 접속 해줘야 하는 이유.. forward에 작업 기록이 남는다.
    location.href = "/HarangProject/food?cmd=Amenu";
    </script>
</c:if>   
<c:if test="${result eq 'delete'}">
    <script type="text/javascript">
    alert("해당 메뉴를 삭제 했습니다.");
    location.href = "/HarangProject/food?cmd=Amenu";
    </script>
</c:if>
<c:if test="${result eq 'insert'}">
    <script type="text/javascript">
    alert("해당 날짜에 해당 메뉴를 등록했습니다.");
    location.href = "/HarangProject/food?cmd=Amenu";
    </script>
</c:if>
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
                         학식 메뉴 등록 수정
          </h1>
          <br>
          <button id="newMenu" class="btn btn-sm btn-primary col-md-9">신규 메뉴 등록</button>
          <br>
          <br>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> 메인</a></li>
            <li><a href="#"> 하랑 레스토랑 관리</a></li>
            <li class="active"> 학식 메뉴 등록 수정</li>
          </ol>
        </section>
 <!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>       
        <!-- 달력 모양 -->
        <section class="content">
          <div class="row">
            <!-- 달력의 크기 조정 -->
            <div class="col-md-9">
            
             <!-- 리스트 사용시  -->
              <div class="box" id="inputMenu" hidden="hidden">
                <div class="box-header">
                  <h3 class="box-title">신규 메뉴 등록</h3>
                   <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
                </div><!-- /.box-header -->
                 <!-- form 시작 -->
                <form role="form" action="/HarangProject/food
                ?cmd=Amenu" method="post">
                
                <div class="box-body">
                
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-location-arrow"></i> 메뉴 제목</span>
                    <input type="text" name="f_title" class="form-control" required="required">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-location-arrow"></i> 메뉴 판매일</span>
                    <input type="text" name="f_selldate" id="date1" class="form-control" required="required" data-date-format='yyyy-mm-dd'>
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-location-arrow"></i> 메뉴 상세 정보</span>
                    <textarea class="form-control" rows="10" required="required" name="f_content">
                    </textarea>
                   </div>
                    <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-location-arrow"></i> 식권  판매 포인트</span>
                    <input type="text" name="f_point" class="form-control" required="required">
                    <span class="input-group-addon bg-gray"> 포인트</span>
                  </div>
                  <br>
                </div><!-- /.box-body -->
                 <div class="box-footer clearfix" align="right">
                      <input type="hidden" name="check" value="insert">
                      <input type="button" id="closebtn" class="btn btn-gray" value="닫기">
                      <input type="submit" class="btn btn-success" value="메뉴 등록">
                </div>
                </form>
              </div><!-- /.box -->
            
             <!-- 리스트 사용시  -->
              <div class="box" id="updateMenu" hidden="hidden">
                <div class="box-header">
                  <h3 class="box-title">메뉴 수정</h3>
                   <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
                </div><!-- /.box-header -->
                 <!-- form 시작 -->
                <form role="form" action="" name="menuUpdate" id="udpateProc" method="post">
                <div class="box-body">
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-location-arrow"></i> 메뉴 제목</span>
                    <input type="text" name="f_title" class="form-control" required="required">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-location-arrow"></i> 메뉴 판매일</span>
                    <input type="text" name="f_selldate" id="date2" class="form-control" readonly="readonly" data-date-format='yyyy-mm-dd'>
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-location-arrow"></i> 메뉴 상세 정보</span>
                    <textarea class="form-control" name="f_content" rows="10" required="required">
                    </textarea>
                   </div>
                    <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-location-arrow"></i> 식권  판매 포인트</span>
                    <input type="text" name="f_point" class="form-control" required="required">
                    <span class="input-group-addon bg-gray"> 포인트</span>
                  </div>
                  <br>
                </div><!-- /.box-body -->
                 <div class="box-footer clearfix" align="right">
                      <input type="hidden" name="f_num">
                      <input type="hidden" name="check" id="check">
                      <input type="button" id="closebtn" class="btn btn-gray" value="닫기">
                      <input type="button" id="update" class="btn btn-warning" value="메뉴 수정">
                      <input type="button" id="delete" class="btn btn-danger" value="메뉴 삭제">
                </div>
                </form>
              </div><!-- /.box -->
            <!-- 달력 메뉴 판 보이기 -->
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
<!-- 날짜 입력  -->
    <script src="plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
    <script>
    $(function() {
        $( "#date1" ).datepicker({
        	format: 'yyyy-mm-dd',
            autoclose: true
        });
    });
    </script>
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
          events : "/HarangProject/ajax?cmd=food&check=amenu",
           //입력 글자 뒷 배경 색
           eventColor: '#F9FFAB',
           //입력 글자 색
           eventTextColor: '#000000',
           eventMouseover: function(calEvent, jsEvent, view) {
        	   $(this).css('background-color', '#CCFF66');
               $(this).css('cursor','pointer');
           },
           eventMouseout: function(calEvent, jsEvent, view) {
        	   $(this).css('background-color', '#F9FFAB');
           },
           eventClick: function(calEvent, jsEvent, view) {
        	   $("#updateMenu").slideUp();
        	   $("#inputMenu").slideUp();
        	   $("#updateMenu").slideDown();
        	 //날짜를 클릭 했을 때 해당 날짜에 포함된 데이터를 불러 옵니다. 위와 마찬가지..
               $.getJSON("/HarangProject/ajax?cmd=foodinfo",
                       {f_num:calEvent.id},
                       function(data){
                            $("#menuinfobox").slideUp();
                            $("#menuinfobox").slideDown();
                            $(data).each(function(index, flist){
                            	menuUpdate.f_title.value = flist.f_title;
                            	menuUpdate.f_selldate.value = flist.f_selldate;
                            	menuUpdate.f_content.value = flist.f_content;
                            	menuUpdate.f_point.value = flist.f_point;
                            	menuUpdate.f_num.value = flist.f_num;
                       });
             });
           }
        });
        $('#newMenu').click(function() {
            $("#updateMenu").slideUp();
            $("#inputMenu").slideUp();
            $("#inputMenu").slideDown();
        });
        $("#closebtn1").click(function(){
        	$("#inputMenu").slideUp();
        });
        $("#closebtn2").click(function(){
        	$("#updateMenu").slideUp();s
        });

        
        $("#update").click(function() {
            $("#check").val("update");
            $("#udpateProc")
            .attr("action", "/HarangProject/food?cmd=Amenu")
            .submit();
        });
        
        $("#delete").click(function() {
            $("#check").val("delete");
            $("#udpateProc")
            .attr("action", "/HarangProject/food?cmd=Amenu")
            .submit();
        });
        
      });
    </script>