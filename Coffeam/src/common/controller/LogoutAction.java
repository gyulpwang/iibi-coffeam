package common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import user.member.MemberDAO;
import user.member.MemberVO;

public class LogoutAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {	
		// ���� ���
		HttpSession ses=req.getSession();
		
		// ���� ��ȿȭ
		ses.invalidate();
		
		// Ȩ�������� redirect �̵�
		this.setRedirect(true);
		this.setViewPage(req.getContextPath()+"/index.do");
	}
}
