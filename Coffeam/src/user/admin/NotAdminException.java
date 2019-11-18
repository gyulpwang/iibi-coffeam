package user.admin;

/** 관리자가 아닐 경우 발생시킬 사용자 정의 예외 클래스 */
public class NotAdminException extends Exception {
	public NotAdminException(){
		super("NotMemberException");
	}
	public NotAdminException(String msg){
		super(msg);
	}
}
