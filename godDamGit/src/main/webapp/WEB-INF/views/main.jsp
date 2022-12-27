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
	
	<%-- 1226 우종빈: map css추가 --%>
	     <style>
		.overlaybox {position:relative;width:130px;height:100px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/box_movie.png') no-repeat;padding:15px 10px;}
		.overlaybox div, ul {overflow:hidden;margin:0;padding:0;}
		.overlaybox li {list-style: none;}
		.overlaybox .boxtitle {color:#fff;font-size:16px;font-weight:bold;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png') no-repeat right 120px center;margin-bottom:8px;}
		.overlaybox ul {width:130px;}
		.overlaybox li {position:relative;margin-bottom:2px;background:#FFFFFF;padding:4px 10px;color:#aaabaf;line-height: normal;}
		.overlaybox li span {display:inline-block;}
	</style>
    

</head>
<body>
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
                       <div id = "weathercloud"> </div> <%-- 1227 김민석: class -> id로 변경 --%>
                  </div>     
                </div>


                <!-- 큰제목 -->
                <header class="bigName">GWANG JU WATER
                </header>
                
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
                <a href="#" class="arp"><span>수칙</span> </a>
                <a href="#" class="arp"><span>상세지도</span> </a>
			    <a href="#" class="arp">상세정보 </a>
			    <a href="GoBoard.do" class="arp">방명록 </a>
                </nav>
            </div> <!-- .subhead -->
        </div> <!-- .head -->
        
        <section class="section1">
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
                </div>
        
                <div class="collumn2 scrllap_ap">
                <%-- 1223 김민석: 서브 차트2 추가 --%>
                    <div class="chart1">
                      <div id="tit2">월별 주암댐 데이터(%)</div> <%-- 1227 김민석 : 이름 변경 --%>
   						<div class="wrapper">
     				   		<canvas id='ctx' class="canvas"></canvas>
      				 </div>
    				</div>
    				<%-- 1223 김민석: 서브 차트2 추가 --%>
                </div>

                <div class="collumn3">
                    <%-- 1223 김민석: 서브 차트3 추가 --%>
                    <main class="containers">
  						<h3 id="tit3">연별 주암댐 데이터(%)</h3> <%-- 1227 김민석 : 이름 변경 --%>
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
    
            <div class="part1 scrllap_ap">
            <div id="map" style="width:90%;height:800px;"></div><!-- 1226 우종빈 -->
            </div>
        
            <div class="part2 scrllap_ap">
				<select name="blood" id="damName">
            		<option value="soyang">소양강댐</option>
            		<option value="chungju">충주댐</option>
            		<option value="hoengseong">횡성댐</option>
            		<option value="daecheong">대청댐</option>
        		</select>
				<input type="date" id="startDate">
				<input type="date" id="endDate">
				<input type="submit" id="submit">
        <%--1223 우종빈 댐, 기간 선택 태그 만듬 --%>
            </div>
        </div>
    </section>

    <section class="section3">
        <div name="main_part"></div>
        <div class="part1 scrllap_ap">
        
        </div>
        <div class="part2 scrllap_ap">
        
        </div>

    </section> 

      <section class="section4 scrllap_ap">
        <!-- 메인파트 아랫공간때문에 따로 css 추가됨 -->
        <div name="main_part_last">
        <div class="part1_in scrllap_ap">
            
            <div class="page_top_in">
            <div class="page_num_in bigName">04
            </div>
            <div class="page_title_in bigName"> picture
            </div>

            </div>
            

             <div class="box_in">
                <div class="card_in">
                    <div class="imgBx_in">
                        <img id="b" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMXOnlGaUlhGc-eZw9HYnnnHCT44JBNaPGCA&usqp=CAU"
                            alt="images">
                    </div>
                    <div class="details_in">
                        <h2>JongBin is Famous<br><span>Hansot Director</span></h2>
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
            <div class="num_right_in bigName">
                04
            </div>
            <div class="title_right_in bigName">
                WATER
            </div>

            <!-- 오른쪽 아래 타이핑-->
            <div class="logname_in">
                <div class="typing_demo_in">
                    JONGBIN IS FAMOUS
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
    <footer class="foo"><div><marquee>"여기를 보시라구요....글씨가 커졌습니까?"</marquee></div></footer>

<%--1226 김민석: 스크롤 상단 버튼 추가 --%>
	<div style="position:fixed; bottom:55px; right:20px; z-index:99;"> 
	<a href="#weathercloud"> <%-- 1227 김민석 : id 제거 --%>
 	 <i class="fa-regular fa-circle-up" style="font-size: xxx-large; color:black;"></i>
	</a>	
	</div>
<%--1226 김민석: 스크롤 상단 버튼 추가 --%>


    <script type="text/javascript" src="./assets/script.js"></script>
	<script type="text/javascript" src="./assets/ajax.js"></script>
	<script type="text/javascript" src="./assets/ajax2.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0f1f4c8e6a3afcf5f5bfec0f271a2d10"></script>
	<script type="text/javascript" src="./assets/map.js"></script> <!--1226 우종빈-->
</body>

</html>