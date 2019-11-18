package freeboard.controller;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import common.controller.AbstractAction;
import freeboard.model.FreeBoardDAO;
import freeboard.model.FreeBoardVO;

public class FreeBoardEditFormAction extends AbstractAction{
	
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
		FreeBoardDAO fdao =new FreeBoardDAO();
		FreeBoardVO fvo = fdao.getMyFBList(Integer.parseInt(num));
		System.out.println(fvo);
		
		req.setAttribute("myFBList", fvo);
		
/*		req.setAttribute("review", rvo);
		// ��ǰ ��ȣ�� ���� ����
		HttpSession ses = req.getSession();
		ses.setAttribute("pnum", new Integer(pnum));*/
		
		this.setRedirect(false);
		this.setViewPage("coffeam_editPosting.jsp");
	}
}
