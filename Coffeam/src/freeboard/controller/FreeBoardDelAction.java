package freeboard.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import common.controller.AbstractAction;
import freeboard.model.FreeBoardDAO;

public class FreeBoardDelAction extends AbstractAction {

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
		
		// 2. �Ķ���� ��(pnum, num) �޾ƿ���
		int num = Integer.parseInt(req.getParameter("num").trim());
		
		// 3. FreeBoardDAO�� deletePosting(num) ȣ��
		FreeBoardDAO fdao = new FreeBoardDAO();
		fdao.deletePosting(num);
		
		// 4. �� ��� �޽��� ó�� �̵���� ����
		this.setRedirect(true);
		this.setViewPage("fb-list.do");
	}
}
