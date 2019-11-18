package qna.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import qna.model.QnADAO;
import qna.model.QnAVO;

public class QEditFormAction  extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// 글번호 받기
		String num = req.getParameter("num_edit");
		
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
		System.out.println(qvo);
		
		req.setAttribute("myQAList", qvo);
		
/*		req.setAttribute("review", rvo);
		// 상품 번호는 세션 저장
		HttpSession ses = req.getSession();
		ses.setAttribute("pnum", new Integer(pnum));*/
		
		this.setRedirect(false);
		this.setViewPage("coffeam_editQ.jsp");
	}
}
