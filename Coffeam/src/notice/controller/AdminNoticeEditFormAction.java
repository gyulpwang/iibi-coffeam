package notice.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import notice.model.NoticeDAO;
import notice.model.NoticeVO;

public class AdminNoticeEditFormAction extends AbstractAction{
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// �۹�ȣ �ޱ�
		String num = req.getParameter("num");
		
		if(num==null){
			req.setAttribute("msg", "�߸� ���� ����Դϴ�.");
			String loc = "javascript:history.back()";
			req.setAttribute("loc", loc);
			this.setRedirect(false);
			this.setViewPage("memo/message.jsp");
			return;
		}// if----------
		
		// ReviewDAO�� �ش� �۹�ȣ �� ������ �������� �޼ҵ� ȣ��
		NoticeDAO ndao =new NoticeDAO();
		NoticeVO nvo = ndao.getMyNTCList(Integer.parseInt(num));
		
		req.setAttribute("myNTCList", nvo);

		this.setRedirect(false);
		this.setViewPage("coffeam_editNotice.jsp");
	}
}
