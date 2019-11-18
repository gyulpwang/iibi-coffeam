package qna.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import qna.model.QnADAO;
import qna.model.QnAVO;

public class QEditAction  extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// 1. 관리자가 입력한 값 받는다.
		String num = req.getParameter("num");
		String idx = req.getParameter("idx");
		String writer = req.getParameter("writer");
		String title = req.getParameter("title");
		String contents = req.getParameter("contents");
		
		System.out.println("num = "+req.getParameter("num"));
		
		// 2. 유효성 체크
		if(num==null || num.trim().isEmpty()){
			this.setViewPage("qna-list.do");
			this.setRedirect(true);
			return;
		}
		// 3. QnAVO에 사용자가 입력한 값 담기
		QnAVO qvo = new QnAVO();
		qvo.setNum(Integer.parseInt(num));
		qvo.setIdx(Integer.parseInt(idx));
		qvo.setWriter(writer);
		qvo.setTitle(title);
		qvo.setContents(contents);

		// 4. QnADAO의 editQ(vo) 호출
		QnADAO qdao = new QnADAO();
		int n = qdao.editQ(qvo);
		
		String ms = (n>0)? "질문 수정 성공" : "질문 수정 실패";
		String loc = (n>0)? "qna-list.do" : "javascript:history.back()";
		
		// 5. 결과값들을 req에 저장
		req.setAttribute("msg", ms);
		req.setAttribute("loc", loc);
		
		// 6. 뷰페이지 지정 및 이동방식 지정
		this.setViewPage("../memo/message.jsp");
		this.setRedirect(false);
	}

}
