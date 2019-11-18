package common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/* Sub Controller(일꾼)들은 모두 AbstractAction 추상 클래스를 
상속받아 execute() 메소드를 오버라이딩 해야한다. */
public class IndexAction extends AbstractAction{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println("IndexAction의 execute()..");
		req.setAttribute("msg", "Welcome to Coffeam");
		// 뷰 페이지 지정
		this.setViewPage("/coffeam_Home.jsp");
		this.setRedirect(false);	// forward 방식으로 이동
	}
	
}
