package common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import user.member.MemberDAO;
import user.member.MemberVO;

public class LogoutAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {	
		// 세션 얻기
		HttpSession ses=req.getSession();
		
		// 세션 무효화
		ses.invalidate();
		
		// 홈페이지로 redirect 이동
		this.setRedirect(true);
		this.setViewPage(req.getContextPath()+"/index.do");
	}
}
