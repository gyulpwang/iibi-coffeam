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
	
	/** ���� ���� �� �� �ѹ� ȣ��Ǵ� �޼ҵ� - init() 
	 * init-param�� ����Ǿ� �ִ� config�� �ش��ϴ� 
	 * value ��(Command.properties�� ������)�� ������. 
	 * => web.xml�� ���. �ֱٿ��� ������̼����� ��ġ��. */
	@Override
	public void init(ServletConfig conf) throws ServletException{
		System.out.println("init() ȣ���...");
		String props = conf.getInitParameter("config");
		System.out.println("props = "+props);
		Properties pr = new Properties();
		/* Hashtable�� �ڽ� Ŭ����. Ű ���� value ���� �����Ͽ� 
		�����ϴ� �ڷᱸ��. Command.properties ���Ͽ� ���ε� ������ 
		Properties �ڷᱸ���� �ű���. */
		try {
			FileInputStream fis = new FileInputStream(props);
			pr.load(fis);
			// Command.properties ������ ������ Properties ��ü�� �����Ѵ�.
			if(fis != null)	fis.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		// System.out.println(pr.getProperty("/index.do"));
		// key ���鸸 ��������.
		Enumeration<Object> en = pr.keys();
		while(en.hasMoreElements()){
			String cmd=en.nextElement().toString();	//key ��
			String className=pr.getProperty(cmd);
			System.out.println("cmd="+cmd);	// /index.do	
			System.out.println("className="+className);	// common.controller.IndexAction
			
			if(className!=null)
				className=className.trim();	// ���� ����
			
			try {
				Class cmdClass = Class.forName(className);
				// �ش� Ŭ������ ��üȭ���� �޸𸮿� �ø���.
				Object cmdInstance = cmdClass.newInstance();
				
				// �� ��ü���� �ؽøʿ� �����Ѵ�. ////////
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
		System.out.println("FrontController �����...");
		// 1. Ŭ�� ��û URI�� �м��غ���.
		String uri=req.getRequestURI();
		System.out.println("uri="+uri);	// /MyMVC/index.do�� ��ȯ
		String myctx=req.getContextPath();	// /MyMVC
		int len=myctx.length();	// 6
		String cmd=uri.substring(len);
		System.out.println("cmd="+cmd);	// /index.do
		
		Object instance=cmdMap.get(cmd);
		
		AbstractAction action = (AbstractAction) instance;
		if(action == null){
			System.out.println("�׼��� ��");
			return;
		}
		// ���� ��Ʈ�ѷ�(�׼�)�� execute()�� ȣ��
		try{
			// �̵��� �� ������ ���
			////////////////////////////////
			action.execute(req, res);
			////////////////////////////////
			String viewPage = action.getViewPage();
			if(viewPage == null){
				System.out.println("���������� ��");
				viewPage="index.jsp";	// ����Ʈ �������� index.jsp�� ����
			}
			
			// �̵� ��Ŀ� ���� ���������� �̵�
			if(action.isRedirect()){
				// redirect �̵��� ���(10%); true
				res.sendRedirect(viewPage);
			}else{
				// forward �̵��� ���(90%); false
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
