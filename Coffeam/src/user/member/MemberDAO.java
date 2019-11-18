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
			System.out.println("DS 룩업 성공"+ds);
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	/** 아이디 중복여부 체크 메소드*/
	public boolean idCheck(String userid) throws SQLException, NotMemberException{
		try{
			//con=DBUtil.getCon();
			con = ds.getConnection();
			// userid로 member 테이블에 레코드가 있는지 확인
			String sql = "select idx from member where userid = ?";
			System.out.println(sql);
			ps=con.prepareStatement(sql);
			ps.setString(1, userid);
			rs=ps.executeQuery();

			boolean isExist = rs.next();
			
			// 있으면 false 반환
			/*if(isExist){return false;}
			// 없으면 true 반환
			else{return true;}*/
			
			return !isExist;	// 한줄로 줄일 수 있다.
		}finally{
			close();
		}
	}
	
	/** 회원가입 처리 메소드 - biz(business) method */
	public int insertMember(MemberVO user) throws SQLException{
		try{
			//con = DBUtil.getCon();
			con = ds.getConnection();
			String sql = "insert into member(idx, name, userid, pwd, email, hp1, hp2, hp3, favorite)"
					+ " values(member_member_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?)";	//insert문 작성
			// ps 얻어오기
			ps = con.prepareStatement(sql);

			// 인파라미터(?) 값들 setting하기
			ps.setString(1, user.getName());
			ps.setString(2, user.getUserid());
			ps.setString(3, user.getPwd());
			ps.setString(4, user.getEmail());
			ps.setString(5, user.getHp1());
			ps.setString(6, user.getHp2());
			ps.setString(7, user.getHp3());
			ps.setString(8, user.getFavorite());
			
			System.out.println(sql);
			// db에 전송
			int n = ps.executeUpdate();
			
			// 반환값 반환
			return n;
		}finally{
			close();
		}
	}
	
	/** 로그인 체크 - 회원 여부를 체크하는 메소드 */
	public MemberVO loginCheck(String userid, String pwd) throws SQLException, NotMemberException{
		MemberVO loginUser = findMemberByUserid(userid);
		if(loginUser!=null){
			// 아이디가 존재한다면 => 비번 체크
			String dbPwd = loginUser.getPwd();
			
			if(pwd.equals(dbPwd)){	// 비번 일치
				return loginUser;	// 회원 정보 반환
			}else{					// 비번 불일치
				throw new NotMemberException("비밀번호가 일치하지 않아요!");
			}
		}
		return null;
	}
	
	/** 회원 아이디(UK)로 회원정보를 가져오는 메소드 */
	public MemberVO findMemberByUserid(String userid) throws SQLException, NotMemberException{
		try{
			//con=DBUtil.getCon();
			con = ds.getConnection();
			String sql="SELECT * FROM member WHERE userid=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();
			ArrayList<MemberVO> arr = makeList(rs);
			
			// 아이디는 UNIQUE 제약 조건을 주었기 때문에 있다면 레코드는 하나.
			if(arr!=null && arr.size()==1){	// (하나 )있을 경우
				// 아이디가 존재하는 경우
				MemberVO user = arr.get(0);
				return user;
			}else{
				// 아이디가 존재하지 않는 경우 => 사용자 정의 예외 발생
				throw new NotMemberException(userid+"란 아이디는 존재하지 않아요.");
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
			String sql = "select * from member order by idx desc";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<MemberVO> arr = makeList(rs);

			return arr;
		}finally{
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
			ArrayList<MemberVO> arr = makeList(rs);
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
