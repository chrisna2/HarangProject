<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<!-- 페이지 헤드 라인 : 제목 -->
<head>
<%@ include file="../include/header.jsp"%>
<title>대나무숲 리스트 사용자페이지</title>
<style>
table {
	table-layout: fixed;
}

td {
	word-break: break-all;
	word-wrap: break-word;
}
</style>


<script>
	function fnBbnewlist() {
		document.bbnewlist.submit()
	}
	function fnBbhotlist() {
		document.bbhotlist.submit()
	}
	function fnBbpost() {
		document.bbpost.submit()
	}
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
	/////////////////////////////끝//////////////////////////////////
</script>


</head>

<div class="content-wrapper">
	<!----------------------------------- 메인페이지 헤더 [작업 제목] ------------------------------------------------------------->
	<section class="content-header">
		<h1>
			<a href="/HarangProject/bamboo?cmd=BB_LIST" style="color: black">대나무숲
				리스트 사용자페이지</a>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> 메인</a></li>
			<li class="active">대나무숲</li>
		</ol>
	</section>
	<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
	<br> <br>
	<section class="content">

		<!-- 컨텐츠 헤더부분. 제목. 작성일. 작성자. 추천/비추천 수 표시 -->



		<!--  여기부터 본문 -->

		<!-- 세로 길이 수정 -->
		<div class="row">
			<!-- 너비 사이즈 수정  : col-->
			<div class="col-md-9">
				<div class="box">
					<div class="box-header" style="background-color: #dceff4">
						<h1 class="box-title">
							<a href="/HarangProject/bamboo?cmd=BB_LIST" style="color: black">대나무숲</a>
						</h1>
						<div class="box-tools">

							<p align="right">
								<a type="button" class="btn btn-default btn-sm"
									href="javascript:fnBbnewlist()"
									title="최신글 보기 : 최근 3일 이내의 게시글을 게시일 순서로 검색합니다. "
									data-placement="top">최신글 보기</a> <a type="button"
									class="btn btn-default btn-sm" href="javascript:fnBbhotlist()"
									title="인기글 보기 : 최근 30일 이내의 게시글을 추천수가 많은 순서로 검색합니다. "
									data-placement="top">인기글 보기</a> <a type="button"
									class="btn btn-primary btn-sm" href="javascript:fnBbpost()">글쓰기</a>
							</p>



							<!-- 최신글 보기를 위한 form 시작 -->

							<form action="/HarangProject/bamboo" name="bbnewlist"
								method="post">
								<input type="hidden" name="cmd" value="BB_LIST"> <input
									type="hidden" name="table_search" value="bbnewlist">

							</form>
							<!-- 최신글 보기를 위한 form 끝 -->

							<!-- 인기글 보기를 위한 form 시작 -->
							<form action="/HarangProject/bamboo" name="bbhotlist"
								method="post">
								<input type="hidden" name="cmd" value="BB_LIST"> <input
									type="hidden" name="table_search" value="bbhotlist">

							</form>
							<!-- 인기글 보기를 위한 form 끝 -->

							<!-- 글쓰기를 위한 form 시작 -->
							<form action="/HarangProject/bamboo" name="bbpost" method="post">
								<input type="hidden" name="cmd" value="U_BB_POST">

							</form>
							<!-- 인기글 보기를 위한 form 끝 -->





						</div>
					</div>
					<!-- /.box-header -->
					<div class="box-body table-responsive no-padding">
						<table class="table table-hover">


							<tr>
								<th width="100">작성일</th>
								<th width="100">닉네임</th>
								<th>제목</th>
								<th width="70">조회수</th>
								<th width="70">추천수</th>

							</tr>

							<c:choose>
								<c:when test="${fn:length(bbnlist) eq 0}">
								공지사항이 없습니다.
								</c:when>
								<c:otherwise>
									<c:forEach items="${bbnlist}" var="bbnlist"
										begin="${paging.beginPerPage}"
										end="${paging.beginPerPage + paging.numPerPage -1}"
										varStatus="status">
										<tr bgcolor="pink">
											<td><fmt:formatDate value="${bbnlist.bb_regdate}"
													pattern="yyyy-MM-dd" /></td>
											<td>${bbnlist.bb_nickname}</td>
											<td><a href="/HarangProject/bamboo?cmd=U_BB_CON&bb_num=${bbnlist.bb_num}"
												style="color: black">[공지] ${bbnlist.bb_title}
													[${bbnlist.reply_cnt}]</a></td>
											<td>${bbnlist.bb_count}</td>
											<td>${bbnlist.like_cnt}</td>

										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>















							<c:choose>
								<c:when test="${fn:length(bblist) eq 0}">
								게시물이 없습니다.
								</c:when>
								<c:otherwise>
									<c:forEach items="${bblist}" var="bblist"
										begin="${paging.beginPerPage}"
										end="${paging.beginPerPage + paging.numPerPage -1}"
										varStatus="status">
										<tr>
											<td><fmt:formatDate value="${bblist.bb_regdate}"
													pattern="yyyy-MM-dd" /></td>
											<td>${bblist.bb_nickname}</td>
											<td><a
												href="/HarangProject/bamboo?cmd=U_BB_CON&bb_num=${bblist.bb_num}"
												style="color: black">${bblist.bb_title}
													[${bblist.reply_cnt}]</a></td>
											<td>${bblist.bb_count}</td>
											<td>${bblist.like_cnt}</td>

										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>

						</table>
					</div>
					<!-- /.box-body -->





						<!-- 페이징 버튼 -->
						<div class="box-footer clearfix" style="background-color: #dceff4">
							<ul class="pagination pagination-sm no-margin pull-right">
								<c:if test="${paging.nowBlock > 0}">
									<li><a href="javascript:prevPage()">&laquo;</a></li>
								</c:if>
								<c:forEach var="i" begin="0" end="${paging.pagePerBlock-1}"
									step="1">
									<!-- if문 추가 : 20170615 -->
									<c:if
										test="${paging.nowBlock*paging.pagePerBlock+i < paging.totalPage}">
										<li><a
											href="javascript:goPage('${paging.nowBlock*paging.pagePerBlock+i}')">${paging.nowBlock*paging.pagePerBlock+(i+1)}</a></li>
									</c:if>
									<!-- 끝 -->
								</c:forEach>
								<c:if test="${paging.totalBlock > paging.nowBlock +1}">
									<li><a href="javascript:nextPage()">&raquo;</a></li>
								</c:if>
							</ul>
						<form action="/HarangProject/bamboo" name="search" method="post">

							<input type="hidden" name="cmd" value="BB_LIST">
							<div class="input-group">

								<select name="sOption" class="form-control input-sm"
									style="width: 150px;">

									<option value="bb_title">제목</option>
									<option value="bb_content">내용</option>

								</select> <input type="text" name="table_search"
									class="form-control input-sm" style="width: 150px;"
									placeholder="Search" />

								<button class="btn btn-sm btn-default pull-left">
									<i class="fa fa-search"></i>
								</button>

							</div>
						</form>
						</div>
						<!-- 페이징 버튼 -->

				</div>
			</div>
			<!-- /.box -->
		</div>

	</section>
