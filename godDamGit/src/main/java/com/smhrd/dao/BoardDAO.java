package com.smhrd.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SessionManager;
import com.smhrd.entity.BoardDTO;

public class BoardDAO {
	SqlSessionFactory sqlSessionFactory=SessionManager.getSqlSessionFactory();
	
		public List<BoardDTO> list (int page) {
		
		SqlSession session =  sqlSessionFactory.openSession(true); // true 오토커밋
		List<BoardDTO> result = session.selectList("List", page);

		session.close();
		return result;
		
		}
	
		
		
	
}