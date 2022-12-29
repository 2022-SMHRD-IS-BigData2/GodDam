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
	
		
		
		public int write (BoardDTO dto) {
			
			SqlSession session = sqlSessionFactory.openSession(true);
			int result = session.insert("BoardWrite", dto);
			
			session.close();
			return result;
		}
		
		public BoardDTO boardView(int rnum) {
	         
	         SqlSession session = sqlSessionFactory.openSession( true );
	         BoardDTO board = session.selectOne("BoardView", rnum);
	         
	         session.close();
	         return board;
	      }
		
		
		
		public BoardDTO BoardEditView (int num) {
			
			SqlSession session = sqlSessionFactory.openSession(true);
			BoardDTO result = session.selectOne("BoardEditView", num);
			
			session.close();
			return result;
			
		}
		
		public int boardCount() {
			SqlSession session =  sqlSessionFactory.openSession(true); // true 오토커밋
			int result = session.selectOne("BoardCount");

			session.close();
			return result;
		}
		
		
		public int BoardEditUpdate (BoardDTO dto) {
			
			SqlSession session = sqlSessionFactory.openSession(true);
			int result = session.insert("BoardUpdate", dto);
			
			session.close();
			return result;
		}
}
