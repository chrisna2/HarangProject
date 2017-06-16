<%@page import="dto.CertiDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../include/header.jsp"%>
<!-- 해더  삽입  [지우지마세여]------------------------------------------------------------------------------------------------->
<!-- 페이지 헤드 라인 : 제목 -->
<head>
<title>스펙 업!</title>
</head>
<!-- 메인 페이지 구역 , 즉 작업 구역 -->
<div class="content-wrapper">
	<!----------------------------------- 메인페이지 헤더 [작업 제목] ------------------------------------------------------------->
	<section class="content-header">
		<h1>
			스펙 업! <small>스펙도 올리고! 포인트도 올리고!</small>
		</h1>
		<ol class="breadcrumb">
			<!-- 페이지 기록 : 메인에서 부터 현재 페이지 까지의 경로 나열 -->
			<li><a href="#"><i class="fa fa-dashboard"></i> 메인</a></li>
			<li><a href="#"> 마이페이지</a></li>
			<li class="active">스펙 업!</li>
		</ol>
	</section>
	<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
	<section class="content">
		<!-- 세로 길이 수정 -->
		<div class="row">
			<!-- 너비 사이즈 수정  : col-->
			<div class="col-md-9">

				<!-- 리스트 사용시  -->
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">하랑 도전 리스트!</h3>
						<div class="box-tools">
							<div class="input-group">

								<form action="/HarangProject/myPage?cmd=specUp" name="search"
									method="post">
									<input type="text" name="keyfield"
										class="form-control input-sm pull-right" style="width: 150px;"
										placeholder="Search" /> <select
										class="form-control input-sm pull-right" name=keyword
										style="width: 150px;">

										<option value="c_num"
											<c:choose>
                        <c:when test="${requestScope.keyword eq 'c_num' }">
                        selected="selected"
                         </c:when>
                         </c:choose>>도전
											번호</option>
										<option value="c_name"
											<c:choose>
                        <c:when test="${requestScope.keyword eq 'c_name' }">
                        selected="selected"
                         </c:when>
                         </c:choose>>도전
											이름</option>
										<option value="c_agency"
											<c:choose>
                        <c:when test="${requestScope.keyword eq 'c_agency' }">
                        selected="selected"
                         </c:when>
                         </c:choose>>도전
											기관</option>
										<option value="c_point"
											<c:choose>
                        <c:when test="${requestScope.keyword eq 'c_point' }">
                        selected="selected"
                         </c:when>
                         </c:choose>>도전
											보상</option>
										<option>성공 여부</option>
									</select>
									<div class="input-group-btn">
										<button class="btn btn-sm btn-default">
											<i class="fa fa-search"></i>
										</button>
									</div>
								</form>
							</div>
						</div>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>도전 번호</th>
									<th>도전 이름</th>
									<th>도전 기관</th>
									<th>도전 보상</th>
									<th>성공 여부</th>
								</tr>
							</thead>
							<tbody>

								<c:choose>
									<c:when test="${fn:length(aspeclist) eq 0}">
									</c:when>
									<c:otherwise>
										<c:forEach var="aspec" items="${requestScope.aspeclist}"
											begin="${paging.beginPerPage}" end="${paging.beginPerPage + paging.numPerPage -1}">
											<tr>
												<td>${aspec.c_num}</td>
												<td>${aspec.c_name }</td>
												<td>${aspec.c_agency}</td>
												<td>${aspec.c_point}P</td>
												  <c:if test="${aspec.cm_iscomplete eq 'none'}">
												      <td><span class="label label-warning">심사 중</span></td>
    					                          </c:if>
												  <c:if test="${aspec.cm_iscomplete eq 'complete'}">
    												  <td><span class="label label-success">도전 완료</span></td>
    					                          </c:if>
												  <c:if test="${aspec.cm_iscomplete eq null}">
    												  <td><span class="label label-danger">도전 중</span></td>
    					                          </c:if>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
					<!-- /.box-body -->
					<div class="box-footer clearfix">
						<ul class="pagination pagination-sm no-margin pull-right">
							<c:if test="${paging.nowBlock > 0}">
								<li><a href="javascript:prevPage()">&laquo;</a></li>
							</c:if>
							<c:forEach var="i" begin="0" end="${paging.pagePerBlock-1}"	step="1">
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
				</div>
				<!-- /.box -->


				<c:if test="${requestScope.read !=null }">

					<!-- 도전 등록 -->
					<div class="box box-black">
						<div class="box-header">
							<h3 class="box-title">스펙 등록</h3>
							<div class="box-tools pull-right">
								<button class="btn btn-box-tool" data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
								<button class="btn btn-box-tool" data-widget="remove">
									<i class="fa fa-times"></i>
								</button>
							</div>
						</div>

						<!-- form 시작 -->
						<!-- form 시작 -->
						<form role="form2" name="read"
							action="/HarangProject/myPage?cmd=specUp" method="post">

							<!-- 히든을 통해 read2를 커멘더로 넘겨줌  -->
							<input type="hidden" name="read2" value="${requestScope.read}" />

							<div class="box-body">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-bolt"></i>
										도전 이름</span> <input type="text" name="c_name" class="form-control"
										value="${read.c_name }" readonly="readonly">
								</div>
								<br>
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-sort-numeric-desc"></i> 도전 번호</span> <input type="text"
										name="c_num" class="form-control" value="${read.c_num }"
										readonly="readonly">
								</div>
								<br>
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-money"></i>
										도전 보상</span> <input type="text" name="c_point" class="form-control"
										value="${read.c_point }" readonly="readonly"> <span
										class="input-group-addon">포인트</span>
								</div>
								<br>
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-exclamation-circle"></i> 성공 여부</span> <input type="text"
										name="c_confirm" class="form-control" value="도전 중"
										readonly="readonly"> <input type="text"
										name="c_confirm_day" class="form-control" value=""
										readonly="readonly">
								</div>
								<br>
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-file-text"></i> 자격증명서</span> <span
										class="input-group-addon"> <input type="file"
										id="exampleInputFile" name="c_image" required="required">
									</span> <span class="input-group-addon bg-gray"> <img
										src="../dist/img/license.jpg" class="img-responsive"
										alt="User Image" />
									</span>
								</div>
								<br>
							</div>
							<!-- /.box-body -->

							<div class="box-footer" align="right">
								<input type="button" class="btn" value="닫기"> <input
									type="submit" class="btn btn-primary" value="스펙 등록">
							</div>

						</form>

					</div>
				</c:if>
				<!-- /.box -->

				<!-- 도전 확인  -->
				<div class="box box-black">
					<div class="box-header">
						<h3 class="box-title">도전 확인</h3>
						<div class="box-tools pull-right">
							<button class="btn btn-box-tool" data-widget="collapse">
								<i class="fa fa-minus"></i>
							</button>
							<button class="btn btn-box-tool" data-widget="remove">
								<i class="fa fa-times"></i>
							</button>
						</div>
					</div>

					<!-- form 시작 -->
					<form role="form">

						<div class="box-body">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-bolt"></i>
									도전 이름</span> <input type="text" name="c_name" class="form-control"
									value="정보 처리 기사" readonly="readonly">
							</div>
							<br>
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-sort-numeric-desc"></i> 도전 번호</span> <input type="text"
									name="c_num" class="form-control" value="c000000005"
									readonly="readonly">
							</div>
							<br>
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-money"></i>
									도전 보상</span> <input type="text" name="c_point" class="form-control"
									value="600000" readonly="readonly"> <span
									class="input-group-addon">포인트</span>
							</div>
							<br>
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-exclamation-circle"></i> 성공 여부</span> <input type="text"
									name="c_confirm" class="form-control text-green" value="도전 완료"
									readonly="readonly"> <input type="text"
									name="c_confirm_day" class="form-control text-green"
									value="2017-25-14" readonly="readonly">
							</div>
							<br>
						</div>
						<!-- /.box-body -->

						<div class="box-footer" align="right">
							<input type="button" class="btn" value="닫기">
						</div>
					</form>
				</div>
				<!-- /.box -->
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</section>
	<!-- /. 작업 공간 끝! -->
	<!------------------------------------------------------------------------------------------------------------------->
