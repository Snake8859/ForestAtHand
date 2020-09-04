package top.ss.forest.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.ss.forest.mapper.UserMapper;
import top.ss.forest.pojo.User;
import top.ss.forest.service.UserService;
/**
 * 用户service
 * @author snake
 *
 */
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	public User login(User user) {
		User isExitUser = null;
		if(user.getUsername()!=""&&user.getPassword()!=""){
			isExitUser = userMapper.findUserByUserNameAndPassword(user);
			//判断用户是否存在
			if(isExitUser !=null){
				isExitUser.setMessage("success");
			}else{
				isExitUser = new User();
				isExitUser.setMessage("fail");
			}
		}
		return isExitUser;
	}

}
