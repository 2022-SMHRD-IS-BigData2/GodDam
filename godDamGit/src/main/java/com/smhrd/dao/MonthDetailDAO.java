package com.smhrd.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SessionManager;
import com.smhrd.entity.MonthDetailDTO;

public class MonthDetailDAO {
	SqlSessionFactory sqlSessionFactory=SessionManager.getSqlSessionFactory();
	
	public MonthDetailDTO detailmonth(MonthDetailDTO dto) {
		SqlSession session= sqlSessionFactory.openSession(true);
		MonthDetailDTO month = session.selectOne("detailmonth",dto);// 받아온 dto의 dam_name정보 사용
		session.close();
		return month; //1223(23~28) ajax 통신용 메서드 작성
	}

}
