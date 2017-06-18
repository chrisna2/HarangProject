<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../include/header.jsp" %>
<!-- 해더  삽입  [지우지마세여]------------------------------------------------------------------------------------------------->
<!-- 페이지 헤드 라인 : 제목 -->
<head>
     <title>식권 구매 내역</title>
</head>
	  <!-- 메인 페이지 구역 , 즉 작업 구역 -->
      <div class="content-wrapper">
<!----------------------------------- 메인페이지 헤더 [작업 제목] ------------------------------------------------------------->
      <section class="content-header">
          <h1>
                         식권 구매 내역
            <small>당신이 구매한 식권의 흔적</small>
          </h1>
          <ol class="breadcrumb">
          <!-- 페이지 기록 : 메인에서 부터 현재 페이지 까지의 경로 나열 -->
            <li><a href="#"><i class="fa fa-dashboard"></i> 메인</a></li>
            <li><a href="#"> 하랑 레스토랑</a></li>
            <li class="active"> 식권 구매 내역</li>
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
                  <h3 class="box-title">식권 구매 조회</h3>
                   <div class="box-tools">
                   <form action="/HarangProject/food?cmd=ticket" name="search" method="post"> 
                    <div class="input-group">
                      <input type="text" name="keyword" class="form-control input-sm pull-right" value="${requestScope.keyword}" style="width: 150px;" placeholder="Search"/>
                      <select class="form-control input-sm pull-right" style="width: 150px;" name="keyfield">
                        <option value="" ${requestScope.keyfield eq null ? 'selected' : null }></option>
                        <option value="fm_regdate" ${requestScope.keyfield eq 'fm_regdate' ? 'selected' : null }>구매일</option>
                        <option value="f_selldate" ${requestScope.keyfield eq 'f_selldate' ? 'selected' : null }>사용가능일</option>
                        <option value="f_title" ${requestScope.keyfield eq 'f_title' ? 'selected' : null }>메뉴</option>
                        <option value="f_point" ${requestScope.keyfield eq 'f_point' ? 'selected' : null }>구매 포인트</option>
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
                        <th>식권 구매일</th>
                        <th>메뉴 판매일</th>
                        <th>메뉴</th>
                        <th>구매 포인트</th>
                        <th>사용 여부</th>
                      </tr>
                    </thead>
                    <tbody>
                     <c:choose>
                      <c:when test="${fn:length(requestScope.tlist) eq 0}">
                      </c:when>
                      <c:otherwise>
                        <c:forEach items="${tlist}" var="t" 
                          begin="${paging.beginPerPage}" 
                          end="${paging.beginPerPage + paging.numPerPage -1}" 
                          varStatus="i">
                            <c:if test="${t.fm_isuse == 'unuse'}">
	                          <tr class="text-blue" style="cursor: pointer;" onclick="useticket('${t.f_num}')">
		                        <td>${t.fm_regdate}</td>
		                        <td>${t.f_selldate}</td>
		                        <td>${t.f_title}</td>
		                        <td>${t.f_point}</td>
		                        <td>미사용</td>
	                          </tr>
                            </c:if>
                            <c:if test="${t.fm_isuse == 'used'}">
	                          <tr class="text-black" style="cursor: no-drop;">
		                        <td>${t.fm_regdate}</td>
		                        <td>${t.f_selldate}</td>
		                        <td>${t.f_title}</td>
		                        <td>${t.f_point}</td>
		                        <td>사용 | ${t.fm_usedate}</td>
	                          </tr>
                            </c:if>
                            <c:if test="${t.fm_isuse == 'return'}">
	                          <tr class="text-danger" style="cursor: no-drop;">
		                        <td>${t.fm_regdate}</td>
		                        <td>${t.f_selldate}</td>
		                        <td>${t.f_title}</td>
		                        <td>${t.f_point}</td>
		                        <td>환불처리 | ${t.fm_usedate}</td>
	                          </tr>
                            </c:if>
                        </c:forEach>
                     </c:otherwise>
                    </c:choose>
                  </table>
                </div><!-- /.box-body -->
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
                </div>
              </div><!-- /.box -->
              </div><!-- /.col -->
           </div><!-- /.row -->
        </section><!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->        
      </div><!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->
      <!-- 페이징 관련 폼 ----------------------------------------------------------------------->
<!-- 페이징 : 이전 블록으로 이동하는 폼 -->
<form id="prevPage" method="post" action="/HarangProject/food?cmd=ticket">
    <input type="hidden" name="keyword" value="${requestScope.keyword}"/>
    <input type="hidden" name="keyfield" value="${requestScope.keyfield}"/>
    <input type="hidden" name="nowPage" value="${paging.pagePerBlock * (paging.nowBlock-1)}"/>
    <input type="hidden" name="nowBlock" value="${paging.nowBlock-1}"/>
</form>
<!-- 페이징 : 다음 블록으로 이동하는 폼 -->
<form id="nextPage" method="post" action="/HarangProject/food?cmd=ticket">
    <input type="hidden" name="keyword" value="${requestScope.keyword}"/>
    <input type="hidden" name="keyfield" value="${requestScope.keyfield}"/>
    <input type="hidden" name="nowPage" value="${paging.pagePerBlock * (paging.nowBlock+1)}"/>
    <input type="hidden" name="nowBlock" value="${paging.nowBlock+1}"/>
</form>
<!-- 페이징 : 해당 페이지로 이동하는 폼 -->
<form id="goPage" method="post" action="/HarangProject/food?cmd=ticket">
    <input type="hidden" name="keyword" value="${requestScope.keyword}"/>
    <input type="hidden" name="keyfield" value="${requestScope.keyfield}"/>
    <input type="hidden" name="nowPage" value="" id="page"/>
    <input type="hidden" name="nowBlock" value="${paging.nowBlock}"/>
</form>
<form name="printt" method="post" action="/HarangProject/food?cmd=ticket_print">
    <input type="hidden" name="f_num" value="">
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

function useticket(f_num) {
	printt.f_num.value = f_num;
	printt.submit();
}

</script>
