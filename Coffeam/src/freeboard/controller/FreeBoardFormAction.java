package freeboard.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;

public class FreeBoardFormAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

		// 자유게시판 글 등록 폼을 보여준다.
		
		// 1. 뷰페이지 지정
		this.setViewPage("/service/coffeam_writePosting.jsp");
		
		// 2. 이동방식 forward 방식으로 지정
		this.setRedirect(false);
	}

}
