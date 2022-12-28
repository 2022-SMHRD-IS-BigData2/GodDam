package com.smhrd.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SessionManager;
import com.smhrd.entity.GuestCountDTO;

public class GuestCountDAO {
	SqlSessionFactory sqlSessionFactory=SessionManager.getSqlSessionFactory();
	
	public int newsession() {
		SqlSession session= sqlSessionFactory.openSession(true);
		int cnt=session.insert("newsession");
		session.close();
		return cnt;
		}
	
	public List<GuestCountDTO> daycount() {
		SqlSession session= sqlSessionFactory.openSession(true);
		List<GuestCountDTO> cnt=session.selectList("daycount");
		session.close();
		return cnt;
	}
	public List<GuestCountDTO> ttlcount() {
		SqlSession session= sqlSessionFactory.openSession(true);
		List<GuestCountDTO> cnt=session.selectList("ttlcount");
		session.close();
		return cnt;
	}
	

}
