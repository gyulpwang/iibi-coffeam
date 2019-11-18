package notice.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import notice.model.NoticeDAO;
import notice.model.NoticeVO;

public class AdminNoticeEditFormAction extends AbstractAction{
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// 글번호 받기
		String num = req.getParameter("num");
		
		if(num==null){
			req.setAttribute("msg", "잘못 들어온 경로입니다.");
			String loc = "javascript:history.back()";
			req.setAttribute("loc", loc);
			this.setRedirect(false);
			this.setViewPage("memo/message.jsp");
			return;
		}// if----------
		
		// ReviewDAO의 해당 글번호 글 정보를 가져오는 메소드 호출
		NoticeDAO ndao =new NoticeDAO();
		NoticeVO nvo = ndao.getMyNTCList(Integer.parseInt(num));
		
		req.setAttribute("myNTCList", nvo);

		this.setRedirect(false);
		this.setViewPage("coffeam_editNotice.jsp");
	}
}
