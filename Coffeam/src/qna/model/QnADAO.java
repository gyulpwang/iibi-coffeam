package qna.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import freeboard.model.FreeBoardVO;
import notice.model.NoticeVO;

public class QnADAO {

	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	private DataSource ds;
	
	public QnADAO() {
		// Resource Lookup
				try {
					Context ctx=new InitialContext();
					ds = (DataSource)ctx.lookup("java:comp/env/jdbc/coffeam");
					System.out.println("DS ��� ����"+ds);
				} catch (NamingException e) {
					e.printStackTrace();
				}
	}
	
	/** Ư�� �˻���� �Խñ��� ã�� �޼ҵ� */
	public List<QnAVO> findQ(String findType, String findString)
	throws SQLException{
		try{
			con = ds.getConnection();
			String colName="title";
			
			switch(findType){
				case "0" : colName="title";		break;
				case "1" : colName="writer";	break;
				case "2" : colName="wdate";		break;
				case "3" : colName="yn";		break;
			}
			// SELECT�� WHERE�� LIKE �˻�
			String sql = "select * from qna where "+colName+" like ? order by num desc";
			System.out.println(sql);
			ps = con.prepareStatement(sql);
			ps.setString(1, "%"+findString+"%");
			rs = ps.executeQuery();
			
			return makeList(rs);
		}finally{
			close();
		}
	}
	
	
	/** ��ü QnA ��� �������� �޼ҵ�[������ ���] */
	public ArrayList<QnAVO> listAllQnA() throws SQLException{
		try{
			//con=DBUtil.getCon();
			con = ds.getConnection();
			// select �� ����
			String sql = "select * from QnA order by num desc";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<QnAVO> arr = makeList(rs);

			return arr;
		}finally{
			close();
		}
	}
	
