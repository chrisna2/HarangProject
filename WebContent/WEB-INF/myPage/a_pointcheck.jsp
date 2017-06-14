<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../include/a_header.jsp" %>
<!-- 해더  삽입  [지우지마세여]------------------------------------------------------------------------------------------------->
<!-- 페이지 헤드 라인 : 제목 -->
<head>
     <title>하랑 대학교 | 관리자 포인트 체크</title>
</head>
	  <!-- 메인 페이지 구역 , 즉 작업 구역 -->
      <div class="content-wrapper">
<!----------------------------------- 메인페이지 헤더 [작업 제목] ------------------------------------------------------------->
      <section class="content-header">
          <h1>
                         관리자 포인트 체크
          </h1>
          <ol class="breadcrumb">
          <!-- 페이지 기록 : 메인에서 부터 현재 페이지 까지의 경로 나열 -->
            <li><a href="#"><i class="fa fa-dashboard"></i> 메인</a></li>
            <li><a href="#"> 마이페이지</a></li>
            <li class="active"> 포인트 거래 내역</li>
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
                  <h3 class="box-title">회원 목록</h3>
                   <div class="box-tools">
                    <form action="/HarangProject/myPage?cmd=ApointCheck" name="search" method="post"> 
                    <div class="input-group">
                      <input type="text" name="keyword" class="form-control input-sm pull-right" value="${requestScope.keyword}" style="width: 150px;" placeholder="Search"/>
                      <select class="form-control input-sm pull-right" style="width: 150px;" name="keyfield">
                        <option value="" ${requestScope.keyfield eq null ? 'selected' : null }></option>
                        <option value="m_id" ${requestScope.keyfield eq 'm_id' ? 'selected' : null }>학번 / 관리자 번호</option>
                        <option value="m_name" ${requestScope.keyfield eq 'm_name' ? 'selected' : null }>이름</option>
                        <option value="m_dept" ${requestScope.keyfield eq 'm_dept' ? 'selected' : null }>학과</option>
                        <option value="m_point" ${requestScope.keyfield eq 'm_point' ? 'selected' : null }>포인트</option>
                      </select>
                      <div class="input-group-btn">
                        <button class="btn btn-sm btn-default"><i class="fa fa-search"></i></button>
                      </div>
                    </div>
                   </form>
                  </div>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th>학번 / 관리자 번호</th>
                        <th>이름</th>
                        <th>학과</th>
                        <th>학년</th>
                        <th>보유 포인트</th>
                        <th>거래 내역</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                      <c:when test="${fn:length(requestScope.mList) eq 0}">
                      </c:when>
                      <c:otherwise>
	                     <c:forEach var="mem" items="${requestScope.mList}"
	                      begin="${paging.beginPerPage}" 
	                      end="${paging.beginPerPage + paging.numPerPage -1}" 
	                      varStatus="i" >
	                      <tr>
	                        <td>${mem.m_id}</td>
	                        <td>${mem.m_name}</td>
	                        <td>${mem.m_dept}</td>
	                        <td>${mem.m_grade}학년</td>
	                        <td>${mem.m_point}p</td>
	                        <td><a class="btn btn-primary" href="/HarangProject/myPage?cmd=ApointCheck&check_id=${mem.m_id}">조회</a></td>
	                      </tr>
	                      </c:forEach>
                      </c:otherwise>
                    </c:choose>
                    </tbody>
                  </table>
                </div><!-- /.box-body -->
                 <div class="box-footer clearfix">
                    <ul class="pagination pagination-sm no-margin pull-right">
                          <c:if test="${paging.nowBlock > 0}">
                            <li><a href="javascript:prevPage()">&laquo;</a></li>
                          </c:if>
                        <c:forEach var="i" begin="0" end="${paging.pagePerBlock-1}" step="1">
                            <li><a href="javascript:goPage('${paging.nowBlock*paging.pagePerBlock+i}')">${paging.nowBlock*paging.pagePerBlock+(i+1)}</a></li>
                        </c:forEach>
                          <c:if test="${paging.totalBlock > paging.nowBlock +1}">
                            <li><a href="javascript:nextPage()">&raquo;</a></li>
                         </c:if>
                    </ul>
                </div>
              </div><!-- /.box -->
        
        
        <c:if test="${requestScope.pList != null}">
            <!-- 리스트 사용시  -->
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">${requestScope.pName} 포인트 거래 목록</h3>
                   <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th>거래 날짜</th>
                        <th>거래 내용</th>
                        <th>포인트</th>
                        <th>출금 대상</th>
                        <th>입금 대상</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach items="${requestScope.pList}" var="p" varStatus="i">
                        <c:if test="${requestScope.checkid eq p.m_giver}">
	                       <tr class="text-red">
	                        <td>${p.r_regdate}</td>
	                        <td>${p.r_content}</td>
	                        <td>${p.r_point}</td>
	                        <td>${p.m_givername} | ${p.m_giver}</td>
	                        <td>${p.m_havername} | ${p.m_haver}</td>
	                      </tr>
	                     </c:if>
	                     <c:if test="${requestScope.checkid eq p.m_haver}">
                           <tr class="text-green">
                            <td>${p.r_regdate}</td>
                            <td>${p.r_content}</td>
                            <td>${p.r_point}</td>
                            <td>${p.m_givername} | ${p.m_giver}</td>
                            <td>${p.m_havername} | ${p.m_haver}</td>
                          </tr>
	                     </c:if>
                      </c:forEach>
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
            <!-- 리스트 사용시  -->
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">${requestScope.pName} 회원의 포인트 수정</h3>
                   <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
                </div><!-- /.box-header -->
                 <!-- form 시작 -->
                <form role="form" id="updatepoint" method="post">
                <div class="box-body">
                    <span class="input-group-addon"><i class="fa fa-location-arrow"></i> 사유</span>
                    <textarea class="form-control" name="r_content" rows="3" placeholder="Enter ..."></textarea>
                    <span class="input-group-addon"> 사유로 인해</span>
                    <br>
                  <div class="input-group">
                    <span class="input-group-addon bg-gray"><i class="fa fa-location-arrow"></i> 포인트</span>
                    <input type="text" name="r_point" class="form-control" required="required">
                    <span class="input-group-addon bg-gray"> 포인트를</span>
                  </div>
                  <br>
                </div><!-- /.box-body -->
                 <div class="box-footer clearfix" align="center">
                      <input type="button" id="minus" class="btn btn-danger col-md-6 col-xs-6" value="차감합니다!">
                      <input type="button" id="plus" class="btn btn-success col-md-6 col-xs-6" value="추가합니다!">
                </div>
                </form>
              </div><!-- /.box -->
            </c:if>
              
              </div><!-- /.col -->
           </div><!-- /.row -->
        </section><!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->        
      </div><!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->
      
