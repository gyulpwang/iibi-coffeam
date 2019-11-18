package common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.member.MemberDAO;
import user.member.MemberVO;
import user.member.NotMemberException;

public class LoginEndAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// 1. 아이디, 비번 받기
		String userid=req.getParameter("userid");
		String pwd=req.getParameter("pwd");
		String saveUid=req.getParameter("saveUid");
		if(userid == null || pwd==null || userid.trim().isEmpty() || pwd.trim().isEmpty()){
			this.setRedirect(true);
			this.setViewPage(req.getContextPath()+"/index.do");
			return;
		}
		
		MemberDAO dao=new MemberDAO();
		try{
			MemberVO loginUser=dao.loginCheck(userid.trim(), pwd.trim());
			if(loginUser != null){	// 회원이 맞다면
				HttpSession ses= req.getSession();
				ses.setAttribute("loginUser", loginUser);
				this.setRedirect(true);
				/* 세션에 저장된 returnPage가 있는지 체크.
				없다면 index.do로 보내고 있으면 해당 페이지로 보낸다. */
				String returnPage=(String)ses.getAttribute("returnPage");
				if(returnPage==null){
					this.setViewPage(req.getContextPath()+"/index.do");
				}else{
					this.setViewPage(returnPage);
				}
			}
		}catch(NotMemberException e){
			req.setAttribute("msg", e.getMessage());
			String loc = "javascript:history.back()";
			req.setAttribute("loc", loc);
			this.setRedirect(false);
			this.setViewPage("memo/message.jsp");
			return;
		}
	}

}
