package test.mybatis;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig {
	
	private static SqlSessionFactory sqlSession;
	
	static {
			String resource = "test/mybatis/Configuration.xml";
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlSession = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
			System.out.println("객체생성 성공");
			
		} catch (Exception e) {
			System.out.println("객체생성 실패");
		}
	}

	public static SqlSessionFactory getSqlSession() {
		return sqlSession;
	}

	public static void setSqlSession(SqlSessionFactory sqlSession) {
		SqlMapConfig.sqlSession = sqlSession;
	}
	
	
}
