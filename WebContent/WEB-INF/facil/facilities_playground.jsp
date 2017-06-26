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
									class="form-control" placeholder="예약한 날짜가 여기로 들어와야 한다."
									disabled>
							</div>

							<!-- 시설명(첫번째 카테고리) 선택 -->
							<div class="form-group col-md-4">
								<label>시설명</label> <select class="form-control" name="pg_type"
									id="pg_type" onchange="selectfacil()">

									<option>시설을 선택하세요.</option>

									<c:forEach items="${list}" var="s">
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
								<label>대여 포인트</label> <input id="pg_point" type="text" class="form-control"
									readonly="readonly" style="width: 150px">
							</div>
						</div>
					</div>
					</form>

					<!-- Box footer -->
					<div class="box-footer">
						<div class="row" align="center"></div>
					</div>

				</div>
			</div>
		</div>

		<!-- faclities.select -->
		<div class="row">
			<div class="col-md-12">
				<!-- faclities.select.box-->
				<div class="box box-primary collapsed-box" id="reser02">
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
				<div class="box box-primary collapsed-box" id="reser03">
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
					<div class="box-body ">
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
		  dayClick: function(date, jsEvent, view) {
				// 이날짜를 바탕으로 쿼리문을 날려서 예약결제로 넘어가도록 한다.
        	    document.getElementById('Reser').setAttribute( 'placeholder',date.format());
      			
				$("#reser01").slideUp();
				$("#reser01").slideDown();
				
              }
        });
        
        
        
       $("#closeup").click(function(){
    	   $("#menuinfobox").slideUp();
       });

      });
      
      
      function selectfacil(){
			
    	   	var wpg_type = document.getElementById('pg_type').value;
			 $.getJSON("/HarangProject/ajax?cmd=selectPg",
                   {pg_type:encodeURIComponent(wpg_type)},
                   function(data){
                       $("#pg_name option").remove();
                       $("#pg_name").append("<option>호수를 입력하세요.</option>");
                       $(data).each(function(index, pglist){
                           $("#pg_name").append("<option value='"+pglist.pg_name+"'>"+pglist.pg_name+"</option>");
                         
                    });
                });
		}
      
       function select02(){
			 var varpg_type = document.getElementById('pg_type').value;    	  
    	  	 var varpg_name = select09.pg_name.value;
    	  	
    	  	 $.getJSON("/HarangProject/ajax?cmd=selectPg",
                 {pg_type:encodeURIComponent(varpg_type),pg_name:encodeURIComponent(varpg_name),check:1},
                 function(data){
                 $("#pg_content textarea").remove();
                 $(data).each(function(index, pglist){
                 	$("#pg_content").append("<textarea readonly='readonly' class='form-control' rows='3' style='width: 250px'>"
              	 	+ pglist.pg_content
              	 	+"</textarea>");
                 	$("#pg_point").attr("value", pglist.pg_point);
                 });
              });
		}      
      
      	function insertDate(){
      		return date.format();
      	}
      	
      	


    </script>