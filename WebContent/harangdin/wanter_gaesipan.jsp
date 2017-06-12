<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@ include file="../include/header.jsp" %>
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
             	내 중고도서 구매 희망자
          </h1>
          <ol class="breadcrumb">
          <!-- 페이지 기록 메인에서 부터 현재 페이지 까지의 경로 나열 -->
            <li><a href="#"><i class="fa fa-dashboard"></i> 메인</a></li>
            <li class="active">하랑딘 24</li>
            <li class="active">내 중고도서 구매 희망자</li>
          </ol>
        </section>
<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
	<section class="content">
		<div class="row">
			<div class="col-md-10">
				<div class="box">
					<div class="box-header"></div>
					<!-- box-header -->
					<div class="box-body">
							<div class="row">
								<div class="col-sm-12">
				
									<table id="example2" class="table table-bordered table-hover dataTable">
											<tr role="row">
												<th style="width: 50px">No</th>
												<th style="width: 40%">도서명</th>
												<th>학번</th>
												<th>구매자 희망 포인트</th>
												<th>신청 날짜</th>
												<th>선택</th>
											</tr>
											<tr>
												<td>1</td>
												<td>시나공 정보처리기사 필기</td>
												<td>20140001</td>
												<td>2500</td>
												<td>2017.06.08</td>
												<td><input type="checkbox" name="pick"/></td>
											</tr>
											<tr>
												<td>2</td>
												<td>지윤이의 하루</td>
												<td>20137214</td>
												<td>1500</td>
												<td>2017.06.08</td>
												<td><input type="checkbox" name="pick"/></td>
											</tr>
									</table>
								</div>
							</div> <!-- row -->
							<div class="row">
								<div class="col-sm-5"></div>
								<div class="col-sm-7">
									<div class="dataTables_paginate paging_simple_numbers">
										<ul class="pagination">
											<li><a href="#">Previous</a></li>
											<li><a href="#">1</a></li>
											<li><a href="#">2</a></li>
											<li><a href="#">3</a>
											<li><a href="#">Next</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div><!-- body -->
					</div>
				</div>
			</div><!-- row -->
	</section>

	<!-- /. 작업 공간 끝! -->
	<!------------------------------------------------------------------------------------------------------------------->
	</div><!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->
      
<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------> 
<%@ include file="../include/footer.jsp" %>