<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
             	대타 모집 글보기
            <small>대타 모집 공고입니다.</small>
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
                  
                    <!-- text input -->
                    <div class="row">
	                    <div class="col-md-3 form-group">
	                      <label>머릿말</label>	                      
		                    <input type="text" value="${info.d_header}" readonly="readonly"/>		                		                  
	                    </div>
                    </div>
                    <div class="form-group">
                      <label>제목</label>
                      <input type="text" class="form-control" value="${info.d_title}" readonly="readonly"/>
                    </div>
                    <div class="row">
	                    <div class="col-md-6 form-group">
	                      <label>장소</label>
	                      <input type="text" class="form-control" value="${info.d_location}" readonly="readonly"/>
	                    </div>
	                    <div class="col-md-6 form-group">
	                      <label>마감일</label>	                      
	                      <input type="text" class="form-control pull-right" value="${info.d_deadline}" readonly="readonly"/>                    
	                    </div>
                    </div>
                    <div class="row">
	                    <div class="col-md-6 form-group">
	                      <label>시급</label>
	                      <input type="text" class="form-control" value="${info.d_wage}원" readonly="readonly"/>
	                    </div>
	                    <div class="col-md-6 form-group">
	                      <label>지급 포인트</label>&nbsp;&nbsp;&nbsp;<small>시급과 별개로 지급하는 포인트입니다.</small>
	                      <input type="text" class="form-control" value="${info.d_deposit}point" readonly="readonly"/>
	                    </div>
                    </div>
                    <div class="form-group">
                      <label>대타 시간</label>&nbsp;&nbsp;&nbsp;<small>날짜와 시간을 정확하게 입력해주세요.</small>
                      <input type="text" class="form-control" value="${info.d_date}" readonly="readonly"/>
                    </div>
                    <div class="form-group">
                      <label>문의</label>
                      <input type="text" class="form-control" value="${info.d_tel}" readonly="readonly"/>
                    </div>
					<div class="form-group">
		              <label>업무 내용 </label>&nbsp;&nbsp;&nbsp;	<small>해야 할 업무에 대한 자세한 내용입니다.</small>	     	               
		              <textarea class="form-control" rows="10" readonly="readonly">${info.d_content}</textarea>
              		</div>
              		
              		
					<!-- 버튼 -->
					<div class="row">
						<c:choose>
							<c:when test="${m_id eq info.m_id}"><!-- 내가 쓴 글일 때 -->
								<div class="col-md-4"></div>
								<div class="col-md-2">
									<button class="btn btn-block btn-primary" onclick="fnUpdate()">수정</button>
								</div>
								<div class="col-md-2">
									<button class="btn btn-block btn-primary" onclick="fnDelete()">삭제</button>
								</div>
							</c:when>
							
							<c:otherwise><!-- 남이 쓴 글일 때 -->
								<div class="col-md-4"></div>
								<div class="col-md-4">
									<button class="btn btn-block btn-primary" onclick="fnDelete()">삭제하기</button>
								</div>
							</c:otherwise>		
						</c:choose>		
                  	</div>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
              <div class="row">
              	<div class="col-md-10"></div>
              	<div class="col-md-2">
              		<button class="btn btn-block btn-warning" onclick = "fnList('${tab}')">목록</button>
              	</div>
              </div>
              <br>
              
              <!-- ★★★ 내가 쓴 글일 때만 보이기 : 지원자 목록 collapse -->       
           <c:if test="${m_id eq info.m_id}">
            <div class='box box-danger'>
                <div class='box-header'>
                  <h3 class='box-title'>지원자 목록</h3><br><br>
                  <small>나의 게시글에 지원한 사람들의 목록입니다. 채용하고자 하는 사람을 체크하고 채용버튼을 누르면 자동으로 쪽지가 전송됩니다.</small>
           
                  <div class="pull-right box-tools">
                    <button class="btn btn-danger btn-sm" data-widget='collapse' data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
                  </div><!-- /. tools -->
                </div><!-- /.box-header -->
                <div class="box-body">              
						<table class="table table-bordered table-striped">
							<tr>
								<th style="width: 10px">#</th>
								<th>지원자</th>
								<th>지원자 정보</th>
								<th>지원날짜</th>
								<th>pick</th>
								<th>지급확인</th>
							</tr>
							<c:choose>
								<c:when test="${fn:length(resume) eq 0}">
								<td></td>
								<td>지원자가 없습니다.</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								</c:when>
								<c:otherwise>
									<c:forEach items="${resume}" var="resume" 
											   begin="${a_paging.beginPerPage}" 
											   end="${a_paging.beginPerPage + a_paging.numPerPage -1}" 
											   varStatus="status">
										<tr>
											<td>${resume.list_num}</td>
											<td>${resume.m_name}</td>
											<td><button class="btn btn-danger btn-sm" onclick="fnResume(${resume.m_id})">이력서 보기</button></td>
											<td>${resume.ㅇm_regdate}</td>
											<td>
											<c:choose>
												<c:when test="${resume.pm_choice eq 'Y'}">
													채용 확정
												</c:when>
												<c:otherwise>
													<button class="btn btn-sm btn-danger" onclick="fnPick(${resume.m_id})">채용하기</button>
												</c:otherwise>
											</c:choose>
											</td>
											<td></td>
										</tr>
									</c:forEach>
							</c:otherwise>
							</c:choose>
							
						</table>
					</div>
					<!-- /.box-body -->
					<div class="box-footer clearfix">
						<ul class="pagination pagination-sm no-margin pull-left">
							<c:if test="${a_paging.nowBlock > 0}">
							<li><a href="javascript:prevPage()">&laquo;</a></li>
							</c:if>
						  <c:forEach var="i" begin="0" end="${a_paging.pagePerBlock-1}" step="1">
						  	
						  	<c:if test="${a_paging.nowBlock*a_paging.pagePerBlock+i < a_paging.totalPage}" >
							<li><a href="javascript:goPage('${a_paging.nowBlock*a_paging.pagePerBlock+i}')">${a_paging.nowBlock*a_paging.pagePerBlock+(i+1)}</a></li>
						  	</c:if>
						 
						  </c:forEach>
						  	<c:if test="${a_paging.totalBlock > a_paging.nowBlock +1}">
							<li><a href="javascript:nextPage()">&raquo;</a></li>
							</c:if>
						</ul>
					</div>
                </div>
            </c:if>   
              <!-- 댓글창  collapse -->
              <div class='box box-success'>
                <div class='box-header'>
                  <h3 class='box-title'>댓글 <small>이 게시글에 댓글을 달아주세요.</small></h3>
                  <!-- tools box -->
                  <div class="pull-right box-tools">
                    <button class="btn btn-success btn-sm" data-widget='collapse' data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
                  </div><!-- /. tools -->
                </div><!-- /.box-header -->
                <div class="box-body">
                	<!-- 댓글쓰기 -->
                <form method="post" action="/HarangProject/parttime?cmd=DREAD">
                	<div class="input-group input-group-sm">
                	  	<input type="hidden" name="d_num" value="${info.d_num}" id="d_num"/>
                	  	<input type="hidden" name="comment" value="insert"/>
	                   	<input type="text" name="dr_comment" class="form-control">
	                    <span class="input-group-btn">
	                    	<button class="btn btn-success btn-flat" type="submit">Go!</button>
	                    </span>
	                </div><!-- 댓글쓰기 끝! -->
	            </form>
                  	<br>
                  	<!-- 댓글 목록 들어갈 위치 -->
                	<div class="input-group" id="ajax"></div>
                </div>
              </div><!-- /.box -->
              
              
            </div><!--/.col -->
        </div><!-- /.row -->
    </section><!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->        
      </div><!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->
