<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/header.jsp" %>
<!-- 해더  삽입  [지우지마세여]------------------------------------------------------------------------------------------------->
<!-- 페이지 헤드 라인 : 제목 -->
<head>
     <title>기본 값 페이지</title>
</head>
	  <!-- 메인 페이지 구역 , 즉 작업 구역 -->
      <div class="content-wrapper">
<!----------------------------------- 메인페이지 헤더 [작업 제목] ------------------------------------------------------------->
        <section class="content-header">
          <h1>
             	중고도서 상세페이지
            <small>거래중인 중고도서의 상세정보를 알 수 있습니다.</small>
          </h1>
          <ol class="breadcrumb">
          <!-- 페이지 기록 : 메인에서 부터 현재 페이지 까지의 경로 나열 -->
            <li><a href="#"><i class="fa fa-dashboard"></i> 메인</a></li>
            <li class="active">하랑딘24</li>
            <li class="active">중고도서 상세페이지</li>
          </ol>
        </section>
<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
        <section class="content">
          <!-- 세로 길이 수정 -->
          <div class="row">
           <!-- 너비 사이즈 수정  : col-->
           <div class="col-md-10">
        
        <div class="box box-warning">
            <div class="box-header with-border">
              <h3 class="box-title">중고도서 상세페이지</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <form role="form">
                <!-- text input -->
                <!-- select -->
                <div class="row">
                	<div class="col-sm-12 form-group">
                 	 <label>도서명</label>
                	 <input type="text" class="form-control" placeholder="2017시나공 정보처리기사 필기" readonly="readonly">
             	   </div>
                </div>
 
                <div class="row">
                <div class="col-sm-6 form-group">
                  <label>도서 대표사진</label>
                </div>
                <div class="col-sm-6 form-group">
                 
                  <label>중고도서 거래번호</label>
                  <input type="text" class="form-control" placeholder="1234-56789" readonly="readonly">
                  <label>학번</label>
                  <input type="text" class="form-control" placeholder="20140001" readonly="readonly">
                  <label>저자</label>
                  <input type="text" class="form-control" placeholder="길벗알앤디" readonly="readonly">
                  <label>출판사</label>
                  <input type="text" class="form-control" placeholder="길벗" readonly="readonly">
                  <label>재고수량</label>
                  <input type="text" class="form-control" placeholder="1" readonly="readonly">
                  <label>판매자 희망 포인트</label>
                  <input type="text" class="form-control" placeholder="3000" readonly="readonly">
                  <label>등록날짜</label>
	                      <div class="input-group">
	                      <div class="input-group-addon">
	                        <i class="fa fa-calendar"></i>
	                      </div>
	                      <input type="text" class="form-control pull-right" id="reservation" readonly="readonly"/>
	                    </div>
                  <label>현시각 최고 포인트</label>
                  <input type="text" class="form-control" placeholder="2500" readonly="readonly">
                </div>
                </div> 

                <!-- textarea -->
                <div class="form-group">
                  <label>도서 정보</label>
                  <textarea class="form-control" rows="5" placeholder="정보처리기사 필기 합격하고 기쁜마음으로 책 팝니다!! 좋은기운 받아가세요 :)"
                  	readonly="readonly"></textarea>
                </div>

              </form>
            </div>
            <div class="row">
						<div class="col-sm-4"></div>
						<div class="col-sm-2">
							<button class="btn btn-block btn-primary">구매희망</button>
						</div>
						<div class="col-sm-2">	
							<button class="btn btn-block">이전</button>
                  		</div>
                  	</div>
            <!-- /.box-body -->
            
          </div>



              </div><!-- /.col -->
           </div><!-- /.row -->
        </section><!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->        
      </div><!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->
      
<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------> 
<%@ include file="../include/footer.jsp" %>