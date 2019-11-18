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
		// 글번호 받기
		String num = req.getParameter("num");
		
		if(num==null){
			req.setAttribute("msg", "잘못 들어온 경로입니다.");
			String loc = "javascript:history.back()";
			req.setAttribute("loc", loc);
			this.setRedirect(false);
			this.setViewPage("memo/message.jsp");
			return;
		}// if----------
		
		// ReviewDAO의 해당 글번호 글 정보를 가져오는 메소드 호출
		FreeBoardDAO fdao =new FreeBoardDAO();
		FreeBoardVO fvo = fdao.getMyFBList(Integer.parseInt(num));
		System.out.println(fvo);
		
		req.setAttribute("myFBList", fvo);
		
/*		req.setAttribute("review", rvo);
		// 상품 번호는 세션 저장
		HttpSession ses = req.getSession();
		ses.setAttribute("pnum", new Integer(pnum));*/
		
		this.setRedirect(false);
		this.setViewPage("coffeam_editPosting.jsp");
	}
}
