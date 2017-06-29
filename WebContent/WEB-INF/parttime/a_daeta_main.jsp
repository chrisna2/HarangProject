<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../include/a_header.jsp"%>
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
			대타 채용 정보 <small>대타 모집 정보를 확인하세요!</small>
		</h1>
		<ol class="breadcrumb">
			<!-- 페이지 기록 메인에서 부터 현재 페이지 까지의 경로 나열 -->
			<li><a href="#"><i class="fa fa-dashboard"></i> Home > 알바 하랑</a></li>
			<li class="active">대타 모집</li>
		</ol>
	</section>
	<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
	<section class="content">
		<div class="row">
			<div class="col-md-10">
				<div class="box box-success">
					<div class="box-header">
						<h3 class="box-title"></h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<div class="row">
						<div class="col-md-2">
							<button class="btn btn-xs btn-success" onclick="fnPost()">글쓰기</button>
						</div>
						<div class="col-md-9"></div>
						<div class="col-md-1">
							<button class="btn btn-default btn-sm pull-right" onclick="fnRefresh()"><i class="fa fa-refresh"></i></button>
						</div>					
                  	</div>
						<table class="table table-bordered table-striped">
							<tr>
								<th></th>
								<th style="width: 10px">#</th>
								<th style="width: 32%">제목</th>
								<th style="width: 13%">대타 날짜</th>
								<th style="width: 8%">글쓴이</th>
								<th>작성일</th>
								<th>채용</th>
								<th>거래</th>
								<th>신고</th>
							</tr>
							<c:choose>
								<c:when test="${fn:length(list) eq 0}">
								<tr>
									<td></td>
									<td></td>
									<td>게시물이 없습니다.<td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${list}" var="list" 
											   begin="${paging.beginPerPage}" 
											   end="${paging.beginPerPage + paging.numPerPage -1}" 
											   varStatus="status">
										<tr>
											<td><input type="checkbox"/></td>
											<td>${list.list_num}</td>
											<td>${list.d_header}&nbsp;&nbsp; 
												<a href="javascript:fnRead('${list.d_num}')" id="read">${list.d_title}</a>
											</td>
											<td>${list.d_date} </td>
											<td>${list.m_name}</td>
											<td>${list.d_regdate}</td>
											<c:choose>
												<c:when test="${(list.d_pick eq null) and (list.d_header ne '[마감]')}">
													<td><span class="btn btn-info btn-xs">채용중</span></td>
												</c:when>
												<c:when test="${(list.d_pick ne null) and (list.d_header eq '[마감]')}">
													<td><span class="btn btn-default btn-xs">완료</span></td>
												</c:when>
												<c:when test="${(list.d_pick eq null) and (list.d_header eq '[마감]')}">
													<td><span class="btn btn-default btn-xs">실패</span></td>
												</c:when>
												<c:otherwise>
													<td>${list.d_pick}</td>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${(list.d_pick eq null) and (list.d_header eq '[마감]')}">
												<td></td>
												</c:when>
												<c:otherwise>
												<td>
													<c:if test="${list.state eq 'prepare'}"><span class="btn btn-default btn-xs">준비중</span></c:if>
													<c:if test="${list.state eq 'progress'}"><span class="btn btn-info btn-xs">진행중</span></c:if>
													<c:if test="${list.state eq 'waiting'}"><span class="btn btn-parimary btn-xs">대기중</span></c:if>
													<c:if test="${list.state eq 'warning'}"><span class="btn btn-warning btn-xs">경고</span></c:if>
													<c:if test="${list.state eq 'success'}"><span class="btn btn-success btn-xs">성공</span></c:if>
													<c:if test="${list.state eq 'denied'}"><span class="btn btn-danger btn-xs">거절</span></c:if>
												</td>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${list.dm_report eq 'N' || list.dm_report eq null}">
													<td></td>
												</c:when>
												<c:when test="${list.dm_report eq 'Solved'}">
													<td><span class="btn btn-default btn-xs" >해결</span></td>
												</c:when>
												<c:when test="${list.dm_report ne 'N' and list.dm_report ne 'Solved' and list.dm_report ne null}">
													<td><span class="btn btn-danger btn-xs" onclick="fnReport('${list.d_num}','${list.d_pick}','${list.dm_report}')">신고</span></td>
												</c:when>
												
											</c:choose>
										</tr>
									</c:forEach>
							</c:otherwise>
							</c:choose>
						</table>
					</div>
					<!-- /.box-body -->
					<div class="col-md-2">
							<button class="btn btn-xs btn-danger" onclick="fnDelete()">삭제</button>
					</div>
					<!-- 페이징 버튼 -->
					<div class="box-footer clearfix">
						<ul class="pagination pagination-sm no-margin pull-right">
							<c:if test="${paging.nowBlock > 0}">
							<li><a href="javascript:prevPage()">&laquo;</a></li>
							</c:if>
						  <c:forEach var="i" begin="0" end="${paging.pagePerBlock-1}" step="1">
						  	<!-- if문 추가 : 20170615 -->
						  	<c:if test="${paging.nowBlock*paging.pagePerBlock+i < paging.totalPage}" >
							<li><a href="javascript:goPage('${paging.nowBlock*paging.pagePerBlock+i}')">${paging.nowBlock*paging.pagePerBlock+(i+1)}</a></li>
						  	</c:if>
						  	<!-- 끝 -->
						  </c:forEach>
						  	<c:if test="${paging.totalBlock > paging.nowBlock +1}">
							<li><a href="javascript:nextPage()">&raquo;</a></li>
							</c:if>
						</ul>
						
						<br><br>
						<div>  
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<b>거래 상태 표시</b><br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                <span class="btn btn-default btn-xs">준비중</span><small> 모집 마감일이 지나지 않은 상태</small><br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span class="btn btn-info btn-xs">진행중</span><small> 마감일이 지나고 대타날짜가 지나지 않은 상태</small><br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span class="btn btn-primary btn-xs">대기중</span><small> 대타 날짜가 지나고 (대타 날짜 후 3일 미만) 확인 버튼이 아직 눌리지 않은 상태</small><br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span class="btn btn-warning btn-xs">경고</span><small> 대타 날짜가 3일이상 지났지만 확인 버튼이 눌리지 않은 상태</small><br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span class="btn btn-success btn-xs">성공</span><small> 거래가 성공적으로 완료된 상태</small><br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span class="btn btn-danger btn-xs">거절</span><small> 거래가 거절된 상태</small><br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
					</div><!-- 페이징 버튼 -->
					
					
					<form name="search" method="post" action="/HarangProject/parttime?cmd=DMAIN">
					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-md-2 form-group">
							<select class="form-control" name="keyField">
	                        <c:choose>
	                        <c:when test="${keyField eq '제목' or keyField eq null}">
		                        <option selected="selected">제목</option>
		                        <option>시급</option>
	                        </c:when>
	                        <c:when test="${keyField eq '시급'}">
		                        <option>제목</option>
		                        <option selected="selected">시급</option>
	                        </c:when>
	                        </c:choose>
	                      </select>
						</div>
						<div class="col-md-4 input-group input-group-sm">
	                    <input type="text" name="keyword" value="${keyword}" class="form-control">
	                    <span class="input-group-btn">
	                      <button class="btn btn-success btn-flat" type="submit">Go!</button>
	                    </span>
	                  </div><!-- /input-group -->
                  </div>
                  </form>
				</div>
				
				<!-- 신고 -->
				<form method="post" action="/HarangProject/parttime?cmd=DMAIN">
					<input type="hidden" name="d_num" value="" id="report_num"/>
	                <input type="hidden" name="solved" value="OK"/>
              <div class="box box-danger" id="theRemote" style="display: none;">
	                <div class="box-header">
	                  <h3 class="box-title">신고 내용</h3>
	                  <div class="box-tools pull-right">
	                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
	                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
	                  </div>
	                </div>
                
                <!-- form 시작 -->
                	
	                <div class="box-body">
	                  
	                  <div class="input-group">
	                    <span class="input-group-addon"><i class="fa fa-sort-numeric-desc"></i> 회원번호</span>
	                    <input type="text" name="d_picked" id="report_id" value="" class="form-control" readonly="readonly">
	                  </div> 
	                  <div class="input-group">
	                    <span class="input-group-addon"><i class="fa fa-sort-numeric-desc"></i> 신고내용</span>
	                    <input type="text" id="report_content" value="" class="form-control" readonly="readonly">
	                  </div>
	                </div><!-- /.box-body -->
	                
	                 <div class="box-footer" align="right">
	                    <button type="submit" class="btn btn-danger" onclick="fnSolve()">해결</button>
	                </div>
	              </div><!-- /.box -->
	              </form>
			</div>
		</div><!-- row -->


	</section><!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->
