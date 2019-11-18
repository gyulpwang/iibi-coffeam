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

public class FreeBoardSeeAction extends AbstractAction{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		/*// 1. 메소드 방식이 POST가 아니라면 history.back()
		String method = req.getMethod();
		if(!method.equalsIgnoreCase("POST")){
			req.setAttribute("msg", "잘못 들어온 경로입니다.");
			String loc = "javascript:history.back()";
			req.setAttribute("loc", loc);
			this.setRedirect(false);
			this.setViewPage("memo/message.jsp");
			return;
		}*/
		
		// 2. 파라미터 값(pnum, num) 받아오기
		int num = Integer.parseInt(req.getParameter("num").trim());
		
		// 3. FreeBoardDAO의 getMyFBList(num) 호출
		FreeBoardDAO fdao = new FreeBoardDAO();
		FreeBoardVO fvo = fdao.getMyFBList(num);
		req.setAttribute("fvo", fvo);
		
		// 4. 그 결과 메시지 처리 이동경로 지정
		this.setRedirect(true);
		this.setViewPage("fb-see.do");
	}
}
