<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<!-- 페이지 헤드 라인 : 제목 -->
<head>
<%@ include file="../include/header.jsp"%>
<title>대나무숲 리스트 사용자페이지</title>




</head>

<div class="content-wrapper">
	<!----------------------------------- 메인페이지 헤더 [작업 제목] ------------------------------------------------------------->
	<section class="content-header">
		<h1>대나무숲 리스트 사용자페이지</h1>
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
					<div class="box-header">
						<h3 class="box-title">대나무숲</h3>
						<div class="box-tools">
								<form action="/HarangProject/bamboo?cmd=U_BB_POST" name="bbpost"
							method="post">
							<div class="input-group">
								<button type="submit" 
								 class="btn btn-primary pull-right btn-sm">글쓰기</button>
								
							</div>
							</form>
						</div>
					</div>
					<!-- /.box-header -->
					<div class="box-body table-responsive no-padding">
						<table class="table table-hover">


							<tr>

								
								<th>작성자</th>
								<th>작성일</th>
								<th>제목</th>
								<th>조회수</th>
								

							</tr>

							
							<c:if test="${bblist != null }">
							<c:forEach var="i" begin="0" end="${bblist.size()-1 }">

								<tr>
									
									<td>${bblist[i].bb_nickname}</td>
									<td><fmt:formatDate value="${bblist[i].bb_regdate}" pattern="yyyy-MM-dd"/></td>
									<td><a href="/HarangProject/bamboo?cmd=U_BB_CON&bb_num=${bblist[i].bb_num}"  style= "color: black" >${bblist[i].bb_title}</a></td>
									<td>${bblist[i].bb_count}</td>
									
								</tr>


							</c:forEach>
							</c:if>
							<!-- 
							<tr>
							
								<td>${bbdto.bb_num}</td>
								<td>${bbdto.bb_nickname}</td>
								<td>${bbdto.bb_regdate}</td>
								<td><a href="#" class="" style="color: black">${bbdto.bb_title}</a></td>
								<td>${bbdto.bb_count}</td>
								<td>20</td>

							</tr>
							 -->

						</table>
					</div>
					<!-- /.box-body -->

					<div class="box-footer clearfix">






						<ul class="pagination pagination-sm no-margin pull-right">
							<li><a href="#">&laquo;</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">&raquo;</a></li>
						</ul>

						<form action="/HarangProject/bamboo?cmd=BB_LIST" name="search"
							method="post">
							<div class="input-group">

								<select name="sOption" class="form-control input-sm"
									style="width: 150px;">
									
									<option value="bb_title">제목</option>
									<option value="bb_content">내용</option>

								</select> 
								<input type="text" name="table_search"
									class="form-control input-sm" style="width: 150px;"
									placeholder="Search" />
								
									<button class="btn btn-sm btn-default pull-left">
										<i class="fa fa-search"></i>
									</button>
								
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- /.box -->
		</div>

	</section>
</div>





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