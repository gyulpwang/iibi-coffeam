package notice.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import notice.model.NoticeDAO;
import notice.model.NoticeVO;

public class NoticeSeeAction extends AbstractAction{

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
		
		// 3. NoticeDAO의 getMyFBList(num) 호출
		NoticeDAO ndao = new NoticeDAO();
		NoticeVO nvo = ndao.getMyNTCList(num);
		req.setAttribute("nvo", nvo);
		
		// 4. 그 결과 메시지 처리 이동경로 지정
		this.setRedirect(true);
		this.setViewPage("ntc-see.do");
	}
}