<form name="list" method="post" action="/HarangProject/parttime">
      	<input type="hidden" name="nowPage" value="${nowPage}"/>
      	<input type="hidden" name="nowBlock" value="${nowBlock}"/>
      	<input type="hidden" name="cmd" value="${tab}"/>
      </form>
      <form name="cancel" method="post" action="/HarangProject/parttime?cmd=DREAD">
      	<input type="hidden" name="d_num" value="${info.d_num}"/>
      	<input type="hidden" name="nowPage" value="${nowPage}"/>
      	<input type="hidden" name="nowBlock" value="${nowBlock}"/>
      	<input type="hidden" name="cancel" value="OK"/>
      	<input type="hidden" name="tab" value="${tab}"/>
      </form>
      <form name="resume" method="post" action="/HarangProject/parttime?cmd=DRESUME">
      	<input type="hidden" name="d_num" value="${info.d_num}"/>
      	<input type="hidden" name="tab" value="${tab}"/>
      	<input type="hidden" name="m_id" value="" id="resume_id"/>
      	<input type="hidden" name="nowPage" value="${nowPage}"/>
    	<input type="hidden" name="nowBlock" value="${nowBlock}"/>
    	<input type="hidden" name="a_nowPage" value="${a_paging.nowPage}"/>
		<input type="hidden" name="a_nowBlock" value="${a_paging.nowBlock}"/>
      </form>
      <form name="pick" method="post" action="/HarangProject/parttime?cmd=DREAD">
        <input type="hidden" name="tab" value="${tab}"/>
      	<input type="hidden" name="a_nowPage" value="${a_paging.nowPage}"/>
		<input type="hidden" name="a_nowBlock" value="${a_paging.nowBlock}"/>
		<input type="hidden" name="nowPage" value="${nowPage}"/>
    	<input type="hidden" name="nowBlock" value="${nowBlock}"/>
		<input type="hidden" name="d_num" value="${d_num}"/>
		<input type="hidden" name="choice" value="Y"/> 
		<input type="hidden" name="choice_id" value="" id="choice_id"/>
      </form>
      <form name="del" method="post" action="/HarangProject/parttime?cmd=DMAIN">
        <input type="hidden" name="tab" value="${tab}"/>
      	<input type="hidden" name="delete" value="OK"/>
      	<input type="hidden" name="d_num" value="${info.d_num}"/>
      	<input type="hidden" name="nowPage" value="${nowPage}"/>
      	<input type="hidden" name="nowBlock" value="${nowBlock}"/>
      </form>
      <form name="update" method="post" action="/HarangProject/parttime">
        <input type="hidden" name="tab" value="${tab}"/>
      	<input type="hidden" name="cmd" value="DUPDATE"/>
      	<input type="hidden" name="d_num" value="${info.d_num}"/>
      	<input type="hidden" name="nowPage" value="${nowPage}"/>
      	<input type="hidden" name="nowBlock" value="${nowBlock}"/>
      </form>
      <form name="comdel" id="commentDel" method="post" action="/HarangProject/parttime">
      	<input type="hidden" name="cmd" value="DREAD"/>
      	<input type="hidden" name="comment" value="delete"/>
      	<input type="hidden" name="dr_num" value="" id="dr_num"/>
      	<input type="hidden" name="d_num" value="${info.d_num}"/>
      	<input type="hidden" name="m_id" value="${m_id}"/>
      	<input type="hidden" name="tab" value="${tab}"/>
      	<input type="hidden" name="a_nowPage" value="${a_paging.nowPage}"/>
		<input type="hidden" name="a_nowBlock" value="${a_paging.nowBlock}"/>
		<input type="hidden" name="nowPage" value="${nowPage}"/>
    	<input type="hidden" name="nowBlock" value="${nowBlock}"/>
      </form>
      <form name="refresh" method="post" action="/HarangProject/parttime">
      	<input type="hidden" name="cmd" value="DREAD"/>
      	<input type="hidden" name="d_num" value="${info.d_num}"/>
      	<input type="hidden" name="tab" value="${tab}"/>
      </form>
       
