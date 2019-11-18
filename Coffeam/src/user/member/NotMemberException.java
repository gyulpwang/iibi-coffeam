package user.member;

/** 회원이 아닐 경우 발생시킬 사용자 정의 예외 클래스 */
public class NotMemberException extends Exception {
	public NotMemberException(){
		super("NotMemberException");
	}
	public NotMemberException(String msg){
		super(msg);
	}
}
