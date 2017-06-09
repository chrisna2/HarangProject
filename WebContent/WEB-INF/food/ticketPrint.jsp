<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>
<!-- 해더  삽입  [지우지마세여]------------------------------------------------------------------------------------------------->
<!-- 페이지 헤드 라인 : 제목 -->
		<head>
		     <title>식권 구매 내역</title>
		         <style>
		      * {
		          color:#7F7F7F;
		          font-family:Arial,sans-serif;
		          font-size:12px;
		          font-weight:normal;
		      }    
		      #config{
		          overflow: auto;
		          margin-bottom: 10px;
		      }
		      .config{
		          float: left;
		          width: 200px;
		          height: 250px;
		          border: 1px solid #000;
		          margin-left: 10px;
		      }
		      .config .title{
		          font-weight: bold;
		          text-align: center;
		      }
		      .config .barcode2D,
		      #miscCanvas{
		        display: none;
		      }
		      #submit{
		          clear: both;
		      }
		      #barcodeTarget,
		      #canvasTarget{
		        margin-top: 20px;
		      }        
		    </style>
		</head>
	  <!-- 메인 페이지 구역 , 즉 작업 구역 -->
      <div class="content-wrapper">
<!----------------------------------- 메인페이지 헤더 [작업 제목] ------------------------------------------------------------->
      <section class="content-header">
          <h1>
                         식권 출력
            <small>해당 QR코드를 바코드에 스캔 하세요</small>
          </h1>
          <ol class="breadcrumb">
          <!-- 페이지 기록 : 메인에서 부터 현재 페이지 까지의 경로 나열 -->
            <li><a href="#"><i class="fa fa-dashboard"></i> 메인</a></li>
            <li><a href="#"> 하랑 레스토랑</a></li>
            <li><a href="#"> 식권 구매 내역</a></li>
            <li class="active"> 식권 출력</li>
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
                  <h3 class="box-title">식권 출력</h3>
                <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                 </div>
                </div><!-- /.box-header -->
                <div class="box-body" align="center">
                
	                <h2>
	                                         하랑 <img src="dist/img/Logo.png" class="img-circle" alt="User Image" width="75" height="75"/> 식당
	                </h2>
	                    <!-- 여기다 코드 벨류 입력 DB 데이터 -->
		                <input type="hidden" id="barcodeValue" value="4566464879872313" onload="generateBarcode();">
		                <!-- 바코드 핵심 위치 -->
		                <div id="barcodeTarget" class="barcodeTarget"></div>
		                <canvas id="canvasTarget" width="250" height="250"></canvas> 
                    <BR>
                    <h4><i class="fa fa-cutlery"></i> 구매 메뉴 : 초밥</h4>
                    <h4><i class="fa fa-cutlery"></i> 구매일 : 2017-06-21 09:25:15</h4>
                    <h4><i class="fa fa-cutlery"></i> 구매자 : 나현기 (201701008)</h4>
                    <h4 class="text-danger"><i class="fa fa-warning"></i> 사용 가능 시간 : 2017-06-22 11시 이후 부터 3시 이전까지</h4>
                    <br>
                    <h4 class="text-danger"><i class="fa fa-warning"></i> 사용시 주의 사항 <i class="fa fa-warning"></i></h4>
                    <p>1. 해당식권은 사용 가능 시간이 지나면 사용할 수 없습니다.</p>
                    <p>2. 해당식권은 사용 가능 시간 하루 이전까지 환불 가능합니다.</p>
                    <p>3. 해당식권은 사용 가능 시간이 지나면 환불할 수 없습니다.</p>
                    <p>4. 환불이 완료된 식권은 다시 구매 할 수 없습니다.</p>
                
                </div><!-- /.box-body -->

					<div class="box-footer clearfix" align="center">
						<input type="button" class="btn" value="닫기"> 
						<input type="submit" class="btn btn-success" value="사용 [결제 테스트용]"> 
					    <input type="button" onclick="" class="btn btn-danger" value="환불 처리">
					</div>

				</div><!-- /.box -->
              
              </div><!-- /.col -->
           </div><!-- /.row -->
        </section><!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->        
      </div><!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->
      
<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------> 
<%@ include file="../include/footer.jsp" %>
    <script type="text/javascript" src="plugins/barcode/jquery-barcode.js"></script>
    <script type="text/javascript">
      function generateBarcode(){
        var value = $("#barcodeValue").val();
        var btype = "datamatrix";
        var renderer = "css";
        
        var quietZone = false;
        if ($("#quietzone").is(':checked') || $("#quietzone").attr('checked')){
          quietZone = true;
        }
        
        var settings = {
          output:renderer,
          bgColor: "#ffffff",
          color: "#000000",
          barWidth: "1",
          barHeight: "50",
          moduleSize: "10",
          posX: "10",
          posY: "20",
          addQuietZone: "1"
        };
        if ($("#rectangular").is(':checked') || $("#rectangular").attr('checked')){
          value = {code:value, rect: true};
        }
        if (renderer == 'canvas'){
          clearCanvas();
          $("#barcodeTarget").hide();
          $("#canvasTarget").show().barcode(value, btype, settings);
        } else {
          $("#canvasTarget").hide();
          $("#barcodeTarget").html("").show().barcode(value, btype, settings);
        }
      }
      
      $(function(){
        $('input[name=btype]').click(function(){
          if ($(this).attr('id') == 'datamatrix') showConfig2D(); else showConfig1D();
        });
        $('input[name=renderer]').click(function(){
          if ($(this).attr('id') == 'canvas') $('#miscCanvas').show(); else $('#miscCanvas').hide();
        });
        generateBarcode();
      });
  
</script>
