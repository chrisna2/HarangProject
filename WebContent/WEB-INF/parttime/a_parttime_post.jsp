<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@ include file="../include/a_header.jsp" %>
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
             	알바 채용 글쓰기
            <small>알바를 채용하고 싶으신가요? 아래 항목을 성실하게 채워주세요!</small>
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
                  <form name="post" method="post" action="/HarangProject/parttime?cmd=PMAIN">
                  	<input type="hidden" name="insert" value="OK"/>
                  	<input type="hidden" name="p_daycode" value="" id = "p_daycode" required="required"/>
                    <!-- text input -->
                    <div class="row">
	                    <div class="col-md-3 form-group">
	                      <label>머릿말</label>	                      
		                    <select class="form-control" name="p_header" required="required">
		                    	<option>[모집중]</option>
		                    	<option>[마감]</option>
		                    	<option>[급구]</option>
		                    </select>		                		                  
	                    </div>
                    </div>
                    <div class="form-group">
                      <label>제목</label>
                      <input type="text" class="form-control" name="p_title" required="required" placeholder="ex)**과 과사무실 조교 모집합니다."/>
                    </div>
                    <div class="row">
	                    <div class="col-md-6 form-group">
	                      <label>장소</label>
	                      <input type="text" class="form-control" name="p_location" required="required" placeholder="ex) **과 과사무실"/>
	                    </div>
	                    <div class="col-md-6 form-group">
	                      <label>마감일</label>
	                      <div class="input-group">
		                      <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
		                      <input type="text" class="form-control pull-right" name="p_deadline" required="required" id="datepicker"/>
	                      </div><!-- /.input group -->
	                    </div>
                    </div>
                    <div class="row">
	                    <div class="col-md-6 form-group">
	                      <label>시급&nbsp;&nbsp;&nbsp;&nbsp;<small>숫자만 입력해주세요.</small></label>
	                      <input type="text" class="form-control onlynum" name="p_wage" id = "p_wage" required="required" placeholder="ex) 7000원"/>
	                    </div>
	                    <div class="col-md-6 form-group">
	                      <label>근무기간</label>
	                      <input type="text" class="form-control" name="p_term" required="required" placeholder="ex) 6개월, 1년 ..."/>
	                    </div>
                    </div>
                    <div class="form-group">
                      <label>요일</label>
                      <div>
                      <c:forEach var="i" begin="0" end="6" step="1">
		                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" value="${day[i]}"> ${day[i]}
	                  </c:forEach>
	                  </div>
                    </div>
                    <div class="form-group">
                      <label>문의</label>
                      <input type="text" class="form-control" name="p_tel" required="required" placeholder="ex)010-1234-5678 or email@naver.com"/>
                    </div>
                    
					<div class="form-group">
		              <label>업무 내용 &nbsp;&nbsp;&nbsp;&nbsp;<small>해야 할 업무에 대한 자세한 내용을 자유롭게 작성해주세요.</small></label>
		              <textarea class="form-control" name="p_content" required="required" rows="10">※ 구체적인 요일/시간을 작성해주세요.</textarea>
		            </div>
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
              		<button class="btn btn-block btn-warning" onclick="fnList()">목록</button>
              	</div>
              </div>
            </div><!--/.col (right) -->
        </div>
      </section><!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->        
      </div><!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->
<form name="cancel" method="post" action="/HarangProject/parttime?cmd=PMAIN">
	<input type="hidden" name="nowPage" value="${nowPage}"/>
    <input type="hidden" name="nowBlock" value="${nowBlock}"/>
</form>
<form name="list" method="post" action="/HarangProject/parttime?cmd=PMAIN">
	<input type="hidden" name="nowPage" value="${nowPage}"/>
    <input type="hidden" name="nowBlock" value="${nowBlock}"/>
</form>
<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------> 
<%@ include file="../include/a_footer.jsp" %>
<!-- ------------------------------------------------------------------------------------------------ -->
	
    
    <!-- 날짜 입력  -->
    <script src="plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
    <script>
   
        $('#datepicker').datepicker({
        	format: 'yyyy-mm-dd',
        	autoclose: true
        });
	</script>
    
    <script>
    //숫자만 입력하게 하기 
    $(".onlynum").keyup(function(){$(this).val( $(this).val().replace(/[^0-9]/g,"") );} );
    
    function fnCancel(){
		if(confirm("현재 작성한 내용이 모두 사라집니다.\n정말 취소하시겠습니까?") == true){
			document.cancel.submit();
		}else{
			return;
		}
	}
    
    function fnList(){
    	if(confirm("현재 작성한 내용이 모두 사라집니다.\n정말 돌아가시겠습니까?") == true){
			document.list.submit();
		}else{
			return;
		}
    }
    
    function fnPost(){
    	var arr = [];
    	$(":checkbox:checked").each(function(){
    		arr.push($(this).val());
    	});
    	document.getElementById("p_daycode").value = arr;
    	document.post.submit();
    }
    </script>
    
    