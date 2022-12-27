package com.smhrd.frontController;
//
import java.io.IOException;
import java.util.HashMap;

//
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.controller.BoardWriteCon;
//
import com.smhrd.controller.Controller;
import com.smhrd.controller.GoBoardCon;
import com.smhrd.controller.GoBoardEditCon;
import com.smhrd.controller.GoBoardViewCon;
import com.smhrd.controller.GoBoardWriteCon;
import com.smhrd.controller.GoMainCon;
import com.smhrd.controller.GoWindowCon;
import com.smhrd.controller.LastDamCon;
import com.smhrd.controller.MapDamCon;
import com.smhrd.controller.SelectDayCon;
//
@WebServlet("*.do") // .do로 끝나는 모든 요청을 받아온다.
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
//	
//	// HashMap : dict, key-value 
//	// HashMap<K,V>
//	// K : Key값의 자료형
//	// V : Value값의 자료형
//	
	private HashMap<String,Controller> handlerMapping;
//
	public void init(ServletConfig config) throws ServletException {
//		// Servlet은 요청을 받아야 객체 생성이 이루어진다
//		// Servlet이 생성될 때 실행되는 메서드
//		// 최대 한번 실행된다.
		System.out.println("Servlet 생성");
//		// 한번 실행 후 f5 눌러도 다시 실행되지 않는다.
//		
//		// 새로운 해시맵 생성
		handlerMapping = new HashMap<>();
		handlerMapping.put("/DamList.do",new MapDamCon());
		handlerMapping.put("/LastDam.do",new LastDamCon());
		handlerMapping.put("/SelectDay.do", new SelectDayCon());// 1223 우종빈, ajax통신용 해시맵 객체 추가
	
//		
//		// .put(Key,Value);
		handlerMapping.put("/goMain.do", new GoMainCon());
		handlerMapping.put("/goWindow.do", new GoWindowCon()); //1226 우종빈, windowChart 추가
//		handlerMapping.put("/goSuccess.go", new GosuccessCon());
//		handlerMapping.put("/goBoard.do", new GoBoardCon());
//		handlerMapping.put("/goWriteBoard.do", new GoWriterBoardCon());
//		handlerMapping.put("/goView.do", new GoViewCon());
//
		handlerMapping.put("/GoBoard.do", new GoBoardCon());
		handlerMapping.put("/GoEdit.do", new GoBoardEditCon());
		handlerMapping.put("/GoWrite.do", new GoBoardWriteCon());
		handlerMapping.put("/GoView.do", new GoBoardViewCon());

		handlerMapping.put("/GoBoard.do", new GoBoardCon());
		handlerMapping.put("/GoEdit.do", new GoBoardEditCon());
		handlerMapping.put("/GoWrite.do", new GoBoardWriteCon());
		handlerMapping.put("/GoView.do", new GoBoardViewCon());

		handlerMapping.put("/BoardWrite.do", new BoardWriteCon());

//		//===================
	}
//	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	//요청 구분하기
//		// 1. urlMapping 확인
//		// 전체주소 필요 : http://localhost:8083/FrontController/FrontController/join.do
		String uri=request.getRequestURI(); // = FrontController/join.do
		String cpath=request.getContextPath();//=FrontController
		String nextPage=null;
//		//Controller interface이용해서 업캐스팅!
//		//모든 con들을 담아줄수 있다.
		Controller con=null;
//		
//		// String.substring()=문자열이있을때
//		// "안녕하세요".substring(2)=인덱스2부터 뒤의문자열 전부 잘라오는기능
		String mapping=uri.substring(cpath.length()); // =UrlMapping : /join.do
		System.out.println(mapping);

//		// redirect 하는 경우, 앞에 redirect:/ 를 붙이기로 약속!
//		
//		// 요청에맞는 POJO꺼내서 con에 담아주기
		con=handlerMapping.get(mapping);
//		
		if(con!=null) {
		nextPage=con.execute(request,response);
//		
//		// 3. page 이동부분
		if(nextPage!=null) {
			if(nextPage.contains("redirect:/")) {
				// redirect 하는 경우, 앞에 redirect:/ 를 붙이기로 약속! -> spilt
				response.sendRedirect(nextPage.split(":/")[1]);
			}else {
				RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/"+nextPage+".jsp");
				rd.forward(request, response);
			}
			
		}
	
	}
	}

}
