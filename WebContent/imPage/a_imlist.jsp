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
             	관리자 강의평가리스트
            <small></small>
          </h1>
          <ol class="breadcrumb">
          <!-- 페이지 기록 메인에서 부터 현재 페이지 까지의 경로 나열 -->
            <li><a href="#"><i class="fa fa-dashboard"></i> 메인</a></li>
            <li class="active">관리자 강의평가리스트[현재 페이지]</li>
          </ol>
        </section>
<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
        <section class="content">
        
         <div class="row">
            <div class="col-md-10">
            
            
             
   
        
        	<div class="col-md-10">
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">전체 강의평가 게시글</h3>
                    <!-- select -->
                   <div class="box-tools">
                  
                    <div class="input-group">
                    	
                   
                      <input type="text" name="table_search" class="form-control input-sm pull-right" style="width: 150px;" placeholder="검색"/>
                       <select class="form-control input-sm pull-right" style="width: 80px; heigh:30px;">
                        <option>제목</option>
                        <option>교수명</option>
                        <option>작성자</option>
                       
                      </select>
                      <div class="input-group-btn">
                      	
                        <button class="btn btn-sm btn-default"><i class="fa fa-search"></i></button>
                      </div>
                    </div>
                    
                     
                 
                  
                  
                   
                
                   </div>
                </div><!-- /.box-header -->
                <div class="box-body no-padding">
                  <table class="table">
                    <tr>
                      <th>평가번호</th>
                      <th>강의명</th>
                      <th>만족도</th>
                      <th >강의년도</th>
                       <th>강의학기</th>
                        <th>교수명</th>
                        <th>작성자</th>
                        <th>신고횟수</th>
                    </tr>
                    <tr>
                      <td>1.</td>
                      <td>Update software</td>
                      <td>
               			      ☆☆☆☆☆
                      </td>
                      <td>2016년도</td>
                  
                      <td>1학기</td>
                      <td>김만종</td>
                      <td>스프링</td>
                       <td>2회</td>
                    </tr>
                    <tr>
                      <td>2.</td>
             			
                      <td>
                      Update software
                      </td>
                      <td>	        ★☆☆☆☆</td>
                      <td>2014년도</td>
                  
                      <td>2학기</td>
                      <td>김지성</td>
                      <td>선주박</td>
                       <td>3회</td>
                    </tr>
                   
                    
                    
                   
                  </table>
                  <ul class="pagination pagination-sm no-margin pull-right">
                      <li><a href="#">&laquo;</a></li>
                      <li><a href="#">1</a></li>
                      <li><a href="#">2</a></li>
                      <li><a href="#">3</a></li>
                      <li><a href="#">&raquo;</a></li>
                    </ul>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
        </div>
           </div>
                
              </div><!-- /.box -->





        </section><!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->        
      </div><!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->
      
<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------> 
<%@ include file="../include/footer.jsp" %>