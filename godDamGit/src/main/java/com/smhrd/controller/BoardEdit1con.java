package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.BoardDAO;
import com.smhrd.entity.BoardDTO;

public class BoardEdit1con implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//데이터 수집
				int book_seq =1;
				
				System.out.println("오류1");
				String asd = request.getParameter("seq");
				if (asd != null) {
					book_seq = Integer.parseInt(asd);
				}
				
				System.out.println("오류2"+book_seq);
				
				// DAO
				BoardDAO dao = new BoardDAO();
				BoardDTO board = dao.BoardEditView(book_seq);
				
				// 객체 바인딩
				request.setAttribute("board1", board);
				
				System.out.println("오류3"+board);
				
				
				return "BoardEdit";

	}


}
