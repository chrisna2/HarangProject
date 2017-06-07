<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/a_header.jsp" %>
<!-- 해더  삽입  [지우지마세여]------------------------------------------------------------------------------------------------->
<!-- 페이지 헤드 라인 : 제목 -->
<head>
     <title>수업 수정</title>
</head>
	  <!-- 메인 페이지 구역 , 즉 작업 구역 -->
      <div class="content-wrapper">
<!----------------------------------- 메인페이지 헤더 [작업 제목] ------------------------------------------------------------->
        <section class="content-header">
          <h1>
             	수업 수정
          </h1>
         <ol class="breadcrumb">
          <!-- 페이지 기록 : 메인에서 부터 현재 페이지 까지의 경로 나열 -->
            <li><a href="#"><i class="fa fa-dashboard"></i> 관리자 메인</a></li>
            <li><a href="#"> 사이트 관리</a></li>
            <li><a href="#"> 수업 등록 수정</a></li>
            <li class="active"> 수업 수정</li>
          </ol>
        </section>
<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
        <section class="content">
          <!-- 세로 길이 수정 -->
          <div class="row">
           <!-- 너비 사이즈 수정  : col-->
           <div class="col-md-9">
           
             <div class="box">
                <form action="">
                <div class="box-header">
                    <h3 class="box-title">수업 수정</h3>
                </div>
                <div class="box-body">
                     <div class="input-group">
                          <span class="input-group-addon bg-gray"><i class="fa fa-sort-numeric-desc"></i> 개설 학기</span>
                          <select class="form-control input-sm" required="required">
                            <option></option>
                            <option value="1">1학기</option>
                            <option value="2">2학기</option>
                          </select>
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
                          <span class="input-group-addon bg-gray"><i class="fa fa-sort-numeric-desc"></i> 선택 필수</span>
                          <select class="form-control input-sm" required="required">
                            <option></option>
                            <option value="선택">선택</option>
                            <option value="필수">필수</option>
                          </select>
                          <span class="input-group-addon bg-gray"><i class="fa fa-sort-numeric-desc"></i> 이수 학점</span>
                          <select class="form-control input-sm" required="required">
                            <option></option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                          </select>
                    </div>
                    <br>
                     <br>
                     <div class="input-group">
                          <span class="input-group-addon bg-gray"><i class="fa fa-sort-numeric-desc"></i> 수업 요일</span>
                          <select class="form-control input-sm" required="required">
                            <option></option>
                            <option value="월">월</option>
                            <option value="회">화</option>
	                        <option value="수">수</option>
	                        <option value="목">목</option>
	                        <option value="금">금</option>
                          </select>
                          <span class="input-group-addon bg-gray"><i class="fa fa-sort-numeric-desc"></i> 수업 시간</span>
                          <select class="form-control input-sm" required="required">
                            <option></option>
                            <option value="1-3">1-3교시</option>
                            <option value="4-5">4-5교시</option>
                            <option value="6-9">6-9교시</option>
                          </select>
                    </div>
                     <div class="input-group">
                          <span class="input-group-addon bg-gray"><i class="fa fa-sort-numeric-desc"></i> 교수님</span>
                          <input type="text" name="m_tel" class="form-control" required="required"/>
                          <span class="input-group-addon bg-gray"><i class="fa fa-sort-numeric-desc"></i> 강의실</span>
                          <input type="text" name="m_tel" class="form-control" required="required"/>
                    </div>
                </div>
                <div class="box-footer clearfix" align="right">
                    <button type="submit" class="btn btn-danger"> 수업 삭제</button>
                    <button type="submit" class="btn btn-primary"> 수업 수정</button>
                </div>
           </form>
            </div>
		          
              </div><!-- /.col -->
           </div><!-- /.row -->
        </section><!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->        
      </div><!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->
      
<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------> 
<%@ include file="../include/footer.jsp" %>