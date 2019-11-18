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
			System.out.println("DS ��� ����"+ds);
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	/** ��ǰ �ڵ�(PK)�� ���������� �������� �޼ҵ� */
	public DrinkVO findDrinkByCode(int drinkCode) throws SQLException{
		try{
			con = ds.getConnection();
			
			//SELECT�� WHERE ��
			String sql = "select * from drink where drinkCode=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, drinkCode);
			rs=ps.executeQuery();
			ArrayList<DrinkVO> arr = makeList(rs);
			
			if(arr!=null && arr.size()==1){	// ��ǰ������ �ִٸ�
				DrinkVO drink = arr.get(0);	// �ϳ� �ִٸ� �ε����� 0
				return drink;
			}else{	// ī�������� ���ٸ�
				return null;
			}
		}finally{
			close();
		}
	}
	/** ��ü ���� ��� �������� �޼ҵ�[������ ���] */
	public ArrayList<DrinkVO> listAllDrink() throws SQLException{
		try{
			//con=DBUtil.getCon();
			con = ds.getConnection();
			// select �� ����
			String sql = "select * from drink order by drinkCode";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<DrinkVO> arr = makeList(rs);

			return arr;
		}finally{
			close();
		}
	}
	
	/** ����Ʈ �޴� ���� ���(BEST, HIT) �������� �޼ҵ� */
	public ArrayList<DrinkVO> listBHDrink() throws SQLException{
		try{
			//con=DBUtil.getCon();
			con = ds.getConnection();
			// select �� ����
			String sql = "select * from drink where spec='HIT' OR spec='BEST' order by price";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<DrinkVO> arr = makeList(rs);

			return arr;
		}finally{
			close();
		}
	}
	
	/** �����ε�, ī�� �ڵ带 �޾Ƽ� drink ����� �����ִ� �Լ� */
	public ArrayList<DrinkVO> listAllDrink(int cafeCode) throws SQLException{
		try{
			//con=DBUtil.getCon();
			con = ds.getConnection();
			// select �� ����
			String sql = "select * from drink where cafecode="+cafeCode+" order by drinkCode";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<DrinkVO> arr = makeList(rs);

			return arr;
		}finally{
			close();
		}
	}
	
	/** ���ο� ���Ḧ ����ϴ� �޼ҵ�[������ ���] */
	public int insertDrink(DrinkVO drink) throws SQLException{
		try {
			con = ds.getConnection();
			String sql = "insert into drink(drinkCode, cafeCode, drinkName, img, price, mileage, spec, num, beanType, rdate, updir)"
					+ " values(DRINK_DRINK_SEQ.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";	//insert�� �ۼ�

			ps = con.prepareStatement(sql);

			// ���Ķ����(?) ���� setting�ϱ�
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
			
			// db�� ����
			int n = ps.executeUpdate();
			// ��ȯ�� ��ȯ
			return n;
		} finally {
			close();
		}
	}
	
	/** ���� ������ �����ϴ� �޼ҵ� */
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
	
	/** �����ڵ�(PK)�� ���� ������ �����ϴ� �޼ҵ�[������] */
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
