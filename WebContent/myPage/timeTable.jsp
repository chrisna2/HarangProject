<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>
<!-- 해더  삽입  [지우지마세여]------------------------------------------------------------------------------------------------->
<!-- 페이지 헤드 라인 : 제목 -->
<head>
     <title>수강 시간표 작성</title>
     <style type="text/css">
        td{
            text-align:center;
            height:80px;
        }
        th{
            text-align:center;
        }
     </style>
</head>
	  <!-- 메인 페이지 구역 , 즉 작업 구역 -->
      <div class="content-wrapper">
<!----------------------------------- 메인페이지 헤더 [작업 제목] ------------------------------------------------------------->
        <section class="content-header">
          <h1>
             	수강 시간표
            <small>당신의 수강 시간표를 미리 작성해 보세요</small>
          </h1>
          <ol class="breadcrumb">
          <!-- 페이지 기록 : 메인에서 부터 현재 페이지 까지의 경로 나열 -->
            <li><a href="#"><i class="fa fa-dashboard"></i> 메인</a></li>
            <li><a href="#"> 마이페이지</a></li>
            <li class="active"> 수강 시간표</li>
          </ol>
        </section>
<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
        <section class="content">
          <!-- 세로 길이 수정 -->
          <div class="row">
           <!-- 너비 사이즈 수정  : col-->
           <div class="col-md-12">
             
             
           <!-- 수업 시간표 -->
             <div class="box">
                <div class="box-header">
                  <h3 class="box-title">당신의 시간표</h3>
                   <div class="box-tools">
                    <form action="">
                     <div class="input-group">
                          <select class="form-control input-sm pull-right" style="width: 30%;">
                            <option>1학년 1학기</option>
                            <option>1학년 2학기</option>
                            <option>2학년 1학기</option>
                            <option>2학년 2학기</option>
                            <option>3학년 1학기</option>
                            <option>3학년 2학기</option>
                            <option>4학년 1학기</option>
                            <option>4학년 2학기</option>
                          </select>
                          <div class="input-group-btn">
                        <button class="btn btn-sm btn-primary">&nbsp;&nbsp;&nbsp; 시간표 조회  &nbsp;&nbsp;&nbsp;<i class="fa fa-search">&nbsp;</i></button>
                      </div>
                    </div>
                    </form>
                  </div>
                  
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table class="table table-bordered table-striped" style="border-color: #9E9E9E">
                  <colgroup>
                    <col class="col-md-1 col-xs-1">
                    <col class="col-md-2 col-xs-2"> 
                    <col class="col-md-2 col-xs-2"> 
                    <col class="col-md-2 col-xs-2"> 
                    <col class="col-md-2 col-xs-2"> 
                    <col class="col-md-2 col-xs-2"> 
                  </colgroup>
                  <thead>
                    <tr class="bg-gray">
                      <th></th>
                      <th>월요일</th>
                      <th>화요일</th>
                      <th>수요일</th>
                      <th>목요일</th>
                      <th>금요일</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td class="bg-gray"><br><b>1교시</b><br>[9시 ~ 10시]</td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                    </tr>
                    <tr>
                       <td class="bg-gray"><br><b>2교시</b><br>[10시 ~ 11시]</td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                    </tr>
                    <tr>
                       <td class="bg-gray"><br><b>3교시</b><br>[11시 ~ 12시]</td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                    </tr>
                    <tr>
                       <td class="bg-gray"><br><b>4교시</b><br>[12시 ~ 13시]</td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                    </tr>
                    <tr>
                       <td class="bg-gray"><br><b>5교시</b><br>[13시 ~ 14시]</td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                    </tr>
                    <tr>
                       <td class="bg-gray"><br><b>6교시</b><br>[14시 ~ 15시]</td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                    </tr>
                    <tr>
                       <td class="bg-gray"><br><b>7교시</b><br>[15시 ~ 16시]</td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                    </tr>
                    <tr>
                       <td class="bg-gray"><br><b>8교시</b><br>[16시 ~ 17시]</td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                    </tr>
                    <tr>
                       <td class="bg-gray"><br><b>9교시</b><br>[17시 ~ 18시]</td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                    </tr>
                   </tbody>
                  </table>
                </div><!-- /.box-body -->
              </div><!-- /.box -->

            <!-- 리스트 사용시  -->
             <div class="box">
                <div class="box-header">
                  <h3 class="box-title">1학년 1학기 수업 목록</h3>
                   <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th>수업 번호</th>
                        <th>주요 학과</th>
                        <th>필수 여부</th>
                        <th>수업 명</th>
                        <th>대상 학년</th>
                        <th>수업 요일</th>
                        <th>수업 시간</th>
                        <th>교수님</th>
                        <th>강의실</th>
                        <th>이수 학점</th>
                        <th>시간표 등록</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>l000000001</td>
                        <td>교양</td>
                        <td>필수</td>
                        <td>교양 영어 1</td>
                        <td>1학년</td>
                        <td>수요일</td>
                        <td>1~3</td>
                        <td>Daniel Harny</td>
                        <td>멀티관 306호</td>
                        <td>3</td>
                        <td><input type="button" class="btn btn-primary" value="시간표 등록"></td>
                      </tr>
                      <tr>
                        <td>l000000002</td>
                        <td>교양</td>
                        <td>필수</td>
                        <td>교양 영어 1</td>
                        <td>1학년</td>
                        <td>수요일</td>
                        <td>1~3</td>
                        <td>Daniel Harny</td>
                        <td>멀티관 306호</td>
                        <td>3</td>
                        <td><input type="button" class="btn btn-primary" value="시간표 등록"></td>
                      </tr>
                      <tr>
                        <td>l000000003</td>
                        <td>교양</td>
                        <td>필수</td>
                        <td>교양 영어 1</td>
                        <td>1학년</td>
                        <td>수요일</td>
                        <td>1~3</td>
                        <td>Daniel Harny</td>
                        <td>멀티관 306호</td>
                        <td>3</td>
                        <td><input type="button" class="btn btn-primary" value="시간표 등록"></td>
                      </tr>
                      <tr>
                        <td>l000000004</td>
                        <td>교양</td>
                        <td>필수</td>
                        <td>교양 영어 1</td>
                        <td>1학년</td>
                        <td>수요일</td>
                        <td>1~3</td>
                        <td>Daniel Harny</td>
                        <td>멀티관 306호</td>
                        <td>3</td>
                        <td><input type="button" class="btn btn-danger" value="등록 취소"></td>
                      </tr>
                      <tr>
                        <td>l000000005</td>
                        <td>교양</td>
                        <td>필수</td>
                        <td>교양 영어 1</td>
                        <td>1학년</td>
                        <td>수요일</td>
                        <td>1~3</td>
                        <td>Daniel Harny</td>
                        <td>멀티관 306호</td>
                        <td>3</td>
                        <td><input type="button" class="btn btn-primary" value="시간표 등록"></td>
                      </tr>
                      <tr>
                        <td>l000000006</td>
                        <td>교양</td>
                        <td>필수</td>
                        <td>교양 영어 1</td>
                        <td>1학년</td>
                        <td>수요일</td>
                        <td>1~3</td>
                        <td>Daniel Harny</td>
                        <td>멀티관 306호</td>
                        <td>3</td>
                        <td><input type="button" class="btn btn-primary" value="시간표 등록"></td>
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
                            <option>거래 날짜</option>
                            <option>거래 내용</option>
                            <option>포인트</option>
                            <option>출금 대상</option>
                            <option>입금 대상</option>
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