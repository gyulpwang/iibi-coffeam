package freeboard.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import user.member.MemberVO;

public class FreeBoardDAO {

	private DataSource ds;
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public FreeBoardDAO() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/coffeam");
			System.out.println("DS 룩업 성공");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/** 모든 게시글 목록을 출력하는 메소드(페이징 포함) */
	public List<FreeBoardVO> getFBList(Integer num, int start, int end) throws SQLException{
		try {
			con = ds.getConnection();
			String sql = "select * from("
					   + "select row_number() over(order by ? desc) rn, freeboard.*"
					   + "from freeboard) where rn between ? and ?";

			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.setInt(2, start);
			ps.setInt(3, end);
			rs = ps.executeQuery();
			
			return makeList(rs);
		} finally {
			close();
		}
	}
	
	/** 특정 검색어로 게시글을 찾는 메소드 */
	public List<FreeBoardVO> findPosting(String findType, String findString)
	throws SQLException{
		try{
			con = ds.getConnection();
			String colName="title";
			
			switch(findType){
				case "0" : colName="title";		break;
				case "1" : colName="writer";	break;
				case "2" : colName="wdate";		break;
			}
			// SELECT문 WHERE절 LIKE 검색
			String sql = "select * from freeboard where "+colName+" like ? order by num desc";
			System.out.println(sql);
			ps = con.prepareStatement(sql);
			ps.setString(1, "%"+findString+"%");
			rs = ps.executeQuery();
			
			return makeList(rs);
		}finally{
			close();
		}
	}
	
	
	/** 게시글을 등록하는 메소드 */
	public int insertPosting(FreeBoardVO fvo) throws SQLException{
		try {
			con = ds.getConnection();
			String sql
			= "insert into freeboard(num, idx, title, contents, writer, upfile, wdate, cnt)"
			+ "values(fb_num_seq.nextval, ?, ?, ?, ?, ?, sysdate, 0)";
			ps = con.prepareStatement(sql);
		
			ps.setInt(1, fvo.getIdx());
			ps.setString(2, fvo.getTitle());
			ps.setString(3, fvo.getContents());
			ps.setString(4, fvo.getWriter());
			ps.setString(5, fvo.getUpfile());
			
			int n = ps.executeUpdate();
			return n;
		} finally {
			close();
		}
	}
	
	/** 게시글을 수정하는 메소드 */
	public int updatePosting(FreeBoardVO fvo) throws SQLException{
		try {
			// UPDATE문 title, contents, score, upfile
			// where num으로
			con = ds.getConnection();
			String sql = "UPDATE freeboard SET title=?, contents=?, upfile=? WHERE num=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, fvo.getTitle());
			ps.setString(2, fvo.getContents());
			ps.setString(3, fvo.getUpfile());
			ps.setInt(4, fvo.getNum());
			
			int n = ps.executeUpdate();
			return n;
		} finally {
			close();
		}
	}
	
	/** 게시글을 삭제하는 메소드 */
	public int deletePosting(int num) throws SQLException{
		try{
			con=ds.getConnection();
			String sql = "delete freeboard where num="+num;
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
			String sql="SELECT count(idx) cnt FROM freeboard";
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
	public ArrayList<FreeBoardVO> selectAllPosting(int start, int end){
		try {
			con=ds.getConnection();
			String sql="select * from("
					+ " select rownum rn, a.* from("
					+ " (select * from freeboard order by num desc) a))"
					+ " where rn between "+start+" and "+end;
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			ArrayList<FreeBoardVO> arr = new ArrayList<FreeBoardVO>();
			
			while(rs.next()){
				int num = rs.getInt("num");
				int idx = rs.getInt("idx");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				String writer = rs.getString("writer");
				String upfile = rs.getString("upfile");
				Date wdate = rs.getDate("wdate");
				int cnt = rs.getShort("cnt");
				
				FreeBoardVO record = new FreeBoardVO(num, idx, title, contents, writer, upfile, wdate, cnt);
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
	
	/** 글 번호로 자유게시판 글 정보를 가져오는 메소드 */
	public FreeBoardVO getMyFBList(int num) throws SQLException{
		try {
			con = ds.getConnection();
			String sql = "SELECT * FROM freeboard WHERE num=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			List<FreeBoardVO> arr=makeList(rs);
			if(arr!=null && arr.size()==1){
				return arr.get(0);
			}
			return null;
		} finally {
			close();
		}
	}
	
	/** 자유게시판 글 목록을 가져오는 메소드 - SELECT 문을 수행 */
	public ArrayList<FreeBoardVO> selectAllPosting(){
		try{
			con=ds.getConnection();
			String sql = "select num, idx, title, contetns, writer, upfile, wdate, cnt "
					   + "from freeboard order by num desc";
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			ArrayList<FreeBoardVO> arr = new ArrayList<FreeBoardVO>();
			
			while(rs.next()){
				int num = rs.getInt("num");
				int idx = rs.getInt("idx");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				String writer = rs.getString("writer");
				String upfile = rs.getString("upfile");
				Date wdate = rs.getDate("wdate");
				int cnt = rs.getShort("cnt");
				
				FreeBoardVO record = new FreeBoardVO(num, idx, title, contents, writer, upfile, wdate, cnt);
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
	
	
	// makeList
	private List<FreeBoardVO> makeList(ResultSet rs) throws SQLException{
		List<FreeBoardVO> arr = new ArrayList<FreeBoardVO>();
		while(rs.next()){
			FreeBoardVO vo = new FreeBoardVO();
			vo.setNum(rs.getInt("num"));
			vo.setIdx(rs.getInt("idx"));
			vo.setTitle(rs.getString("title"));
			vo.setContents(rs.getString("contents"));
			vo.setWriter(rs.getString("writer"));
			vo.setUpfile(rs.getString("upfile"));
			vo.setWdate(rs.getDate("wdate"));
			vo.setCnt(rs.getInt("cnt"));
			
			arr.add(vo);
		}// while --------------------
		return arr;
	}

	// close()
	private void close() {
		try {
			if(rs != null)	rs.close();
			if(ps != null)	ps.close();
			if(con != null)	con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}// -----------------------------------------------

}
