package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.dao.BoardDAO;
import com.smhrd.entity.BoardDTO;

public class PicList6Con implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		BoardDAO dao = new BoardDAO(); 
		List<BoardDTO> Boardlist6 = dao.BoardList6();
		
		
		// 1. 객체생성
		Gson gson=new Gson();
		// 2. 변환
		String json=gson.toJson(Boardlist6);
		
		out.print(json);
		return null;
	}

}
