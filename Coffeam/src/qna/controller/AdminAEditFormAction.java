package qna.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import qna.model.QnADAO;
import qna.model.QnAVO;

public class AdminAEditFormAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// QnA��ȣ �ޱ�
		String num = req.getParameter("num_ansEdit");
		
		if(num==null){
			req.setAttribute("msg", "�߸� ���� ����Դϴ�.");
			String loc = "javascript:history.back()";
			req.setAttribute("loc", loc);
			this.setRedirect(false);
			this.setViewPage("memo/message.jsp");
			return;
		}// if----------
		
		// ReviewDAO�� �ش� �۹�ȣ �� ������ �������� �޼ҵ� ȣ��
		QnADAO qdao =new QnADAO();
		QnAVO qvo = qdao.getMyQAList(Integer.parseInt(num));
		
		req.setAttribute("myQAList", qvo);

		
		this.setRedirect(false);
		this.setViewPage("coffeam_editA.jsp");
	}

}
