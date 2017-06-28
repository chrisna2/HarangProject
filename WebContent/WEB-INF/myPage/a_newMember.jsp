<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- daterange picker -->
<link href="../plugins/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />
<%@ include file="../include/a_header.jsp" %>

<!-- 해더  삽입  [지우지마세여]------------------------------------------------------------------------------------------------->
<!-- 페이지 헤드 라인 : 브라우저 제목 -->
<head>
<script type="text/javascript">

function checkform(){
    
    var num1 = input.num1.value;
    var num2 = input.num2.value;
    var num3 = input.num3.value;
    
    var num4 = num1+""+num2;
    
    var m_id = num1+""+num2+""+num3;
    
    input.m_id.value = m_id;
    input.num4.value = num4;

   

    return true;
    
}


function deptcheck(){ 
	  i = input.num2.selectedIndex; // 선택항목의 인덱스 번호
	
	
	  
      var dept= input.num2.options[i].value; // 선택항목 value
    	
      if(dept=="01"){
    		dept="국문학과";
    		
    	} else if(dept=="02"){
    		dept="수학과";
    		
    	} else if(dept=="03"){
    		dept="컴퓨터 공학과";
    		
    	} else if(dept=="04"){
    		dept="경영학과";
    		
    	} else if(dept=="05"){
    		dept="정보통신학과";
    		
    	} 
      
    
    	 input.m_dept.value = dept;
  
}



</script>
     <title>신입생 편입생 등록</title>
</head>
<!-- 메인 페이지 구역 , 즉 작업 구역 -->
      <div class="content-wrapper">
<!----------------------------------- 메인페이지 헤더 [작업 제목] ------------------------------------------------------------->
        <section class="content-header">
          <h1>
                신입생/편입생 등록
          </h1>
            <ol class="breadcrumb">
          <!-- 페이지 기록 : 메인에서 부터 현재 페이지 까지의 경로 나열 -->
            <li><a href="#"><i class="fa fa-dashboard"></i> 관리자 메인</a></li>
            <li><a href="#"> 사이트 관리</a></li>
            <li><a href="#"> 회원 관리</a></li>
            <li class="active"> 신입생/편입생 등록</li>
          </ol>
        </section>
<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
        <section class="content">
          <!-- 세로 길이 수정 -->
          <div class="row">
           <!-- 너비 사이즈 수정  : col-->
           <div class="col-md-9">
           
             <!-- Input addon -->
              <div class="box box-black">
                <div class="box-header">
                  <h3 class="box-title">신규 신입생/편입생 정보</h3>
                </div>
                
                <!-- form 시작 -->
                <form role="form" name="input" action="/HarangProject/myPage?cmd=Anewmem" method="post" onsubmit="return checkform()">
                
                <div class="box-body">
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-smile-o"></i> 이름</span>
                    <input type="text" name="m_name" class="form-control"   placeholder="이름">
                    
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-sort-numeric-desc"></i> 학번</span>
                    <select class="form-control"   name="num1">
                        <option value="2017" selected="selected">2017 [신입생]</option>
                        <option value="2016">2016 [2학년 편입]</option>
                        <option value="2015">2015 [3학년 편입]</option>
                    </select>
                    <span class="input-group-addon"> - </span>
                    <select class="form-control"  name="num2" onchange="deptcheck()">
                        <option value="01" >01:국문학과</option>
                        <option value="02" selected="selected">02:수학과</option>
                        <option value="03" >03:컴퓨터 공학과</option>
                        <option value="04" >04:경영학과</option>
                        <option value="05" >05:정보통신학과</option>
                    </select>
                    <span class="input-group-addon"> - </span>
                    <input type="text" name="num3" class="form-control"   >
                    <input type="hidden" name="m_id" value="">
                    <input type="hidden" name="num4" value="">
      
                    <span class="input-group-btn">
                      <input type="button" class="btn btn-warning btn-flat" onclick="numclick()"  value="최신번호 입력">
                    </span>
                   
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-sitemap"></i> 학과</span>
                    <input type="text" name="m_dept" class="form-control" >
                  </div>
                  <br>
                  <!--
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-calendar"></i> 생년월일1</span>
                    <input type="text" class="form-control pull-right" id="date" required="required"/>
                  </div>
                  -->
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-calendar"></i> 생년월일</span>
                    <input type="text" class="form-control pull-right" name="m_birth"  placeholder="생년월일6자리" />
                  </div>
                  <br>
                </div><!-- /.box-body -->
                
                 <div class="box-footer" align="right">
                    <input type="button" class="btn" value="뒤로가기">
                    <input type="reset" class="btn" value="리셋">
                    <input type="submit" class="btn btn-primary" value="등록">
                </div>
                </form>
                
              </div><!-- /.box -->
              <!-- 페이지 단위 -->
             </div><!-- /.col -->
           </div><!-- /.row -->
        </section><!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->        
      </div>
<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------> 
 <!-- date-range-picker -->
<%@ include file="../include/footer.jsp" %>
    
    <script>
   
    
    
    function idcheck(){ 
        i = input.num1.selectedIndex; // 선택항목의 인덱스 번호
        var num1= input.num1.options[i].value; // 선택항목 value
        input.num1.value = num1;
   }
    function idcheck2(){ 
        i = input.num2.selectedIndex; // 선택항목의 인덱스 번호
        var num2= input.num2.options[i].value; // 선택항목 value
        input.num2.value = num2;
   }
    
    function mailcheck(){ 
        i = input.m_mail3.selectedIndex; // 선택항목의 인덱스 번호
        var mail= input.m_mail3.options[i].value; // 선택항목 value
        input.m_mail2.value = mail;
   }
    
    function numclick() {
   	 var num1 = input.num1.value;
   	    var num2 = input.num2.value;
   	  
   	    var num4_1 = num1+""+num2;
   	  $.getJSON("/HarangProject/ajax?cmd=membernum",
   			  {num4:num4_1},
              function(data){  
              $(data).each(function(index, list){
               input.num3.value = list.m_maxnum;
              
           });
       });
   	    
   	  
   	
   }
    
   
    
    </script>