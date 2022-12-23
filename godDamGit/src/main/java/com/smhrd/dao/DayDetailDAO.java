package com.smhrd.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SessionManager;
import com.smhrd.entity.DamDTO;
import com.smhrd.entity.DayDetailDTO;

public class DayDetailDAO {
	SqlSessionFactory sqlSessionFactory=SessionManager.getSqlSessionFactory();	
	
	public DayDetailDTO selectlast(DamDTO dto){
		SqlSession session= sqlSessionFactory.openSession(true);
		DayDetailDTO day = session.selectOne("lastDay",dto);// 받아온 dto의 dam_name정보 사용
		session.close();
		return day;
		
	}
	public List<DayDetailDTO> selectdate(DayDetailDTO dto) {
		SqlSession session= sqlSessionFactory.openSession(true);
		List<DayDetailDTO> dateList = session.selectList("selectdate",dto);// 받아온 dto의 dam_name정보 사용
		session.close();
		return dateList; //1223(23~28) ajax 통신용 메서드 작성
	}

}
