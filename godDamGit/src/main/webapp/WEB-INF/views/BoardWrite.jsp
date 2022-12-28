<%@page import="com.smhrd.entity.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link rel="stylesheet" href="assets/BoardWrite.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&family=Noto+Sans+KR:wght@500;700;900&display=swap" rel="stylesheet">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/c8ca5d214a.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,700,900,400italic,700italic,900italic|Droid+Serif:400,700,400italic,700italic" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@500&display=swap" rel="stylesheet">
    <script type="text/javascript" src="assets/Board_Write.js"></script>


</head>
<body>
    <div class="board_wrap">
        
        
        
        <div class="board_title bigName">
            Guest board
        </div>

        <div class="board_view_wrap">
            
            <div class="board_view">

                <form id="frm" action="BoardWrite.do" method="post" enctype="multipart/form-data">
                <div class="title headline2">
                    <input type="text" id="title" name="title" class="col4" placeholder="여기에 제목을입력 해주세요">
                </div>

                <div class="info">
                    <div>
                        <div class="a1a headline3">번호</div>
                        <div class="a2a headline3">1</div>
                    </div>
                    <div>
                        <div class="a1a headline3">글쓴이</div>
                        <div class="container"> 
                        <input type="text" id="name" name="name" class="col" placeholder="여기에 아이디입력 해주세요"></div>
                    </div>
                    <div>
                        <div class="a1a headline3">비밀번호</div>
                        <div class="a2a2 headline3" >
                        <input type="text" id="pw" name="pw" class="col2" placeholder="여기에 비밀번호입력 해주세요">
                        </div>
                    </div>
                </div>
                
                <div class="page headline3" contenteditable="true">
                <textarea type="text" id="content" name="content" class="col3" placeholder="여기에 글을 써주세요">
                </textarea>
                    
                </div>
                <div class="filebox">
                    <label for="file">이미지를 넣어주세요</label> 
                    <input type="file" id="file" name="file">
                </div>


            </div>
            
            
            <div class="bt_wrap">
                <a href="GoBoard.do" class="on headline1 arp3">목록</a>
                <a onclick="return chk_form()" class="on2 headline1 arp3">작성</a>
            </div>
            
        </div>
    </div>
</body>
</html>