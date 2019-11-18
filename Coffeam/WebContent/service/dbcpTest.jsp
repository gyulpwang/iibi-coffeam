<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="javax.sql.*, javax.naming.*, java.sql.*" %>
<div align="center">
	<h1>DBCP Test</h1>
	<%
		// Resource를 JNDI에서 찾자. 이를 위해 필요한 것이 javax.naming.InitialContext 객체
		Context envCtx=new InitialContext();
		// [1] 먼저 WAS 서버를 찾고
		// 톰캣 서버를 찾을 때는 java:comp/env
		// WAS 서버마다 다름.
		Context ctx=(Context)envCtx.lookup("java:comp/env");
		// [2] WAS 서버에 등록된 Resource를 찾는다.
		DataSource ds=(DataSource)ctx.lookup("jdbc/coffeam");
		
		// [3] DataSource를 통해 Connection을 얻어온다.
		Connection con=ds.getConnection();
		out.println("<h2>데이터 소스 룩업 성공 : "+ds+"</h2>");
		out.println("<h2>dbcp 통해 커넥션 얻기 : "+con+"</h2>");
	
		String sql="SELECT * FROM tab";
		Statement st=con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		out.println("<hr color='red'>");
		out.println("<h3>coffeam 계정의 테이블 목록</h3>");
		while(rs.next()){
			String tname=rs.getString(1);
			String type=rs.getString(2);
			%><li><%=tname%> : <%=type %></li><%
		}
		// con.close()를 하면 커넥션이 close() 되는 것이 아니라
		// DBCP 커넥션 풀에 커넥션이 반납된다.
		if(con != null) con.close();
		if(st != null) st.close();
		if(con != null) con.close();
		
	/* 커넥션을 얻는 방법
	[1] DriverManager를 통해 얻는 방법
	[2] DataSource를 통해 얻는 방법
	=> WAS 서버(톰캣)에 설정되어 있는 데이터소스를 통해 커넥션을 얻는다.
	(WAS의 Resource 중 JNDI라는 참조 방식을 이용해 가져옴)
	
	<참고> JNDI란?(Java Naming Directory Interface)
			객체에 특정 이름을 주어 등록해놓고 해당 이름을 lookup하여 찾는 
			방식을 메소드로 선언해놓은 인터페이스. */
	
	%>
</div>
