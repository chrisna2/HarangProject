<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../include/header.jsp"%>
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
		나의 페이지
		<small>나의 중고도서 거래 내역을 알 수 있습니다.</small>
	</h1>
	<ol class="breadcrumb">
		<!-- 페이지 기록 : 메인에서 부터 현재 페이지 까지의 경로 나열 -->
		<li><a href="#"><i class="fa fa-dashboard"></i> 메인</a></li>
		<li class="active">하랑딘24</li>
		<li class="active">마이페이지</li>
	</ol>
</section>
<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
<section class="content">
	<div class="row">
		<div class="col-md-11">
			<!-- 나의 도서 구매신청 -->
					<div class="box box-warning">
	                	<div class="box-header with-border">
	                 	<h3 class="box-title">나의 도서 구매 신청</h3>
	                 	<small>나의 중고도서를 구매 신청한 회원 목록입니다.</small>
	                	</div><!-- /.box-header -->
	                	
	                	<div class="box-body">
	                		<table class="table table-bordered table-hover dataTable">
								<tr role="row">
									<th style="width: 50px">거래번호</th>
									<th style="width: 40%">도서명</th>
									<th>지원자 학번</th>
									<th>신청일</th>
									<th>지원 포인트</th>
									<th>선택</th>
									<th>완료여부</th>
								</tr>

								<c:choose>
                     			 <c:when test="${fn:length(harangdinmain) eq 0}">
                     			</c:when>
                     			 <c:otherwise>
								<c:forEach items="${harangdinmain}" var="i" varStatus="k"
											begin="${paging.beginPerPage}" 
											   end="${paging.beginPerPage + paging.numPerPage -1}">
											
									<tr>
										<td>${i.b_num }</td>
										<td>
											<a style="cursor:pointer;" onclick="fnRead('${i.b_num}')">${i.b_name}</a>
										</td>
										<td>${i.m_id }</td>
										<td>${i.bh_regdate }</td>
										<td>${i.bh_want }</td>
										<td>${i.bh_choice }</td>
										<td>${i.bh_iscomplete }</td>
									</tr>		
								</c:forEach>
							 </c:otherwise>
                   		 </c:choose>
							</table>
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
						</div><!-- 페이징 버튼 -->
					</div><!-- /.box -->  
					</div>	
				</div><!-- /.col -->
			</div>
		</div>
	</div>
</section><!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->
</div><!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->

<!-- 페이징 관련 폼 ----------------------------------------------------------------------->

<!-- 페이징 : 이전 블록으로 이동하는 폼 -->
<form id="prevPage" method="post" action="/HarangProject/harangdin?cmd=selling">
	<input type="hidden" name="nowPage" value="${paging.pagePerBlock * (paging.nowBlock-1)}"/>
	<input type="hidden" name="nowBlock" value="${paging.nowBlock-1}"/>
</form>

<!-- 페이징 : 다음 블록으로 이동하는 폼 -->
<form id="nextPage" method="post" action="/HarangProject/harangdin?cmd=selling">
	<input type="hidden" name="nowPage" value="${paging.pagePerBlock * (paging.nowBlock+1)}"/>
	<input type="hidden" name="nowBlock" value="${paging.nowBlock+1}"/>
</form>

<!-- 페이징 : 해당 페이지로 이동하는 폼 -->
<form id="goPage" method="post" action="/HarangProject/harangdin?cmd=selling">
	<input type="hidden" name="nowPage" value="" id="page"/>
	<input type="hidden" name="nowBlock" value="${paging.nowBlock}"/>
</form>

<!-- 글 읽기 -->
<form name="read" method="post" action="/HarangProject/harangdin?cmd=registMy">
	<input type="hidden" name="b_num" value="" id="b_num"/>
	<input type="hidden" name="nowPage" value="${paging.nowPage}"/>
	<input type="hidden" name="nowBlock" value="${paging.nowBlock}"/>
</form>

<!-- 페이징 관련 폼 여기까지입니다. ----------------------------------------------------------------------------------- -->

<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------>
<%@ include file="../include/footer.jsp"%>

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
	
	function fnRead(b_num){
		document.getElementById("b_num").value = b_num;
		document.read.submit();
	}
</script>

<!-- --------------------------------------------------------------------------------------------------- -->

 
