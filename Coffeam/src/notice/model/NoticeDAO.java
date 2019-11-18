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
			System.out.println("DS ��� ����"+ds);
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	/** ��ü ���� ��� �������� �޼ҵ�[������ ���] */
	public ArrayList<NoticeVO> listAllNotice() throws SQLException{
		try{
			//con=DBUtil.getCon();
			con = ds.getConnection();
			// select �� ����
			String sql = "select * from notice order by num desc";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<NoticeVO> arr = makeList(rs);

			return arr;
		}finally{
			close();
		}
	}
	
	/** �������׹�ȣ(PK)�� Ư�� ���������� �������� �޼ҵ� */
	public NoticeVO findNoticeByNum(int num) throws SQLException{
		try{
			//con=DBUtil.getCon();
			con = ds.getConnection();
			//SELECT�� WHERE ��
			String sql = "select * from notice where num=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, num);
			rs=ps.executeQuery();
			ArrayList<NoticeVO> arr = makeList(rs);
			// ȸ������(PK) ==> ȸ�������� �ִٸ� 1��
			if(arr!=null && arr.size()==1){	// ȸ�������� �ִٸ�
				// findNoticeByIdx�� ��ȯŸ���� NoticeVO�̱� ������ ArrayList�� ������ ��ȯ.
				NoticeVO user = arr.get(0);	// �ϳ� �ִٸ� �ε����� 0
				return user;
			}else{	// ȸ�������� ���ٸ�
				return null;
			}
		}finally{
			close();
		}
	}
	
	/** Ư�� �˻���� �Խñ��� ã�� �޼ҵ� */
	public List<NoticeVO> findNotice(String findType, String findString)
	throws SQLException{
		try{
			con = ds.getConnection();
			String colName="title";
			
			switch(findType){
				case "0" : colName="title";		break;
				case "1" : colName="wdate";		break;
			}
			// SELECT�� WHERE�� LIKE �˻�
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
	
	/** ���������� ����ϴ� �޼ҵ� */
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
	
	/** ���������� �����ϴ� �޼ҵ� */
	public int updateNotice(NoticeVO nvo) throws SQLException{
		try {
			// UPDATE�� title, contents, score, upfile
			// where num����
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
	
	/** ���������� �����ϴ� �޼ҵ� */
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

	/** �� �Խù� �� ���ϱ� => ����¡ ó�� �� �ʿ�
	 * - SELECT���� ����*/
	public int getTotalCount(){
		try {
			con=ds.getConnection();
			String sql="SELECT count(num) cnt FROM notice";
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
	
	/** ����¡ ó���� �Ͽ� �� ����� �������� �޼ҵ� */
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
	
	/** �� ��ȣ�� �������� �� ������ �������� �޼ҵ� */
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
	
	/** �������� �� ����� �������� �޼ҵ� - SELECT ���� ���� */
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
				arr.add(record);	// ArrayList�� record�� �������� �߰�
			}// while--------------
			return arr;		// ���������� ����Ǹ� ArrayList ��ȯ 
		}catch(SQLException e){
			e.printStackTrace();
			return null;	// ������ ���� ��ȯ�� �� �����Ƿ� ���� ��ȯ
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
