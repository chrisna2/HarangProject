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
             	쪽지함
            <small>쪽지를 관리하세요.</small>
          </h1>
          <ol class="breadcrumb">
          <!-- 페이지 기록 : 메인에서 부터 현재 페이지 까지의 경로 나열 -->
            <li><a href="#"><i class="fa fa-dashboard"></i> 메인</a></li>
            <li><a href="#">마이페이지</a></li>
            <li class="active">쪽지함</li>
          </ol>
        </section>
<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
        <section class="content">
          <!-- 세로 길이 수정 -->
          <div class="row">
           <!-- 너비 사이즈 수정  : col-->
           <div class="col-md-9">
        	  <div class="box box-primary">
                <div class="box-header with-border">
                  <h3 class="box-title">새 쪽지를 작성하세요.</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <div class="row">
                  	  <div class=" col-md-2 form-group">
                  	  	<input type="checkbox"/>
                  	    <label>내게 쓰기</label>
	                  </div>
	                  <div class=" col-md-5 form-group">
	                    <input class="form-control" placeholder="받는사람:"/>
	                  </div>
	                  <div class=" col-md-5 form-group">
	                    <select class="form-control">
	                    	<option> 이름중복확인</option>
	                    	<option> 학번1</option>
	                    	<option> 학번2</option>
	                    	<option> 학번3</option>
	                    </select>
	                  </div>
                  </div>
                  <div class="form-group">
                    <input class="form-control" placeholder="제목:"/>
                  </div>
                  <div class="form-group">
                    <textarea id="compose-textarea" class="form-control" style="height: 300px">
                      
                    </textarea>
                  </div>
                  <div class="form-group">
                    <div class="btn btn-default btn-file">
                      <i class="fa fa-paperclip"></i> Attachment
                      <input type="file" name="attachment"/>
                    </div>
                    <p class="help-block">Max. 32MB</p>
                  </div>
                </div><!-- /.box-body -->
                <div class="box-footer">
                  <div class="pull-right">
                    <button class="btn btn-default"><i class="fa fa-times"></i> 삭제하기</button>
                    <button type="submit" class="btn btn-primary"><i class="fa fa-envelope-o"></i> 보내기</button>
                  </div>
                </div><!-- /.box-footer -->
                <br>
              </div><!-- /. box -->
             </div><!-- /.col -->
              
              <!-- 오른쪽에 메시지 탭 바 구성 -->
             <div class="col-md-3">
              <a href="compose.html" class="btn btn-primary btn-block margin-bottom">쪽지쓰기</a>
              <div class="box box-solid">
                <div class="box-body no-padding">
                  <ul class="nav nav-pills nav-stacked">
                    <li><a href="#"><i class="fa fa-inbox"></i> 받은 쪽지함 <span class="label label-primary pull-right">12</span></a></li>
                    <li><a href="#"><i class="fa fa-envelope-o"></i> 보낸 쪽지함</a></li>
                    <li><a href="#"><i class="fa fa-file-text-o"></i> 내게 쓴 쪽지함 </a></li>
                    <li><a href="#"><i class="fa fa-filter"></i> 스팸 쪽지함 <span class="label label-waring pull-right">65</span></a></li>
                    <li><a href="#"><i class="fa fa-trash-o"></i> 휴지통</a></li>
                  </ul>
                </div><!-- /.box-body -->
              </div><!-- /. box -->
              </div>
           </div><!-- /.row -->
        </section><!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->        
      </div><!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->
      
<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------> 
<%@ include file="../include/footer.jsp" %>