</div>

<!-- 페이징 관련 폼 ----------------------------------------------------------------------->
<!-- 페이징 : 이전 블록으로 이동하는 폼 -->
<form id="prevPage" method="post" action="/HarangProject/bamboo">
	<input type="hidden" name="cmd" value="BB_LIST" /> <input
		type="hidden" name="nowPage"
		value="${paging.pagePerBlock * (paging.nowBlock-1)}" /> <input
		type="hidden" name="nowBlock" value="${paging.nowBlock-1}" />
</form>
<!-- 페이징 : 다음 블록으로 이동하는 폼 -->
<form id="nextPage" method="post" action="/HarangProject/bamboo">
	<input type="hidden" name="cmd" value="BB_LIST" /> <input
		type="hidden" name="nowPage"
		value="${paging.pagePerBlock * (paging.nowBlock+1)}" /> <input
		type="hidden" name="nowBlock" value="${paging.nowBlock+1}" />
</form>
<!-- 페이징 : 해당 페이지로 이동하는 폼 -->
<form id="goPage" method="post" action="/HarangProject/bamboo">
	<input type="hidden" name="cmd" value="BB_LIST" /> <input
		type="hidden" name="nowPage" value="" id="page" /> <input
		type="hidden" name="nowBlock" value="${paging.nowBlock}" />
</form>
<!-- 페이징 관련 폼 여기까지입니다. ----------------------------------------------------------------------------------- -->
<!-- /.col -->

<!-- /.content-wrapper -->
<%@ include file="../include/footer.jsp"%>


<!-- ★★★Ajax를 배우면 이해 할 수 있는 곳 : 여기에 데이터를 삽입합니다. -->
<script type="text/javascript">
	$(function() {

		/* initialize the calendar
		 -----------------------------------------------------------------*/
		//현재 년 월 일 불러 오기
		var date = new Date();
		var d = date.getDate(), m = date.getMonth(), y = date.getFullYear();

		$('#calendar').fullCalendar(
				{
					header : {
						left : 'prev,next',
						center : 'title',
						right : 'today'
					},
					buttonText : {
						today : '오늘날짜',
						month : '월별',
						week : '주별',
						day : '일별'
					},
					titleFormat : {
						month : 'YYYY년 MMMM'
					},
					monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월",
							"8월", "9월", "10월", "11월", "12월" ],
					monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월",
							"7월", "8월", "9월", "10월", "11월", "12월" ],
					dayNames : [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일",
							"<font color='blue'>토요일</font>" ],
					dayNamesShort : [ "일", "월", "화", "수", "목", "금", "토" ],
					editable : true
				});
	});
</script>