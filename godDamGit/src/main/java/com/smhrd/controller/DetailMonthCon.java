package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.dao.DayDetailDAO;
import com.smhrd.dao.MonthDetailDAO;
import com.smhrd.entity.MonthDetailDTO;

public class DetailMonthCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		MonthDetailDAO dao2 =new MonthDetailDAO();
		String dam_name=request.getParameter("damName");
		String startDate=request.getParameter("startDate");
		
		MonthDetailDTO dto=new MonthDetailDTO();
		dto.setDam_name(dam_name);
		dto.setStartDate(startDate);
		
		MonthDetailDTO selectdetail=dao2.detailmonth(dto);
		// 1. 객체생성
		Gson gson=new Gson();
		// 2. 변환
		String json=gson.toJson(selectdetail);
		
		out.print(json);
		
		
		return null;
	}

}
