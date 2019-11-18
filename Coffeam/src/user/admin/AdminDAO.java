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
			System.out.println("DS 룩업 성공"+ds);
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	/** 아이디 중복여부 체크 메소드*/
	public boolean idCheck(String adminId) throws SQLException, NotAdminException{
		try{
			//con=DBUtil.getCon();
			con = ds.getConnection();
			// adminId로 admin 테이블에 레코드가 있는지 확인
			String sql = "select adminNo from admin where adminId = ?";
			System.out.println(sql);
			ps=con.prepareStatement(sql);
			ps.setString(1, adminId);
			rs=ps.executeQuery();

			boolean isExist = rs.next();
			return !isExist;	// 한줄로 줄일 수 있다.
		}finally{
			close();
		}
	}
	
	/** 회원가입 처리 메소드 - biz(business) method */
	public int insertMember(AdminVO user) throws SQLException{
		try{
			//con = DBUtil.getCon();
			con = ds.getConnection();
			String sql = "insert into member(adminNo, adminId, adminName, adminPwd)"
					+ " values(admin_adminNo_SEQ.nextval, ?, ?, ?)";	//insert문 작성
			// ps 얻어오기
			ps = con.prepareStatement(sql);

			// 인파라미터(?) 값들 setting하기
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
	
	/** 로그인 체크 - 관리자 여부를 체크하는 메소드 */
	public AdminVO loginCheck(String adminId, String adminPwd) throws SQLException, NotAdminException{
		AdminVO loginAdmin = findAdminByadminId(adminId);
		if(loginAdmin!=null){
			// 아이디가 존재한다면 => 비번 체크
			String dbadminPwd = loginAdmin.getAdminPwd();
			
			if(adminPwd.equals(dbadminPwd)){	// 비번 일치
				return loginAdmin;	// 회원 정보 반환
			}else{					// 비번 불일치
				throw new NotAdminException("비밀번호가 일치하지 않습니다.");
			}
		}
		return null;
	}
	
	/** 관리자 번호로 관리자 정보를 가져오는 메소드*/
	public AdminVO findAdminByAdminNo(int adminNo) throws SQLException{
		try{
			con = ds.getConnection();
			String sql = "select * from admin where adminNo=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, adminNo);
			rs=ps.executeQuery();
			ArrayList<AdminVO> arr = makeList(rs);
			if(arr!=null && arr.size()==1){	// 회원정보가 있다면
				AdminVO admin = arr.get(0);	// 하나 있다면 인덱스는 0
				return admin;
			}else{	// 회원정보가 없다면
				return null;
			}
		}finally{
			close();
		}
	}
	
	/** 관리자 아이디(UK)로 관리자 정보를 가져오는 메소드 */
	public AdminVO findAdminByadminId(String adminId) throws SQLException, NotAdminException{
		try{
			con = ds.getConnection();
			String sql="SELECT * FROM admin WHERE adminId=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, adminId);
			rs = ps.executeQuery();
			ArrayList<AdminVO> arr = makeList(rs);
			
			// 아이디는 UNIQUE 제약 조건을 주었기 때문에 있다면 레코드는 하나.
			if(arr!=null && arr.size()==1){	// (하나 )있을 경우
				// 아이디가 존재하는 경우
				AdminVO admin = arr.get(0);
				return admin;
			}else{
				// 아이디가 존재하지 않는 경우 => 사용자 정의 예외 발생
				throw new NotAdminException(adminId+"란 아이디는 존재하지 않아요.");
			}
		}finally{
			close();
		}
	}//-----------------------------------------
	
	/** 전체 회원 목록 가져오는 메소드[관리자 모드] */
	public ArrayList<MemberVO> listAllMember() throws SQLException{
		try{
			//con=DBUtil.getCon();
			con = ds.getConnection();
			// select 문 수행
			String sql = "select * from member order by idx asc";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<MemberVO> arr = makeListM(rs);

			return arr;
		}finally{
			close();
		}
	}
	
	/** 모든 회원 목록을 출력하는 메소드(페이징 포함) */
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
	
	/** 회원번호(PK)로 특정 회원정보를 가져오는 메소드 */
	public MemberVO findMemberByIdx(Integer idx) throws SQLException{
		try{
			//con=DBUtil.getCon();
			con = ds.getConnection();
			//SELECT문 WHERE 절
			String sql = "select * from member where idx=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, idx);
			rs=ps.executeQuery();
			ArrayList<MemberVO> arr = makeListM(rs);
			// 회원정보(PK) ==> 회원정보가 있다면 1개
			if(arr!=null && arr.size()==1){	// 회원정보가 있다면
				// findMemberByIdx는 반환타입이 MemberVO이기 때문에 ArrayList를 꺼내서 반환.
				MemberVO user = arr.get(0);	// 하나 있다면 인덱스는 0
				return user;
			}else{	// 회원정보가 없다면
				return null;
			}
		}finally{
			close();
		}
	}
	
	/** 검색어로 회원정보를 검색하는 메소드 */
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
			// SELECT문 WHERE절 LIKE 검색
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
	
	/** 관리자 정보를 수정하는 메소드 */
	public int updateAdmin(AdminVO admin) throws SQLException{// DML 함수일 경우 반환 타입은 int
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
	
	/** 회원번호(PK)로 회원 정보를 삭제하는 메소드[관리자] */
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
	
	/** 회원 정보를 수정하는 메소드 */
	public int updateMember(MemberVO user) throws SQLException{// DML 함수일 경우 반환 타입은 int
		try{
			//con=DBUtil.getCon();
			con = ds.getConnection();
			// UPDATE문 작성(이름, 아이디, 비번, 이메일, 연락처(hp1~hp3), 우편번호, 주소)
			// WHERE 회원번호
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
