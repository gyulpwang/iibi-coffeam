package notice.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;

public class NoticeFormAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

		// �����Խ��� �� ��� ���� �����ش�.
		
		// 1. �������� ����
		this.setViewPage("/service/coffeam_writeNotice.jsp");
		
		// 2. �̵���� forward ������� ����
		this.setRedirect(false);
	}

}
