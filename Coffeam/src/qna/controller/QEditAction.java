package qna.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import qna.model.QnADAO;
import qna.model.QnAVO;

public class QEditAction  extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// 1. �����ڰ� �Է��� �� �޴´�.
		String num = req.getParameter("num");
		String idx = req.getParameter("idx");
		String writer = req.getParameter("writer");
		String title = req.getParameter("title");
		String contents = req.getParameter("contents");
		
		System.out.println("num = "+req.getParameter("num"));
		
		// 2. ��ȿ�� üũ
		if(num==null || num.trim().isEmpty()){
			this.setViewPage("qna-list.do");
			this.setRedirect(true);
			return;
		}
		// 3. QnAVO�� ����ڰ� �Է��� �� ���
		QnAVO qvo = new QnAVO();
		qvo.setNum(Integer.parseInt(num));
		qvo.setIdx(Integer.parseInt(idx));
		qvo.setWriter(writer);
		qvo.setTitle(title);
		qvo.setContents(contents);

		// 4. QnADAO�� editQ(vo) ȣ��
		QnADAO qdao = new QnADAO();
		int n = qdao.editQ(qvo);
		
		String ms = (n>0)? "���� ���� ����" : "���� ���� ����";
		String loc = (n>0)? "qna-list.do" : "javascript:history.back()";
		
		// 5. ��������� req�� ����
		req.setAttribute("msg", ms);
		req.setAttribute("loc", loc);
		
		// 6. �������� ���� �� �̵���� ����
		this.setViewPage("../memo/message.jsp");
		this.setRedirect(false);
	}

}
