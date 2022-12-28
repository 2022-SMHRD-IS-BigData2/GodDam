<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="com.smhrd.dao.GuestCountDAO"%>
<%@page import="com.smhrd.entity.GuestCountDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%		GuestCountDTO dto=new GuestCountDTO();
GuestCountDAO dao=new GuestCountDAO();

if(session.isNew()) {
	dao.newsession();
}else{
	System.out.println("아니네");
}

Date now=new Date();
System.out.println(now);


List<GuestCountDTO> ttlday=dao.ttlcount();

System.out.println(ttlday.size());
List<GuestCountDTO> today=dao.daycount();

session.setAttribute("today", today.size());
session.setAttribute("ttlday", ttlday.size());
 %>
	<h1>hello</h1>
	
	<!-- 
	http://localhost:8083/FrontController/
	기본경로 url로 요청했을때 보여지는 페이지 >> Welcome Page라고 한다
	
	단, 파일이 webapp 아래에 있어야함.
	이름이 반드시 index.jsp여야 함.
	다들 이미 설정되어있기때문에 지켜줘야한다.
	
	jsp:forward 커스텀태그,
	jsp 액션태그중 forward 사용! page 속에 이동할 페이지 작성 
	 -->
	<jsp:forward page="goMain.do"></jsp:forward>

</body>
</html>