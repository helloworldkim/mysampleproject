package com.jqueryAddress;

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

public class JAddressDAO {
private static JAddressDAO instace = new JAddressDAO();
	
	java.sql.Connection conn;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public static JAddressDAO getInstace() {
		return instace;
	}
	
	//Tomcat DBCP/ JNDI기법
	private Connection getConnection() throws SQLException, NamingException {
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup("java:comp/env");//기본경로
			DataSource ds = (DataSource) envCtx.lookup("jdbc/jsp"); //등록하는이름(사용자지정)
			return ds.getConnection();
	}
	
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
	
	public ArrayList<ZipCodeVO> getZipCode(String dong){
		ArrayList<ZipCodeVO> zipList= new ArrayList<ZipCodeVO>();
		String sql ="select * from zipcode where dong like ?";
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+dong+"%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ZipCodeVO zip = new ZipCodeVO();
				zip.setZipcode(rs.getString("zipcode"));
				zip.setSido(rs.getString("sido"));
				zip.setGugun(rs.getString("gugun"));
				zip.setDong(rs.getString("dong"));
				zip.setBunji(rs.getString("bunji"));
				zipList.add(zip);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(conn, pstmt, null, rs);
		}
		
		return zipList;
	}
	//ajax 검색때 사용되는 메서드
		public ArrayList<AddressVO> getSearchList(String field, String word){
			ArrayList<AddressVO> addrList= new ArrayList<AddressVO>();
			String sql ="select * from address where "+field+" like ?";
			try {
				conn=getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+word+"%");
				rs = pstmt.executeQuery();
				while(rs.next()) {
					AddressVO addr = new AddressVO();
					addr.setNum(rs.getInt("num"));
					addr.setName(rs.getString("name"));
					addr.setAddr(rs.getString("addr"));
					addr.setTel(rs.getString("tel"));
					addrList.add(addr);
				}
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeConnection(conn, pstmt, null, rs);
			}
			
			return addrList;

		}
	//기본 전체리스트 보는 메서드
	public ArrayList<AddressVO> addrList(){
		ArrayList<AddressVO> addrList= new ArrayList<AddressVO>();
		String sql ="select * from address";
		try {
			conn=getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				AddressVO addr = new AddressVO();
				addr.setNum(rs.getInt("num"));
				addr.setName(rs.getString("name"));
				addr.setZipcode(rs.getString("zipcode"));
				addr.setAddr(rs.getString("addr"));
				addr.setTel(rs.getString("tel"));
				addrList.add(addr);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(conn, null, stmt, rs);
		}
		
		return addrList;

	}
	public int addrCount() {
		String sql ="select count(*) from address";
		int count =0;
		try {
			conn=getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(conn, null, stmt, rs);
		}
		
		return count;
	}
	
	public int getSearchCount(String field, String word) {
		String sql ="select count(*) from address where "+field+" like ?";
		int count =0;
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+word+"%");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(conn, pstmt, null, rs);
		}
		
		return count;
	}
	
	public AddressVO addressDetail(int num) {
		
		String sql ="select * from address where num=?";
		AddressVO avo = new AddressVO();
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				avo.setName(rs.getString("name"));
				avo.setAddr(rs.getString("addr"));
				avo.setNum(rs.getInt("num"));
				avo.setTel(rs.getString("tel"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(conn, pstmt, null, rs);
		}
		
		
		return avo;
	}
	
	public void deleteList(int num) {
		String sql="delete from address where num=?";
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			pstmt.executeQuery();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(conn, pstmt, null, null);
		}

	}
	
}
