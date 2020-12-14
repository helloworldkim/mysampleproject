package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class AdduserDAO {
private static AdduserDAO instace = new AdduserDAO();
	
	java.sql.Connection conn;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public static AdduserDAO getInstace() {
		return instace;
	}
	//Tomcat DBCP/ JNDI기법
	private Connection getConnection() throws SQLException, NamingException {
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");//기본경로
		DataSource ds = (DataSource) envCtx.lookup("jdbc/jsp"); //등록하는이름(사용자지정)
		return ds.getConnection();
	}
	
	public ArrayList<Adduser> searchUser(String id){
		String sql = "select * from adduser where id like ?";
		ArrayList<Adduser> list = new ArrayList<Adduser>();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+id+"%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Adduser add = new Adduser();
				add.setId(rs.getString(1));
				add.setPwd(rs.getString(2));
				list.add(add);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public String getJSON(String id) {
		if(id==null) id="";
		StringBuffer result = new StringBuffer("");//공백문자삽입
		result.append("{\"result\":[");
		AdduserDAO addDAO = AdduserDAO.getInstace();
		ArrayList<Adduser> List = addDAO.searchUser(id); //list를 반환하는 메서드
		for(int i=0; i<List.size(); i++) {
			result.append("[{\"value\": \""+List.get(i).getId()+"\"},");
			result.append("{\"value\": \""+List.get(i).getPwd()+"\"}]");
			if(i != List.size()-1) result.append(",");
		}
		result.append("]}");
		return result.toString();
	}
	

}
