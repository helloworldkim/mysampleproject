package myspring.user.test;

import static org.junit.Assert.assertEquals;

import java.util.List;

import javax.sql.DataSource;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import myspring.user.service.UserService;
import myspring.user.vo.UserVO;

//@ContextConfiguration(locations="file:src/main/java/config/beans.xml")

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:config/beans.xml")
public class UserClient {
	
	@Autowired
	ApplicationContext context;
	
	@Test @Ignore
	public void dataSourceTest() {
		DataSource ds = (DataSource) context.getBean("dataSource");
		
		try {
			System.out.println(ds.getConnection());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Autowired
	UserService service;
	
	@Test
	public void getUserTest() {
		UserVO user = service.getUser("glidong");
		System.out.println(user.getName());
		assertEquals("홍길동2", user.getName());
	}
	
	@Test @Ignore
	public void UserList() {
		List<UserVO> userList= service.getUserList();
		System.out.println(userList.size());
		for(int i=0; i<userList.size();i++) {
			System.out.println(userList.get(i).getName());
	}

	}
	@Test @Ignore
	public void updateUserTest() {
		service.updateUser(new UserVO("glidong","홍길동2","남2","서울2"));
		
		UserVO user = service.getUser("glidong");
		System.out.println(user);
	}
}
