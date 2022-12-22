package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.dao.DamDAO;
import com.smhrd.entity.DamDTO;

public class MapDamCon implements Controller {

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
		List<DamDTO> damList=dao.damList();
		
		// java Object -> json
		// 메이븐->GSON 2.8.9 받아오기
		
		// 1. 객체생성
		Gson gson=new Gson();
		// 2. 변환
		String json=gson.toJson(damList);
		
		out.print(json);
//		out.print(damList);
		
		// ajax요청 처리시 return은 null 그대로 유지해야한다!
		return null;
		
		
		
	
	}

}
