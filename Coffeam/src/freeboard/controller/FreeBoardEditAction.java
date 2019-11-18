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

public class FreeBoardEditAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// ���ε� ���丮 ������ ���
		HttpSession ses = req.getSession();
		ServletContext app = ses.getServletContext();
		
		String upDir = app.getRealPath("/Upload");
		File dir = new File(upDir);
		if(!dir.exists()){
			dir.mkdirs();
		}
		
		// ���� ÷�ΰ� �ִٸ� ���ε�
		MultipartRequest mr = 
			new MultipartRequest(req, upDir, 10*1024*1024, "UTF-8", 
					new DefaultFileRenamePolicy());
		
		String num = mr.getParameter("num");
		String title = mr.getParameter("title");
		String contents = mr.getParameter("contents");
		String upfile = mr.getFilesystemName("upfile");
		
		if(upfile==null){
			// ���ε� ���� �ʾҴٸ� ���� ���ϸ�����
			upfile=mr.getParameter("old_filename");
		}
		else{
			String old_filename=mr.getParameter("old_filename");
			// ���� ���ε� �ߴٸ� �������� ���� ���� ����
			if(old_filename != null && !old_filename.isEmpty()){
				File delFile = new File(upDir+"/"+old_filename);
				if(delFile != null){
					boolean isDel = delFile.delete();
					System.out.println("���� ���� ���� : "+isDel);
				}
			}
		}
		
		FreeBoardVO fvo = new FreeBoardVO();
		fvo.setNum(Integer.parseInt(num));
		fvo.setTitle(title);
		fvo.setContents(contents);
		fvo.setUpfile(upfile);
		
		FreeBoardDAO dao = new FreeBoardDAO();
		int n = dao.updatePosting(fvo);
		
		String msg = (n>0)?"���� ����" : "���� ����";
		String loc = (n>0)?"fb-list.do":"javascript:history.back()";
		
		req.setAttribute("msg", msg);
		req.setAttribute("loc", loc);
		this.setRedirect(false);
		this.setViewPage("fb-list.do");
		
		// ������ ���ε� �ߴ� ������ �������� ����
	}
}
