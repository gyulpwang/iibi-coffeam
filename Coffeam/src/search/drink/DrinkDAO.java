package search.drink;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import search.cafe.CafeVO;
import search.drink.DrinkVO;

public class DrinkDAO {	
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	private DataSource ds;
	
	public DrinkDAO() {
		// Resource Lookup
		try {
			Context ctx=new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/coffeam");
			System.out.println("DS 룩업 성공"+ds);
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	/** 상품 코드(PK)로 음료정보를 가져오는 메소드 */
	public DrinkVO findDrinkByCode(int drinkCode) throws SQLException{
		try{
			con = ds.getConnection();
			
			//SELECT문 WHERE 절
			String sql = "select * from drink where drinkCode=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, drinkCode);
			rs=ps.executeQuery();
			ArrayList<DrinkVO> arr = makeList(rs);
			
			if(arr!=null && arr.size()==1){	// 상품정보가 있다면
				DrinkVO drink = arr.get(0);	// 하나 있다면 인덱스는 0
				return drink;
			}else{	// 카페정보가 없다면
				return null;
			}
		}finally{
			close();
		}
	}
	/** 전체 음료 목록 가져오는 메소드[관리자 모드] */
	public ArrayList<DrinkVO> listAllDrink() throws SQLException{
		try{
			//con=DBUtil.getCon();
			con = ds.getConnection();
			// select 문 수행
			String sql = "select * from drink order by drinkCode";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<DrinkVO> arr = makeList(rs);

			return arr;
		}finally{
			close();
		}
	}
	
	/** 베스트 메뉴 음료 목록(BEST, HIT) 가져오는 메소드 */
	public ArrayList<DrinkVO> listBHDrink() throws SQLException{
		try{
			//con=DBUtil.getCon();
			con = ds.getConnection();
			// select 문 수행
			String sql = "select * from drink where spec='HIT' OR spec='BEST' order by price";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<DrinkVO> arr = makeList(rs);

			return arr;
		}finally{
			close();
		}
	}
	
	/** 오버로딩, 카페 코드를 받아서 drink 목록을 보여주는 함수 */
	public ArrayList<DrinkVO> listAllDrink(int cafeCode) throws SQLException{
		try{
			//con=DBUtil.getCon();
			con = ds.getConnection();
			// select 문 수행
			String sql = "select * from drink where cafecode="+cafeCode+" order by drinkCode";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<DrinkVO> arr = makeList(rs);

			return arr;
		}finally{
			close();
		}
	}
	
	/** 새로운 음료를 등록하는 메소드[관리자 모드] */
	public int insertDrink(DrinkVO drink) throws SQLException{
		try {
			con = ds.getConnection();
			String sql = "insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, spec, num, beanType, rdate, updir)"
					+ " values(DRINK_DRINK_SEQ.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";	//insert문 작성

			ps = con.prepareStatement(sql);

			// 인파라미터(?) 값들 setting하기
			ps.setInt(1, drink.getCafeCode());
			ps.setString(2, drink.getDrinkName());
			ps.setString(3, drink.getImg());
			ps.setInt(4, drink.getPrice());
			ps.setInt(5, drink.getMileage());
			ps.setString(6, drink.getSpec());
			ps.setInt(7, drink.getNum());
			ps.setString(8, drink.getBeanType());
			ps.setString(9, drink.getRdate());
			ps.setString(10, drink.getUpdir());
			
			// db에 전송
			int n = ps.executeUpdate();
			// 반환값 반환
			return n;
		} finally {
			close();
		}
	}
	
	/** 음료 정보를 수정하는 메소드 */
	public int updateDrink(DrinkVO drink) throws SQLException{
		try{
			con = ds.getConnection();
			String sql = "update drink set drinkName=?, img=?, price=?, mileage=?, spec=?,"
					   + "num=?, beanType=?, rdate=?, updir=? where drinkCode=?";
			ps = con.prepareStatement(sql);
			
			ps.setString(1, drink.getDrinkName());
			ps.setString(2, drink.getImg());
			ps.setInt(3, drink.getPrice());
			ps.setInt(4, drink.getMileage());
			ps.setString(5, drink.getSpec());
			ps.setInt(6, drink.getNum());
			ps.setString(7, drink.getBeanType());
			ps.setString(8, drink.getRdate());
			ps.setString(9, drink.getUpdir());
			ps.setInt(10, drink.getDrinkCode());
			int n = ps.executeUpdate();
			System.out.println(n);
			return n;
		}finally{
			close();
		}
	}
	
	/** 음료코드(PK)로 음료 정보를 삭제하는 메소드[관리자] */
	public int deleteDrink(int drinkCode) throws SQLException{
		try{
			con = ds.getConnection();
			String sql = "delete drink where drinkCode=?";
			ps=con.prepareStatement(sql);
			System.out.println(drinkCode);
			ps.setInt(1, drinkCode);
			
			int n = ps.executeUpdate();
			return n;
		}finally{
			close();
		}
	}
	
	private ArrayList<DrinkVO> makeList(ResultSet rs) throws SQLException{
		
		ArrayList<DrinkVO> arr = new ArrayList<DrinkVO>();
		
		while(rs.next()){		
			int drinkCode = rs.getInt("drinkCode");		
			int cafeCode = rs.getInt("cafeCode");	
			String drinkName = rs.getString("drinkName");		
			String img = rs.getString("img");		
			int price = rs.getInt("price");
			int mileage = rs.getInt("mileage");
			String spec = rs.getString("spec");			
			int num = rs.getInt("num");				
			String beanType = rs.getString("beanType");		
			String rdate = rs.getString("rdate");
			String updir = rs.getString("updir");
			
			DrinkVO cinfo = new DrinkVO(drinkCode, cafeCode, drinkName, img, price, mileage, spec, num, beanType, rdate, updir);
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
