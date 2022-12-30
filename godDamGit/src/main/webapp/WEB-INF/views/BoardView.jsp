<%@page import="com.smhrd.entity.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link rel="stylesheet" href="assets/BoardView.css">

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
<% BoardDTO board = (BoardDTO)request.getAttribute("num"); %>
    <div class="board_wrap">
        
        <div class="board_title bigName">
            Guest board
        </div>

        <div class="board_view_wrap">
            
            <div class="board_view">
                <div class="title headline2">
                    <%= board.getBook_title() %>
                </div>
                
                <div class="info">
                    <div>
                        <div class="a1a headline3">번호</div>
                        <div class="a2a headline3"><%= board.getBook_seq() %></div>
                    </div>
                    <div>
                        <div class="a1a headline3">글쓴이</div>
                        <div class="a2a headline3"><%= board.getBook_id() %></div>
                    </div>
                    <div>
                        <div class="a1a headline3">작성일</div>
                        <div class="a2a headline3"><%= board.getBook_rdate() %></div>
                    </div>
                    <div>
                        <div class="a1a headline3">조회</div>
                        <div class="a2a2 headline3"><%= board.getBook_cnt() %></div>
                    </div>
                </div>
                
                <div class="page headline3">
                    <img src="images/<%= board.getBook_img() %>" alt="이미지가 없습니다" class="left_img">
                    <div class="spacing"></div>
					<%= board.getBook_content() %>
                </div>
            </div>
            
            
            <div class="bt_wrap">
                <a href="GoBoard.do" class="on headline1 arp3">목록</a>
                <a href="BoardEdit.do?seq=<%=board.getBook_seq()%>&img=<%=board.getBook_img()%>" class="on2 headline1 arp3">수정</a>
            </div>

            
        </div>
    </div>
</body>
</html>