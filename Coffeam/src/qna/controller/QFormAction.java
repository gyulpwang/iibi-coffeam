package qna.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;

public class QFormAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

		// �����Խ��� �� ��� ���� �����ش�.
		
		// 1. �������� ����
		this.setViewPage("/service/coffeam_writeQ.jsp");
		
		// 2. �̵���� forward ������� ����
		this.setRedirect(false);
	}

}