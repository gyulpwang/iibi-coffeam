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
		// 1. �����ڰ� �Է��� �� �޴´�.
		String num = req.getParameter("num");
		String adminNo = req.getParameter("adminNo");
		String answer = req.getParameter("answer");
		String answerer = req.getParameter("answerer");
		
		//System.out.println(num+", "+answer+", "+answerer);
		
		// 2. ��ȿ�� üũ
		if(num==null || num.trim().isEmpty()){
			this.setViewPage("admin-qna-list.do");
			this.setRedirect(true);
			return;
		}
		// 3. QnAVO�� ����ڰ� �Է��� �� ���
		QnAVO qvo = new QnAVO();
		qvo.setNum(Integer.parseInt(num));
		qvo.setAdminNo(Integer.parseInt(adminNo));
		qvo.setAnswer(answer);
		qvo.setAnswerer(answerer);

		// 4. QnADAO�� insertMemo(vo) ȣ��
		QnADAO qdao = new QnADAO();
		int n = qdao.editA(qvo);
		
		String ms = (n>0)? "�亯 ��� ����" : "�亯 ��� ����";
		String loc = (n>0)? "admin-qna-list.do" : "javascript:history.back()";
		
		// 5. ��������� req�� ����
		req.setAttribute("msg", ms);
		req.setAttribute("loc", loc);
		
		// 6. �������� ���� �� �̵���� ����
		this.setViewPage("../memo/message.jsp");
		this.setRedirect(false);
	}

}
