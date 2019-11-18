package common.controller;

// Command 인터페이스를 상속받아서 execute() 추상메소드를 멤버로 갖는다.
public abstract class AbstractAction implements Command{
	private String viewPage;	// 뷰 페이지 값을 가질 예정
	private boolean isRedirect;	// 이동방식이 redirect면 true, forward면 false
	
	public String getViewPage() {return viewPage;}
	public void setViewPage(String viewPage) {this.viewPage = viewPage;}
	
	public boolean isRedirect() {return isRedirect;}
	public void setRedirect(boolean isRedirect) {this.isRedirect = isRedirect;}
}
