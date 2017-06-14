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
		                    <input type="text" value="${info.p_header}" readonly="readonly"/>		                		                  
	                    </div>
                    </div>
                    <div class="form-group">
                      <label>제목</label>
                      <input type="text" class="form-control" value="${info.p_title}" readonly="readonly"/>
                    </div>
                    <div class="row">
	                    <div class="col-md-6 form-group">
	                      <label>장소</label>
	                      <input type="text" class="form-control" value="${info.p_location}" readonly="readonly"/>
	                    </div>
	                    <div class="col-md-6 form-group">
	                      <label>마감일</label>	                      
	                      <input type="text" class="form-control pull-right" value="${info.p_deadline}" readonly="readonly"/>                    
	                    </div>
                    </div>
                    <div class="row">
	                    <div class="col-md-6 form-group">
	                      <label>시급</label>
	                      <input type="text" class="form-control" value="${info.p_wage}원" readonly="readonly"/>
	                    </div>
	                    <div class="col-md-6 form-group">
	                      <label>근무기간</label>
	                      <input type="text" class="form-control" value="${info.p_term}" readonly="readonly"/>
	                    </div>
                    </div>
                    <div class="form-group">
                      <label>요일</label><br>
                      <div class="btn-group" data-toggle="buttons">
	                      <label class="btn btn-primary"> <input type="checkbox" id="mon" autocomplete="off" > 월</label> 
	                      &nbsp;&nbsp;&nbsp;
	                      <label class="btn btn-primary"> <input type="checkbox" id="tue" autocomplete="off"> 화</label> 
	                      &nbsp;&nbsp;&nbsp;
	                      <label class="btn btn-primary"> <input type="checkbox" id="wed" autocomplete="off"> 수</label> 
	                      &nbsp;&nbsp;&nbsp;
	                      <label class="btn btn-primary"> <input type="checkbox" id="thu" autocomplete="off"> 목</label> 
	                      &nbsp;&nbsp;&nbsp;
	                      <label class="btn btn-primary"> <input type="checkbox" id="fri" autocomplete="off"> 금</label> 
	                      &nbsp;&nbsp;&nbsp;
	                      <label class="btn btn-primary"> <input type="checkbox" id="sat" autocomplete="off"> 토</label> 
	                      &nbsp;&nbsp;&nbsp;
	                      <label class="btn btn-primary"> <input type="checkbox" id="sun" autocomplete="off"> 일</label> 			
                      </div>
                    </div>
                    <div class="form-group">
                      <label>문의</label>
                      <input type="text" class="form-control" value="${info.p_tel}" readonly="readonly"/>
                    </div>
                    
					<div class='box'>
		                <div class='box-header'>
		                  <h3 class='box-title'>업무 내용 <small>해야 할 업무에 대한 자세한 내용입니다.</small></h3>		     	               
		                </div><!-- /.box-header -->
		                <div class='box-body pad'>
		                  <form>
		                    <textarea class="form-control" id="editor1" name="editor1" rows="10" cols="120" readonly="readonly">${info.p_content}</textarea>
		                  </form>
		                </div>
              		</div><!-- /.box -->
					<div class="row">
						<div class="col-md-4"></div>
						<div class="col-md-4">
							<button class="btn btn-block btn-primary" onclick="fnApply()">지원하기</button>
						</div>					
                  	</div>
                  </form>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
              <div class="row">
              	<div class="col-md-10"></div>
              	<div class="col-md-2">
              		<button class="btn btn-block btn-warning" onclick="javascript:fnList()">목록</button>
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
      <form name="list" method="post" action="/HarangProject/parttime?cmd=PMAIN">
      	<input type="hidden" name="nowPage" value="${nowPage}"/>
      	<input type="hidden" name="nowBlock" value="${nowBlock}"/>
      </form>
      <form name="apply" method="post" action="/HarangProject/parttime?cmd=PAPPLY">
      	<input type="hidden" name="p_num" value="${list.p_num}"/>
      	<input type="hidden" name="nowPage" value="${nowPage}"/>
      	<input type="hidden" name="nowBlock" value="${nowBlock}"/>
      </form>
<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------> 
<%@ include file="../include/footer.jsp" %>
<!-- ------------------------------------------------------------------------------------------------ -->
<script>
$.urlParam = function(name){
    var results = new RegExp('[\?&amp;]' + name + '=([^&amp;#]*)').exec(window.location.href);
    return results[1] || 0;
}

function fnList(){
	document.list.submit();
}
function fnApply(){
	document.apply.submit();
}

</script>