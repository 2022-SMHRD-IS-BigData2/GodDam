<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link rel="stylesheet" href="assets/BoardEdit.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&family=Noto+Sans+KR:wght@500;700;900&display=swap" rel="stylesheet">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/c8ca5d214a.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,700,900,400italic,700italic,900italic|Droid+Serif:400,700,400italic,700italic" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@500&display=swap" rel="stylesheet">
    <script type="text/javascript" src="/js/board_write.js"></script>


</head>
<body>
    <div class="board_wrap">
        
        <div class="board_title bigName">
            Guest board
        </div>

        <div class="board_view_wrap">
            
            <div class="board_view">

                <form id="frm" action="" method="post">
                <div class="title headline2" id="title" contenteditable="true" value="title" checked="checked" >
                    jsp에서 제목가져옴
                </div>

                <div class="info">
                    <div>
                        <div class="a1a headline3">번호</div>
                        <div class="a2a headline3">1</div>
                    </div>
                    <div>
                        <div class="a1a headline3">글쓴이</div>
                        <div class="a2a headline3" id="name">jsp에서 아이디 가져옴</div>
                    </div>
                    <div>
                        <div class="a1a headline3">비밀번호</div>
                        <div class="a2a2 headline3" contenteditable="true" id="pw">여기에 비밀번호입력</div>
                    </div>
                </div>
                
                <div class="page headline3" contenteditable="true" id="content">
                    <br> <br>jsp에서 수정할 글을 불러옴
                    <input type="url" placeholder="여기에 업로드할 이미지 주소를 입력하세요">
                </div>
                </form> <!-- 이거 전체로 감싸야 하나...? -->

            </div>
            
            
            <div class="bt_wrap">
                <a href="GoBoard.do" class="on headline1 arp3">목록</a>
                <a href="GoBoard.do" onclick="return chk_form()" class="on2 headline1 arp3">작성</a>
            </div>
            
        </div>
    </div>
</body>
</html>