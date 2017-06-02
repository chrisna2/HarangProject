<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
				<div class="box">
					<div class="box-header">
						<h3 class="box-title"></h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<table id = "example1" class="table table-bordered table-striped">
							<tr>
								<th></th>
								<th style="width: 10px">#</th>
								<th style="width: 40%">제목</th>
								<th>대타 날짜</th>
								<th>글쓴이</th>
								<th>작성일</th>
								<th>조회수</th>
								<th>지원자 수</th>
							</tr>
							<tr>
								<td><input type="checkbox" name="check"/></td>
								<td>1</td>
								<td>[모집중] 컴퓨터공학과 과사무실 알바 모집<br>시급 : 7000원 업무 : 사무/청소
								</td>
								<td>2017-05-29</td>
								<td>컴공조교</td>
								<td>2017-05-29</td>
								<td>100</td>
								<td>20</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="check"/></td>
								<td>2</td>
								<td>[모집중] 학관 카페 파트타임 모집<br>시급 : 6500원 업무 : 바리스타/서비스
								</td>
								<td>2017-05-25</td>
								<td>카페</td>
								<td>2017-05-25</td>
								<td>45</td>
								<td>5</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="check"/></td>
								<td>3</td>
								<td>[마감] 하랑대학교 안전지킴이 알바<br>시급 : 6500원 업무 : 서비스
								</td>
								<td>2017-05-15</td>
								<td>관리자</td>
								<td>2017-05-15</td>
								<td>64</td>
								<td>20</td>
							</tr>
							<tr>
								<td><input type="checkbox" name="check"/></td>
								<td>4</td>
								<td>[마감] 학관 식당 설거지 알바<br>시급 : 6500원 업무 : 설거지
								</td>
								<td>2017-05-29</td>
								<td>학생식당</td>
								<td>2017-05-29</td>
								<td>15</td>
								<td>3</td>
							</tr>
						</table>
					</div>
					<div class="col-md-2">
						<button class="btn btn-block btn-danger">삭제</button>
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
					</div><!-- /.box -->
					<div class="row">
						<div class="col-md-2"></div>
						<div class="col-md-2 form-group">
							<select class="form-control">
	                        <option>제목</option>
	                        <option>시급</option>
	                        <option>직종</option>
	                      </select>
						</div>
						<div class="col-md-6 input-group input-group-sm">
	                    <input type="text" class="form-control">
	                    <span class="input-group-btn">
	                      <button class="btn btn-info btn-flat" type="button">Go!</button>
	                    </span>
	                  </div><!-- /input-group -->
                  </div>
				</div>
			</div>
		</div><!-- row -->


	</section><!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->
</div><!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->

<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------>
<%@ include file="../include/footer.jsp"%>

<!-- --------------------------------------------------------------------------------------------------- -->

 
