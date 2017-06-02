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
             	알바 채용 글보기
            <small>알바 채용 모집 공고입니다.</small>
          </h1>
          <ol class="breadcrumb">
          <!-- 페이지 기록 메인에서 부터 현재 페이지 까지의 경로 나열 -->
            <li><a href="#"><i class="fa fa-dashboard"></i> 메인 > 알바 하랑</a></li>
            <li class="active">알바 모집</li>
          </ol>
        </section>
<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
        <section class="content">
        <div class="row">
        	<div class="col-md-10">
              <!-- general form elements disabled -->
              <div class="box box-warning">
                <div class="box-header">
                  <h3 class="box-title">채용 정보</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <form role="form">
                    <!-- text input -->
                    <div class="row">
	                    <div class="col-md-3 form-group">
	                      <label>머릿말</label>	                      
		                    <input type="text" value="[모집중]" readonly="readonly"/>		                		                  
	                    </div>
                    </div>
                    <div class="form-group">
                      <label>제목</label>
                      <input type="text" class="form-control" value="**과 과사무실 조교 모집합니다." readonly="readonly"/>
                    </div>
                    <div class="row">
	                    <div class="col-md-6 form-group">
	                      <label>장소</label>
	                      <input type="text" class="form-control" value="**과 과사무실" readonly="readonly"/>
	                    </div>
	                    <div class="col-md-6 form-group">
	                      <label>마감일</label>	                      
	                      <input type="text" class="form-control pull-right" id="reservation" readonly="readonly"/>                    
	                    </div>
                    </div>
                    <div class="row">
	                    <div class="col-md-6 form-group">
	                      <label>시급</label>
	                      <input type="text" class="form-control" value="ex) 7000원" readonly="readonly"/>
	                    </div>
	                    <div class="col-md-6 form-group">
	                      <label>근무기간</label>
	                      <input type="text" class="form-control" value="ex) 6개월, 1년 ..." readonly="readonly"/>
	                    </div>
                    </div>
                    <div class="form-group">
                      <label>요일</label>
                      <input type="text" class="form-control" placeholder="Enter ..."/>
                    </div>
                    <div class="form-group">
                      <label>문의</label>
                      <input type="text" class="form-control" value="ex)010-1234-5678 or email@naver.com" readonly="readonly"/>
                    </div>
                    
					<div class='box'>
		                <div class='box-header'>
		                  <h3 class='box-title'>업무 내용 <small>해야 할 업무에 대한 자세한 내용입니다.</small></h3>		     	               
		                </div><!-- /.box-header -->
		                <div class='box-body pad'>
		                  <form>
		                    <textarea class="form-control" id="editor1" name="editor1" rows="10" cols="120" readonly="readonly">
		                       	※ 구체적인 요일/시간 정보	                       	                 
		                    </textarea>
		                  </form>
		                </div>
              		</div><!-- /.box -->
					<div class="row">
						<div class="col-md-4"></div>
						<div class="col-md-4">
							<button class="btn btn-block btn-danger">삭제</button>
						</div>					
                  	</div>
                  </form>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
              <div class="row">
              	<div class="col-md-10"></div>
              	<div class="col-md-2">
              		<button class="btn btn-block btn-warning">목록</button>
              	</div>
              </div>
              <br>
              <!-- 댓글창  collapse -->
              <div class='box box-success'>
                <div class='box-header'>
                  <h3 class='box-title'>댓글 <small>이 게시글에 댓글을 달아주세요.</small></h3>
                  <!-- tools box -->
                  <div class="pull-right box-tools">
                    <button class="btn btn-success btn-sm" data-widget='collapse' data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-success btn-sm" data-widget='remove' data-toggle="tooltip" title="Remove"><i class="fa fa-times"></i></button>
                  </div><!-- /. tools -->
                </div><!-- /.box-header -->
                <div class="box-body">
                	<div class="input-group input-group-sm">
                    <input type="text" class="form-control">
                    <span class="input-group-btn">
                      <button class="btn btn-success btn-flat" type="button">Go!</button>
                    </span>
                  </div><!-- /input-group -->
                </div>
              </div><!-- /.box -->


              
            </div><!--/.col -->
        </div><!-- /.row -->
      
  
        </section><!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->        
      </div><!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->
      
<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------> 
<%@ include file="../include/footer.jsp" %>
<!-- ------------------------------------------------------------------------------------------------ -->
