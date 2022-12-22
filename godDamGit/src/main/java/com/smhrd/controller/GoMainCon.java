package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.dao.DamDAO;
import com.smhrd.dao.DayDetailDAO;
import com.smhrd.entity.DamDTO;
import com.smhrd.entity.DayDetailDTO;

public class GoMainCon implements Controller{

	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		// DAO 객체 만들기
		DamDAO dao=new DamDAO();
		DayDetailDAO dao2 =new DayDetailDAO();
		
		// tb_dam에서 데이터 받아오기 및 request에 저장하기
		List<DamDTO> damList=dao.damList();
		request.setAttribute("damList",damList );
		
		// damList에 받아온 tb_dam의 dam_name 이용해서 모든 댐의 최근 정보 가져오기
		// -lastList라는 List 선언 후 더해주는 방법으로 가져오기
		List<DayDetailDTO> lastList =new ArrayList<>();
		for(int i=0;i<damList.size();i++) {
			lastList.add(dao2.selectlast(damList.get(i)));//damList는 댐의 정보중 하나로 DamDTO 객체다
		}
		
		// request에 lastList 집어넣기
		request.setAttribute("lastList", lastList);
		
		
		// main.jsp로 이동하는 코드 작성
		return "main";

		
		
		
	}
	
	
	
}
