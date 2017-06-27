<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../include/a_header.jsp" %>
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
                    	
                    <form action="/HarangProject/impage?cmd=amain" name="search" method="post">  
 
                    <input type="text" name="keyfield" class="form-control input-sm pull-right" style="width: 150px;" placeholder="Search"/>
                   
                       <select class="form-control input-sm pull-right" name="keyword" style="width: 80px; heigh:30px;">
                        <option value="l_name"
                        <c:choose>
                        <c:when test="${requestScope.keyword eq 'l_name' }">
                        selected="selected"
                         </c:when>
                         </c:choose>>강의명</option>
                        <option value="l_teacher"   <c:choose>
                        <c:when test="${requestScope.keyword eq 'l_teacher' }">
                        selected="selected"
                         </c:when>
                         </c:choose>>교수명</option>
                        <option value="m_name"   <c:choose>
                        <c:when test="${requestScope.keyword eq 'm_name' }">
                        selected="selected"
                         </c:when>
                         </c:choose>>작성자</option>
                       
                      </select>
                      <div class="input-group-btn">
                        <button type="submit" class="btn btn-sm btn-default"><i class="fa fa-search"></i></button>
                      </div>
                     </form>     
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
                    <tbody>
                
                     
                      <c:choose>
						<c:when test="${fn:length(alllist) eq 0}">
						</c:when>
          				<c:otherwise>
                      <c:forEach var="all" items="${requestScope.alllist}"
                       begin="${paging.beginPerPage}"  end="${paging.beginPerPage + paging.numPerPage -1}">
                       <tr>
                        <td><a href="/HarangProject/impage?cmd=adetail&lm_num=${all.lm_num}"> ${all.lm_num} </a></td>
                        <td>${all.l_name }</td>
                        <td>${all.lm_star}</td>
                        <td>${all.lm_year}</td>
                        <td>${all.lm_term}</td>
                        <td>${all.l_teacher}</td>
                        <td>${all.m_name}</td>
                        <td>${all.w_count}</td>
       
					 	  
                      </tr>
                        </c:forEach>
                        </c:otherwise>
                   </c:choose>
                   </tbody>
                 
                  
                   
                    
                    
                   
                  </table>
                <div class="box-footer clearfix">
                   <ul class="pagination pagination-sm no-margin pull-right">
							<c:if test="${paging.nowBlock > 0}">
							<li><a href="javascript:prevPage()">&laquo;</a></li>
							</c:if>
						  <c:forEach var="i" begin="0" end="${paging.pagePerBlock-1}" step="1">
                            <!-- if문 추가 : 20170615 -->
                               <c:if test="${paging.nowBlock*paging.pagePerBlock+i < paging.totalPage}" >
                                    <li><a href="javascript:goPage('${paging.nowBlock*paging.pagePerBlock+i}')">${paging.nowBlock*paging.pagePerBlock+(i+1)}</a></li>
                               </c:if>
                            <!-- 끝 -->
						  </c:forEach>
						  	<c:if test="${paging.totalBlock > paging.nowBlock +1}">
							<li><a href="javascript:nextPage()">&raquo;</a></li>
							</c:if>
						</ul>
                </div><!-- /.box-body -->
                </div><!-- /.box-body -->
              </div><!-- /.box -->
        </div>
           </div>
                
              </div><!-- /.box -->





        </section><!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->        
      </div><!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->
      <!-- 페이징 관련 폼 ----------------------------------------------------------------------->
<!-- 페이징 : 이전 블록으로 이동하는 폼 -->
<form id="prevPage" method="post" action="/HarangProject/impage?cmd=amain">
	<input type="hidden" name="nowPage" value="${paging.pagePerBlock * (paging.nowBlock-1)}"/>
	<input type="hidden" name="nowBlock" value="${paging.nowBlock-1}"/>
</form>
<!-- 페이징 : 다음 블록으로 이동하는 폼 -->
<form id="nextPage" method="post" action="/HarangProject/impage?cmd=amain">
	<input type="hidden" name="nowPage" value="${paging.pagePerBlock * (paging.nowBlock+1)}"/>
	<input type="hidden" name="nowBlock" value="${paging.nowBlock+1}"/>
</form>
<!-- 페이징 : 해당 페이지로 이동하는 폼 -->
<form id="goPage" method="post" action="/HarangProject/impage?cmd=amain">
	<input type="hidden" name="nowPage" value="" id="page"/>
	<input type="hidden" name="nowBlock" value="${paging.nowBlock}"/>
</form>   
<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------> 
<%@ include file="../include/footer.jsp" %>

<script>
///////////////// 페이지 관련 javascript function////////////////////
function prevPage(){
	document.getElementById("prevPage").submit();
}
function nextPage(){
	document.getElementById("nextPage").submit();
}
function goPage(nowPage){
	document.getElementById("page").value = nowPage;
	document.getElementById("goPage").submit();
}







</script>
