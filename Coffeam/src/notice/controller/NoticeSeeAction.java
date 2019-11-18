package notice.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import notice.model.NoticeDAO;
import notice.model.NoticeVO;

public class NoticeSeeAction extends AbstractAction{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		/*// 1. �޼ҵ� ����� POST�� �ƴ϶�� history.back()
		String method = req.getMethod();
		if(!method.equalsIgnoreCase("POST")){
			req.setAttribute("msg", "�߸� ���� ����Դϴ�.");
			String loc = "javascript:history.back()";
			req.setAttribute("loc", loc);
			this.setRedirect(false);
			this.setViewPage("memo/message.jsp");
			return;
		}*/
		
		// 2. �Ķ���� ��(pnum, num) �޾ƿ���
		int num = Integer.parseInt(req.getParameter("num").trim());
		
		// 3. NoticeDAO�� getMyFBList(num) ȣ��
		NoticeDAO ndao = new NoticeDAO();
		NoticeVO nvo = ndao.getMyNTCList(num);
		req.setAttribute("nvo", nvo);
		
		// 4. �� ��� �޽��� ó�� �̵���� ����
		this.setRedirect(true);
		this.setViewPage("ntc-see.do");
	}
}
