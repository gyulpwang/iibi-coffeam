package user.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
//import db.util.DBUtil;

import freeboard.model.FreeBoardVO;
import user.member.MemberVO;

public class AdminDAO {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	private DataSource ds;
	
	public AdminDAO() {
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
	public boolean idCheck(String adminId) throws SQLException, NotAdminException{
		try{
			//con=DBUtil.getCon();
			con = ds.getConnection();
			// adminId�� admin ���̺� ���ڵ尡 �ִ��� Ȯ��
			String sql = "select adminNo from admin where adminId = ?";
			System.out.println(sql);
			ps=con.prepareStatement(sql);
			ps.setString(1, adminId);
			rs=ps.executeQuery();

			boolean isExist = rs.next();
			return !isExist;	// ���ٷ� ���� �� �ִ�.
		}finally{
			close();
		}
	}
	
	/** ȸ������ ó�� �޼ҵ� - biz(business) method */
	public int insertMember(AdminVO user) throws SQLException{
		try{
			//con = DBUtil.getCon();
			con = ds.getConnection();
			String sql = "insert into member(adminNo, adminId, adminName, adminPwd)"
					+ " values(admin_adminNo_SEQ.nextval, ?, ?, ?)";	//insert�� �ۼ�
			// ps ������
			ps = con.prepareStatement(sql);

			// ���Ķ����(?) ���� setting�ϱ�
			ps.setString(1, user.getAdminId());
			ps.setString(2, user.getAdminName());
			ps.setString(3, user.getAdminPwd());
			
			System.out.println(sql);
			int n = ps.executeUpdate();
			return n;
		}finally{
			close();
		}
	}
	
	/** �α��� üũ - ������ ���θ� üũ�ϴ� �޼ҵ� */
	public AdminVO loginCheck(String adminId, String adminPwd) throws SQLException, NotAdminException{
		AdminVO loginAdmin = findAdminByadminId(adminId);
		if(loginAdmin!=null){
			// ���̵� �����Ѵٸ� => ��� üũ
			String dbadminPwd = loginAdmin.getAdminPwd();
			
			if(adminPwd.equals(dbadminPwd)){	// ��� ��ġ
				return loginAdmin;	// ȸ�� ���� ��ȯ
			}else{					// ��� ����ġ
				throw new NotAdminException("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			}
		}
		return null;
	}
	
	/** ������ ��ȣ�� ������ ������ �������� �޼ҵ�*/
	public AdminVO findAdminByAdminNo(int adminNo) throws SQLException{
		try{
			con = ds.getConnection();
			String sql = "select * from admin where adminNo=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, adminNo);
			rs=ps.executeQuery();
			ArrayList<AdminVO> arr = makeList(rs);
			if(arr!=null && arr.size()==1){	// ȸ�������� �ִٸ�
				AdminVO admin = arr.get(0);	// �ϳ� �ִٸ� �ε����� 0
				return admin;
			}else{	// ȸ�������� ���ٸ�
				return null;
			}
		}finally{
			close();
		}
	}
	
	/** ������ ���̵�(UK)�� ������ ������ �������� �޼ҵ� */
	public AdminVO findAdminByadminId(String adminId) throws SQLException, NotAdminException{
		try{
			con = ds.getConnection();
			String sql="SELECT * FROM admin WHERE adminId=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, adminId);
			rs = ps.executeQuery();
			ArrayList<AdminVO> arr = makeList(rs);
			
			// ���̵�� UNIQUE ���� ������ �־��� ������ �ִٸ� ���ڵ�� �ϳ�.
			if(arr!=null && arr.size()==1){	// (�ϳ� )���� ���
				// ���̵� �����ϴ� ���
				AdminVO admin = arr.get(0);
				return admin;
			}else{
				// ���̵� �������� �ʴ� ��� => ����� ���� ���� �߻�
				throw new NotAdminException(adminId+"�� ���̵�� �������� �ʾƿ�.");
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
			String sql = "select * from member order by idx asc";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<MemberVO> arr = makeListM(rs);

			return arr;
		}finally{
			close();
		}
	}
	
	/** ��� ȸ�� ����� ����ϴ� �޼ҵ�(����¡ ����) */
	public List<MemberVO> getMemberList(Integer num, int start, int end) throws SQLException{
		try {
			con = ds.getConnection();
			String sql = "select * from("
					   + "select row_number() over(order by ? desc) rn, member.*"
					   + "from member) where rn between ? and ?";

			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.setInt(2, start);
			ps.setInt(3, end);
			rs = ps.executeQuery();
			
			return makeListM(rs);
		} finally {
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
			ArrayList<MemberVO> arr = makeListM(rs);
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
			
			return makeListM(rs);
		}finally{
			close();
		}
	}
	
	/** ������ ������ �����ϴ� �޼ҵ� */
	public int updateAdmin(AdminVO admin) throws SQLException{// DML �Լ��� ��� ��ȯ Ÿ���� int
		try{
			con = ds.getConnection();
			String sql = "update admin set adminName=?, adminId=?, adminPwd=? where adminNo=?";
			ps = con.prepareStatement(sql);
			
			ps.setString(1, admin.getAdminName());
			ps.setString(2, admin.getAdminId());
			ps.setString(3, admin.getAdminPwd());
			ps.setInt(4, admin.getAdminNo());
			System.out.println(sql);
			int n = ps.executeUpdate();
			
			return n;
		}finally{
			close();
		}
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
	
	private ArrayList<AdminVO> makeList(ResultSet rs) throws SQLException{
		
		ArrayList<AdminVO> arr = new ArrayList<AdminVO>();
		
		while(rs.next()){
			int adminNo = rs.getInt("adminNo");
			String adminName = rs.getString("adminName");
			String adminId = rs.getString("adminId");
			String adminPwd = rs.getString("adminPwd");
			
			AdminVO user = new AdminVO(adminNo, adminId, adminName, adminPwd);
			arr.add(user);	
		}
		return arr;
	}
	
	private ArrayList<MemberVO> makeListM(ResultSet rs) throws SQLException{
		
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
