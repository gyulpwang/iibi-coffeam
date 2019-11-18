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
			System.out.println("DS ��� ����"+ds);
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	/** ī�� �ڵ�(PK)�� ī�������� �������� �޼ҵ� */
	public CafeVO findCafeByCode(int cafeCode) throws SQLException{
		try{
			//con=DBUtil.getCon();
			con = ds.getConnection();
			
			//SELECT�� WHERE ��
			String sql = "select * from cafe where cafeCode=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, cafeCode);
			rs=ps.executeQuery();
			ArrayList<CafeVO> arr = makeList(rs);
			
			// ī������(PK) ==> ī�������� �ִٸ� 1��
			if(arr!=null && arr.size()==1){	// ī�������� �ִٸ�
				// findCafeByCode�� ��ȯŸ���� CafeVO�̱� ������ ArrayList�� ������ ��ȯ.
				CafeVO user = arr.get(0);	// �ϳ� �ִٸ� �ε����� 0
				return user;
			}else{	// ī�������� ���ٸ�
				return null;
			}
		}finally{
			close();
		}
	}
	
	/** ��ü ī�� ��� �������� �޼ҵ�[������ ���] */
	public ArrayList<CafeVO> listAllCafe() throws SQLException{
		try{
			//con=DBUtil.getCon();
			con = ds.getConnection();
			// select �� ����
			String sql = "select * from cafe order by cafeCode";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<CafeVO> arr = makeList(rs);

			return arr;
		}finally{
			close();
		}
	}
	
	/** �� ī���� �� ���ϱ� => ����¡ ó�� �� �ʿ�
	 * - SELECT���� ����*/
	public int getTotalCount(){
		try {
			con=ds.getConnection();
			String sql="SELECT count(idx) cnt FROM freeboard";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();	// ����� �������̱� ������ �ݺ���(while) ���� �ʿ� ����
			int totalCount=rs.getInt("cnt");
			return totalCount;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally{
			close();
		}
	}// getTotalCount() -------------------------
	
	/** ����¡ ó���� �Ͽ� ��ü ī�� ��� �������� �޼ҵ� */
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
	
	/** ���ο� ī�並 ����ϴ� �޼ҵ�[������ ���] */
	public int insertCafe(CafeVO cafe) throws SQLException{
		try {
			con = ds.getConnection();
			String sql = "insert into cafe(cafecode, cafename, info, site, logo, img)"
					+ " values(CAFE_CAFE_SEQ.nextval, ?, ?, ?, ?, ?)";	//insert�� �ۼ�

			ps = con.prepareStatement(sql);
			
			// ���Ķ����(?) ���� setting�ϱ�
			ps.setString(1, cafe.getCafeName());
			ps.setString(2, cafe.getInfo());
			ps.setString(3, cafe.getSite());
			ps.setString(4, cafe.getLogo());
			ps.setString(5, cafe.getImg());
			
			// db�� ����
			int n = ps.executeUpdate();

			// ��ȯ�� ��ȯ
			return n;
		} finally {
			close();
		}
	}
	
	/** ī�� ������ �����ϴ� �޼ҵ� */
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
	
	/** ī���ڵ�(PK)�� ī�� ������ �����ϴ� �޼ҵ�[������] */
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
