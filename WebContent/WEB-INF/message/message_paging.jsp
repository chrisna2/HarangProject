<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- ----------------------------------------------------------------------- -->
				
				<div class="mailbox-controls">
                    <!-- Check all button -->
                    <button class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o"></i></button>                    
                    <div class="btn-group">
                      <button class="btn btn-default btn-sm"><i class="fa fa-trash-o"></i></button>
                    </div><!-- /.btn-group -->
                    <button class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
                    
				<!-- 페이징버튼 -->
                    <div class="pull-right">
	                    <c:choose>
		                    <c:when test="${paging.nowBlock*paging.pagePerBlock+paging.pagePerBlock > paging.totalRecord}" >
		                      <c:choose>
			                      <c:when test="${paging.totalRecord == 0}">
			                      	0 / 0
			                      </c:when>
			                      <c:otherwise>
			                      	${paging.nowBlock*paging.pagePerBlock+1} - ${paging.totalRecord}/${paging.totalRecord}
			                      </c:otherwise>
		                      </c:choose>
		                    </c:when>
		                    <c:otherwise>
		                      ${paging.nowBlock*paging.pagePerBlock+1} - ${paging.nowBlock*paging.pagePerBlock+paging.pagePerBlock}/${paging.totalRecord}
		                    </c:otherwise>
	                    </c:choose>
                      <div class="btn-group">
                      	<c:if test="${paging.nowBlock > 0}">
	                        <button class="btn btn-default btn-sm" onclick="prevPage()"><i class="fa fa-chevron-left"></i></button>
						</c:if>
                        <c:if test="${paging.totalBlock > paging.nowBlock +1}">
	                        <button class="btn btn-default btn-sm" onclick="nextPage()"><i class="fa fa-chevron-right"></i></button>
						</c:if>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      </div><!-- /.btn-group -->
                    </div><!-- /.pull-right -->
                    <!-- 페이징 버튼 -->
               </div>