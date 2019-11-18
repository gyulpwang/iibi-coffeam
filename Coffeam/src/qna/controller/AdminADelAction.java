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
		// 1. �޼ҵ� ����� POST�� �ƴ϶�� history.back()
		String method = req.getMethod();
		if(!method.equalsIgnoreCase("POST")){
			req.setAttribute("msg", "�߸� ���� ����Դϴ�.");
			String loc = "javascript:history.back()";
			req.setAttribute("loc", loc);
			this.setRedirect(false);
			this.setViewPage("memo/message.jsp");
			return;
		}
		
		// 2. �Ķ���� ��(num) �޾ƿ���
		String num_ansDel = req.getParameter("num_ansDel").trim();

		// 3. FreeBoardDAO�� deletePosting(num) ȣ��
		QnADAO qdao = new QnADAO();
		int n = qdao.deleteA(Integer.parseInt(num_ansDel));
		
		String msg = (n>0)?"���� ����" : "���� ����";
		String loc = (n>0)?"admin-qna-list.do":"javascript:history.back()";
		
		req.setAttribute("msg", msg);
		req.setAttribute("loc", loc);
		this.setRedirect(false);
		this.setViewPage("admin-qna-list.do");
	}
}
