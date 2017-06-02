<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- daterange picker -->
<link href="../plugins/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />
<%@ include file="../include/header_a.jsp" %>

<!-- 해더  삽입  [지우지마세여]------------------------------------------------------------------------------------------------->
<!-- 페이지 헤드 라인 : 브라우저 제목 -->
<head>
     <title>신입생 편입생 등록</title>
</head>
<!-- 메인 페이지 구역 , 즉 작업 구역 -->
      <div class="content-wrapper">
<!----------------------------------- 메인페이지 헤더 [작업 제목] ------------------------------------------------------------->
        <section class="content-header">
          <h1>
                신입생/편입생 등록
          </h1>
            <ol class="breadcrumb">
          <!-- 페이지 기록 : 메인에서 부터 현재 페이지 까지의 경로 나열 -->
            <li><a href="#"><i class="fa fa-dashboard"></i> 관리자 메인</a></li>
            <li><a href="#"> 사이트 관리</a></li>
            <li><a href="#"> 회원 관리</a></li>
            <li class="active"> 신입생/편입생 등록</li>
          </ol>
        </section>
<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
        <section class="content">
          <!-- 세로 길이 수정 -->
          <div class="row">
           <!-- 너비 사이즈 수정  : col-->
           <div class="col-md-10">
           
             <!-- Input addon -->
              <div class="box box-black">
                <div class="box-header">
                  <h3 class="box-title">신규 신입생/편입생 정보</h3>
                </div>
                
                <!-- form 시작 -->
                <form role="form">
                
                <div class="box-body">
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-smile-o"></i> 이름</span>
                    <input type="text" name="m_name" class="form-control" value="나현기" required="required">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-sort-numeric-desc"></i> 학번</span>
                    <select class="form-control" required="required">
                        <option>2017 [신입생]</option>
                        <option>2016 [2학년 편입]</option>
                        <option>2015 [3학년 편입]</option>
                    </select>
                    <span class="input-group-addon"> - </span>
                    <select class="form-control" required="required">
                        <option>01:국문학과</option>
                        <option>02:수학과</option>
                        <option>03:컴퓨터 공학과</option>
                        <option>04:경영학과</option>
                        <option>05:정보통신학과</option>
                    </select>
                    <span class="input-group-addon"> - </span>
                    <input type="text" name="m_num" class="form-control" value="055 [최종 번호로 자동 입력] [수동입력 가능]" required="required">
                    <span class="input-group-btn">
                      <button class="btn btn-warning btn-flat" type="button">중복 학번 확인</button>
                    </span>
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-sitemap"></i> 학과</span>
                    <input type="text" name="m_dept" class="form-control" value="국어국문학과 [학번 입력시 자동 추가] [불필요하면 삭제 가능]" required="required">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-calendar"></i> 생년월일1</span>
                    <input type="text" class="form-control pull-right" id="date" required="required"/>
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-calendar"></i> 생년월일2</span>
                    <input type="text" class="form-control pull-right" required="required" value="그냥 주민등록 번호 앞자리만 입력하면 자동으로 초기 비밀번호와 생년월일이 입력되는 구조로 가도 좋을 것 같다."/>
                  </div>
                  <br>
                </div><!-- /.box-body -->
                
                 <div class="box-footer" align="right">
                    <input type="button" class="btn" value="뒤로가기">
                    <input type="reset" class="btn" value="리셋">
                    <input type="submit" class="btn btn-primary" value="등록">
                </div>
                </form>
              </div><!-- /.box -->
              <!-- 페이지 단위 -->
             </div><!-- /.col -->
           </div><!-- /.row -->
        </section><!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->        
      </div>
<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------> 
 <!-- date-range-picker -->
<%@ include file="../include/footer.jsp" %>
    <script src="../plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
    <script>
    $(function() {
        $( "#date" ).datepicker({
        });
    });
    </script>