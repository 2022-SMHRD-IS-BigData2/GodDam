package com.smhrd.controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GoWindowCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
        LocalDate now = LocalDate.now();
        String dam_namewin=request.getParameter("dam_namewin");
        
        
        // 연도, 월(문자열, 숫자), 일, 일(year 기준), 요일(문자열, 숫자)
        request.setAttribute("nowDate", now);
		
		return "windowMain";
	}

}
