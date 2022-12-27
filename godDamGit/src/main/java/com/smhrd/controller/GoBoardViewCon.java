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
		// TODO Auto-generated method stub
		
		int book_seq = Integer.parseInt(request.getParameter("book_seq"));
		
		/*
		 * BoardDAO dao = new BoardDAO(); BoardDTO board = dao.list(page);
		 */
		
		// 객체 바인딩
		/*
		 * request.setAttribute("board", board);
		 */		
		
		
		
		
		return "BoardView";
		
		
	}

}
