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
             	중고도서 거래 게시판
          </h1>
          <ol class="breadcrumb">
          <!-- 페이지 기록 메인에서 부터 현재 페이지 까지의 경로 나열 -->
            <li><a href="#"><i class="fa fa-dashboard"></i> 메인</a></li>
            <li class="active">하랑딘 24</li>
          </ol>
        </section>
<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
        <section class="content">
        <div class="row">
        	<div class="col-xs-12">

				<div class="box">
					<div class="col-xs-6 box-header">
						<!-- <h3 class="box-title">Hover Data Table</h3> -->
						<div class="input-group margin">
							<div class="input-group-btn">
								<button type="button" class="btn btn-info.btn-flat">
									<i class="fa fa-search"></i>
								</button>
							</div>
							<!-- /btn-group -->
							<input type="text" class="form-control">
						</div>
                    <button type="button" class="btn btn-block btn-default" >등록</button>
					</div>


					<div class="box-body">
						<div id="example2_wrapper"
							class="dataTables_wrapper form-inline dt-bootstrap">
							<div class="row">
								<div class="col-sm-6"></div>
								<div class="col-sm-6"></div>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<table id="example2"
										class="table table-bordered table-hover dataTable" role="grid"
										aria-describedby="example2_info">
										<thead>
											<tr role="row">
												<th class="sorting_asc" tabindex="0"
													aria-controls="example2" rowspan="1" colspan="1"
													aria-sort="ascending">거래번호</th>
												<th class="sorting" tabindex="0" aria-controls="example2"
													rowspan="1" colspan="1">도서명</th>
												<th class="sorting" tabindex="0" aria-controls="example2"
													rowspan="1" colspan="1">저자</th>
												<th class="sorting" tabindex="0" aria-controls="example2"
													rowspan="1" colspan="1">출판사</th>
												<th class="sorting" tabindex="0" aria-controls="example2"
													rowspan="1" colspan="1">희망 포인트</th>
											</tr>
										</thead>
										<tbody>

											<tr role="row" class="odd">
												<td class="sorting_1">1</td>
												<td>시나공 정보처리기사 필기</td>
												<td>길벗알앤디</td>
												<td>길벗</td>
												<td>3000</td>
											</tr>
											<tr role="row" class="even">
												<td class="sorting_1">2</td>
												<td>Firefox 1.5</td>
												<td>Win 98+ / OSX.2+</td>
												<td>1.8</td>
												<td>A</td>
											</tr>
											<tr role="row" class="odd">
												<td class="sorting_1">3</td>
												<td>Firefox 2.0</td>
												<td>Win 98+ / OSX.2+</td>
												<td>1.8</td>
												<td>A</td>
											</tr>
											<tr role="row" class="even">
												<td class="sorting_1">4</td>
												<td>Firefox 3.0</td>
												<td>Win 2k+ / OSX.3+</td>
												<td>1.9</td>
												<td>A</td>
											</tr>
											<tr role="row" class="odd">
												<td class="sorting_1">5</td>
												<td>Camino 1.0</td>
												<td>OSX.2+</td>
												<td>1.8</td>
												<td>A</td>
											</tr>
											<tr role="row" class="even">
												<td class="sorting_1">6</td>
												<td>Camino 1.5</td>
												<td>OSX.3+</td>
												<td>1.8</td>
												<td>A</td>
											</tr>
											<tr role="row" class="odd">
												<td class="sorting_1">7</td>
												<td>Netscape 7.2</td>
												<td>Win 95+ / Mac OS 8.6-9.2</td>
												<td>1.7</td>
												<td>A</td>
											</tr>
											<tr role="row" class="even">
												<td class="sorting_1">8</td>
												<td>Netscape Browser 8</td>
												<td>Win 98SE+</td>
												<td>1.7</td>
												<td>A</td>
											</tr>
											<tr role="row" class="odd">
												<td class="sorting_1">9</td>
												<td>Netscape Navigator 9</td>
												<td>Win 98+ / OSX.2+</td>
												<td>1.8</td>
												<td>A</td>
											</tr>
											<tr role="row" class="even">
												<td class="sorting_1">10</td>
												<td>Mozilla 1.0</td>
												<td>Win 95+ / OSX.1+</td>
												<td>1</td>
												<td>A</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-5">
									<div class="dataTables_info" id="example2_info" role="status"
										aria-live="polite">Showing 1 to 10 of 57 entries</div>
								</div>
								<div class="col-sm-7">
									<div class="dataTables_paginate paging_simple_numbers"
										id="example2_paginate">
										<ul class="pagination">
											<li class="paginate_button previous disabled"
												id="example2_previous"><a href="#"
												aria-controls="example2" data-dt-idx="0" tabindex="0">Previous</a>
											</li>
											<li class="paginate_button active"><a href="#"
												aria-controls="example2" data-dt-idx="1" tabindex="0">1</a>
											</li>
											<li class="paginate_button "><a href="#"
												aria-controls="example2" data-dt-idx="2" tabindex="0">2</a>
											</li>
											<li class="paginate_button "><a href="#"
												aria-controls="example2" data-dt-idx="3" tabindex="0">3</a>
											</li>
											<li class="paginate_button "><a href="#"
												aria-controls="example2" data-dt-idx="4" tabindex="0">4</a>
											</li>
											<li class="paginate_button "><a href="#"
												aria-controls="example2" data-dt-idx="5" tabindex="0">5</a>
											</li>
											<li class="paginate_button "><a href="#"
												aria-controls="example2" data-dt-idx="6" tabindex="0">6</a>
											</li>
											<li class="paginate_button next" id="example2_next"><a
												href="#" aria-controls="example2" data-dt-idx="7"
												tabindex="0">Next</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
        </div>
        </section><!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->        
      </div><!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->
      
<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------> 
<%@ include file="../include/footer.jsp" %>