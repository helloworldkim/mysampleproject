package myspring.user.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import myspring.user.vo.UserVO;

//데이터 계층이라 컴포넌트 말고 다른걸로 선언함
@Repository("userDao")
public class UserDAoImplJDBC implements UserDao {
	
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	class UserMapper implements RowMapper<UserVO>{
		public UserVO mapRow(ResultSet rs,int rowNum) throws SQLException{
			UserVO user = new UserVO();
			user.setUserId(rs.getString("userid"));
			user.setName(rs.getString("name"));
			user.setGender(rs.getString("gender"));
			user.setCity(rs.getString("city"));
			return user;
			
		}
	}
	@Override
	public void insert(UserVO user) {
		// TODO Auto-generated method stub
		String sql = "insert into users values(?,?,?,?)";
		jdbcTemplate.update(sql,user.getUserId(),user.getName(),user.getGender(),user.getCity());
		System.out.println("등록된 유저="+user.getUserId()+" "+user.getName());
	}

	@Override
	public List<UserVO> readAll() {
		String sql = "select * from users";
		List<UserVO> userList = jdbcTemplate.query(sql, new UserMapper());
		return userList;
	}

	@Override
	public void update(UserVO user) {
		// TODO Auto-generated method stub
		String sql = "update users set name=?, gender=?, city=? where userid=?";
		jdbcTemplate.update(sql,user.getName(),user.getGender(),user.getCity(),user.getUserId());
		System.out.println("갱신된 유저="+user.getUserId());
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		String sql = "delete from users where userid=?";
		jdbcTemplate.update(sql, id);
		System.out.println("삭제된 유저="+id);

	}

	@Override
	public UserVO read(String id) {
		String sql = "select * from users where userid =?";
		try {
			UserVO user = jdbcTemplate.queryForObject(sql, new Object[] {id},new UserMapper());
			return user;
		} catch (EmptyResultDataAccessException e) {
			return null;
			// TODO: handle exception
		}
		

	}

}
