package qna.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import notice.model.NoticeDAO;
import notice.model.NoticeVO;
import qna.model.QnADAO;
import qna.model.QnAVO;

public class AdminADelAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// 1. 메소드 방식이 POST가 아니라면 history.back()
		String method = req.getMethod();
		if(!method.equalsIgnoreCase("POST")){
			req.setAttribute("msg", "잘못 들어온 경로입니다.");
			String loc = "javascript:history.back()";
			req.setAttribute("loc", loc);
			this.setRedirect(false);
			this.setViewPage("memo/message.jsp");
			return;
		}
		
		// 2. 파라미터 값(num) 받아오기
		String num_ansDel = req.getParameter("num_ansDel").trim();

		// 3. FreeBoardDAO의 deletePosting(num) 호출
		QnADAO qdao = new QnADAO();
		int n = qdao.deleteA(Integer.parseInt(num_ansDel));
		
		String msg = (n>0)?"삭제 성공" : "삭제 실패";
		String loc = (n>0)?"admin-qna-list.do":"javascript:history.back()";
		
		req.setAttribute("msg", msg);
		req.setAttribute("loc", loc);
		this.setRedirect(false);
		this.setViewPage("admin-qna-list.do");
	}
}
