package org.membe.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.member.dto.MemberDTO;

public class MemberDAOImpl implements MemberDAO {
	
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	private static MemberDAO instance = new MemberDAOImpl();
	
		//커넥션
		public Connection getConnection() {
			 String userid = "hr";
			 String userpassword = "1234";
			 String url = "jdbc:oracle:thin:@localhost:1521:xe";
			 try {
		 Class.forName("oracle.jdbc.driver.OracleDriver"); 
		 } catch(ClassNotFoundException e){
			 e.printStackTrace();
		}
		 
		 try { 
			 conn= DriverManager.getConnection(url,userid,userpassword);
			 } catch(SQLException e) {
				 e.printStackTrace(); 
			} 
		 return conn;
		}
		//메모리닫기
		private void closeConnection(Connection conn, PreparedStatement pstmt , Statement stmt, ResultSet rs) {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
				if(stmt!=null) stmt.close();
				if(rs!=null) rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}

		
	public static MemberDAO getInstance() {
			return instance;
	}
	//insert문
	@Override
	public void memInsert(MemberDTO member) {
		String sql= "insert into member values(?,?,?,?,?,?)";
		try {
			conn= getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getUserid());
			pstmt.setString(3, member.getPwd());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getPhone());
			pstmt.setInt(6, member.getAdmin());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(conn, pstmt, null, null);
		}
		
	}
	//전체리스트
	@Override
	public ArrayList<MemberDTO> memList() {
		String sql= "select * from member";
		ArrayList<MemberDTO> mList = new ArrayList<MemberDTO>();
		try {
			conn= getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				MemberDTO mDTO = new MemberDTO();
				mDTO.setName(rs.getString("name"));
				mDTO.setUserid(rs.getString("userid"));
				mDTO.setEmail(rs.getString("email"));
				mDTO.setPhone(rs.getString("phone"));
				mDTO.setPwd(rs.getString("pwd"));
				mDTO.setAdmin(rs.getInt("admin"));
				mList.add(mDTO);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(conn, pstmt, null, null);
		}
		
		return mList;
	}
	//update문
	@Override
	public int memUpdate(MemberDTO member) {
		String sql = "update member set name=?,email=?,phone=?,pwd=? where userid=?";
		int result = 0;
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getEmail());
			pstmt.setString(3, member.getPhone());
			pstmt.setString(4, member.getPwd());
			pstmt.setString(5, member.getUserid());
			result = pstmt.executeUpdate();
			return result; //수정되면 1 리턴
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(conn, pstmt, stmt, rs);
		}
		result=-1;
		return result;//수정이 비정상적으로 되면 -1리턴
	}
	//delete문
	@Override
	public void memDelete(String userid) {
		String sql = "delete from member where userid=?";
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(conn, pstmt, null, null);
		}

	}
	//userid로 Member찾는문
	@Override
	public MemberDTO findById(String userid) {
		String sql ="select * from member where userid=?";
		MemberDTO dto = new MemberDTO();
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setName(rs.getString("name"));
				dto.setUserid(rs.getString("userid"));
				dto.setPwd(rs.getString("pwd"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				dto.setAdmin(rs.getInt("admin"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(conn, pstmt, null, rs);
		}
		
		return dto;
	}

	@Override
	public int idCheck(String userid) {
		String sql = "select count(userid) from member where userid=?";
		int count=0;
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
			return count = rs.getInt(1);//실행결과가 있으면 1반환
			}
			return count; //없으면 0;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(conn, pstmt, null, rs);
		}

		return count; //-1 db오류
	}
	//로그인 확인메서드
	@Override
	public int loginCheck(String userid, String pwd) {
		int result = -1; //기본값 -1 , 2:비밀번호 틀림, 0:일반회원,1:관리자
		String sql ="select userid,pwd,admin from member where userid=?";
		
		try {
			conn = getConnection();
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs=pstmt.executeQuery();
			if(rs.next()) {//퀴리문 결과가 있음
				if(rs.getString("pwd").equals(pwd)) {
					result = rs.getInt("admin"); //0또는 1
				}else { //비밀번호 틀림
					result=2;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(conn, pstmt, null, rs);
		}
		return result;
	}
	//일반회원수
	@Override
	public int getCount() {
		String sql = "select count(userid) from member";
		int count = 0;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs=stmt.executeQuery(sql);
			if(rs.next()) {//퀴리문 결과가 있음
				return count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(conn, null, stmt, rs);
		}
		return 0;
	}

}
