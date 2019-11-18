package freeboard.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractAction;
import freeboard.model.FreeBoardDAO;
import freeboard.model.FreeBoardVO;

public class FreeBoardListAction extends AbstractAction {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// 0. 현재 보여줄 페이지 파라미터(cpage) 값 받기
		/* cpage 파라미터가 넘어오지 않는다면 보여줄 디폴트 페이지는 1로 지정하자. */
		String cpStr=req.getParameter("cpage");
		if(cpStr==null || cpStr.trim().isEmpty()){
			cpStr="1";
		}
		int cpage=Integer.parseInt(cpStr.trim());
		if(cpage <= 0){	// 파라미터로 음수 값 입력 시
			cpage=1;	// 첫 페이지를 보여준다.
		}
		
		// 1. 메모 목록 가져오기
		FreeBoardDAO fdao = new FreeBoardDAO();
		
		// 1_2. 페이징 처리를 위해 총 게시글 수를 가져온다.
		int totalCount=fdao.getTotalCount();
		
		// 1_3. 한 페이지당 보여줄 목록 갯수 정하기
		int pageSize=5;
		
		// 1_4. 페이지 수 구하기
		/* totalCount	pageSize	pageCount
		 *  1 ~ 10			10			1
		 * 11 ~ 20						2
		 * 21 ~ 30						3*/
		int pageCount=0;
		// 방법 1
		/* if(totalCount%pageSize==0)	pageCount=totalCount/pageSize;
		   else							pageCount=totalCount/pageSize+1; */
		// 방법 2
		/* pageCount2 = (totalCount+(pageSize-1))/pageSize; */
		// 방법 3
		pageCount = (totalCount-1)/pageSize+1;
		
		if(cpage > pageCount){	// 파라미터로 초과된 페이지 입력 시
			cpage=pageCount;	// 마지막 페이지를 보여준다.
		}
		
		// 1_5. DB에서 5개 단위로 끊어오기 위한 로직
		int end = cpage * pageSize;
		int start = end-(pageSize-1);
		
		ArrayList<FreeBoardVO> arr=fdao.selectAllPosting(start, end);
		// start와 end값을 매개변수로 넣어준다.
		System.out.println("arr="+arr);

		// 2. req에 저장하기
		req.setAttribute("FBList", arr);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("cpage", cpage);
		
		// 3. 뷰페이지와 이동방식 지정
		this.setViewPage("coffeam_FreeBoard.jsp");
	}
}
