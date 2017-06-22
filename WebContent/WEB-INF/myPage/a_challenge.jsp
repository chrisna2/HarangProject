<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../include/a_header.jsp" %>
<!-- 해더  삽입  [지우지마세여]------------------------------------------------------------------------------------------------->
<!-- 페이지 헤드 라인 : 제목 -->
<head>
     <title>스펙 업 관리</title>
</head>
	  <!-- 메인 페이지 구역 , 즉 작업 구역 -->
      <div class="content-wrapper">
<!----------------------------------- 메인페이지 헤더 [작업 제목] ------------------------------------------------------------->
        <section class="content-header">
          <h1>
             	스펙 업 관리
          </h1>
          <ol class="breadcrumb">
          <!-- 페이지 기록 : 메인에서 부터 현재 페이지 까지의 경로 나열 -->
            <li><a href="#"><i class="fa fa-dashboard"></i> 관리자 메인</a></li>
            <li><a href="#"> 사이트 관리</a></li>
            <li class="active"> 스펙 업 포인트 신청 목록</li>
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
                  <h3 class="box-title">스펙 업 포인트 신청 목록</h3>
                   <div class="box-tools">
                   <form action="/HarangProject/myPage?cmd=Achallenge" name="search" method="post"> 
                    <div class="input-group">
                      <input type="text" name="keyword" value="${requestScope.keyword}" class="form-control input-sm pull-right" style="width: 150px;" placeholder="Search"/>
                      <select class="form-control input-sm pull-right" style="width: 150px;">
                        <option value="" ${requestScope.keyfield eq null ? 'selected' : null }></option>
                        <option value="m_id" ${requestScope.keyfield eq 'm_id' ? 'selected' : null }>학번 / 관리자 번호</option>
                        <option value="m_name" ${requestScope.keyfield eq 'm_name' ? 'selected' : null }>이름</option>
                        <option value="m_dept" ${requestScope.keyfield eq 'm_dept' ? 'selected' : null }>학과</option>
                        <option value="m_dept" ${requestScope.keyfield eq 'c_name' ? 'selected' : null }>자격증명</option>
                        <option value="m_dept" ${requestScope.keyfield eq 'c_point' ? 'selected' : null }>지급포인트</option>
                        <option value="m_dept" ${requestScope.keyfield eq 'cm_regdate' ? 'selected' : null }>등록 날짜</option>
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
                        <th>학번</th>
                        <th>이름</th>
                        <th>학과</th>
                        <th>자격증</th>
                        <th>보상포인트</th>
                        <th>신청등록날짜</th>
                        <th>조회버튼</th>
                      </tr>
                    </thead>
                    <tbody>
                   <c:choose>
                      <c:when test="${fn:length(cmlist) eq 0}">
                      </c:when>
                    <c:otherwise>
                    <c:forEach items="${cmlist}"
                      begin="${paging.beginPerPage}" 
                      end="${paging.beginPerPage + paging.numPerPage -1}" 
                      var="cm">
                      <tr>
                        <td>${cm.m_id}</td>
                        <td>${cm.m_name}</td>
                        <td>${cm.m_dept}</td>
                        <td>${cm.c_name}</td>
                        <td>${cm.c_point}p</td>
                        <td>${cm.cm_regdate}</td>
                        <c:if test="${cm.cm_iscomplete eq 'none'}">
                            <td><input type="button" class="btn btn-primary" value="확인 조회"></td>
                        </c:if>
                        <c:if test="${cm.cm_iscomplete eq 'complete'}">
                            <td><span class="label label-success">처리완료</span><br>${cm.cm_completedate}</td>
                        </c:if>
                        <c:if test="${cm.cm_iscomplete eq 'reject'}">
                             <td><span class="label label-danger">지급거부</span></td>
                        </c:if>
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
              
                <!-- 도전 등록 -->
              <div class="box box-black">
                <div class="box-header">
                  <h3 class="box-title"><font color="#4888FF">나현기</font> 회원 자격 증명 확인</h3>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
                </div>
                
                <!-- form 시작 -->
                <form role="form">
                
                <div class="box-body">
                 <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-bolt"></i> 자격증 이름</span>
                    <input type="text" name="c_name" class="form-control" value="정보 처리 기사" readonly="readonly">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-sort-numeric-desc"></i> 자격증 번호</span>
                    <input type="text" name="c_num" class="form-control" value="c000000005" readonly="readonly">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-money"></i> 보상 포인트</span>
                    <input type="text" name="c_point" class="form-control" value="600000" readonly="readonly">
                    <span class="input-group-addon">포인트</span>
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-file-text"></i> 자격증명서</span>
                    <span class="input-group-addon ">
                        <a href="#"><img src="../dist/img/license.jpg" class="img-responsive" alt="User Image"/></a>
                    </span>
                  </div>
                  <br>
                </div><!-- /.box-body -->
                  <div class="box-footer" align="right">
                    <input type="button" class="btn" value="닫기">
                    <input type="submit" class="btn btn-primary" value="포인트 지급 처리">
                    <input type="button" onclick="" class="btn btn-danger" value="포인트 지급 거부 [팝업]">
                </div>
                </form>
              </div><!-- /.box -->
              
              </div><!-- /.col -->
           </div><!-- /.row -->
        </section><!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->        
      </div><!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->
<!-- 페이징 : 이전 블록으로 이동하는 폼 -->
<form id="prevPage" method="post" action="/HarangProject/myPage?cmd=Achallenge">
    <input type="hidden" name="keyword" value="${requestScope.keyword}"/>
    <input type="hidden" name="keyfield" value="${requestScope.keyfield}"/>
    <input type="hidden" name="nowPage" value="${paging.pagePerBlock * (paging.nowBlock-1)}"/>
    <input type="hidden" name="nowBlock" value="${paging.nowBlock-1}"/>
</form>
<!-- 페이징 : 다음 블록으로 이동하는 폼 -->
<form id="nextPage" method="post" action="/HarangProject/myPage?cmd=Achallenge">
    <input type="hidden" name="keyword" value="${requestScope.keyword}"/>
    <input type="hidden" name="keyfield" value="${requestScope.keyfield}"/>
    <input type="hidden" name="nowPage" value="${paging.pagePerBlock * (paging.nowBlock+1)}"/>
    <input type="hidden" name="nowBlock" value="${paging.nowBlock+1}"/>
</form>
<!-- 페이징 : 해당 페이지로 이동하는 폼 -->
<form id="goPage" method="post" action="/HarangProject/myPage?cmd=Achallenge">
    <input type="hidden" name="keyword" value="${requestScope.keyword}"/>
    <input type="hidden" name="keyfield" value="${requestScope.keyfield}"/>
    <input type="hidden" name="nowPage" value="" id="page"/>
    <input type="hidden" name="nowBlock" value="${paging.nowBlock}"/>
</form>
<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------> 
<%@ include file="../include/footer.jsp" %>
<script>
function prevPage() {
    document.getElementById("prevPage").submit();
}
function nextPage() {
    document.getElementById("nextPage").submit();
}
function goPage(nowPage) {
    document.getElementById("page").value = nowPage;
    document.getElementById("goPage").submit();
}
</script>