</div><!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->
<!-- 페이징 : 이전 블록으로 이동하는 폼 -->
<form id="prevPage" method="post" action="/HarangProject/parttime?cmd=DMAIN">
	<input type="hidden" name="nowPage" value="${paging.pagePerBlock * (paging.nowBlock-1)}"/>
	<input type="hidden" name="nowBlock" value="${paging.nowBlock-1}"/>
	<input type="hidden" name="keyword" value="${keyword}"/>
	<input type="hidden" name="keyField" value="${keyField}"/>
</form>
<!-- 페이징 : 다음 블록으로 이동하는 폼 -->
<form id="nextPage" method="post" action="/HarangProject/parttime?cmd=DMAIN">
	<input type="hidden" name="nowPage" value="${paging.pagePerBlock * (paging.nowBlock+1)}"/>
	<input type="hidden" name="nowBlock" value="${paging.nowBlock+1}"/>
	<input type="hidden" name="keyword" value="${keyword}"/>
	<input type="hidden" name="keyField" value="${keyField}"/>
</form>
<!-- 페이징 : 해당 페이지로 이동하는 폼 -->
<form id="goPage" method="post" action="/HarangProject/parttime?cmd=DMAIN">
	<input type="hidden" name="nowPage" value="" id="page"/>
	<input type="hidden" name="nowBlock" value="${paging.nowBlock}"/>
	<input type="hidden" name="keyword" value="${keyword}"/>
	<input type="hidden" name="keyField" value="${keyField}"/>
