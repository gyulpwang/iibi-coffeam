package qna.controller;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import qna.model.QnADAO;
import qna.model.QnAVO;

public class AdminQnAAnswerAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// 1. 관리자가 입력한 값 받는다.
		String num = req.getParameter("num");
		String adminNo = req.getParameter("adminNo");
		String answer = req.getParameter("answer");
		String answerer = req.getParameter("answerer");
		
		//System.out.println(num+", "+answer+", "+answerer);
		
		// 2. 유효성 체크
		if(num==null || num.trim().isEmpty()){
			this.setViewPage("admin-qna-list.do");
			this.setRedirect(true);
			return;
		}
		// 3. QnAVO에 사용자가 입력한 값 담기
		QnAVO qvo = new QnAVO();
		qvo.setNum(Integer.parseInt(num));
		qvo.setAdminNo(Integer.parseInt(adminNo));
		qvo.setAnswer(answer);
		qvo.setAnswerer(answerer);

		// 4. QnADAO의 insertMemo(vo) 호출
		QnADAO qdao = new QnADAO();
		int n = qdao.editA(qvo);
		
		String ms = (n>0)? "답변 등록 성공" : "답변 등록 실패";
		String loc = (n>0)? "admin-qna-list.do" : "javascript:history.back()";
		
		// 5. 결과값들을 req에 저장
		req.setAttribute("msg", ms);
		req.setAttribute("loc", loc);
		
		// 6. 뷰페이지 지정 및 이동방식 지정
		this.setViewPage("../memo/message.jsp");
		this.setRedirect(false);
	}

}
