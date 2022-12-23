package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.dao.DamDAO;
import com.smhrd.dao.DayDetailDAO;
import com.smhrd.entity.DamDTO;
import com.smhrd.entity.DayDetailDTO;

public class LastDamCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("요청받음");
		String num =request.getParameter("num");
		
		// ajax에 응답시 out 객체 사용!
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out=response.getWriter();
//		String json="{\"key\":\"value\", \"key2\":\"value2\"}";
		
		DamDAO dao = new DamDAO();
		DayDetailDAO dao2 =new DayDetailDAO();
		List<DamDTO> damList=dao.damList();
		List<DayDetailDTO> lastList =new ArrayList<>();
		for(int i=0;i<damList.size();i++) {
			lastList.add(dao2.selectlast(damList.get(i)));//damList는 댐의 정보중 하나로 DamDTO 객체다
		}

		// 1. 객체생성
		Gson gson=new Gson();
		// 2. 변환
		String json=gson.toJson(lastList);
		
		out.print(json);
//		out.print(damList);
		
		// ajax요청 처리시 return은 null 그대로 유지해야한다!
		
		
		
		
		return null;
	}

}
