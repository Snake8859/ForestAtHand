package top.ss.forest.service;

import top.ss.forest.pojo.User;

public interface UserService {

	/**
	 * 用户登录
	 * @param user
	 * @return
	 */
	public User login(User user);
	
}
