package com.smhrd.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SessionManager;
import com.smhrd.entity.DamDTO;


public class DamDAO {
	SqlSessionFactory sqlSessionFactory=SessionManager.getSqlSessionFactory();

	public List<DamDTO> damList() {
		SqlSession session= sqlSessionFactory.openSession(true);
		List<DamDTO> damList= session.selectList("damList");
		session.close();
		return damList;
	}

}
