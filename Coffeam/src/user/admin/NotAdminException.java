package user.admin;

/** �����ڰ� �ƴ� ��� �߻���ų ����� ���� ���� Ŭ���� */
public class NotAdminException extends Exception {
	public NotAdminException(){
		super("NotMemberException");
	}
	public NotAdminException(String msg){
		super(msg);
	}
}