	/** �� ������ �� ���ϱ� => ����¡ ó�� �� �ʿ� - SELECT���� ����*/
	public int getTotalCount(){
		try {
			con=ds.getConnection();
			String sql="SELECT count(num) cnt FROM qna";
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
	public ArrayList<QnAVO> selectAllQnA(int start, int end){
		try {
			con=ds.getConnection();
			String sql="select * from("
					+ " select rownum rn, a.* from(("
					+ " select * from qna order by num desc) a))"
					+ " where rn between "+start+" and "+end;
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			ArrayList<QnAVO> arr = new ArrayList<QnAVO>();
			
			while(rs.next()){
				int num = rs.getInt("num");
				int idx = rs.getInt("idx");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String contents = rs.getString("contents");
				Date wdate = rs.getDate("wdate");
				int adminNo = rs.getInt("adminNo");
				String yn = rs.getString("yn");
				String answer = rs.getString("answer");
				String answerer = rs.getString("answer");
				
				QnAVO record = new QnAVO(num, idx, title, writer, contents, wdate, adminNo, yn, answer, answerer);
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
	
	/** �� ��ȣ�� QnA �� ������ �������� �޼ҵ� */
	public QnAVO getMyQAList(int num) throws SQLException{
		try {
			con = ds.getConnection();
			String sql = "SELECT * FROM qna WHERE num=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			List<QnAVO> arr=makeList(rs);
			if(arr!=null && arr.size()==1){
				return arr.get(0);
			}
			return null;
		} finally {
			close();
		}
	}
		
	/** QnA ��ȣ(PK)�� Ư�� QnA������ �������� �޼ҵ� */
	public QnAVO findQnAByNum(int num) throws SQLException{
		try{
			con = ds.getConnection();

			String sql = "select * from QnA where num=?";
			
			ps=con.prepareStatement(sql);
			ps.setInt(1, num);
			ResultSet rs2=ps.executeQuery();
			
			ArrayList<QnAVO> arr = makeList(rs2);
			
			if(rs2!=null) rs2.close();
			if(arr!=null && arr.size()==1){
				QnAVO user = arr.get(0);
				return user;
			}else{
				return null;
			}
		
		}finally{
			close();
		}
	}
	
	/** QnA�� ����ϴ� �޼ҵ�. INSERT ���� ����. DML ���� ���θ� int�� ��ȯ(�Ǵ� boolean�� ����) */
	public int insertQnA(QnAVO qna){
		try {
			con = ds.getConnection();
			
			String sql = "insert into qna(num, idx, title, writer, contents, wdate, yn) "
						+ "values(qna_num_seq.nextval, ?, ?, ?, ?, sysdate, 'n')";
			/*String sql=
			"insert into qna(num, idx, title, writer, contents, wdate, adminNo, yn, answer, answerer) "
			+ "values(QnA_NUM_SEQ.nextval, ?, ?, ?, ?, sysdate, 0, 'n', null, null)";*/
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, qna.getIdx());
			ps.setString(2, qna.getTitle());
			ps.setString(3, qna.getWriter());
			ps.setString(4, qna.getContents());
			//System.out.println(qna.toString());
			
			int n = ps.executeUpdate();
			return n;
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;	// ������ ��� �������� ��ȯ
		}finally{
			close();
		}
	}
		
	/** QnA�� �����ϴ� �޼ҵ� */
	public int deleteQnA(int num) throws SQLException{
		try{
			con=ds.getConnection();
			String sql = "delete from qna where num="+num;
			ps = con.prepareStatement(sql);
			int n = ps.executeUpdate();
			return n;
		} finally{
			close();	
		}
	}
	
	/** ������ �����ϴ� �޼ҵ� */
	public int editQ(QnAVO qvo) throws SQLException{
		try{
			con=ds.getConnection();
			String sql = "update qna set idx=?, writer=?, title=?, contents=? where num=?";
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, qvo.getIdx());
			ps.setString(2, qvo.getWriter());
			ps.setString(3, qvo.getTitle());
			ps.setString(4, qvo.getContents());
			ps.setInt(5, qvo.getNum());
			
			int n = ps.executeUpdate();
			return n;
		} finally{
			close();	
		}
	}

	/** �亯�� ����ϴ� �޼ҵ� */
	public int editA(QnAVO qvo) throws SQLException{
		try{
			con=ds.getConnection();
			String sql = "update qna set yn='y', adminno=?, answer=?, answerer=? where num=?";
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, qvo.getAdminNo());
			ps.setString(2, qvo.getAnswer());
			ps.setString(3, qvo.getAnswerer());
			ps.setInt(4, qvo.getNum());
			
			int n = ps.executeUpdate();
			return n;
		} finally{
			close();	
		}
	}
	
	/** �亯(A)�� �����ϴ� �޼ҵ�*/
/*	public int updateA(QnAVO qvo) throws SQLException{
		try{
			con=ds.getConnection();
			String sql = "update qna set answer=?, answerer=? where num=?";
			ps.setString(1, qvo.getAnswer());
			ps.setString(2, qvo.getAnswerer());
			ps.setInt(3, qvo.getNum());			
			
			ps = con.prepareStatement(sql);
			int n = ps.executeUpdate();
			return n;
		} finally{
			close();	
		}
	}
*/	
	/** A(�亯)�� �����ϴ� �޼ҵ� */
	public int deleteA(int num) throws SQLException{
		try{
			con=ds.getConnection();
			String sql = "update qna set yn='n', adminNo=null, answer=null, answerer=null where num="+num;
			ps = con.prepareStatement(sql);
			int n = ps.executeUpdate();
			return n;
		} finally{
			close();	
		}
	}
	
	
	private ArrayList<QnAVO> makeList(ResultSet rs) throws SQLException{
		
		ArrayList<QnAVO> arr = new ArrayList<QnAVO>();
		if(!rs.isClosed()){
		while(rs.next()){
			int num = rs.getInt("num");
			int idx = rs.getInt("idx");
			String title = rs.getString("title");
			String writer = rs.getString("writer");
			String contents = rs.getString("contents");
			Date wdate = rs.getDate("wdate");
			int adminNo = rs.getInt("adminNo");
			String yn = rs.getString("yn");
			String answer = rs.getString("answer");
			String answerer = rs.getString("answerer");
			
			QnAVO qna = new QnAVO(num, idx, title, writer, contents, wdate, adminNo, yn, answer, answerer);
			arr.add(qna);	
		}
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