<!-- 페이징 관련 폼 ----------------------------------------------------------------------->
<!-- 페이징 : 이전 블록으로 이동하는 폼 -->
<form id="prevPage" method="post" action="/HarangProject/myPage?cmd=ApointCheck">
    <input type="hidden" name="keyword" value="${requestScope.keyword}"/>
    <input type="hidden" name="keyfield" value="${requestScope.keyfield}"/>
    <input type="hidden" name="nowPage" value="${paging.pagePerBlock * (paging.nowBlock-1)}"/>
    <input type="hidden" name="nowBlock" value="${paging.nowBlock-1}"/>
</form>
<!-- 페이징 : 다음 블록으로 이동하는 폼 -->
<form id="nextPage" method="post" action="/HarangProject/myPage?cmd=ApointCheck">
    <input type="hidden" name="keyword" value="${requestScope.keyword}"/>
    <input type="hidden" name="keyfield" value="${requestScope.keyfield}"/>
    <input type="hidden" name="nowPage" value="${paging.pagePerBlock * (paging.nowBlock+1)}"/>
    <input type="hidden" name="nowBlock" value="${paging.nowBlock+1}"/>
</form>
<!-- 페이징 : 해당 페이지로 이동하는 폼 -->
<form id="goPage" method="post" action="/HarangProject/myPage?cmd=ApointCheck">
    <input type="hidden" name="keyword" value="${requestScope.keyword}"/>
    <input type="hidden" name="keyfield" value="${requestScope.keyfield}"/>
    <input type="hidden" name="nowPage" value="" id="page"/>
    <input type="hidden" name="nowBlock" value="${paging.nowBlock}"/>
</form>
<!-- 페이징 관련 폼 여기까지입니다. ----------------------------------------------------------------------------------- -->
      
      
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

$(document).ready(function(){
    $("#plus").click(function() {
        $("#updatepoint").
        
    	
    });


	
}

</script>