</div>
<!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->
<!-- 페이징 관련 폼 ----------------------------------------------------------------------->
<!-- 페이징 : 이전 블록으로 이동하는 폼 -->
<form id="prevPage" method="post"
	action="/HarangProject/myPage?cmd=specUp">
	<input type="hidden" name="nowPage"
		value="${paging.pagePerBlock * (paging.nowBlock-1)}" /> <input
		type="hidden" name="nowBlock" value="${paging.nowBlock-1}" />
</form>
<!-- 페이징 : 다음 블록으로 이동하는 폼 -->
<form id="nextPage" method="post"
	action="/HarangProject/myPage?cmd=specUp">
	<input type="hidden" name="nowPage"
		value="${paging.pagePerBlock * (paging.nowBlock+1)}" /> <input
		type="hidden" name="nowBlock" value="${paging.nowBlock+1}" />
</form>
<!-- 페이징 : 해당 페이지로 이동하는 폼 -->
<form id="goPage" method="post"
	action="/HarangProject/myPage?cmd=specUp">
	<input type="hidden" name="nowPage" value="" id="page" /> <input
		type="hidden" name="nowBlock" value="${paging.nowBlock}" />
</form>

<!-- 페이징 관련 폼 여기까지입니다. ----------------------------------------------------------------------------------- -->




<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------>
<%@ include file="../include/footer.jsp"%>


<script>
	///////////////// 페이지 관련 javascript function////////////////////
	function prevPage() {
		document.getElementById("prevPage").submit();
	}
	function nextPage() {
		document.getElementById("nextPage").submit();
	}
	function goPage(nowPage) {
		document.getElementById("page").value = nowPage;
		document.getElementById("goPage").submit();
	}
</script>
