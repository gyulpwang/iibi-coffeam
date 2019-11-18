package notice.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import freeboard.model.FreeBoardVO;
import user.member.MemberVO;

public class NoticeDAO {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	private DataSource ds;
	
	public NoticeDAO() {
		// Resource Lookup
		try {
			Context ctx=new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/coffeam");
			System.out.println("DS 룩업 성공"+ds);
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	/** 전체 공지 목록 가져오는 메소드[관리자 모드] */
	public ArrayList<NoticeVO> listAllNotice() throws SQLException{
		try{
			//con=DBUtil.getCon();
			con = ds.getConnection();
			// select 문 수행
			String sql = "select * from notice order by num desc";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<NoticeVO> arr = makeList(rs);

			return arr;
		}finally{
			close();
		}
	}
	
	/** 공지사항번호(PK)로 특정 공지정보를 가져오는 메소드 */
	public NoticeVO findNoticeByNum(int num) throws SQLException{
		try{
			//con=DBUtil.getCon();
			con = ds.getConnection();
			//SELECT문 WHERE 절
			String sql = "select * from notice where num=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, num);
			rs=ps.executeQuery();
			ArrayList<NoticeVO> arr = makeList(rs);
			// 회원정보(PK) ==> 회원정보가 있다면 1개
			if(arr!=null && arr.size()==1){	// 회원정보가 있다면
				// findNoticeByIdx는 반환타입이 NoticeVO이기 때문에 ArrayList를 꺼내서 반환.
				NoticeVO user = arr.get(0);	// 하나 있다면 인덱스는 0
				return user;
			}else{	// 회원정보가 없다면
				return null;
			}
		}finally{
			close();
		}
	}
	
	/** 특정 검색어로 게시글을 찾는 메소드 */
	public List<NoticeVO> findNotice(String findType, String findString)
	throws SQLException{
		try{
			con = ds.getConnection();
			String colName="title";
			
			switch(findType){
				case "0" : colName="title";		break;
				case "1" : colName="wdate";		break;
			}
			// SELECT문 WHERE절 LIKE 검색
			String sql = "select * from notice where "+colName+" like ? order by num desc";
			System.out.println(sql);
			ps = con.prepareStatement(sql);
			ps.setString(1, "%"+findString+"%");
			rs = ps.executeQuery();
			
			return makeList(rs);
		}finally{
			close();
		}
	}
	
	/** 공지사항을 등록하는 메소드 */
	public int insertNotice(NoticeVO nvo) throws SQLException{
		try {
			con = ds.getConnection();
			String sql
			= "insert into notice(num, adminNo, writer, wdate, title, contents, upfile)"
			+ "values(notice_num_SEQ.nextval, ?, ?, sysdate, ?, ?, ?)";
			ps = con.prepareStatement(sql);
		
			ps.setInt(1, nvo.getAdminNo());
			ps.setString(2, nvo.getWriter());
			ps.setString(3, nvo.getTitle());
			ps.setString(4, nvo.getContents());
			ps.setString(5, nvo.getUpfile());
			int n = ps.executeUpdate();
			return n;
		} finally {
			close();
		}
	}
	
	/** 공지사항을 수정하는 메소드 */
	public int updateNotice(NoticeVO nvo) throws SQLException{
		try {
			// UPDATE문 title, contents, score, upfile
			// where num으로
			con = ds.getConnection();	//num, adminNo, writer, wdate, title, contents
			String sql = "UPDATE notice SET title=?, contents=?, upfile=? WHERE num=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, nvo.getTitle());
			ps.setString(2, nvo.getContents());
			ps.setString(3, nvo.getUpfile());
			ps.setInt(4, nvo.getNum());
			
			int n = ps.executeUpdate();
			return n;
		} finally {
			close();
		}
	}
	
	/** 공지사항을 삭제하는 메소드 */
	public int deleteNotice(int num) throws SQLException{
		try{
			con=ds.getConnection();
			String sql = "delete notice where num="+num;
			ps = con.prepareStatement(sql);
			int n = ps.executeUpdate();
			return n;
		} finally{
			close();	
		}
	}

	/** 총 게시물 수 구하기 => 페이징 처리 시 필요
	 * - SELECT문을 수행*/
	public int getTotalCount(){
		try {
			con=ds.getConnection();
			String sql="SELECT count(num) cnt FROM notice";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();	// 결과가 단일행이기 때문에 반복문(while) 돌릴 필요 없음
			int totalCount=rs.getInt("cnt");
			return totalCount;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally{
			close();
		}
	}// getTotalCount() -------------------------
	
	/** 페이징 처리를 하여 글 목록을 가져오는 메소드 */
	public ArrayList<NoticeVO> selectAllNotice(int start, int end){
		try {
			con=ds.getConnection();
			String sql="select * from("
					+ " select rownum rn, a.* from(("
					+ " select * from notice order by num desc) a))"
					+ " where rn between "+start+" and "+end;
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			ArrayList<NoticeVO> arr = new ArrayList<NoticeVO>();
			
			while(rs.next()){
				int num = rs.getInt("num");
				int adminNo = rs.getInt("adminNo");
				String writer = rs.getString("writer");
				Date wdate = rs.getDate("wdate");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				String upfile = rs.getString("upfile");
				
				NoticeVO record = new NoticeVO(num, adminNo, writer, wdate, title, contents, upfile);
				arr.add(record);
			}// while--------------
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			close();
		}
	}
	
	/** 글 번호로 공지사항 글 정보를 가져오는 메소드 */
	public NoticeVO getMyNTCList(int num) throws SQLException{
		try {
			con = ds.getConnection();
			String sql = "SELECT * FROM notice WHERE num=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			List<NoticeVO> arr=makeList(rs);
			if(arr!=null && arr.size()==1){
				return arr.get(0);
			}
			return null;
		} finally {
			close();
		}
	}
	
	/** 공지사항 글 목록을 가져오는 메소드 - SELECT 문을 수행 */
	public ArrayList<NoticeVO> selectAllNotice(){
		try{
			con=ds.getConnection();
			String sql = "select num, idx, title, contetns, writer, upfile, wdate"
					   + "from notice order by num desc";
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			ArrayList<NoticeVO> arr = new ArrayList<NoticeVO>();
			
			while(rs.next()){
				int num = rs.getInt("num");
				int adminNo = rs.getInt("adminNo");
				String writer = rs.getString("writer");
				Date wdate = rs.getDate("wdate");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				String upfile = rs.getString("upfile");
				
				NoticeVO record = new NoticeVO(num, adminNo, title, wdate, contents, writer, upfile);
				arr.add(record);	// ArrayList에 record를 차곡차곡 추가
			}// while--------------
			return arr;		// 정상적으로 수행되면 ArrayList 반환 
		}catch(SQLException e){
			e.printStackTrace();
			return null;	// 에러가 나면 반환할 게 없으므로 널을 반환
		}finally{
			close();
		}
	}// selectAllMemo()-----------------------
	
	
	
	
	
	private ArrayList<NoticeVO> makeList(ResultSet rs) throws SQLException{
		
		ArrayList<NoticeVO> arr = new ArrayList<NoticeVO>();
		
		while(rs.next()){
			int num = rs.getInt("num");
			int adminNo = rs.getInt("adminNo");
			String writer = rs.getString("writer");
			Date wdate = rs.getDate("wdate");
			String title = rs.getString("title");
			String contents = rs.getString("contents");
			String upfile = rs.getString("upfile");
			
			NoticeVO ntc = new NoticeVO(num, adminNo, writer, wdate, title, contents, upfile);
			arr.add(ntc);	
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
