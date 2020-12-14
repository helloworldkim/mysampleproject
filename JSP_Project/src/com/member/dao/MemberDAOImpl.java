package com.member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.member.dto.MemberDTO;

public class MemberDAOImpl implements MemberDAO{
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	private static MemberDAOImpl instance = new MemberDAOImpl();
	
	public static MemberDAOImpl getInstace() {
		return instance;
	}
	
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
	

	@Override
	public void memberInsert(MemberDTO member) {
		String sql = "insert into member values(?,?,?,?,?,?)";
		try {
			conn= getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getUserid());
			pstmt.setString(3, member.getPwd());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getPhone());
			pstmt.setInt(6, member.getAdmin());
			pstmt.executeUpdate(); //int를 반환함 성공한 갯수만큼이라서 1
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(conn, pstmt, null, null);			
		}
		
	}

	@Override
	public ArrayList<MemberDTO> memberList() {
		ArrayList<MemberDTO> memberList = new ArrayList<MemberDTO>();
		String sql = "select * from member";
		try {
			
			conn= getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				MemberDTO memberDTO = new MemberDTO();
				memberDTO.setName(rs.getString(1));
				memberDTO.setUserid(rs.getString(2));
				memberDTO.setPwd(rs.getString(3));
				memberDTO.setEmail(rs.getString(4));
				memberDTO.setPhone(rs.getString(5));
				memberDTO.setAdmin(rs.getInt(6));
				memberList.add(memberDTO);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(conn, pstmt, null, rs);			
		}
		return memberList;
	}

	@Override
	public int memberUpdate(MemberDTO member) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MemberDTO findById(String userid) {
		String sql ="select name,userid,phone,email from member where userId=?";
		MemberDTO memberDTO = new MemberDTO();
		try {
			conn= getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs= pstmt.executeQuery();
			if(rs.next()) {
				memberDTO.setName(rs.getString(1));
				memberDTO.setUserid(rs.getString(2));
				memberDTO.setPhone(rs.getString(3));
				memberDTO.setEmail(rs.getString(4));
			}
			return memberDTO;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(conn, pstmt, null, rs);
		}
		return null;
	}
	

	@Override
	public void memberDelete(String userid) {
		String sql ="delete from member where userId=?";
		try {
			conn= getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs= pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(conn, pstmt, null, rs);
		}
		
	}
	
	public int userIdCheck(String userid) {
		String sql ="select count(*) from member where userId=?";
		int result = 0;
		try {
			conn= getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs= pstmt.executeQuery();
			if(rs.next()) {
			result = rs.getInt(1);
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(conn, pstmt, null, rs);
		}
		return -1;
	}

}
