<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../include/header.jsp" %>
<!-- 해더  삽입  [지우지마세여]------------------------------------------------------------------------------------------------->
<!-- 페이지 헤드 라인 : 제목 -->
<head>
     <title>하랑대학교|학생 메인</title>
</head>
	  <!-- 메인 페이지 구역 , 즉 작업 구역 -->
      <div class="content-wrapper">
<!----------------------------------- 메인페이지 헤더 [작업 제목] ------------------------------------------------------------->
        <section class="content-header">
          <h1></h1>
          <ol class="breadcrumb">
          <!-- 페이지 기록 : 메인에서 부터 현재 페이지 까지의 경로 나열 -->
            <li><a href="#"><i class="fa fa-dashboard"></i> 메인</a></li>
            <li class="active">반갑습니다 :) </li>
          </ol>
        </section>
<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
        <section class="content">
          <!-- 윗부분 : carousel 배너 -->
          <div class="row">
           <div class="col-md-9">
	           	<div class="slider1">
					<div class="slide"><img src="dist/img/harang1.jpg"></div>
					<div class="slide"><img src="dist/img/harang2.jpg"></div>
				 </div>
           </div><!-- /.col -->
          </div><!-- /.row -->
          
          <!-- 아랫부분 : summary와 내 시간표 --> 
          <div class="row">
        	<div class="col-md-9">
        	
        		<div class="col-md-6">
        		<!-- 최신알바정보 -->	
        		<div class="nav-tabs-custom">
		            <ul class="nav nav-tabs pull-right">
        			  <li class="pull-left header"><small><b>최신 정보</b></small></li>
		              <li class="active"><a href="#tab_1" data-toggle="tab" style="color:black">알바</a></li>
		              <li><a href="#tab_2" data-toggle="tab" style="color:black">대타</a></li>
		              <li><a href="#tab_3" data-toggle="tab" style="color:black">대숲</a></li>
		            </ul>
		            <div class="tab-content">
		              <div class="tab-pane active" id="tab_1">
		              	<c:forEach items="${p_list}" var="list" begin="0" end="4" step="1" >
							<a href="javascript:fnReadP('${list.p_num}')" id="read" style="color:black">${list.p_header}&nbsp;&nbsp;${list.p_title}</a><br>
						</c:forEach>
		              </div>
		              <div class="tab-pane" id="tab_2">
		              	<c:forEach items="${d_list}" var="list" begin="0" end="4" step="1" >
							<a href="javascript:fnReadD('${list.d_num}')" id="read" style="color:black">${list.d_header}&nbsp;&nbsp;${list.d_title}</a><br>
						</c:forEach>
		              </div>
		              <div class="tab-pane" id="tab_3">
		              	<c:forEach items="${blist}" var="list" begin="0" end="4" step="1" >
							<a href="javascript:fnReadB('${list.bb_num}')" id="read" style="color:black">${list.bb_title}</a><br>
						</c:forEach>
		              </div>
		            </div>
		          </div>
				<!-- 최신알바정보 끝!-->
				<!-- 포인트 거래 내역 -->
				<div class="box box-solid">
					<div class="box-header with-border">
		              <h3 class="box-title"><small><b>최근 포인트 내역</b></small></h3>
		            </div>
            		<div class="box-body">
            			<table class="table table-bordered table-striped">
		                    <thead>
		                      <tr>
		                        <th>거래 날짜</th>
		                        <th>거래 내용</th>
		                        <th width="20%">포인트</th>
		                      </tr>
		                    </thead>
		                    <tbody>
		                    <c:choose>
		                      <c:when test="${fn:length(pList) eq 0}">
		                      </c:when>
		                      <c:otherwise>
		                      <c:forEach items="${requestScope.pList}" 
		                       					begin="0" end="2" var="p" varStatus="i">
		                        <c:if test="${member.m_id eq p.m_giver}">
		                           <tr class="text-red">
		                            <td>${p.r_regdate}</td>
		                            <td>${p.r_content}</td>
		                            <td>- ${p.r_point}</td>
		                          </tr>
		                         </c:if>
		                         <c:if test="${member.m_id eq p.m_haver}">
		                           <tr class="text-green">
		                            <td>${p.r_regdate}</td>
		                            <td>${p.r_content}</td>
		                            <td>+ ${p.r_point}</td>
		                          </tr>
		                         </c:if>
		                      </c:forEach>
		                    </c:otherwise>
		                    </c:choose>
		                    </tbody>
		                  </table>
            		</div>
				</div>
				<!-- 포인트 거래 내역 끝! -->			        		
        		
        		</div>
        		
        		
        		<!-- 시간표 -->
        		<div class="col-md-6">
        		<b>${tt_grade}학년 ${tt_term}학기</b>
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
                      <th>Mon</th>
                      <th>Tue</th>
                      <th>Wed</th>
                      <th>Thu</th>
                      <th>Fri</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr id="t1">
                      <td class="bg-gray"><br><b>1</b></td>
                      <td id="d1"></td>
                      <td id="d2"></td>
                      <td id="d3"></td>
                      <td id="d4"></td>
                      <td id="d5"></td>
                    </tr>
                    <tr id="t2">
                     <td class="bg-gray"><br><b>2</b></td>
                      <td id="d1"></td>
                      <td id="d2"></td>
                      <td id="d3"></td>
                      <td id="d4"></td>
                      <td id="d5"></td>
                    </tr>
                    <tr id="t3">
                       <td class="bg-gray"><br><b>3</b></td>
                      <td id="d1"></td>
                      <td id="d2"></td>
                      <td id="d3"></td>
                      <td id="d4"></td>
                      <td id="d5"></td>
                    </tr>
                    <tr id="t4">
                       <td class="bg-gray"><br><b>4</b></td>
                      <td id="d1"></td>
                      <td id="d2"></td>
                      <td id="d3"></td>
                      <td id="d4"></td>
                      <td id="d5"></td>
                    </tr>
                    <tr id="t5">
                       <td class="bg-gray"><br><b>5</b></td>
                      <td id="d1"></td>
                      <td id="d2"></td>
                      <td id="d3"></td>
                      <td id="d4"></td>
                      <td id="d5"></td>
                    </tr>
                    <tr id="t6">
                      <td class="bg-gray"><br><b>6</b></td>
                      <td id="d1"></td>
                      <td id="d2"></td>
                      <td id="d3"></td>
                      <td id="d4"></td>
                      <td id="d5"></td>
                    </tr>
                    <tr id="t7">
                      <td class="bg-gray"><br><b>7</b></td>
                      <td id="d1"></td>
                      <td id="d2"></td>
                      <td id="d3"></td>
                      <td id="d4"></td>
                      <td id="d5"></td>
                    </tr>
                    <tr id="t8">
                       <td class="bg-gray"><br><b>8</b></td>
                      <td id="d1"></td>
                      <td id="d2"></td>
                      <td id="d3"></td>
                      <td id="d4"></td>
                      <td id="d5"></td>
                    </tr>
                    <tr id="t9">
                       <td class="bg-gray"><br><b>9</b></td>
                      <td id="d1"></td>
                      <td id="d2"></td>
                      <td id="d3"></td>
                      <td id="d4"></td>
                      <td id="d5"></td>
                    </tr>
                   </tbody>
                  </table>
        		</div>
        	</div>   
          </div>
        </section><!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->        
      </div><!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->
