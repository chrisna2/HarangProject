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
                  <table id = "example1" class="table table-bordered table-striped">
							<tr>
								<th style="width: 10px">#</th>
								<th style="width: 60%">제목</th>
								<th>작성일</th>
								<th>조회수</th>
								<th>지원자 수</th>
							</tr>
							<tr>
								<td>1</td>
								<td>[모집중] 컴퓨터공학과 과사무실 알바 모집<br>시급 : 7000원 업무 : 사무/청소
								</td>
								<td>2017-05-29</td>
								<td>100</td>
								<td>20</td>
							</tr>
							
						</table>
                </div><!-- /.box-body -->
                <div class="box-footer clearfix">
						<ul class="pagination pagination-sm no-margin pull-right">
							<li><a href="#">&laquo;</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">&raquo;</a></li>
						</ul>
				</div><!-- /.box -->
                
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
                  <table id = "example1" class="table table-bordered table-striped">
							<tr>
								<th style="width: 10px">#</th>
								<th style="width: 60%">제목</th>
								<th>작성일</th>
								<th>조회수</th>
								<th>지원자 수</th>
							</tr>
							<tr>
								<td>1</td>
								<td>[모집중] 컴퓨터공학과 과사무실 알바 모집<br>시급 : 7000원 업무 : 사무/청소
								</td>
								<td>2017-05-29</td>
								<td>100</td>
								<td>20</td>
							</tr>
							
						</table>
                </div><!-- /.box-body -->
                <div class="box-footer clearfix">
						<ul class="pagination pagination-sm no-margin pull-right">
							<li><a href="#">&laquo;</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">&raquo;</a></li>
						</ul>
				</div><!-- /.box -->
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
								<th style="width: 60%">제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>이력서</th>
								<th>지원자 수</th>
								<th>채용 여부</th>
							</tr>
							<tr>
								<td>1</td>
								<td>[모집중] 컴퓨터공학과 과사무실 알바 모집<br>시급 : 7000원 업무 : 사무/청소
								</td>
								<td>컴공 조교</td>
								<td>2017-05-29</td>
								<td><button class="btn btn-block btn-success">이력서</button></td>
								<td>10</td>
								<td>Y</td>
							</tr>
							
						</table>
                </div><!-- /.box-body -->
                <div class="box-footer clearfix">
						<ul class="pagination pagination-sm no-margin pull-right">
							<li><a href="#">&laquo;</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">&raquo;</a></li>
						</ul>
				</div><!-- /.box -->
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
								<th style="width: 60%">제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>이력서</th>
								<th>지원자 수</th>
								<th>채용 여부</th>
							</tr>
							<tr>
								<td>1</td>
								<td>[모집중] 컴퓨터공학과 과사무실 알바 모집<br>시급 : 7000원 업무 : 사무/청소
								</td>
								<td>컴공 조교</td>
								<td>2017-05-29</td>
								<td><button class="btn btn-block btn-danger">이력서</button></td>
								<td>10</td>
								<td>Y</td>
							</tr>
							
							</tr>
						</table>
                </div><!-- /.box-body -->
                <div class="box-footer clearfix">
						<ul class="pagination pagination-sm no-margin pull-right">
							<li><a href="#">&laquo;</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">&raquo;</a></li>
						</ul>
				</div><!-- /.box -->
              </div><!-- /.box -->  
           
            </div><!-- /.col -->
		</div>
	</section><!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->
</div><!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->

<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------>
<%@ include file="../include/footer.jsp"%>

<!-- --------------------------------------------------------------------------------------------------- -->

 
