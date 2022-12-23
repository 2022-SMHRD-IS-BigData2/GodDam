package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.dao.DamDAO;
import com.smhrd.dao.DayDetailDAO;
import com.smhrd.entity.DamDTO;
import com.smhrd.entity.DayDetailDTO;

public class SelectDayCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		DayDetailDAO dao2 =new DayDetailDAO();
		String dam_name=request.getParameter("damName");
		String startDate=request.getParameter("startDate");
		String endDate=request.getParameter("endDate");
		System.out.println(dam_name);
		System.out.println(startDate);
		System.out.println(endDate);
		
		DayDetailDTO dto=new DayDetailDTO();
		dto.setDam_name(dam_name);
		dto.setStartDate(startDate);
		dto.setEndDate(endDate);
		
		List<DayDetailDTO> selectList=dao2.selectdate(dto);
		// 1. 객체생성
		Gson gson=new Gson();
		// 2. 변환
		String json=gson.toJson(selectList);
		
		out.print(json);
		
		return null;
	}

}
