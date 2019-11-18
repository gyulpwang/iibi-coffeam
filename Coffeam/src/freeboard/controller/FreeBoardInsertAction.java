package freeboard.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.controller.AbstractAction;
import freeboard.model.FreeBoardDAO;
import freeboard.model.FreeBoardVO;


public class FreeBoardInsertAction extends AbstractAction {
	private String upDir;
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// 1. 로그인 여부 체크
		
		// 2. 업로드할 디렉토리의 절대경로 구하기
		// application.getRealPath("review/Upload");
		HttpSession ses = req.getSession();
		ServletContext app=ses.getServletContext();
		upDir = app.getRealPath("service/Upload");
		System.out.println("upDir="+upDir);
		
		// 3. 업로드 컴포넌트 사용 - MultipartRequest
		try{
			MultipartRequest mr = new MultipartRequest
				(req, upDir, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
			System.out.println("파일 업로드 성공!");
			
			// 첨부파일 얻기
			String upfile = mr.getFilesystemName("upfile");
			System.out.println("upfile="+upfile);
			
			// 1. 사용자가 입력한 값 받는다.
			//String num = req.getParameter("num");	// int
			String idx = mr.getParameter("idx");	// int
			String title = mr.getParameter("title");
			String contents = mr.getParameter("contents");
			String writer = mr.getParameter("writer");
			//String wdate = req.getParameter("wdate");	//Date
			String cnt = mr.getParameter("cnt");	// int
			
			// 2. 유효성 체크
			if(idx==null || idx.trim().isEmpty()){
				this.setViewPage("coffeam_FreeBoard.jsp");
				this.setRedirect(true);
				return;
			}
			
			// 3. FreeBoardVO에 담기
			FreeBoardVO fvo = new FreeBoardVO(0, Integer.parseInt(idx), title, contents, writer, upfile, null, 0);
			
			// 4. FreeBoardDAO의 insertPosting(vo) 호출
			FreeBoardDAO fdao = new FreeBoardDAO();
			int n = fdao.insertPosting(fvo);
			
			String ms = (n>0)? "등록 성공" : "등록 실패";
			String loc = (n>0)? "fb-list.do" : "javascript:history.back()";
			System.out.println(ms);
			// 5. 결과값들을 req에 저장
			req.setAttribute("msg", ms);
			req.setAttribute("loc", loc);
			
			// 6. 뷰페이지 지정 및 이동방식 지정
			this.setViewPage("fb-list.do");
			this.setRedirect(false);
		}catch(IOException e){
			System.out.println("파일 업로드 실패!");
			req.setAttribute("msg", "파일업로드 실패 : "+e.getMessage());
			String loc ="javascript:history.back()";
			req.setAttribute("loc", loc);
			this.setRedirect(false);
			this.setViewPage("coffeam_writePosting.jsp");
		}
	}
}
