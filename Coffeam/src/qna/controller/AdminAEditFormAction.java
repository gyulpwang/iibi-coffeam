package qna.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import qna.model.QnADAO;
import qna.model.QnAVO;

public class AdminAEditFormAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// QnA번호 받기
		String num = req.getParameter("num_ansEdit");
		
		if(num==null){
			req.setAttribute("msg", "잘못 들어온 경로입니다.");
			String loc = "javascript:history.back()";
			req.setAttribute("loc", loc);
			this.setRedirect(false);
			this.setViewPage("memo/message.jsp");
			return;
		}// if----------
		
		// ReviewDAO의 해당 글번호 글 정보를 가져오는 메소드 호출
		QnADAO qdao =new QnADAO();
		QnAVO qvo = qdao.getMyQAList(Integer.parseInt(num));
		
		req.setAttribute("myQAList", qvo);

		
		this.setRedirect(false);
		this.setViewPage("coffeam_editA.jsp");
	}

}
