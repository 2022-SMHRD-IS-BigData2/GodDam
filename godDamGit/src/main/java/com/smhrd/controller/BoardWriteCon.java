package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.dao.BoardDAO;
import com.smhrd.entity.BoardDTO;

public class BoardWriteCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String savePath = request.getServletContext().getRealPath("images");
		
		// 최대 사이즈 : byte 단위
		int maxSize = 5*1024*1024; // 5메가 바이트
		
		// 인코딩 방식
		String encoding = "UTF-8";
		System.out.println(savePath);  // 테스트
		 
		
		// MultipartRequest 생성
		MultipartRequest multi = new MultipartRequest(
				request, 
				savePath,
				maxSize,
				encoding,
				new DefaultFileRenamePolicy()// 중복된 파일 이름을 변경
				
				);
				
				
		
		// 1. 데이터 가져오기
		// 제목/ 작성자/ 내용/ 이미지
		String book_title = multi.getParameter("title");
		String book_id = multi.getParameter("name");
		String book_content = multi.getParameter("content");
		String book_pw = multi.getParameter("pw");
		
		// 이미지 파일의 이름 가져오기
		// 이때, 파일 저장이 일어난다
		String book_img = multi.getFilesystemName("file");
		System.out.println(book_img); // 테스트
		
		// 2. DTO로 묶기
		BoardDTO dto = new BoardDTO();
		dto.setBook_id(book_id);
		dto.setBook_pw(book_pw);
		dto.setBook_title(book_title);
		dto.setBook_content(book_content);
		dto.setBook_img(book_img);
		
		System.out.println(book_title);
		
		// 3. DAO의 boardwrite사용
		BoardDAO dao = new BoardDAO();
		int cnt = dao.write(dto);
		
		// 4. 성공 실패 구분
		if (cnt > 0) {
			System.out.println("게시글 작성 성공");
		}else {
			System.out.println("게시글 작성 실패");
		}
	
		
		return "redirect:/GoBoard.do";
	}

}