<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------> 
<%@ include file="../include/a_footer.jsp" %>
<!-- ------------------------------------------------------------------------------------------------ -->
<script>
function fnList(tab){list.submit();}
function fnUpdate(){update.submit();}
function fnCancel(){
	if(confirm("작성한 이력서가 삭제됩니다.\n정말 지원을 취소하시겠습니까?") == true){
		document.cancel.submit();
	}else{
		return;
	}
}
function fnDelete(){
	if(confirm("지금 글을 삭제하면 복구할 수 없습니다.\n정말 삭제하시겠습니까?") == true){
		document.del.submit();
	}else{
		return;
	}
}
function fnResume(m_id){
	document.getElementById("resume_id").value = m_id;
	document.resume.submit();
}
function fnPick(m_id){
	if(confirm("채용하기 버튼을 누른 후에는 취소할 수 없습니다.\n정말 채용하시겠습니까?\n(지원자에게 채용확정 메시지가 전송됩니다.)") == true){
		document.getElementById("choice_id").value = m_id;
		document.pick.submit();
	}else{
		return;
	}
}

//댓글
var d_num = $("#d_num").val();

$.getJSON("/HarangProject/ajax?cmd=dReply",{d_num:d_num}, function(data){
        $("#ajax span").remove();
        $(data).each(function(index, drlist){
             $("#ajax").append(
            		 "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
            		+ "<span class='btn btn-success btn-xs'>" + drlist.m_name + "</span>" 
            		+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + drlist.dr_comment 
            		+ "&nbsp;&nbsp;&nbsp;&nbsp;"
            		+"<small>" + drlist.dr_regdate + "</small>"
                 	+ "&nbsp;&nbsp;&nbsp;&nbsp;"
                 	+ "<button class='btn btn-default btn-xs' id='rdel"+drlist.dr_num+"'>삭제</button><br>" 
                 	+ "<input type='hidden' value='"+drlist.dr_num+"'/>"
                 	);
             
             $("#rdel"+drlist.dr_num).click(function(){
            	 if(confirm("정말 삭제하시겠습니까?")==true){
            		 $("#dr_num").val($(this).next().val());
            		 comdel.submit();
            	 }else{
            		 return;
            	 }
             });
        });
});
</script>