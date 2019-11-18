package common.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FrontController
 */
@WebServlet(
		urlPatterns = { "*.do" }, 
		initParams = { 
			@WebInitParam(name = "config", value = "C:/MyData/Workspace/Coffeam/WebContent/WEB-INF/Command.properties")
		})
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Map<String, Object> cmdMap=new HashMap<String, Object>();
	
	/** 서블릿 실행 시 딱 한번 호출되는 메소드 - init() 
	 * init-param에 기술되어 있는 config에 해당하는 
	 * value 값(Command.properties의 절대경로)을 얻어오자. 
	 * => web.xml에 기술. 최근에는 어노테이션으로 대치됨. */
	@Override
	public void init(ServletConfig conf) throws ServletException{
		System.out.println("init() 호출됨...");
		String props = conf.getInitParameter("config");
		System.out.println("props = "+props);
		Properties pr = new Properties();
		/* Hashtable의 자식 클래스. 키 값과 value 값을 매핑하여 
		저장하는 자료구조. Command.properties 파일에 매핑된 정보를 
		Properties 자료구조에 옮기자. */
		try {
			FileInputStream fis = new FileInputStream(props);
			pr.load(fis);
			// Command.properties 파일의 정보를 Properties 객체에 저장한다.
			if(fis != null)	fis.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// System.out.println(pr.getProperty("/index.do"));
		// key 값들만 추출하자.
		Enumeration<Object> en = pr.keys();
		while(en.hasMoreElements()){
			String cmd=en.nextElement().toString();	//key 값
			String className=pr.getProperty(cmd);
			System.out.println("cmd="+cmd);	// /index.do	
			System.out.println("className="+className);	// common.controller.IndexAction
			
			if(className!=null)
				className=className.trim();	// 공백 제거
			
			try {
				Class cmdClass = Class.forName(className);
				// 해당 클래스를 객체화시켜 메모리에 올린다.
				Object cmdInstance = cmdClass.newInstance();
				
				// 이 객체들을 해시맵에 저장한다. ////////
				cmdMap.put(cmd, cmdInstance);
				//////////////////////////////////////////
			} catch (Exception e) {
				e.printStackTrace();
				throw new ServletException(e);
			}
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestProcess(request, response);
	}

	private void requestProcess(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		System.out.println("FrontController 실행됨...");
		// 1. 클의 요청 URI를 분석해보자.
		String uri=req.getRequestURI();
		System.out.println("uri="+uri);	// /MyMVC/index.do를 반환
		String myctx=req.getContextPath();	// /MyMVC
		int len=myctx.length();	// 6
		String cmd=uri.substring(len);
		System.out.println("cmd="+cmd);	// /index.do
		
		Object instance=cmdMap.get(cmd);
		
		AbstractAction action = (AbstractAction) instance;
		if(action == null){
			System.out.println("액션이 널");
			return;
		}
		// 서브 컨트롤러(액션)의 execute()를 호출
		try{
			// 이동할 뷰 페이지 얻기
			////////////////////////////////
			action.execute(req, res);
			////////////////////////////////
			String viewPage = action.getViewPage();
			if(viewPage == null){
				System.out.println("뷰페이지가 널");
				viewPage="index.jsp";	// 디폴트 페이지를 index.jsp로 지정
			}
			
			// 이동 방식에 따라 뷰페이지로 이동
			if(action.isRedirect()){
				// redirect 이동인 경우(10%); true
				res.sendRedirect(viewPage);
			}else{
				// forward 이동인 경우(90%); false
				RequestDispatcher dispatcher=req.getRequestDispatcher(viewPage);
				dispatcher.forward(req, res);
			}
		}catch(Exception e){
			e.printStackTrace();
			throw new ServletException(e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestProcess(request, response);
	}

}
