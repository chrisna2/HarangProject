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
             	기본값 페이지 [페이지 제목]
            <small>[페이지 소개]</small>
          </h1>
          <ol class="breadcrumb">
          <!-- 페이지 기록 : 메인에서 부터 현재 페이지 까지의 경로 나열 -->
            <li><a href="#"><i class="fa fa-dashboard"></i> 메인</a></li>
            <li class="active">기본값 페이지[현재 페이지]</li>
          </ol>
        </section>
<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
        <section class="content">
          <!-- 세로 길이 수정 -->
          <div class="row">
           <!-- 너비 사이즈 수정  : col-->
           <div class="col-md-12">
        
         <div class="box-header">
                  <h3 class="box-title">강의평가 작성</h3>
                </div>
                <div class="box-body">
                  <div class="input-group">
                    <span class="input-group-addon">강의명</span>
                    <input type="text" class="form-control" placeholder="강의명">
                  </div>
                   <div class="input-group">
                    <span class="input-group-addon">교수명</span>
                    <input type="text" class="form-control" placeholder="교수명">
                  </div>
                   <div class="input-group">
                    <span class="input-group-addon">강의평가년도</span>
                    <input type="text" class="form-control" placeholder="강의평가년도">
                  </div>
                   <div class="input-group">
                    <span class="input-group-addon">강의평가학기</span>
                    <input type="text" class="form-control" placeholder="강의평가학기">
                  </div>
                    <div class="input-group">
                    <span class="input-group-addon">만족도</span>
                    	<table align="center">
                    	<tr align="center"> <td>☆☆☆☆☆</td> &nbsp;&nbsp;&nbsp;&nbsp;
                    	<td>★☆☆☆☆ </td>&nbsp;&nbsp;&nbsp;&nbsp;
                    	<td>★★☆☆☆</td>&nbsp;&nbsp;&nbsp;&nbsp;
                    	<td>  ★★★☆☆</td>&nbsp;&nbsp;&nbsp;&nbsp;
                    	<td>  ★★★★☆ </td>&nbsp;&nbsp;&nbsp;&nbsp;
                    	<td>★★★★★</td>
                    	</tr>
                    	<tr align="center"> 
                    	<td>
                    	 <input type="radio" name="r3" class="flat-red" style="width: 20px; heigh:30px;"/>
                    	</td>&nbsp;&nbsp;&nbsp;&nbsp;
                    	<td>
                    	 <input type="radio" name="r3" class="flat-red"/>
                    	</td>&nbsp;&nbsp;&nbsp;&nbsp;
                    	<td>
                    	 <input type="radio" name="r3" class="flat-red"/>
                    	</td>&nbsp;&nbsp;&nbsp;&nbsp;
                    	<td>
                    	 <input type="radio" name="r3" class="flat-red"/>
                    	</td>&nbsp;&nbsp;&nbsp;&nbsp;
                    	<td>
                    	 <input type="radio" name="r3" class="flat-red"/>
                    	  </td>&nbsp;&nbsp;&nbsp;&nbsp;
                    	  <td>
                    	 <input type="radio" name="r3" class="flat-red"/>
                    	 </td>
                    	 </tr>
                		</table>
                 	 </div>
                   <div class="input-group">
                    <span class="input-group-addon">과제</span>
                    <input type="text" class="form-control" placeholder="과제">
                  </div>
                   <div class="input-group">
                    <span class="input-group-addon">출결</span>
                    <input type="text" class="form-control" placeholder="출결">
                  </div>
                   <div class="input-group">
                    <span class="input-group-addon">조모임</span>
                    <input type="text" class="form-control" placeholder="조모임">
                  </div> <div class="input-group">
                    <span class="input-group-addon">시험횟수</span>
                    <input type="text" class="form-control" placeholder="시험횟수">
                  </div>
                   <div class="input-group">
                    <span class="input-group-addon">총평</span>
                    <input type="text" class="form-control" placeholder="총평">
                  </div>
                  
        	
        		</div>
        	
		



              </div><!-- /.col -->
           </div><!-- /.row -->
        </section><!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->        
      </div><!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->
      
<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------> 
<%@ include file="../include/footer.jsp" %>