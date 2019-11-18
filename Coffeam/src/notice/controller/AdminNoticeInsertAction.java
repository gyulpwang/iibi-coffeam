package notice.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.controller.AbstractAction;
import notice.model.NoticeDAO;
import notice.model.NoticeVO;


public class AdminNoticeInsertAction extends AbstractAction {
	private String upDir;
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// 1. �α��� ���� üũ
		
		// 2. ���ε��� ���丮�� ������ ���ϱ�
		// application.getRealPath("review/Upload");
		HttpSession ses = req.getSession();
		ServletContext app=ses.getServletContext();
		upDir = app.getRealPath("service/Upload");
		System.out.println("upDir="+upDir);
		
		// 3. ���ε� ������Ʈ ��� - MultipartRequest
		try{
			MultipartRequest mr = new MultipartRequest
				(req, upDir, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
			System.out.println("���� ���ε� ����!");
			
			// ÷������ ���
			String upfile = mr.getFilesystemName("upfile");
			System.out.println("upfile="+upfile);
			
			// 1. ����ڰ� �Է��� �� �޴´�.
			//String num = mr.getParameter("num");
			String adminNo = mr.getParameter("adminNo");
			String writer = mr.getParameter("writer");
			//String wdate = mr.getParameter("wdate");
			String title = mr.getParameter("title");
			String contents = mr.getParameter("contents");
			
			// 2. ��ȿ�� üũ
			if(adminNo==null || adminNo.trim().isEmpty()){
				this.setViewPage("coffeam_adminNotice.jsp");
				this.setRedirect(true);
				return;
			}
			
			// 3. NoticeVO�� ���
			NoticeVO nvo = new NoticeVO(0, Integer.parseInt(adminNo), writer, null, title, contents, upfile);
			
			// 4. NoticeDAO�� insertPosting(vo) ȣ��
			NoticeDAO ndao = new NoticeDAO();
			int n = ndao.insertNotice(nvo);
			
			String ms = (n>0)? "��� ����" : "��� ����";
			String loc = (n>0)? "admin-ntc-list.do" : "javascript:history.back()";
			System.out.println(ms);
			// 5. ��������� req�� ����
			req.setAttribute("msg", ms);
			req.setAttribute("loc", loc);
			
			// 6. �������� ���� �� �̵���� ����
			this.setViewPage("admin-ntc-list.do");
			this.setRedirect(false);
		}catch(IOException e){
			System.out.println("���� ���ε� ����!");
			req.setAttribute("msg", "���Ͼ��ε� ���� : "+e.getMessage());
			String loc ="javascript:history.back()";
			req.setAttribute("loc", loc);
			this.setRedirect(false);
			this.setViewPage("coffeam_writeNotice.jsp");
		}
	}
}
