<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/header.jsp" %>
<!-- 해더  삽입  [지우지마세여]------------------------------------------------------------------------------------------------->
<!-- 페이지 헤드 라인 : 제목 -->
<head>
     <title>학비 포인트 제로!</title>
</head>
	  <!-- 메인 페이지 구역 , 즉 작업 구역 -->
      <div class="content-wrapper">
<!----------------------------------- 메인페이지 헤더 [작업 제목] ------------------------------------------------------------->
        <section class="content-header">
          <h1>
             	학비 포인트 제로!
            <small>당신이 쌀은 포인트로 다음학기 등록금을 지워 보세요!</small>
          </h1>
          <ol class="breadcrumb">
          <!-- 페이지 기록 : 메인에서 부터 현재 페이지 까지의 경로 나열 -->
            <li><a href="#"><i class="fa fa-dashboard"></i> 메인</a></li>
            <li><a href="#"> 마이페이지</a></li>
            <li class="active"> 학비 포인트 제로!</li>
          </ol>
        </section>
<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
        <section class="content">
          <!-- 세로 길이 수정 -->
          <div class="row">
           <!-- 너비 사이즈 수정  : col-->
           <div class="col-md-9">
        
              <div class="info-box bg-black-gradient">
                <span class="info-box-icon"><i class="ion ion-ios-pricetag-outline"></i></span>
                <div class="info-box-content">
                  <span class="info-box-text">당신의 다음 학기 학비</span>
                  <span class="info-box-number">2,000,000 만원</span>
                  <div class="progress">
                    <div class="progress-bar" style="width: 66%"></div>
                  </div>
                  <span class="progress-description">
                                        학비 제로 까지 66% 남았습니다!
                  </span>
                </div><!-- /.info-box-content -->
              </div><!-- /.info-box -->
        
            <div class="box box-black">
                <div class="box-header bg-black-gradient">
                  <h3 class="box-title">당신의 포인트!</h3>
                </div>
                
                <!-- form 시작 -->
                <form role="form">
                
                <div class="box-body">
                  <div class="input-group">
                    <span class="input-group-addon bg-black-gradient"><i class="fa fa-money"></i> 보유 포인트</span>
                    <input type="text" name="c_point" class="form-control" value="999999" readonly="readonly">
                    <span class="input-group-addon bg-black-gradient">포인트</span>
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon bg-black-gradient"><i class="fa fa-money"></i> 등록금 감면</span>
                    <input type="text" name="c_point" class="form-control" placeholder="당신의 포인트를 입력 하세요" required="required">
                    <span class="input-group-addon bg-black-gradient">포인트</span>
                  </div>
                  <br>
                 </div><!-- /.box-body -->
                
                  <div class="box-footer bg-black-gradient" align="center">
                    <input type="submit" class="btn btn-default" value="★ ☆ ★ ☆ ★ 학비 포인트 감면 ★ ☆ ★ ☆ ★">
                </div>
                </form>
              </div><!-- /.box -->


              </div><!-- /.col -->
           </div><!-- /.row -->
        </section><!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->        
      </div><!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->
      
<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------> 
<%@ include file="../include/footer.jsp" %>