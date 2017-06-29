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
			알바 채용 정보 <small>교내의 알바 채용 정보를 확인하세요!</small>
		</h1>
		<ol class="breadcrumb">
			<!-- 페이지 기록 메인에서 부터 현재 페이지 까지의 경로 나열 -->
			<li><a href="#"><i class="fa fa-dashboard"></i> Home > 알바 하랑</a></li>
			<li class="active">알바 모집</li>
		</ol>
	</section>
	<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
	<section class="content">
		<div class="row">
			<div class="col-md-10">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title"></h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<div class="row">
						<div class="col-md-2">
							<button class="btn btn-xs btn-info" onclick="fnPost()">글쓰기</button>
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
								<th style="width: 40%">제목</th>
								<th>시급</th>
								<th>글쓴이</th>
								<th>작성일</th>
								<th>조회수</th>
								<th>지원자 수</th>
							</tr>
							<!-- 목록 삽입 -->
							<c:choose>
								<c:when test="${fn:length(list) eq 0}">
								게시물이 없습니다.
								</c:when>
								<c:otherwise>
									<c:forEach items="${list}" var="list" 
											   begin="${paging.beginPerPage}" 
											   end="${paging.beginPerPage + paging.numPerPage -1}" 
											   varStatus="status">
										<tr>
											<td><input type="checkbox" id="${status.index}"/></td>
											<td>${list.list_num}</td>
											<td>${list.p_header}&nbsp;&nbsp; 
												<a href="javascript:fnRead('${list.p_num}')" id="read">${list.p_title}</a>
											</td>
											<td>${list.p_wage}원 </td>
											<td>${list.m_id}</td>
											<td>${list.p_regdate}</td>
											<td>${list.p_cnt}</td>
											<td>${list.cnt_apply}</td>
										</tr>
									</c:forEach>
							</c:otherwise>
							</c:choose>
						<!-- 목록삽입  끝 -->	
							
						</table>
					</div>
					<!-- /.box-body -->
					<div class="col-md-2">
							<button class="btn btn-xs btn-danger" onclick="fnDelete()">삭제</button>
					</div>
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
					</div>
					
					<form name="search" method="post" action="/HarangProject/parttime?cmd=PMAIN">
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
	                      <button class="btn btn-info btn-flat" type="submit">Go!</button>
	                    </span>
	                  </div><!-- /input-group -->
                  </div>
                  </form>
				</div>
			</div>
		</div><!-- row -->


	</section><!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->
</div><!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->
<!-- 페이징 : 이전 블록으로 이동하는 폼 -->
<form id="prevPage" method="post" action="/HarangProject/parttime?cmd=PMAIN">
	<input type="hidden" name="nowPage" value="${paging.pagePerBlock * (paging.nowBlock-1)}"/>
	<input type="hidden" name="nowBlock" value="${paging.nowBlock-1}"/>
	<input type="hidden" name="keyword" value="${keyword}"/>
	<input type="hidden" name="keyField" value="${keyField}"/>
</form>
<!-- 페이징 : 다음 블록으로 이동하는 폼 -->
<form id="nextPage" method="post" action="/HarangProject/parttime?cmd=PMAIN">
	<input type="hidden" name="nowPage" value="${paging.pagePerBlock * (paging.nowBlock+1)}"/>
	<input type="hidden" name="nowBlock" value="${paging.nowBlock+1}"/>
	<input type="hidden" name="keyword" value="${keyword}"/>
	<input type="hidden" name="keyField" value="${keyField}"/>
</form>
<!-- 페이징 : 해당 페이지로 이동하는 폼 -->
<form id="goPage" method="post" action="/HarangProject/parttime?cmd=PMAIN">
	<input type="hidden" name="nowPage" value="" id="page"/>
	<input type="hidden" name="nowBlock" value="${paging.nowBlock}"/>
	<input type="hidden" name="keyword" value="${keyword}"/>
	<input type="hidden" name="keyField" value="${keyField}"/>
</form>
<!-- 페이징 관련 폼 여기까지입니다. ----------------------------------------------------------------------------------- -->
<!-- 글 쓰기 -->
<form name="post" method="post" action="/HarangProject/parttime?cmd=PPOST">
	<input type="hidden" name="nowPage" value="${paging.nowPage}"/>
	<input type="hidden" name="nowBlock" value="${paging.nowBlock}"/>
</form>

<!-- 글 읽기 -->
<form name="read" method="post" action="/HarangProject/parttime?cmd=PREAD">
	<input type="hidden" name="p_num" value="" id="p_num"/>
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

function fnRead(p_num){
	document.getElementById("p_num").value = p_num;
	document.read.submit();
}

function fnPost(){
	document.post.submit();
}
function fnRefresh(){
	location.href="/HarangProject/parttime?cmd=PMAIN";
}
</script>
 
 
