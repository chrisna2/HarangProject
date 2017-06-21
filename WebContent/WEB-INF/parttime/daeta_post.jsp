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
             	대타 모집 글쓰기
            <small>대타를 구하고 싶으신가요? 아래 항목을 성실하게 채워주세요!</small>
          </h1>
          <ol class="breadcrumb">
          <!-- 페이지 기록 메인에서 부터 현재 페이지 까지의 경로 나열 -->
            <li><a href="#"><i class="fa fa-dashboard"></i> 메인 > 알바 하랑</a></li>
            <li class="active">대타 모집</li>
          </ol>
        </section>
<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
        <section class="content">
        <div class="row">
        	<div class="col-md-10">
              <!-- general form elements disabled -->
              <div class="box box-warning">
                <div class="box-header">
                  <h3 class="box-title">알바 정보</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <form name="post" method="post" action="/HarangProject/parttime?cmd=DMAIN">
                  	<input type="hidden" name="m_id" value="${m_id}"/>
					<input type="hidden" name="nowPage" value="${nowPage}"/>
      				<input type="hidden" name="nowBlock" value="${nowBlock}"/>
                    <!-- text input -->
                    <div class="row">
	                    <div class="col-md-3 form-group">
	                      <label>머릿말</label>	                      
		                    <select class="form-control" name="d_header">
		                    	<option>[모집중]</option>
		                    	<option>[마감]</option>
		                    	<option>[급구]</option>
		                    </select>		                		                  
	                    </div>
                    </div>
                    <div class="form-group">
                      <label>제목</label>
                      <input type="text" class="form-control" name="d_title" placeholder="ex)**과 과사무실 조교 모집합니다."/>
                    </div>
                    <div class="row">
	                    <div class="col-md-6 form-group">
	                      <label>장소</label>
	                      <input type="text" class="form-control" name="d_location" placeholder="ex) **과 과사무실"/>
	                    </div>
	                    <div class="col-md-6 form-group">
	                      <label>마감일</label>
	                      <div class="input-group">
	                      	<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
	                      	<input type="text" class="form-control pull-right" name="d_deadline" value="" id="date1"/>
	                      </div><!-- /.input group -->
	                    </div>
                    </div>
                    <div class="row">
	                    <div class="col-md-6 form-group">
	                      <label>시급</label>
	                      <input type="text" class="form-control" name="d_wage" placeholder="ex) 7000원"/>
	                    </div>
	                    <div class="col-md-6 form-group">
	                      <label>지급 포인트</label>&nbsp;&nbsp;&nbsp;<small>시급과 별개로 지급하는 포인트입니다.</small>
	                      <input type="text" class="form-control" name="d_deposit" placeholder="ex)500point"/>
	                    </div>
                    </div>
                    <div class="form-group">
                      <label>대타 날짜</label>&nbsp;&nbsp;&nbsp;<small>날짜와 시간을 정확하게 입력해주세요.</small>
                      <div class="input-group">
                      	  <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
	                      <input type="text" class="form-control pull-right" name="d_date" value="" id="date2"/>
	                  </div><!-- /.input group -->
                    </div>
                    <div class="form-group">
                      <label>문의</label>
                      <input type="text" class="form-control" name="d_tel" placeholder="ex)010-1234-5678 or email@naver.com"/>
                    </div>
                    
					<div class='box'>
		                <div class='box-header'>
		                  <h3 class='box-title'>업무 내용 <small>해야 할 업무에 대한 자세한 내용을 자유롭게 작성해주세요.</small></h3>
		                </div><!-- /.box-header -->
		                <div class='box-body pad'>
		                    <textarea id="editor1" name="d_content" rows="10" cols="80">
		                       	대타로서 해야할 업무를 상세하게 작성해주세요.                     	                 
		                    </textarea>
		                </div>
              		</div><!-- /.box -->
					<div class="row">
						<div class="col-md-4"></div>
						<div class="col-md-2">
							<button class="btn btn-block btn-primary" onclick="fnPost()">등록</button>
						</div>
						<div class="col-md-2">	
							<button class="btn btn-block btn-danger" onclick="fnCancel()">취소</button>
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
            </div><!--/.col (right) -->
        
        </div>
        

        </section><!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->        
     </div><!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->
<form name="cancel" method="post" action="/HarangProject/parttime?cmd=DMAIN">
	<input type="hidden" name="nowPage" value="${nowPage}"/>
    <input type="hidden" name="nowBlock" value="${nowBlock}"/>
</form>      
<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------> 
<%@ include file="../include/footer.jsp" %>
<!-- ------------------------------------------------------------------------------------------------ -->
    
    <!-- Editor -->
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="//cdn.ckeditor.com/4.4.3/standard/ckeditor.js"></script>
    <script type="text/javascript">
      $(function () {
        // Replace the <textarea id="editor1"> with a CKEditor
        // instance, using default configuration.
        CKEDITOR.replace('editor1');
        //bootstrap WYSIHTML5 - text editor
        $(".textarea").wysihtml5();
      });
    </script>
    
    <!-- 날짜 -->
    <script src="plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
    <script src="plugins/timepicker/bootstrap-timepicker.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
	<script src="plugins/daterangepicker/daterangepicker.js"></script>
    <script>
   
        $( "#date1" ).datepicker({
        	format: 'yyyy-mm-dd',
        	autoclose: true
        });
       
        $("#date2").daterangepicker({
        	timePicker: true, timePickerIncrement: 30, format: 'YYYY-MM-DD h:mm A'
        });
    
    </script>
    
    <script>
  	//숫자만 입력하게 하기 
    $(".onlynum").keyup(function(){$(this).val( $(this).val().replace(/[^0-9]/g,"") );} );
    	
    	function fnPost(){
    		document.post.submit();
    	}
    	
    	function fnCancel(){
    		if(confirm("현재 작성한 내용이 모두 사라집니다.\n정말 취소하시겠습니까?") == true){
    			document.cancel.submit();
    		}else{
    			return;
    		}
    	}
    </script>