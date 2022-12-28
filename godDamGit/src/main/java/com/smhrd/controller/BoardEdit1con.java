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
				int rnum =1;
				
				System.out.println("오류1");
				
				String asd = request.getParameter("num");
				if (asd != null) {
					rnum = Integer.parseInt(asd);
				}
				
				System.out.println("오류2"+rnum);
				
				// DAO
				BoardDAO dao = new BoardDAO();
				BoardDTO board = dao.BoardEditView(rnum);
				
				// 객체 바인딩
				request.setAttribute("board1", board);
				
				System.out.println("오류3"+board);
				
				
				return "BoardEdit";

	}


}
