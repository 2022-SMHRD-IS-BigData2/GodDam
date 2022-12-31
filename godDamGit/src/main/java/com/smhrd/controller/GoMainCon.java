package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.BoardDAO;
import com.smhrd.dao.DamDAO;
import com.smhrd.dao.DayDetailDAO;
import com.smhrd.entity.BoardDTO;
import com.smhrd.entity.DamDTO;
import com.smhrd.entity.DayDetailDTO;

public class GoMainCon implements Controller{

	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		// DAO 객체 만들기

		// 1223 우종빈 data 통신 ajax로 변경하며 내부 내용 삭제함
		// main.jsp로 이동하는 코드 작성
		
		
		// 1229 메인페이지에 게시판 데이터 가져오기 일남
		
		BoardDAO dao = new BoardDAO(); 
		List<BoardDTO> Boardlist = dao.BoardList6();
		
		request.setAttribute("Boardlist6", Boardlist);
		
		return "main";

		
		
		
	}
	
	
	
}
