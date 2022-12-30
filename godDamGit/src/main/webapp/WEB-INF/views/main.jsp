<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.entity.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>광주가뭄뉴스</title>
    
    <link rel="stylesheet" href="assets/style.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,700,900,400italic,700italic,900italic|Droid+Serif:400,700,400italic,700italic" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="assets/map.css"><!-- 1227 우종빈 -->

    <title>Newspaper Style Design Experiment</title>
    <meta name="viewport" content="width=device-width">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&family=Noto+Sans+KR:wght@500;700;900&display=swap" rel="stylesheet">
    
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/c8ca5d214a.js" crossorigin="anonymous"></script>
	
	<%-- 1223 김민석: 스크립트,css 경로&링크 추가 --%>
    <script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.min.js"></script>
	<script src='https://cdn.jsdelivr.net/npm/apexcharts'></script>
	<%-- 1223 김민석: 스크립트,css 경로&링크 추가 --%>
	
	<%-- 1228 김민석: 스크립트, 폰트 경로 추가 --%>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Luckiest+Guy&display=swap" rel="stylesheet">
	<%-- 1228 김민석: 스크립트, 폰트 경로 추가 --%>
	
	<%-- 1228 김민석: 방문자 폰트 추가 --%>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
	<%-- 1228 김민석: 방문자 폰트 추가 --%>
	
	<%-- 1226 우종빈: map css추가 --%>
	     <style>
		.overlaybox {position:relative;width:130px;height:100px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/box_movie.png') no-repeat;padding:15px 10px;}
		.overlaybox div, ul {overflow:hidden;margin:0;padding:0;}
		.overlaybox li {list-style: none;}
		.overlaybox .boxtitle {color:#fff;font-size:16px;font-weight:bold;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png') no-repeat right 120px center;margin-bottom:8px;}
		.overlaybox ul {width:130px;}
		.overlaybox li {position:relative;margin-bottom:2px;background:#FFFFFF;padding:4px 10px;color:#aaabaf;line-height: normal;}
		.overlaybox li span {display:inline-block;}
		.collumn4{ position: relative; top: 30px}
	</style>
    
   <%-- 1227 안형철 : 달력용 jquery 추가 시작 --%>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
    integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"
    integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css"
    integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="./assets/jquery-ui.css">
  <script src="./assets/jquery-ui.min.js"></script>
  <%-- 1227 안형철 : 달력용 jquery 추가 끝 --%>

</head>
<body>
	<!-- 게시판 데이터를 가져오기 위한 것 12-29 일남 -->
	<% List<BoardDTO> PicList = (List<BoardDTO>)request.getAttribute("Boardlist"); %>


	<div class=""></div>
	<div class=""></div>
	<div class=""></div>
    <!-- 세션1 시작 -->
    <div class="scrollap"> <%-- 1226 김민석: class -> id로 변경  // 1227 김민석: id -> class 다시 수정--%>
    
        <div class="head scrllap_ap">

            <div class="headerobjectswrapper">
                <!-- 날씨정보 -->
                <div class="weather">
               
                   <div class = "weathericon"> </div>
                   <div class = "weathertext">
                       <div class = "weatherarea"> </div>
                       <div class = "weatherdes"> </div>
                         <div class = "weatherhot"> </div>
                       <div class = "weatherwind"> </div>
                       <div id="top" class = "weathercloud"> </div> <%-- 1227 김민석: id 추가 --%>
                  </div>     
                </div>


                <!-- 큰제목 -->
                <header class="bigName">GWANG JU WATER
                </header>
                
         <%-- 1228 김민석: 방문자 추가 --%>
             <div style="display: inline-block; margin: 0 5px;  float: right;
             border: 3px solid cornflowerblue; border-radius: 10px; font-size:18px; 
             padding: 10px; font-family: 'Noto Sans KR', sans-serif;">
				<div>1인당 물 사용량 <img class="Wimg4" src="./assets/img/water4.png"></div>
				<div class="">302.2(-<img class="Wimg1" src="./assets/img/water1.png">3)</div>
				
			</div>
			<div style="display: inline-block; margin: 0 5px;  float: right;
			 border: 3px solid cornflowerblue; border-radius: 10px; font-size:18px; 
			 padding: 10px; font-family: 'Noto Sans KR', sans-serif;">
				<div>전체 방문자 <img class="Wimg2" src="./assets/img/water2.png"></div>
				<div class=""><%=session.getAttribute("ttlday") %>(+<%=session.getAttribute("today")%>)</div>
				
			</div>
			<div style="display: inline-block; margin: 0 5px;  float: right;
			 border: 3px solid cornflowerblue; border-radius: 10px; font-size:18px; 
			 padding: 10px; font-family: 'Noto Sans KR', sans-serif;">
				<div>오늘 방문자 <img class="Wimg3" src="./assets/img/water3.png"></div>
				<div class=""><%=session.getAttribute("today") %> </div>
			</div>
			<%-- 1228 김민석: 방문자 추가 --%>
                
                <!-- 이스터에그 -->
                <span class="logname">
                <div class="typing_demo">
                    조요한님 안녕하세요
                </div>
                </span>

            </div> <!-- .headerobjectswrapper -->

            <div class="subhead">
                <!-- 왼쪽 홈버튼 -->
                <nav class="sub_menu_left">
                <a href="goMain.do" class="arp2"><i class="fa-solid fa-house"></i><span class="lhtext">HOME</span> </a>
                </nav>
            
                <!-- 오른쪽 메뉴 -->
                <nav class="sub_menu" >
                <a href="#map" class="arp"><span>상세지도</span></a>
			    <a href="GoRule.do" class="arp">상세수칙 </a>
                <a href="#3page" class="arp"><span>설문조사</span> </a>
			    <a href="GoBoard.do" class="arp">방명록 </a>
                </nav>
            </div> <!-- .subhead -->
        </div> <!-- .head -->
        
        <section class="section1" id="chart123">
        <div name="main_part">
            <div class="part1 scrllap_ap">
            <%-- 1223 김민석: 메인 차트 추가 --%>
              	<div id="tit1">주암댐 저수율 전년도 비교</div>
                	<script src="https://cdn.amcharts.com/lib/4/core.js"></script>
    				<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
    				<script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>
   				<div id="chartdiv"></div>
   			<%-- 1223 김민석: 메인 차트 추가 --%>
            </div>
        	
            <div class="part2">
                <div class="collumn1 scrllap_ap">
        	<%-- 1228 김민석: 물 사용량 수칙 추가 --%>
                <div class="center-outer">
					<div class="center-inner">
						<div class="bubbles">
							<h1>광주 1인 1일 물 사용량:</h1>
							<h1 class="BC">302 L/day( <img class="down" src="./assets/img/up.png"> +3)</h1>
                			<h1>목표 물 사용량:</h1>
                			<h1 class="BC">240 L/day</h1>
                			<h1>한국 평균 물 사용량:</h1>
                			<h1 class="BC">297 L/day</h1>
						</div>
					</div>
				</div>
               </div>
               <%-- 1228 김민석: 물 사용량 수칙 추가 --%>
        
                <div class="collumn2 scrllap_ap">
                <%-- 1223 김민석: 서브 차트2 추가 --%>
                    <div class="chart1">
                      <div id="tit2">월별 주암댐 저수율 데이터(%)</div> <%-- 1227 김민석 : 이름 변경 --%>
   						<div class="wrapper">
     				   		<canvas id='ctx' class="canvas"></canvas>
      				 </div>
    				</div>
    				<%-- 1223 김민석: 서브 차트2 추가 --%>
                </div>

                <div class="collumn3">
                    <%-- 1223 김민석: 서브 차트3 추가 --%>
                    <main class="containers">
  						<h3 id="tit3">연별 주암댐 저수율 데이터(%)</h3> <%-- 1227 김민석 : 이름 변경 --%>
  						<div>
    					<canvas id="barChart"></canvas>
  						</div>
					</main>
					<%-- 1223 김민석: 서브 차트3 추가 --%>
                </div>

                <div class="collumn4">
                     <canvas id="myChart"></canvas> <%-- 1223 김민석: 서브 차트4 추가 --%>
                </div>
        
            </div>
        </div>
 

    </section> <!-- 세션1 끝 -->
    <section class="section2">
        <div name="main_part ">
    
            <div class="part1 scrllap_ap" id="map123">
            <div id="map" style="width:90%;height:800px;"></div><!-- 1226 우종빈 -->
            </div>
        
        <%--1227 안형철 댐 기간 선택 태그 받아서 차트 만드는거 시공중 시작 --%>
            <div class="part2 scrllap_ap">
             <div style = "width:168px ; height:80px"></div>
            	<div id="dm_select" style = "display : inline; width:168px ; height:50px ;
            	font-size:25px;">
            		일별<input type="radio" name = "radio" id="dayradio" value="일별">
                    월별<input type="radio" name = "radio" id="monthradio" value="월별">
                    <div id="selecttagin"></div>
                    
                    
            	</div>
            	
        	
		
            
            <div id="detailchart" style="width:90%;height:600px;"></div>
            <div id="detailtable" style="width:90%; height:200px;"></div>
            
            </div>
            
        <%--1227 안형철 댐 기간 선택 태그 받아서 차트 만드는거 시공중 끝 --%>  
        </div>
    </section>

    <section class="section3">
        <div id="3page" name="main_part"></div>
        <div class="part1 scrllap_ap">
         <div class="savewater_div_title"style="height:5%;width:100%;align-items: center;display: flex;background-color:gray;">
        <h1 style="align-items: center;position: relative;text-align: center;">물 절약 방법 best 3</h1>
        <a style="position: relative;right:-50px" href="">상세 수칙 보러가기</a>
        </div>
        <div class="savewater_div" style="height: 30%;width:100%;display:flex;position: relative;">
        	<div style="height: 100%;width:40%;">

					<img alt="" src="./assets/img/h4.png" style="width: 100%;height: 100%;position: relative;">
       	
        	</div>
        	 <div style="height: 100%;width:60%;">
				<div class="savewater_div2" style="height: 100%;width:100%;background-color:gray;position: relative;top:-16px">
					<div style="height: 100%;width:100%; background-color:white;position: relative;">
						<h3 class="savewater" style="position: relative;text-align: center;">머리 감을 때,비누질 할 때 수도를 잠그는 것으로</h3>
						<h2 class="savewater" style="position: relative;text-align: center;">하루 30 L의 물을 아낄 수 있습니다!</h2>
						<br>
						<h3 class="savewater" style="position: relative;text-align: center;">추가로 샤워시간을 줄일 때마다</h3>
						<h2 class="savewater" style="position: relative;text-align: center;">1분당 12 L의 물절약이 가능합니다!</h2>
					</div>
				</div>        	
        	</div>
        </div>
        <div class="savewater_div" style="height: 30%;width:100%;display:flex;position: relative;">
        	<div style="height: 100%;width:40%;">
				<div style="height: 100%;width:100%; background-color: whitesmoke;">
					<img alt="" src="./assets/img/h5.png" style="width: 100%;height: 100%;position: relative;">
				</div>        	
        	</div>
        	 <div style="height: 100%;width:60%;">
				<div class="savewater_div2" style="height: 100%;width:100%;background-color:gray;position: relative;top:-16px">
					<div class="savewater_div3" style="	height: 100%;width:100%; background-color:white;position: relative;">
						<h3 class="savewater" style="position: relative;text-align: center;">행굼을 두 번 한다고 세탁이 잘되진 않습니다.</h3>
						<h2 class="savewater" style="position: relative;text-align: center;">10kg 세탁기 행굼 한번에 90L 사용! </h2>
						<br>
						<h3 class="savewater" style="position: relative;text-align: center;">세탁 효과를 높이기 위해선 세탁기 용량의</h3>
						<h3 class="savewater" style="position: relative;text-align: center;">절반 정도에서 하는것이 좋습니다!</h3>
					</div>  
				</div>      	
        	</div>
        </div>
        <div class="savewater_div" style="height: 30%;width:100%;display:flex;position: relative;">
        	<div style="height: 100%;width:40%;">
				<div style="height: 100%;width:100%; background-color: whitesmoke;">
					<img alt="" src="./assets/img/h2.png" style="width: 100%;height: 100%;position: relative;">
				</div>        	
        	</div>
        	 <div style="height: 100%;width:60%;">
				<div class="savewater_div2" style="height:100%;width:100%;background-color:gray;position: relative;top:-16px">
					<div class="savewater_div3" style="	height: 100%;width:100%; background-color:white;position: relative;">
						<h3 class="savewater" style="position: relative;text-align: center;">양치하며 물을 틀어두시나요?</h3>
						<h2 class="savewater" style="position: relative;text-align: center">양치컵 사용시 회당 5L 이상 절약!</h2>
						<br>
						<h3 class="savewater" style="position: relative;text-align: center;">공공장소에서도 수도를 계속 쓰시기보다</h3>
						<h3 class="savewater" style="position: relative;text-align: center;">양치컵을 사용하시면 점심시간에</h3>
						<h3 class="savewater" style="position: relative;text-align: center;">줄 서는 시간을 줄일 수 있습니다.</h3>
					</div>
				</div>        	
        	</div>
        </div>
        </div>
        <div class="part2 scrllap_ap">

   <table border="1" align="center" bgcolor="whitesmoke">
        <tr height="40" bgcolor="gray">
            <td colspan="2" height="35"> 
                <font size="5"><h4 align="center"> 물절약 자가진단<div style="display: inline-flex; position:relative;top: 10px;">
                <img style="width:45px;position: relative; left:10px;" src="./assets/img/100.png" alt="" ></div></h4></font>
            </td>
        </tr>
        <tr >
            <td rowspan="2">
             &nbsp;&nbsp; ▶&nbsp;&nbsp; 1인 가구이신가요?
            </td>
            <td colspan="" align="center">
                &nbsp;&nbsp;&nbsp;네&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;아니요
            </td>
        </tr>
        <tr>
           <td align="center">
                <input type="radio" name="question 1" class="question 1" value="네">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="question 1" class="question 1" value="아니요">
           </td>
        </tr>

        <tr height="50" bgcolor="gray">
            <td colspan="2"><h4>step1 : 욕실에서</h4></td>
        </tr>
        <tr >
            <td rowspan="2">
              &nbsp;&nbsp; ▶&nbsp;&nbsp; 샤워시간은 어느정도신가요?
            </td>
            <td colspan="" align="center">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5분이내&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;10분&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 15분&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 20분 &nbsp;&nbsp;&nbsp;30분이상&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
        </tr>
        <tr>
           <td align="center">
                <input type="radio" name="question 2" class="question 2" value="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="question 2" class="question 2" value="10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="question 2" class="question 2" value="15">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="question 2" class="question 2" value="20">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="question 2" class="question no 2" value="30">
           </td>
        </tr>
        <tr >
            <td rowspan="2">
                &nbsp;&nbsp; ▶&nbsp;&nbsp; 머리감을 때와 비누질할 때 물을 잠그시나요?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td colspan="" align="center">
                &nbsp;&nbsp;&nbsp;네&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;아니요
            </td>
        </tr>
        <tr>
           <td align="center">
            <input type="radio" name="question 3" class="question 3" value="네">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="radio" name="question 3" class="question no 3" value="아니요">
           </td>
        </tr>
        <tr >
            <td rowspan="2">
               &nbsp;&nbsp; ▶&nbsp;&nbsp; 절수형 샤워헤드를 사용하시나요?
            </td>
            <td colspan="" align="center">
                &nbsp;&nbsp;&nbsp;네&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;아니요
            </td>
        </tr>
        <tr>
           <td align="center">
            <input type="radio" name="question 4" class="question 4" value="네">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="radio" name="question 4" class="question no 4" value="아니요">
           </td>
        </tr>
        <tr height="50" bgcolor="gray">
            <td colspan="2"><h4>step2 : 화장실에서</h4></td>
        </tr>
        <tr >
            <td rowspan="2">
              &nbsp;&nbsp; ▶&nbsp;&nbsp; 변기 수조에 물병을 넣으셨나요?
            </td>
            <td colspan="" align="center">
                &nbsp;&nbsp;&nbsp;네&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;아니요
            </td>
        </tr>
        <tr>
           <td align="center">
            <input type="radio" name="question 5" class="question 5" value="네">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="radio" name="question 5" class="question no 5" value="아니요">
           </td>
        </tr>
        <tr >
            <td rowspan="2">
             &nbsp;&nbsp; ▶&nbsp;&nbsp; 양치컵을 사용하시나요?
            </td>
            <td colspan="" align="center">
                &nbsp;&nbsp;&nbsp;네&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;아니요
            </td>
        </tr>
        <tr>
           <td align="center">
            <input type="radio" name="question 6" class="question 6" value="네">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="radio" name="question 6" class="question no 6" value="아니요">
           </td>
        </tr>
        <tr height="50" bgcolor="gray">
            <td colspan="2"><h4>step3 : 부엌에서</h4></td>
        </tr>
        <tr >
            <td rowspan="2">
             &nbsp;&nbsp; ▶&nbsp;&nbsp; 설거지통을 사용하시나요?
            </td align="center">
            <td colspan="" align="center">
                &nbsp;&nbsp;&nbsp;네&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;아니요
            </td>
        </tr>
        <tr>
           <td align="center">
            <input type="radio" name="question 7" class="question 7" value="네">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="radio" name="question 7" class="question no 7" value="아니요">
           </td>
        </tr>
        <tr >
            <td rowspan="2">
               &nbsp;&nbsp; ▶&nbsp;&nbsp; 식기세척기를 사용하시나요?
            </td>
            <td colspan="" align="center">
                &nbsp;&nbsp;&nbsp;네&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;아니요
            </td>
        </tr>
        <tr>
           <td align="center">
            <input type="radio" name="question 8" class="question 8" value="네">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="radio" name="question 8" class="question 8" value="아니요">
           </td>
        </tr>
        <tr height="50" bgcolor="gray">
            <td colspan="2"><h4>step4 : 세탁실에서</h4></td>
        </tr>
        <tr >
            <td rowspan="2">
               &nbsp;&nbsp; ▶&nbsp;&nbsp; 세탁은 며칠마다 하시나요?
            </td>
            <td colspan="" align="center">
                &nbsp;&nbsp;&nbsp;하루&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;이틀&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;사흘&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;나흘&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;닷새
            </td>
        </tr>
        <tr>
           <td align="center">
                &nbsp;&nbsp;<input type="radio" name="question 9" class="question no 9" value="1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="question 9" class="question no 9" value="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="question 9" class="question 9" value="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="question 9" class="question 9" value="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="question 9" class="question 9" value="5">
           </td>
        </tr>
        <tr >
            <td rowspan="2">
              &nbsp;&nbsp; ▶&nbsp;&nbsp; 세탁시 추가 헹굼을 하시나요?
            </td>
            <td colspan="" align="center">
                &nbsp;&nbsp;&nbsp;네&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;아니요
            </td>
        </tr>
        <tr>
           <td align="center">
            <input type="radio" name="question 10" class="question no 10" value="네">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="radio" name="question 10" class="question 10" value="아니요">
           </td>
        </tr>
       
        <tr align="center">
        <tr height="50">
            <td  colspan="2" align="center">
                <input id="testsubmit"type="submit" value="제출">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="reset" id=checkreset value="초기화">
            </td>
        </tr>
    </table>
    
    


        
        
        
        </div>

    </section> 
    		<%int PicSize=PicList.size();%>
    
    
    			<%
    			ArrayList<String> Picimg = new ArrayList<>();
    			ArrayList<String> Picid = new ArrayList<>();
    			ArrayList<String> PicTitle = new ArrayList<>();
    			
    			
    			for(int i=0; i<PicSize; i++) {
    			Picimg.add(PicList.get(i).getBook_img());
    			Picid.add(PicList.get(i).getBook_id());
    			PicTitle.add(PicList.get(i).getBook_title());
    			
    			}
    		    /* Random random = new Random();
    	        int randomIndex = random.nextInt(Picimg.size());
    			
    	        String Picimgf =Picimg.get(randomIndex); */
    	        /* System.out.print(PicTitle); */
    			%>
    			<!-- 여기까지는 된다 값을 출력해보면 들어간 것을 확인-->
    			
    			<div class="imglist_in" id="imglist_in"><%=Picimg%></div>
    			<div class="Namelist_in" id="Namelist_in"><%=Picid%></div>
    			<div class="Titlelist_in" id="Titlelist_in"><%=PicTitle%></div>

      <section class="section4 scrllap_ap">
        <!-- 메인파트 아랫공간때문에 따로 css 추가됨 -->
        <div name="main_part_last">
        <div class="part1_in scrllap_ap">
            
            <div class="page_top_in">
            <div class="page_num_in headline1_in">사진
            </div>
            <div class="page_title_in bigName"> picture
            </div>

            </div>
            

             <div class="box_in">
                <div class="card_in" onclick="ranPhoto()">
                    <div class="imgBx_in">
                        <img id="b" class=clikPic src="http://www.mdilbo.com/lib/thumb.html?type=file&w=500&src=202211/29/20221129160532949562.jpg"
                            alt="images">
                    </div>
                    <div class="details_in">
                        <h2 id="c_in2">JongBin is Famous<br></h2><h2 id="c_in1" class="fin_in">Hansot Director</h2>
                    </div>
                </div>
            </div> 

            <!-- 사진 밑 버튼 -->
            <span class="icon_name_in" id="ab">
                <i class="fa-sharp fa-solid fa-circle"></i>
                <i class="fa-sharp fa-solid fa-circle-dot"></i>
                <i class="fa-sharp fa-solid fa-circle"></i></span>
        
        </div>
        <div class="part2_in scrllap_ap">

            <span class="page_num2_in bigName">04</span>
            <span class="article_in bigName">ARTICLE</span>

            <div class="right_area_in">
                <div class="graybox_in">
                    
                    <div class="icon_in"></div>
                    <div class="textbox_in">
                    " 경찰서에 구금됐다가 검찰로 송치된 사람은 어떤 처분을 받게 될까? 
                    </div>
                    
                </div>
                <div class="textbox2_in">
                    스크롤트리거로 오른쪽에서 왼쪽 이동시켜보자 그리고 전체 이동할 필요없이 오른쪽에 이펙트를 넣는 것도 고려해볼만 하다. 하지만 일반적으로는 전체적으로 중앙이동해서 자리를 잡는 것이 안정감있고 사이트 전체의 통일성을 위해서 좋을지도 모른다
                </div>


            <!-- 오른쪽 아래 water글씨-->
            </div>
            <div class="num_right_in headline1_in">
                기사
            </div>
            <div class="title_right_in bigName">
                WATER
            </div>

            <!-- 오른쪽 아래 타이핑-->
            <div class="logname_in">
                <div class="typing_demo_in" id="c_id1">
                   생활속 물절약이 가장 중요합니다
                </div>
            </div>
        </div>
        </div>
    </section> 

    <!-- 나중에 푸터 바로 위에 이스터에그 한번 넣어보자 
        <span class="logname">
        <div class="typing_demo">
            조요한님 안녕하세요
        </div>
        </span> -->
</div>
      
      
      
      <!-- partial -->
    
    <!-- footer 밑 자막 -->
    <footer class="foo"><div><marquee>"눈이 많이오더라도.... 저수량에 미치는 영향은 미미합니다"</marquee></div></footer>

<%--1226 김민석: 스크롤 상단 버튼 추가 --%>
	<div style="position:fixed; bottom:55px; right:20px; z-index:99;"> 
	<a href="#top"> <%-- 1227 김민석 : id 제거 --%>
 	 <i class="fa-regular fa-circle-up" style="font-size: xxx-large; color:black;"></i>
	</a>	
	</div>
<%--1226 김민석: 스크롤 상단 버튼 추가 --%>
	

    <script type="text/javascript" src="./assets/script.js"></script>
	<script type="text/javascript" src="./assets/ajax.js"></script>
	<script type="text/javascript" src="./assets/ajax2.js"></script>
	<script type="text/javascript" src="./assets/ajax3.js"></script>
	<script type="text/javascript" src="./assets/checkscore.js"></script>
	<script type="text/javascript" src="./assets/date_picker.js"></script>	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0f1f4c8e6a3afcf5f5bfec0f271a2d10"></script>
	<script type="text/javascript" src="./assets/map.js"></script> <!--1226 우종빈-->
		<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chart.js@4.0.1/dist/chart.umd.min.js"></script>
</body>

</html>