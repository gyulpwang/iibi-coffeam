package common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.member.MemberDAO;
import user.member.MemberVO;

public class LoginAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		//req.setAttribute("msg", "로그인을 하세요.");
		this.setViewPage("/login/login.jsp");
		this.setRedirect(false);
	}
}
