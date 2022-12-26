<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>방명록</title>

    <link rel="stylesheet" href="assets/BoardMain.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&family=Noto+Sans+KR:wght@500;700;900&display=swap" rel="stylesheet">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/c8ca5d214a.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,700,900,400italic,700italic,900italic|Droid+Serif:400,700,400italic,700italic" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@500&display=swap" rel="stylesheet">

</head>
<body>
    <div class="head bigName"> Guest Board </div>

    <div class="subhead">
        <div class="submenu">
            <a href="#" class="arp headline1">수칙</a>
            <a href="#" class="arp headline1">상세지도 </a>
            <a href="#" class="arp headline1">상세정보 </a>
            <a href="#" class="arp headline1">방명록 </a>
        </div>
    </div>

    <div class="part1">
        <div class="board_wrap">
            <div class="board_top">
                <div class="top_left bigName3">Guest Board</div>
                <div class="top_right headline2">[공지사항] <br>으휴 이걸 처음부터 다 만드네</div>
            </div>
            <div class="board_list">
    
                <div class="top">
                    <div class="num">번호</div>
                    <div class="title">제목</div>
                    <div class="writer">글쓴이</div>
                    <div class="date">작성일</div>
                    <div class="count">조회</div>
                </div>
                <div class="line">
                    <div class="num">5</div>
                    <div class="title"><a href="GoView.do">글 제목이 들어갑니다.</a></div>
                    <div class="writer">우종빈</div>
                    <div class="date">2021.1.15</div>
                    <div class="count">33</div>
                </div>
                <div class="line">
                    <div class="num">4</div>
                    <div class="title"><a href="GoView.do">글 제목이 들어갑니다.</a></div>
                    <div class="writer">우종빈</div>
                    <div class="date">2021.1.15</div>
                    <div class="count">33</div>
                </div>
                <div class="line">
                    <div class="num">3</div>
                    <div class="title"><a href="GoView.do">글 제목이 들어갑니다.</a></div>
                    <div class="writer">우종빈</div>
                    <div class="date">2021.1.15</div>
                    <div class="count">33</div>
                </div>
                <div class="line">
                    <div class="num">2</div>
                    <div class="title"><a href="GoView.do">글 제목이 들어갑니다.</a></div>
                    <div class="writer">우종빈</div>
                    <div class="date">2021.1.15</div>
                    <div class="count">33</div>
                </div>
                <div class="line">
                    <div class="num">1</div>
                    <div class="title"><a href="GoView.do">글 제목이 들어갑니다.</a></div>
                    <div class="writer">우종빈</div>
                    <div class="date">2021.1.15</div>
                    <div class="count">33</div>
                </div>
    
            </div>

            <!-- 보드 숫자 -->
            <div class="board_page">
                <a href="#" class="bt first">--</a>
                <a href="#" class="bt prev">-</a>
                <a href="#" class="num">1</a>
                <a href="#" class="num">2</a>
                <a href="#" class="num">3</a>
                <a href="#" class="num">4</a>
                <a href="#" class="num">5</a>
                <a href="#" class="bt next">-</a>
                <a href="#" class="bt last">--</a>
            </div>
            
            <!-- 보드 버튼 -->
            <div class="bt_wrap">
                <a href="nwrite.html" class="on headline1 arp3">검색</a>
                <!--<a href="#">수정</a>-->
            </div>

            <div class="bt_wrap2">
                <a href="GoWrite.do" class="on2 headline1 arp3">글쓰기</a>
                <!--<a href="#">수정</a>-->
            </div>

            <div class="board_page">




            </div>
        </div>
    </div>
    









</body>
</html>