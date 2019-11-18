package search.cafe;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class CafeDAO {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	private DataSource ds;
	
	public CafeDAO() {
		// Resource Lookup
		try {
			Context ctx=new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/coffeam");
			System.out.println("DS 룩업 성공"+ds);
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	/** 카페 코드(PK)로 카페정보를 가져오는 메소드 */
	public CafeVO findCafeByCode(int cafeCode) throws SQLException{
		try{
			//con=DBUtil.getCon();
			con = ds.getConnection();
			
			//SELECT문 WHERE 절
			String sql = "select * from cafe where cafeCode=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, cafeCode);
			rs=ps.executeQuery();
			ArrayList<CafeVO> arr = makeList(rs);
			
			// 카페정보(PK) ==> 카페정보가 있다면 1개
			if(arr!=null && arr.size()==1){	// 카페정보가 있다면
				// findCafeByCode는 반환타입이 CafeVO이기 때문에 ArrayList를 꺼내서 반환.
				CafeVO user = arr.get(0);	// 하나 있다면 인덱스는 0
				return user;
			}else{	// 카페정보가 없다면
				return null;
			}
		}finally{
			close();
		}
	}
	
	/** 전체 카페 목록 가져오는 메소드[관리자 모드] */
	public ArrayList<CafeVO> listAllCafe() throws SQLException{
		try{
			//con=DBUtil.getCon();
			con = ds.getConnection();
			// select 문 수행
			String sql = "select * from cafe order by cafeCode";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<CafeVO> arr = makeList(rs);

			return arr;
		}finally{
			close();
		}
	}
	
	/** 총 카페목록 수 구하기 => 페이징 처리 시 필요
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
	
	/** 페이징 처리를 하여 전체 카페 목록 가져오는 메소드 */
	public ArrayList<CafeVO> listAllCafe(int start, int end){
		try {
			con=ds.getConnection();
			String sql="select * from("
					+ " select rownum rn, a.* from("
					+ " (select * from cafe order by cafeCode desc) a))"
					+ " where rn between "+start+" and "+end;
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			ArrayList<CafeVO> arr = new ArrayList<CafeVO>();
			
			while(rs.next()){
				int cafeCode = rs.getInt("cafeCode");
				String cafeName = rs.getString("cafeName");
				String info = rs.getString("info");
				String site = rs.getString("site");
				String logo = rs.getString("logo");
				String img = rs.getString("img");
				
				CafeVO record = new CafeVO(cafeCode, cafeName, info, site, logo, img);
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
	
	/** 새로운 카페를 등록하는 메소드[관리자 모드] */
	public int insertCafe(CafeVO cafe) throws SQLException{
		try {
			con = ds.getConnection();
			String sql = "insert into cafe(cafecode, cafename, info, site, logo, img)"
					+ " values(CAFE_CAFE_SEQ.nextval, ?, ?, ?, ?, ?)";	//insert문 작성

			ps = con.prepareStatement(sql);
			
			// 인파라미터(?) 값들 setting하기
			ps.setString(1, cafe.getCafeName());
			ps.setString(2, cafe.getInfo());
			ps.setString(3, cafe.getSite());
			ps.setString(4, cafe.getLogo());
			ps.setString(5, cafe.getImg());
			
			// db에 전송
			int n = ps.executeUpdate();

			// 반환값 반환
			return n;
		} finally {
			close();
		}
	}
	
	/** 카페 정보를 수정하는 메소드 */
	public int updateCafe(CafeVO cafe) throws SQLException{
		try{
			con = ds.getConnection();
			String sql = "update cafe set cafename=?, info=?, site=?, logo=?, img=? where cafeCode=?";
			ps = con.prepareStatement(sql);
			
			ps.setString(1, cafe.getCafeName());
			ps.setString(2, cafe.getInfo());
			ps.setString(3, cafe.getSite());
			ps.setString(4, cafe.getLogo());
			ps.setString(5, cafe.getImg());
			ps.setInt(6, cafe.getCafeCode());

			int n = ps.executeUpdate();
			return n;
		}finally{
			close();
		}
	}
	
	/** 카페코드(PK)로 카페 정보를 삭제하는 메소드[관리자] */
	public int deleteCafe(int cafeCode) throws SQLException{
		try{
			con = ds.getConnection();
			String sql = "delete from cafe where cafeCode=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, cafeCode);
			
			int n = ps.executeUpdate();
			return n;
		}finally{
			close();
		}
	}
	
	private ArrayList<CafeVO> makeList(ResultSet rs) throws SQLException{
		
		ArrayList<CafeVO> arr = new ArrayList<CafeVO>();
		
		while(rs.next()){			
			int cafeCode = rs.getInt("cafeCode");		
			String cafeName = rs.getString("cafeName");	
			String info = rs.getString("info");		
			String site = rs.getString("site");		
			String logo = rs.getString("logo");
			String img = rs.getString("img");
			
			CafeVO cinfo = new CafeVO(cafeCode, cafeName, info, site, logo, img);
			arr.add(cinfo);	
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
