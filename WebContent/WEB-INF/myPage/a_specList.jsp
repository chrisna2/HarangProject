<%@page import="dto.CertiDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/a_header.jsp" %>
<!-- 해더  삽입  [지우지마세여]------------------------------------------------------------------------------------------------->






<!-- 페이지 헤드 라인 : 제목 -->




<head>

	

     <title>스펙 목록</title>
</head>
	  <!-- 메인 페이지 구역 , 즉 작업 구역 -->
      <div class="content-wrapper">
<!----------------------------------- 메인페이지 헤더 [작업 제목] ------------------------------------------------------------->
        <section class="content-header">
          <h1>
             	스펙 목록
          </h1>
         <br>
         <button class="btn btn-sm btn-primary col-xs-9 col-md-9 col-lg-9">신규 자격증 등록</button>
         <br>
         <br>
         <ol class="breadcrumb">
          <!-- 페이지 기록 : 메인에서 부터 현재 페이지 까지의 경로 나열 -->
            <li><a href="#"><i class="fa fa-dashboard"></i> 관리자 메인</a></li>
            <li><a href="#"> 사이트 관리</a></li>
            <li class="active"> 스펙 목록</li>
          </ol>
        </section>
<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
        <section class="content">
          <!-- 세로 길이 수정 -->
          <div class="row">
           <!-- 너비 사이즈 수정  : col-->
           <div class="col-md-9">
           
           <!-- 리스트 사용시  -->
            <div class="box">
                <div class="box-header">
                  <h3 class="box-title">스펙 목록</h3>
                   <div class="box-tools">
                    <div class="input-group">
                    
                  <form action="/HarangProject/myPage?cmd=AspecList" name="search" method="post">  
                      <input type="text" name= keyfiled class="form-control input-sm pull-right" style="width: 150px;" placeholder="Search"/>
                      <select class="form-control input-sm pull-right" style="width: 150px" name=keyword>
                     
                       
                        <option value="c_num"
                        <c:choose>
                        <c:when test="${requestScope.keyword eq 'c_num' }">
                        selected="selected"
                         </c:when>
                         </c:choose>>자격증 번호</option>
                        <option value="c_name"   <c:choose>
                        <c:when test="${requestScope.keyword eq 'c_name' }">
                        selected="selected"
                         </c:when>
                         </c:choose>>자격증 이름</option>
                        <option value="c_agency"   <c:choose>
                        <c:when test="${requestScope.keyword eq 'c_agency' }">
                        selected="selected"
                         </c:when>
                         </c:choose>>발급 기관</option>
                        <option value="c_point"   <c:choose>
                        <c:when test="${requestScope.keyword eq 'c_point' }">
                        selected="selected"
                         </c:when>
                         </c:choose>>도전 보상</option>
                      </select>
                      <div class="input-group-btn">
                        <button type="submit" class="btn btn-sm btn-default"><i class="fa fa-search"></i></button>
                      </div>
                     </form>
                    </div>
                  </div>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th>도전 번호</th>
                        <th>도전 이름</th>
                        <th>도전 기관</th>
                        <th>보상 </th>
                        <th>수정 </th>
                      </tr>
                    </thead>
                    <tbody>
                    
                      <c:forEach var="aspec" items="${requestScope.aspeclist}">
                      <tr>
                    
                        <td>${aspec.c_num}</td>
                        <td>${aspec.c_name }</td>
                        <td>${aspec.c_agency}</td>
                        <td>${aspec.c_point}P</td>
                        <td><input type="button" class="btn btn-primary" value="확인"></td>
                     
                      </tr>
                     </c:forEach>
                    
                    	<tr>
                    	
                   
                    	
                    	<td></td>
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
                    <li><a href="#">&raquo;</a></li>
                  </ul>
                </div>
              </div><!-- /.box -->
		          
		          
		      <!-- 자격증 신규 등록  -->
              <div class="box box-black">
                <div class="box-header">
                  <h3 class="box-title">자격증 신규 등록</h3>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
                </div>
                
                <!-- form 시작 -->
                
                <form role="form" action="/HarangProject/myPage?cmd=AspecList" method="post">
              
                <div class="box-body">
                 <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-bolt"></i> 자격증 이름</span>
                    <input type="text" name="c_name" class="form-control" required="required">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-sort-numeric-desc"></i> 발급 기관</span>
                    <input type="text" name="c_agency" class="form-control" required="required">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-money"></i> 보상 포인트</span>
                    <input type="text" name="c_point" class="form-control" required="required">
                    <span class="input-group-addon">포인트</span>
                  </div>
                  <br>
                </div><!-- /.box-body -->
                
                  <div class="box-footer" align="right">
                    <input type="button" class="btn" value="닫기">
                    <input type="submit" class="btn btn-primary" value="신규 등록">
                </div>
                
                </form>
              </div><!-- /.box -->
                  
                   <!-- 도전 확인  -->
              <div class="box box-black">
                <div class="box-header">
                  <h3 class="box-title">자격증 정보 수정</h3>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
                </div>
                
                <!-- form 시작 -->
                <form role="form2">
                	
                <div class="box-body">
                 <div class="input-group">
                  <c var="read" item="${requestScope.read}">
                    <span class="input-group-addon"><i class="fa fa-sort-numeric-desc"></i> 자격증 번호</span>
                    <input type="text" name="c_num" class="form-control" value="${read.c_num }" readonly="readonly">
                    </c>
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-bolt"></i> 자격증 이름</span>
                    <input type="text" name="c_name" class="form-control" value="${read.c_name }" required="required">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-sort-numeric-desc"></i> 발급 기관</span>
                    <input type="text" name="c_agency" class="form-control" value="" required="required">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-money"></i> 보상 포인트</span>
                    <input type="text" name="c_point" class="form-control" value="" required="required">
                    <span class="input-group-addon">포인트</span>
                  </div>
                  <br>
                </div><!-- /.box-body -->
                  <div class="box-footer" align="right">
                    <input type="button" class="btn" value="닫기">
                    <input type="button" class="btn btn-danger" value="삭제">
                    <input type="submit" class="btn btn-primary" value="수정">
                </div>
                </form>
              </div><!-- /.box   -->
                
		          
              </div><!-- /.col -->
           </div><!-- /.row -->
        </section><!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->        
      </div><!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->
      
<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------> 
<%@ include file="../include/footer.jsp" %>