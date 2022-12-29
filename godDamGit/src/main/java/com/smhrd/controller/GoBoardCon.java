package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.BoardDAO;
import com.smhrd.entity.BoardDTO;

public class GoBoardCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int page = 1;
		String asd = request.getParameter("page");
	

		if (asd != null) {
			page = Integer.parseInt(asd);
		}
		
		BoardDAO dao = new BoardDAO();
		
		List<BoardDTO> list = dao.list(page);
		int num = dao.boardCount();
		
		request.setAttribute("cnt", num);
		// 객체 바인딩
		request.setAttribute("list", list);
		
		request.setAttribute("page", page);
		
		
		
		
		
		// TODO Auto-generated method stub
		return "Board";
	}

}