<form name="readP" method="post" action="/HarangProject/parttime?cmd=PREAD">
	<input type="hidden" name="p_num" value="" id="p_num"/>
	<input type="hidden" name="tab" value="PMAIN"/>
</form> 
<form name="readD" method="post" action="/HarangProject/parttime?cmd=PREAD">
	<input type="hidden" name="d_num" value="" id="d_num"/>
	<input type="hidden" name="tab" value="PMAIN"/>
</form>
<form name="readB" method="post" action="/HarangProject/bamboo?cmd=U_BB_CON">
	<input type="hidden" name="bb_num" value="" id="bb_num"/>
</form>     
<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------> 
<%@ include file="../include/footer.jsp" %>
<!-- bxSlider Javascript file -->
<script src="bootstrap/js/jquery.bxslider.min.js"></script>
<!-- bxSlider CSS file -->
<link href="bootstrap/js/jquery.bxslider.css" rel="stylesheet" />
<script>
$(document).ready(function(){
  $('.slider1').bxSlider({
    slideWidth: 800,
    minSlides: 1,
    maxSlides: 3,
    slideMargin: 0
  });
});

function fnReadP(p_num){
	document.getElementById("p_num").value = p_num;
	document.readP.submit();
}
function fnReadD(d_num){
	document.getElementById("d_num").value = d_num;
	document.readD.submit();
}
function fnReadB(bb_num){
	document.getElementById("bb_num").value = bb_num;
	document.readB.submit();
}
</script>


<!-- 시간표를 출력 할 수 있는 쿼리 -->
     <c:forEach items="${ttlist}" varStatus="i" var="tj">
       <script>
       // 요일  -> 날짜 숫자로 변환
       var day = "${tj.l_day}";
        var daynum = 0;
        if(day=="월"){
        	daynum = 1;
            }
        else if(day=="화"){
        	daynum = 2;
            }
        else if(day=="수"){
        	daynum = 3;
            }
        else if(day=="목"){
        	daynum = 4;
            }
        else if(day=="금"){
        	daynum = 5;
            }
        //alert(daynum);
        
        // 시간
        var time = "${tj.l_time}";
        // 1-3 ,4-6, 7-9 
        var sptime = time.split("-");
        var start = sptime[0];
        //alert(start);
        var end = sptime[1];
        //alert(end);
        
        // 수업 이름
        var name = "${tj.l_name}";
        
        // 강의실
        var room = "${tj.l_room}";

        // 교수00
        var teacher = "${tj.l_teacher}";

        // 학과별 색상 변경
        var dept =  "${tj.l_dept}";
        var color = "";
        if(dept=="경영학과"){
        	color = "#EECECE";
            }
        else if(dept=="교양학과"){
        	color = "#EFF7BE";
            }
        else if(dept=="국어국문학과"){
        	color = "#BEDDF7";
            }
        else if(dept=="수학과"){
        	color = "#BEF7EA";
            }
        else if(dept=="산업디자인학과"){
        	color = "#F4DBAF";
            }
        else if(dept=="컴퓨터공학과"){
        	color = "#E0A8FF";
            }
        // 시간표에 해당 내용을 올리는 For문
        for(i=start;i<=end;i++){
        	$("#t"+i+" > #d"+daynum)
        	.css("background",color)
        	.html(name+"<br>"+room+"<br>"+teacher);
        }
       </script>
</c:forEach>