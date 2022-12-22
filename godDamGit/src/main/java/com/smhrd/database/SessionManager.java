package com.smhrd.database;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SessionManager {
	// 필드로 선언
	// static : 프로그램이 시작하자 마자 메모리에 할당시켜두겠다
	// SqlSessionFactory : Connection들을 생성하고, 저장해 두는 객체
	private static SqlSessionFactory sqlSessionFactory;
	// DBCP 만들기!
	// {} : 초기화 블럭?
	// 항상 정해진시점:생성자가 사용된 직후에 실행된다.
	// new SessionManager() 다른곳에서 생성할때 초기화블럭안의 내용이 실행된다
	static {// static {} : static 초기화블럭 : static 변수들이 할당된 직후 : 프로그램이 시작하자마자!실행됨
		//즉 프로그램 시작하자마자 객체를 생성하는 역할
		try {
			String resource = "com/smhrd/database/config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	//getter/setter 만들기
	public static SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}
	public static void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		SessionManager.sqlSessionFactory = sqlSessionFactory;
	}
	

}
