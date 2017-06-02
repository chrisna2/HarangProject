<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/header_a.jsp" %>
<!-- 해더  삽입  [지우지마세여]------------------------------------------------------------------------------------------------->
<!-- 페이지 헤드 라인 : 제목 -->
<head>
     <title>수업 등록 수정</title>
</head>
	  <!-- 메인 페이지 구역 , 즉 작업 구역 -->
      <div class="content-wrapper">
<!----------------------------------- 메인페이지 헤더 [작업 제목] ------------------------------------------------------------->
        <section class="content-header">
          <h1>
             	수업 등록 수정
          </h1>
         <br>
         <input type="submit" class="btn btn-success col-md-12 col-xs-12" value="수업 신규 등록">
         <br>
         <br>
         <ol class="breadcrumb">
          <!-- 페이지 기록 : 메인에서 부터 현재 페이지 까지의 경로 나열 -->
            <li><a href="#"><i class="fa fa-dashboard"></i> 관리자 메인</a></li>
            <li><a href="#"> 사이트 관리</a></li>
            <li class="active"> 수업 등록 수정 </li>
          </ol>
        </section>
<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
        <section class="content">
          <!-- 세로 길이 수정 -->
          <div class="row">
           <!-- 너비 사이즈 수정  : col-->
           <div class="col-md-12">
           
             <div class="box">
                <div class="box-header">
                    <h3 class="box-title">수업 목록 조회 / 개설</h3>
                </div>
                <div class="box-body">
                    <form action="">
                     <div class="input-group">
                          <span class="input-group-addon bg-gray"><i class="fa fa-sort-numeric-desc"></i> 개설 학기</span>
                          <select class="form-control input-sm" required="required">
                            <option></option>
                            <option value="1">1학기</option>
                            <option value="2">2학기</option>
                          </select>
                    </div>
                     <br>
                     <div class="input-group">
                          <span class="input-group-addon bg-gray"><i class="fa fa-sort-numeric-desc"></i> 개설 학년</span>
                          <select class="form-control input-sm" required="required">
                            <option></option>
                            <option value="0">모든학년</option>
                            <option value="1">1학년</option>
                            <option value="2">2학년</option>
                            <option value="3">3학년</option>
                            <option value="4">4학년</option>
                          </select>
                    </div>
                     <br>
                     <div class="input-group">
                          <span class="input-group-addon bg-gray"><i class="fa fa-sort-numeric-desc"></i> 개설 학과</span>
                          <select class="form-control input-sm" required="required">
                            <option></option>
                            <option value="교양">교양</option>
                            <option value="국문학과">국문학과</option>
                            <option value="수학과">수학과</option>
                            <option value="컴퓨터공학과">컴퓨터공학과</option>
                            <option value="경영학과">경영학과</option>
                            <option value="정보통신학과">정보통신학과</option>
                          </select>
                    </div>
                    <br>
                    </form>
                </div>
                <div class="box-footer clearfix" align="right">
                    <button type="submit" class="btn btn-primary">조회 <i class="fa fa-search"></i></button>
                </div>
            </div>
           
            <!-- 리스트 사용시  -->
             <div class="box">
                <div class="box-header">
                  <h3 class="box-title">수업 목록</h3>
                   <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table class="table table-bordered table-striped">
                    <thead class="bg-gray">
                      <tr>
                        <th>수업 번호</th>
                        <th>개설 학과</th>
                        <th>개설 학기</th>
                        <th>필수 여부</th>
                        <th>수업 명</th>
                        <th>대상 학년</th>
                        <th>수업 요일</th>
                        <th>수업 시간</th>
                        <th>교수님</th>
                        <th>강의실</th>
                        <th>이수 학점</th>
                        <th>수정</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>l000000001</td>
                        <td>교양</td>
                        <td>1학기</td>
                        <td>필수</td>
                        <td>교양 영어 1</td>
                        <td>1학년</td>
                        <td>수요일</td>
                        <td>1~3</td>
                        <td>Daniel Harny</td>
                        <td>멀티관 306호</td>
                        <td>3</td>
                        <td><input type="button" class="btn btn-primary" value="수업 수정"></td>
                      </tr>
                      <tr>
                        <td>l000000002</td>
                        <td>교양</td>
                        <td>1학기</td>
                        <td>필수</td>
                        <td>교양 영어 1</td>
                        <td>1학년</td>
                        <td>수요일</td>
                        <td>1~3</td>
                        <td>Daniel Harny</td>
                        <td>멀티관 306호</td>
                        <td>3</td>
                        <td><input type="button" class="btn btn-primary" value="수업 수정"></td>
                      </tr>
                      <tr>
                        <td>l000000003</td>
                        <td>교양</td>
                        <td>1학기</td>                        
                        <td>필수</td>
                        <td>교양 영어 1</td>
                        <td>1학년</td>
                        <td>수요일</td>
                        <td>1~3</td>
                        <td>Daniel Harny</td>
                        <td>멀티관 306호</td>
                        <td>3</td>
                        <td><input type="button" class="btn btn-primary" value="수업 수정"></td>
                      </tr>
                      <tr>
                        <td>l000000005</td>
                        <td>교양</td>
                        <td>1학기</td> 
                        <td>필수</td>
                        <td>교양 영어 1</td>
                        <td>1학년</td>
                        <td>수요일</td>
                        <td>1~3</td>
                        <td>Daniel Harny</td>
                        <td>멀티관 306호</td>
                        <td>3</td>
                        <td><input type="button" class="btn btn-primary" value="수업 수정"></td>
                      </tr>
                      <tr>
                        <td>l000000006</td>
                        <td>교양</td>
                        <td>1학기</td> 
                        <td>필수</td>
                        <td>교양 영어 1</td>
                        <td>1학년</td>
                        <td>수요일</td>
                        <td>1~3</td>
                        <td>Daniel Harny</td>
                        <td>멀티관 306호</td>
                        <td>3</td>
                        <td><input type="button" class="btn btn-primary" value="수업 수정"></td>
                      </tr>
                    </tbody>
                  </table>
                </div><!-- /.box-body -->
                 <div class="box-footer clearfix">
                       <ul class="pagination pagination-sm no-margin pull-right">
                            <li><a href="#">&laquo;</a></li>
                            <li><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#">&raquo;</a></li>
                         </ul>
                    <!-- 검색 폼 -->    
                    <form action="">
                      <div class="input-group">
                          <select class="form-control input-sm pull-left" style="width: 150px;">
	                        <option>수업 명</option>
                            <option>수업 번호</option>
	                        <option>개설 학과</option>
	                        <option>개설 학기</option>
	                        <option>필수 여부</option>
	                        <option>대상 학년</option>
	                        <option>수업 요일</option>
	                        <option>수업 시간</option>
	                        <option>교수님</option>
	                        <option>강의실</option>
	                        <option>이수 학점</option>
                          </select>
                          <input type="text" name="table_search" class="form-control input-sm  pull-left" style="width: 150px;" placeholder="Search"/>
                         <div class="input-group-btn  pull-left">
                            <button class="btn btn-sm btn-primary"> 검색 <i class="fa fa-search"></i></button>
                         </div>
                      </div>
                    </form>
                </div>
              </div><!-- /.box -->
		          
              </div><!-- /.col -->
           </div><!-- /.row -->
        </section><!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->        
      </div><!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->
      
<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------> 
<%@ include file="../include/footer.jsp" %>