package user.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

//import db.util.DBUtil;

public class MemberDAO {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	private DataSource ds;
	
	public MemberDAO() {
		// Resource Lookup
		try {
			Context ctx=new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/coffeam");
			System.out.println("DS ��� ����"+ds);
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	/** ���̵� �ߺ����� üũ �޼ҵ�*/
	public boolean idCheck(String userid) throws SQLException, NotMemberException{
		try{
			//con=DBUtil.getCon();
			con = ds.getConnection();
			// userid�� member ���̺� ���ڵ尡 �ִ��� Ȯ��
			String sql = "select idx from member where userid = ?";
			System.out.println(sql);
			ps=con.prepareStatement(sql);
			ps.setString(1, userid);
			rs=ps.executeQuery();

			boolean isExist = rs.next();
			
			// ������ false ��ȯ
			/*if(isExist){return false;}
			// ������ true ��ȯ
			else{return true;}*/
			
			return !isExist;	// ���ٷ� ���� �� �ִ�.
		}finally{
			close();
		}
	}
	
	/** ȸ������ ó�� �޼ҵ� - biz(business) method */
	public int insertMember(MemberVO user) throws SQLException{
		try{
			//con = DBUtil.getCon();
			con = ds.getConnection();
			String sql = "insert into member(idx, name, userid, pwd, email, hp1, hp2, hp3, favorite)"
					+ " values(member_member_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?)";	//insert�� �ۼ�
			// ps ������
			ps = con.prepareStatement(sql);

			// ���Ķ����(?) ���� setting�ϱ�
			ps.setString(1, user.getName());
			ps.setString(2, user.getUserid());
			ps.setString(3, user.getPwd());
			ps.setString(4, user.getEmail());
			ps.setString(5, user.getHp1());
			ps.setString(6, user.getHp2());
			ps.setString(7, user.getHp3());
			ps.setString(8, user.getFavorite());
			
			System.out.println(sql);
			// db�� ����
			int n = ps.executeUpdate();
			
			// ��ȯ�� ��ȯ
			return n;
		}finally{
			close();
		}
	}
	
	/** �α��� üũ - ȸ�� ���θ� üũ�ϴ� �޼ҵ� */
	public MemberVO loginCheck(String userid, String pwd) throws SQLException, NotMemberException{
		MemberVO loginUser = findMemberByUserid(userid);
		if(loginUser!=null){
			// ���̵� �����Ѵٸ� => ��� üũ
			String dbPwd = loginUser.getPwd();
			
			if(pwd.equals(dbPwd)){	// ��� ��ġ
				return loginUser;	// ȸ�� ���� ��ȯ
			}else{					// ��� ����ġ
				throw new NotMemberException("��й�ȣ�� ��ġ���� �ʾƿ�!");
			}
		}
		return null;
	}
	
	/** ȸ�� ���̵�(UK)�� ȸ�������� �������� �޼ҵ� */
	public MemberVO findMemberByUserid(String userid) throws SQLException, NotMemberException{
		try{
			//con=DBUtil.getCon();
			con = ds.getConnection();
			String sql="SELECT * FROM member WHERE userid=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();
			ArrayList<MemberVO> arr = makeList(rs);
			
			// ���̵�� UNIQUE ���� ������ �־��� ������ �ִٸ� ���ڵ�� �ϳ�.
			if(arr!=null && arr.size()==1){	// (�ϳ� )���� ���
				// ���̵� �����ϴ� ���
				MemberVO user = arr.get(0);
				return user;
			}else{
				// ���̵� �������� �ʴ� ��� => ����� ���� ���� �߻�
				throw new NotMemberException(userid+"�� ���̵�� �������� �ʾƿ�.");
			}
		}finally{
			close();
		}
	}//-----------------------------------------
	
	/** ��ü ȸ�� ��� �������� �޼ҵ�[������ ���] */
	public ArrayList<MemberVO> listAllMember() throws SQLException{
		try{
			//con=DBUtil.getCon();
			con = ds.getConnection();
			// select �� ����
			String sql = "select * from member order by idx desc";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<MemberVO> arr = makeList(rs);

			return arr;
		}finally{
			close();
		}
	}
	
	/** ȸ����ȣ(PK)�� Ư�� ȸ�������� �������� �޼ҵ� */
	public MemberVO findMemberByIdx(Integer idx) throws SQLException{
		try{
			//con=DBUtil.getCon();
			con = ds.getConnection();
			//SELECT�� WHERE ��
			String sql = "select * from member where idx=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, idx);
			rs=ps.executeQuery();
			ArrayList<MemberVO> arr = makeList(rs);
			// ȸ������(PK) ==> ȸ�������� �ִٸ� 1��
			if(arr!=null && arr.size()==1){	// ȸ�������� �ִٸ�
				// findMemberByIdx�� ��ȯŸ���� MemberVO�̱� ������ ArrayList�� ������ ��ȯ.
				MemberVO user = arr.get(0);	// �ϳ� �ִٸ� �ε����� 0
				return user;
			}else{	// ȸ�������� ���ٸ�
				return null;
			}
		}finally{
			close();
		}
	}
	
	/** �˻���� ȸ�������� �˻��ϴ� �޼ҵ� */
	public ArrayList<MemberVO> findMember(String findType, String findString)
	throws SQLException{
		try{
			//con=DBUtil.getCon();
			con = ds.getConnection();
			String colName="name";
			
			switch(findType){
				case "0" : colName="name";		break;
				case "1" : colName="userid";	break;
				case "2" : colName="email";		break;
				case "3" : colName="favorite";	break;
			}
			// SELECT�� WHERE�� LIKE �˻�
			String sql = "select * from member where "+colName+" like ? order by idx desc";
			System.out.println(sql);
			ps = con.prepareStatement(sql);
			ps.setString(1, "%"+findString+"%");
			rs = ps.executeQuery();
			
			return makeList(rs);
		}finally{
			close();
		}
	}
	
	private ArrayList<MemberVO> makeList(ResultSet rs) throws SQLException{
		
		ArrayList<MemberVO> arr = new ArrayList<MemberVO>();
		
		while(rs.next()){
			Integer idx = rs.getInt("idx");
			String name = rs.getString("name");
			String userid = rs.getString("userid");
			String pwd = rs.getString("pwd");
			String email = rs.getString("email");
			String hp1 = rs.getString("hp1");
			String hp2 = rs.getString("hp2");
			String hp3 = rs.getString("hp3");
			java.sql.Date indate = rs.getDate("indate");
			String favorite = rs.getString("favorite");
			int mileage = rs.getInt("mileage");
			
			MemberVO user = new MemberVO(idx, name, userid, pwd, email, hp1, hp2, hp3, indate, favorite, mileage);
			arr.add(user);	
		}
		return arr;
	}
	
	/** ȸ����ȣ(PK)�� ȸ�� ������ �����ϴ� �޼ҵ�[������] */
	public int deleteMember(Integer idx) throws SQLException{
		try{
			//con=DBUtil.getCon();
			con = ds.getConnection();
			String sql = "delete from member where idx=?";
			System.out.println(sql);
			ps=con.prepareStatement(sql);
			System.out.println(idx);
			ps.setInt(1, idx);
			
			int n = ps.executeUpdate();
			
			return n;
		}finally{
			close();
		}
	}
	
	/** ȸ�� ������ �����ϴ� �޼ҵ� */
	public int updateMember(MemberVO user) throws SQLException{// DML �Լ��� ��� ��ȯ Ÿ���� int
		try{
			//con=DBUtil.getCon();
			con = ds.getConnection();
			// UPDATE�� �ۼ�(�̸�, ���̵�, ���, �̸���, ����ó(hp1~hp3), �����ȣ, �ּ�)
			// WHERE ȸ����ȣ
			String sql = "update member set name=?, userid=?, pwd=?, email=?, "
					+ "hp1=?,hp2=?,hp3=?,favorite=? where idx=?";
			ps = con.prepareStatement(sql);
			
			ps.setString(1, user.getName());
			ps.setString(2, user.getUserid());
			ps.setString(3, user.getPwd());
			ps.setString(4, user.getEmail());
			ps.setString(5, user.getHp1());
			ps.setString(6, user.getHp2());
			ps.setString(7, user.getHp3());
			ps.setString(8, user.getFavorite());
			ps.setInt(9, user.getIdx());
			System.out.println(sql);
			int n = ps.executeUpdate();
			
			return n;
		}finally{
			close();
		}
	}
	
	public void close(){
		try {
			if(rs != null) rs.close();
			if(ps != null) ps.close();
			if(con != null) con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
