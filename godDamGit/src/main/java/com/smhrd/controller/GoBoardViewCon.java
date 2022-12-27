package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.BoardDAO;
import com.smhrd.entity.BoardDTO;

public class GoBoardViewCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int rnum = 1;
		String snum = request.getParameter("rnum");
		
		if (snum != null) {
			rnum = Integer.parseInt(snum);
		}
		
		BoardDAO dao = new BoardDAO(); 
		BoardDTO num = dao.boardView(rnum);

		request.setAttribute("num", num);
		 	
		return "BoardView";
		
		
	}

}
