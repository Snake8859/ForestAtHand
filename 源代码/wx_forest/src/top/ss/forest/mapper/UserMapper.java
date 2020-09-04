package top.ss.forest.mapper;

import org.springframework.stereotype.Controller;

import top.ss.forest.pojo.User;

/**
 * 用户Mapepr
 * @author Administrator
 *
 */
@Controller
public interface UserMapper {

	/**
	 * 根据用户名和密码查询用户
	 * @param user
	 * @return
	 */
	public User findUserByUserNameAndPassword(User user);
	
}
