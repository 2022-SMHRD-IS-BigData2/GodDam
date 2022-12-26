<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 정보 조회</title>
</head>
<body>
<%
String dam_name=request.getParameter("dam_name");
String dam_namekor=request.getParameter("dam_namekor");
LocalDate today=LocalDate.now();%>

<strong style="display: block;
    width: 100%;
    height: 2.845em;
    line-height: 2.845em;
    background-color: #005DB7;
    border-radius: 0.5em 0.5em 0 0;
    text-align: center;
    font-size: 1.5em;
    font-weight: 500;
    color: #fff;"><%=dam_namekor%> 상세 정보</strong>
<input readonly id="damNamewin" type="text" value=<%=dam_name%>>
<input type="date" id="startDate" value=<%=today.minusMonths(6)%>>
<input type="date" id="endDate" value=<%=today%>>
<input type="submit" id="submitwin">

<div style="position: relative;
    overflow: hidden;
    width: 100%;
    height: 250px;
    text-align: center;
    line-height: normal;
    z-index: 0;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    user-select: none;
    touch-action: manipulation;
    outline: none;" id="chartWinContainner"></div>
    
    <div style="overflow: auto;
    max-height: 13.3em;
    border: 1px solid #D2D2D2;
    border-radius: 0.2em;
    box-sizing: border-box;" id="tableContainner"></div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript" src="./assets/window.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chart.js@4.0.1/dist/chart.umd.min.js"></script>
</body>
</html>