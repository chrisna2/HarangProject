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
			***님의 글 <small>내가 쓴 글과 지원한 항목을 확인하세요.</small>
		</h1>
		<ol class="breadcrumb">
			<!-- 페이지 기록 메인에서 부터 현재 페이지 까지의 경로 나열 -->
			<li><a href="#"><i class="fa fa-dashboard"></i> Home > 알바 하랑</a></li>
			<li class="active">내가 쓴 글</li>
		</ol>
	</section>
	<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
	<section class="content">
	<div class="row">
		<div class="col-md-10">
			
			
			<!-- 알바 모집 collapse -->
			<div class="box box-info">
                <div class="box-header with-border">
                  <h3 class="box-title">알바 모집</h3>
                  <small>내가 작성한 알바 모집 공고입니다.</small>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                  </div>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table class="table table-bordered table-striped">
							<tr>
								<th style="width: 10px">#</th>
								<th style="width: 60%">제목</th>
								<th>작성일</th>
								<th>조회수</th>
								<th>지원자 수</th>
							</tr>
							<c:choose>
								<c:when test="${fn:length(plist) eq 0}">
									<tr>
										<td></td>
										<td>게시물이 없습니다.<td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${plist}" var="list" 
											   begin="${paging1.beginPerPage}" 
											   end="${paging1.beginPerPage + paging1.numPerPage -1}" 
											   varStatus="status">
										<tr>
											<td>${list.list_num}</td>
											<td>${list.p_header}&nbsp;&nbsp; 
												<a href="#" onclick="fnP_Read('${list.p_num}')">${list.p_title}</a>
											</td>
											<td>${list.p_regdate}</td>
											<td>${list.p_cnt}</td>
											<td>${list.cnt_apply}</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</table>
                </div><!-- /.box-body -->
                
                <!-- 페이징 버튼 -->
					<div class="box-footer clearfix">
						<ul class="pagination pagination-sm no-margin pull-right">
							<c:if test="${paging1.nowBlock > 0}">
							<li><a href="javascript:prevPage()">&laquo;</a></li>
							</c:if>
						  <c:forEach var="i" begin="0" end="${paging1.pagePerBlock-1}" step="1">
						  	<!-- if문 추가 : 20170615 -->
						  	<c:if test="${paging1.nowBlock*paging1.pagePerBlock+i < paging1.totalPage}" >
							<li><a href="javascript:goPage('${paging1.nowBlock*paging1.pagePerBlock+i}')">${paging1.nowBlock*paging1.pagePerBlock+(i+1)}</a></li>
						  	</c:if>
						  	<!-- 끝 -->
						  </c:forEach>
						  	<c:if test="${paging1.totalBlock > paging1.nowBlock +1}">
							<li><a href="javascript:nextPage()">&raquo;</a></li>
							</c:if>
						</ul>
					</div><!-- 페이징 버튼 -->
              </div><!-- /.box -->
              
           	<!-- 대타 모집 collapse -->
			<div class="box box-warning">
                <div class="box-header with-border">
                  <h3 class="box-title">대타 모집</h3>
                  <small>내가 작성한 대타 모집 공고입니다.</small>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                  </div>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table class="table table-bordered table-striped">
							<tr>
								<th style="width: 10px">#</th>
								<th style="width: 60%">제목</th>
								<th>작성일</th>
								<th>조회수</th>
								<th>지원자 수</th>
							</tr>
							<c:choose>
								<c:when test="${fn:length(dlist) eq 0}">
								<tr>
									<td></td>
									<td>게시물이 없습니다.<td>
									<td></td>
									<td></td>
									<td></td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${dlist}" var="list" 
											   begin="${paging2.beginPerPage}" 
											   end="${paging2.beginPerPage + paging2.numPerPage -1}" 
											   varStatus="status">
										<tr>
											<td>${list.list_num}</td>
											<td>${list.d_header}&nbsp;&nbsp; 
												<a href="javascript:fnRead('${list.d_num}')" id="read">${list.d_title}</a>
											</td>
											<td>${list.d_regdate}</td>
											<td>${list.d_cnt}</td>
											<td>${list.cnt_apply}</td>
										</tr>
									</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
                </div><!-- /.box-body -->
                <!-- 페이징 버튼 -->
					<div class="box-footer clearfix">
						<ul class="pagination pagination-sm no-margin pull-right">
							<c:if test="${paging2.nowBlock > 0}">
							<li><a href="javascript:prevPage()">&laquo;</a></li>
							</c:if>
						  <c:forEach var="i" begin="0" end="${paging2.pagePerBlock-1}" step="1">
						  	<!-- if문 추가 : 20170615 -->
						  	<c:if test="${paging2.nowBlock*paging2.pagePerBlock+i < paging2.totalPage}" >
							<li><a href="javascript:goPage('${paging2.nowBlock*paging2.pagePerBlock+i}')">${paging2.nowBlock*paging2.pagePerBlock+(i+1)}</a></li>
						  	</c:if>
						  	<!-- 끝 -->
						  </c:forEach>
						  	<c:if test="${paging2.totalBlock > paging2.nowBlock +1}">
							<li><a href="javascript:nextPage()">&raquo;</a></li>
							</c:if>
						</ul>
					</div><!-- 페이징 버튼 -->
			</div><!-- /.box -->
                
            <!-- 알바 지원 collapse -->
			<div class="box box-success">
                <div class="box-header with-border">
                  <h3 class="box-title">알바 지원</h3>
                  <small>내가 지원한 알바 목록입니다.</small>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                  </div>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table id = "example1" class="table table-bordered table-striped">
							<tr>
								<th style="width: 10px">#</th>
								<th style="width: 40%">제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>이력서</th>
								<th>지원자 수</th>
								<th>채용 여부</th>
							</tr>
							<c:choose>
								<c:when test="${fn:length(p_resume) eq 0}">
								<tr>
									<td></td>
									<td>게시물이 없습니다.<td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${p_resume}" var="list" 
											   begin="${paging3.beginPerPage}" 
											   end="${paging3.beginPerPage + paging3.numPerPage -1}" 
											   varStatus="status">
										<tr>
											<td>${list.list_num}</td>
											<td>${list.p_header}&nbsp;&nbsp; 
												<a href="javascript:fnRead('${list.p_num}')" id="read">${list.p_title}</a>
											</td>
											<td>${list.m_name} </td>
											<td>${list.p_regdate} </td>
											<td><button class="btn btn-block btn-danger">이력서</button></td>
											<td>${list.cnt_apply}</td>
											<td></td>
										</tr>
									</c:forEach>
							</c:otherwise>
							</c:choose>
						</table>
                </div><!-- /.box-body -->
                <!-- 페이징 버튼 -->
					<div class="box-footer clearfix">
						<ul class="pagination pagination-sm no-margin pull-right">
							<c:if test="${paging3.nowBlock > 0}">
							<li><a href="javascript:prevPage()">&laquo;</a></li>
							</c:if>
						  <c:forEach var="i" begin="0" end="${paging3.pagePerBlock-1}" step="1">
						  	<!-- if문 추가 : 20170615 -->
						  	<c:if test="${paging3.nowBlock*paging3.pagePerBlock+i < paging3.totalPage}" >
							<li><a href="javascript:goPage('${paging3.nowBlock*paging3.pagePerBlock+i}')">${paging2.nowBlock*paging2.pagePerBlock+(i+1)}</a></li>
						  	</c:if>
						  	<!-- 끝 -->
						  </c:forEach>
						  	<c:if test="${paging3.totalBlock > paging3.nowBlock +1}">
							<li><a href="javascript:nextPage()">&raquo;</a></li>
							</c:if>
						</ul>
					</div><!-- 페이징 버튼 -->
              </div><!-- /.box -->
                
            <!-- 대타 지원 collapse -->
			<div class="box box-danger">
                <div class="box-header with-border">
                  <h3 class="box-title">대타 지원</h3>
                  <small>내가 지원한 대타 목록입니다.</small>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                  </div>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table id = "example1" class="table table-bordered table-striped">
							<tr>
								<th style="width: 10px">#</th>
								<th style="width: 40%">제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>이력서</th>
								<th>지원자 수</th>
								<th>채용 여부</th>
							</tr>
							<c:choose>
								<c:when test="${fn:length(d_resume) eq 0}">
								<tr>
									<td></td>
									<td>게시물이 없습니다.<td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${d_resume}" var="list" 
											   begin="${paging4.beginPerPage}" 
											   end="${paging4.beginPerPage + paging4.numPerPage -1}" 
											   varStatus="status">
										<tr>
											<td>${list.list_num}</td>
											<td>${list.p_header}&nbsp;&nbsp; 
												<a href="#">${list.p_title}</a>
											</td>
											<td>${list.m_name} </td>
											<td>${list.p_regdate} </td>
											<td><button class="btn btn-block btn-danger">이력서</button></td>
											<td>${list.cnt_apply}</td>
											<td></td>
										</tr>
									</c:forEach>
							</c:otherwise>
							</c:choose>
							
							</tr>
						</table>
                </div><!-- /.box-body -->
                <!-- 페이징 버튼 -->
					<div class="box-footer clearfix">
						<ul class="pagination pagination-sm no-margin pull-right">
							<c:if test="${paging4.nowBlock > 0}">
							<li><a href="javascript:prevPage()">&laquo;</a></li>
							</c:if>
						  <c:forEach var="i" begin="0" end="${paging4.pagePerBlock-1}" step="1">
						  	<!-- if문 추가 : 20170615 -->
						  	<c:if test="${paging4.nowBlock*paging4.pagePerBlock+i < paging4.totalPage}" >
							<li><a href="javascript:goPage('${paging4.nowBlock*paging4.pagePerBlock+i}')">${paging2.nowBlock*paging2.pagePerBlock+(i+1)}</a></li>
						  	</c:if>
						  	<!-- 끝 -->
						  </c:forEach>
						  	<c:if test="${paging4.totalBlock > paging4.nowBlock +1}">
							<li><a href="javascript:nextPage()">&raquo;</a></li>
							</c:if>
						</ul>
					</div><!-- 페이징 버튼 -->
              </div><!-- /.box -->  
           
            </div><!-- /.col -->
		</div><!-- /.row -->
	</section><!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->
</div><!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->
<form name="pRead" method="post" action="/HarangProject/parttime?cmd=PREAD">
	<input type="hidden" name="p_num" value="" id="p_num"/>
</form>

<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------>
<%@ include file="../include/footer.jsp"%>
<!-- --------------------------------------------------------------------------------------------------- -->
<script>
function fnP_Read(p_num){
	document.getElementById("p_num").value = p_num;
	pRead.submit();
}	
</script>



 
