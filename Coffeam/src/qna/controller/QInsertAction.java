package qna.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import qna.model.QnADAO;
import qna.model.QnAVO;

public class QInsertAction extends AbstractAction {
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// 1. 사용자가 입력한 값 받는다.
		String idx = req.getParameter("idx");
		String title = req.getParameter("title");
		String writer = req.getParameter("writer");
		String contents = req.getParameter("contents");
		
		// 2. 유효성 체크
		if(idx==null || idx.trim().isEmpty()){
			this.setViewPage("qna-list.do");
			this.setRedirect(true);
			return;
		}
		
		// 3. QnAVO에 사용자가 입력한 값 담기
		//num, idx, title, writer, contents, wdate, adminNo, yn, answer, answerer
		/*QnAVO qvo = new QnAVO(0, Integer.parseInt(idx), title, writer, contents, null, 0, "n", null, null);*/
		QnAVO qvo = new QnAVO();
		qvo.setIdx(Integer.parseInt(idx));
		qvo.setTitle(title);
		qvo.setWriter(writer);
		qvo.setContents(contents);
		
		// 4. QnADAO의 insertQnA(qvo) 호출
		QnADAO qdao = new QnADAO();
		int n = qdao.insertQnA(qvo);
		
		String ms = (n>0)? " 질문 등록 성공" : "질문 등록 실패";
		String loc = (n>0)? "qna-list.do" : "javascript:history.back()";
		
		// 5. 결과값들을 req에 저장
		req.setAttribute("msg", ms);
		req.setAttribute("loc", loc);
		
		// 6. 뷰페이지 지정 및 이동방식 지정
		this.setViewPage("../memo/message.jsp");
		this.setRedirect(false);
	}
}
