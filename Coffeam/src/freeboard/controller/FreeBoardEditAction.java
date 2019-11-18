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
		// 업로드 디렉토리 절대경로 얻기
		HttpSession ses = req.getSession();
		ServletContext app = ses.getServletContext();
		
		String upDir = app.getRealPath("/Upload");
		File dir = new File(upDir);
		if(!dir.exists()){
			dir.mkdirs();
		}
		
		// 파일 첨부가 있다면 업로드
		MultipartRequest mr = 
			new MultipartRequest(req, upDir, 10*1024*1024, "UTF-8", 
					new DefaultFileRenamePolicy());
		
		String num = mr.getParameter("num");
		String title = mr.getParameter("title");
		String contents = mr.getParameter("contents");
		String upfile = mr.getFilesystemName("upfile");
		
		if(upfile==null){
			// 업로드 하지 않았다면 기존 파일명으로
			upfile=mr.getParameter("old_filename");
		}
		else{
			String old_filename=mr.getParameter("old_filename");
			// 새로 업로드 했다면 서버에서 기존 파일 삭제
			if(old_filename != null && !old_filename.isEmpty()){
				File delFile = new File(upDir+"/"+old_filename);
				if(delFile != null){
					boolean isDel = delFile.delete();
					System.out.println("파일 삭제 여부 : "+isDel);
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
		
		String msg = (n>0)?"수정 성공" : "수정 실패";
		String loc = (n>0)?"fb-list.do":"javascript:history.back()";
		
		req.setAttribute("msg", msg);
		req.setAttribute("loc", loc);
		this.setRedirect(false);
		this.setViewPage("fb-list.do");
		
		// 기존에 업로드 했던 파일은 서버에서 삭제
	}
}