</form>
<!-- 페이징 관련 폼 여기까지입니다. ----------------------------------------------------------------------------------- -->
<!-- 글 쓰기 -->
<form name="post" method="post" action="/HarangProject/parttime?cmd=DPOST">
	<input type="hidden" name="nowPage" value="${paging.nowPage}"/>
	<input type="hidden" name="nowBlock" value="${paging.nowBlock}"/>
</form>

<!-- 글 읽기 -->
<form name="read" method="post" action="/HarangProject/parttime?cmd=DREAD">
	<input type="hidden" name="d_num" value="" id="d_num"/>
	<input type="hidden" name="tab" value="DMAIN"/>
	<input type="hidden" name="nowPage" value="${paging.nowPage}"/>
	<input type="hidden" name="nowBlock" value="${paging.nowBlock}"/>
</form>

<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------>
<%@ include file="../include/a_footer.jsp"%>

<!-- --------------------------------------------------------------------------------------------------- -->
<script>
///////////////// 페이지 관련 javascript function////////////////////
function prevPage(){
	document.getElementById("prevPage").submit();
}
function nextPage(){
	document.getElementById("nextPage").submit();
}
function goPage(nowPage){
	document.getElementById("page").value = nowPage;
	document.getElementById("goPage").submit();
}
/////////////////////////////끝//////////////////////////////////

function fnReport(d_num,d_picked, report){
	if($("#theRemote").css("display") == "none"){
		$("#theRemote").slideDown();
		$("#report_num").val(d_num);
		$("#report_id").val(d_picked);
		$("#report_content").val(report);
	}
	else{
		$("#theRemote").slideUp();
	}
}

function fnRead(d_num){
	document.getElementById("d_num").value = d_num;
	document.read.submit();
}

function fnPost(){
	document.post.submit();
}
function fnRefresh(){
	location.href="/HarangProject/parttime?cmd=DMAIN";
}
</script>
 
 

 