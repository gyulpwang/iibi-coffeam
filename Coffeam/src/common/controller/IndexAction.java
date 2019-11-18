package common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/* Sub Controller(�ϲ�)���� ��� AbstractAction �߻� Ŭ������ 
��ӹ޾� execute() �޼ҵ带 �������̵� �ؾ��Ѵ�. */
public class IndexAction extends AbstractAction{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println("IndexAction�� execute()..");
		req.setAttribute("msg", "Welcome to Coffeam");
		// �� ������ ����
		this.setViewPage("/coffeam_Home.jsp");
		this.setRedirect(false);	// forward ������� �̵�
	}
	
}
