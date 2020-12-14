package com.address;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class AddressDAO {
	private static AddressDAO instace = new AddressDAO();
	
	java.sql.Connection conn;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public static AddressDAO getInstace() {
		return instace;
	}
	//Tomcat DBCP/ JNDI기법
	private Connection getConnection() throws SQLException, NamingException {
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");//기본경로
		DataSource ds = (DataSource) envCtx.lookup("jdbc/jsp"); //등록하는이름(사용자지정)
		return ds.getConnection();
	}
	
	 public AddressDAO() {
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
	}
	
	 
	 public ArrayList<ZipCodeDTO> zipcodeRead(String dong) {
			ArrayList<ZipCodeDTO> zipList = new ArrayList<ZipCodeDTO>();
			 try {
					String sql = "select * from zipcode where dong like ?";
					conn = getConnection();
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%"+dong+"%");
					rs = pstmt.executeQuery();
					while(rs.next()) {
						ZipCodeDTO zipDTO = new ZipCodeDTO();
						zipDTO.setZipcode(rs.getString(1));
						zipDTO.setSido(rs.getString(2));
						zipDTO.setGugun(rs.getString(3));
						zipDTO.setDong(rs.getString(4));
						zipDTO.setBunji(rs.getString(5));
						zipDTO.setSeq(rs.getInt(6));
						zipList.add(zipDTO);
					
					}
					
				} catch (SQLException e) {
					e.printStackTrace();
				} catch (NamingException e) {
					e.printStackTrace();
				}finally {
					closeConnection(conn,pstmt,null,rs);			
				}
			 return zipList;
			}
	 
	public void addrUpdate(Address ad) {
		try {
			String sql = "update address set name=?,zipcode=?, addr=?, tel=? where num=?";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ad.getName());
			pstmt.setString(2, ad.getZipcode());
			pstmt.setString(3, ad.getAddr());
			pstmt.setString(4, ad.getTel());
			pstmt.setInt(5, ad.getNum());
			pstmt.executeQuery(); //업데이트문 실행
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NamingException e) {
			e.printStackTrace();
		}finally {
			closeConnection(conn,pstmt,null,null);			
		}
	}
	
	public void addrInsert(Address ad) {
		try {
			String sql = "insert into address(num,name,zipcode,addr,tel) values(address_seq.nextval,?,?,?,?)";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ad.getName());
			pstmt.setString(2, ad.getZipcode());
			pstmt.setString(3, ad.getAddr());
			pstmt.setString(4, ad.getTel());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NamingException e) {
			e.printStackTrace();
		}finally {
			closeConnection(conn,pstmt,null,null);			
		}
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
	
	public ArrayList<Address> addrList(String field,String word) {
		ArrayList<Address> addList = new ArrayList<Address>();
		String sql="";
		try {
			conn = getConnection();
			
			if(word.equals("")) {//검색아닌거
				sql = "select * from address";
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				while(rs.next()) {
					Address addr = new Address();
					addr.setNum(rs.getInt(1));
					addr.setName(rs.getString(2));
					addr.setZipcode(rs.getString(3));
					addr.setAddr(rs.getString(4));
					addr.setTel(rs.getString(5));
					addList.add(addr);
				}
			}else {
				sql = "select * from address where "+field+" like ?";
				//sql = "select * from address where ?('name') like ?"; 이렇게나옴
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+word+"%");
				//pstmt.setString(1, field); 따옴표를 포함하는개념이라 안불러와짐 sql문 오류도 안남
				rs = pstmt.executeQuery();
				while(rs.next()) {
					Address addr = new Address();
					addr.setNum(rs.getInt(1));
					addr.setName(rs.getString(2));
					addr.setZipcode(rs.getString(3));
					addr.setAddr(rs.getString(4));
					addr.setTel(rs.getString(5));
					addList.add(addr);
				
			}
		}
			

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(conn, pstmt,stmt,rs);
		}
		
		return addList;
		
	}
	
	public int addrCount(String field,String word) {
		String sql="";
		int count=0;
		if(word.equals("")) {//검색아닌거
			sql = "select count(num) from address";
			try {
				conn = getConnection();
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				if(rs.next()) {
					count = rs.getInt(1);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (NamingException e) {
				e.printStackTrace();
			}finally {
				closeConnection(conn,null,stmt,rs);			
			}
			return count;
		}else {
			sql = "select count(num) from address where "+field+" like ?";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+word+"%");
				rs = pstmt.executeQuery();
				if(rs.next()) {
					count = rs.getInt(1);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (NamingException e) {
				e.printStackTrace();
			}finally {
				closeConnection(conn,pstmt,null,rs);			
			}
			return count;
		}
		
		
	}

	public Address addrView(int num){
			Address addr = new Address();
		try {
			conn = getConnection();
			String sql = "select * from address where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {

				addr.setNum(rs.getInt(1));
				addr.setName(rs.getString(2));
				addr.setZipcode(rs.getString(3));
				addr.setAddr(rs.getString(4));
				addr.setTel(rs.getString(5));

			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(conn, pstmt,null,rs);
		}
		
		return addr;
	}
	public void addrDelete(int num) {
		try {
			conn = getConnection();
			String sql = "delete from address where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
	
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(conn, pstmt,null,rs);
		}

	}

		
	
	

}
