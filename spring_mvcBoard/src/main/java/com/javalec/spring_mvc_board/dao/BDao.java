package com.javalec.spring_mvc_board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;

import com.javalec.spring_mvc_board.dto.BDto;
import com.javalec.spring_mvc_board.util.Constant;

public class BDao {
	
	DataSource dataSource;
	JdbcTemplate template=null;

	public BDao() {
		 	template=Constant.template;
	}
	
	public ArrayList<BDto> list() {
		String sql = "select bId,bname,bTitle,bcontent,bdate,bhit,bgroup,bstep,bindent from mvcboard order by bgroup desc, bstep asc";
		return (ArrayList<BDto>) template.query(sql, new BeanPropertyRowMapper<BDto>(BDto.class));
	}

	public void write(final String bName, final String bTitle, final String bContent) {
		template.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				String sql = "insert into mvcboard(bid,bname,btitle,bcontent,bhit,bgroup,bstep,bindent) values(mvc_board_seq.nextval,?,?,?,0,mvc_board_seq.currval,0,0)";
				PreparedStatement pstmt =con.prepareStatement(sql);
				pstmt.setString(1, bName);
				pstmt.setString(2, bTitle);
				pstmt.setString(3, bContent);
				return pstmt;
			}
		});		
	}

	public BDto contentView(String strId) {
		//조회수 1증가
		upHit(strId);
		String sql = "select * from mvcboard where bid="+strId;
		return (BDto) template.queryForObject(sql, new BeanPropertyRowMapper<BDto>(BDto.class));
	}

	private void upHit(final String strId) {
		String sql = "update mvcboard set bHit = bhit+1 where bid=?";
		template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, Integer.parseInt(strId));
				
			}
		});
	}

	public void modify(final String bId, final String bName,final String bTitle,final String bContent) {
		String sql = "update mvcboard set bName=?,btitle=?,bcontent=? where bid=?";
		template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1,bName);
				ps.setString(2,bTitle);
				ps.setString(3,bContent);
				ps.setInt(4,Integer.parseInt(bId));
			}
		});
	}

	public void delete(final String strId) {
		String sql = "delete from mvcboard where bid=?";
		template.update(sql,new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, Integer.parseInt(strId));
			}
		});
		
	}

	public BDto reply_view(String strId) {
		
		String sql = "select * from mvcboard where bid="+strId;
		return template.queryForObject(sql, new BeanPropertyRowMapper<BDto>(BDto.class));
	
	}

	public void reply(String bId, final String bName, final String bTitle, final String bContent, final String bGroup, final String bStep,
			final String bIndent) {
		//추가된부분
		replyShpae(bGroup,bStep);
		String sql = "insert into mvcboard(bid,bname,btitle,bcontent,bgroup,bstep,bindent) values(mvc_board_seq.nextval,?,?,?,?,?,?)";
		template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, bName);
				ps.setString(2, bTitle);
				ps.setString(3, bContent);
				ps.setInt(4, Integer.parseInt(bGroup));
				ps.setInt(5, Integer.parseInt(bStep)+1);
				ps.setInt(6, Integer.parseInt(bIndent)+1);
			}
		});
	}

	private void replyShpae(final String strGroup, final String strStep) {
		
		String sql = "update mvcboard set bstep = bstep+1 where bgroup=? and bstep>?";
		template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, Integer.parseInt(strGroup));
				ps.setInt(2, Integer.parseInt(strStep));
			}
		});
	}
	

}
