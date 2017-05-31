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
        <!-- 여기까지 달력 -->
        
        <!--  여기부터 본문 -->
        
        <section class="content">
          <!-- 세로 길이 수정 -->
          <div class="row">
           <!-- 너비 사이즈 수정  : col-->
           <div class="col-md-9">
  
        
           <!-- Default box -->
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Title</h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
               
              </div>
            </div>
            <div class="box-body">
              Start creating your amazing application!
            </div><!-- /.box-body -->
            <div class="box-footer">
              Footer
            </div><!-- /.box-footer-->
          </div><!-- /.box -->

    <div class="row">
            <div class="col-xs-12">
              <div class="box">
              <div class="box-header">
                  <h3 class="box-title">하랑 도전 리스트!</h3>
                   <div class="box-tools">
                    <div class="input-group">
                      <input type="text" name="table_search" class="form-control input-sm pull-right" style="width: 150px;" placeholder="Search"/>
                      <select class="form-control input-sm pull-right" style="width: 150px;">
                        <option>도전 번호</option>
                        <option>도전 이름</option>
                        <option>도전 기관</option>
                        <option>도전 보상</option>
                        <option>성공 여부</option>
                      </select>
                      <div class="input-group-btn">
                        <button class="btn btn-sm btn-default"><i class="fa fa-search"></i></button>
                      </div>
                    </div>
                  </div>
                </div><!-- /.box-header -->
                <div class="box-body table-responsive no-padding">
                  <table class="table table-hover">
                    <tr>
                      <th>ID</th>
                      <th>User</th>
                      <th>Date</th>
                      <th>Status</th>
                      <th>Reason</th>
                    </tr>
                    <tr>
                      <td>183</td>
                      <td>John Doe</td>
                      <td>11-7-2014</td>
                      <td><span class="label label-success">Approved</span></td>
                      <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                    </tr>
                    <tr>
                      <td>219</td>
                      <td>Alexander Pierce</td>
                      <td>11-7-2014</td>
                      <td><span class="label label-warning">Pending</span></td>
                      <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                    </tr>
                    <tr>
                      <td>657</td>
                      <td>Bob Doe</td>
                      <td>11-7-2014</td>
                      <td><span class="label label-primary">Approved</span></td>
                      <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                    </tr>
                    <tr>
                      <td>175</td>
                      <td>Mike Doe</td>
                      <td>11-7-2014</td>
                      <td><span class="label label-danger">Denied</span></td>
                      <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                    </tr>
                  </table>
                </div><!-- /.box-body -->
                
                  <div class="box-footer clearfix">
                  <ul class="pagination pagination-sm no-margin pull-right">
                    <li><a href="#">&laquo;</a></li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">&raquo;</a></li>
                  </ul>
                </div>
              </div><!-- /.box -->
            </div>
          </div>


		







              </div><!-- /.col -->
           </div><!-- /.row -->
        </section><!-- /. 작업 공간 끝! -->
        <!--  본문 끝 -->
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