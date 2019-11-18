package qna.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import qna.model.QnADAO;
import qna.model.QnAVO;

public class QEditFormAction  extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// �۹�ȣ �ޱ�
		String num = req.getParameter("num_edit");
		
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
		System.out.println(qvo);
		
		req.setAttribute("myQAList", qvo);
		
/*		req.setAttribute("review", rvo);
		// ��ǰ ��ȣ�� ���� ����
		HttpSession ses = req.getSession();
		ses.setAttribute("pnum", new Integer(pnum));*/
		
		this.setRedirect(false);
		this.setViewPage("coffeam_editQ.jsp");
	}
}
