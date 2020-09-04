package top.ss.forest.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import top.ss.forest.pojo.User;
import top.ss.forest.service.UserService;

/**
 * 用户Controller
 * @author Snake
 *
 */
@Controller
@RequestMapping(value={"user"})
public class UserController {

	//注入service
	@Autowired
	private UserService userSerivce;
	
	/**
	 * 用户登录
	 * @param user
	 * @return
	 */
	@RequestMapping(value={"login"})
	public @ResponseBody
	User login(@RequestBody User user,HttpSession session){
		//System.out.println("测试登录！！！！");
		if(user!=null){
			User isExitUser = userSerivce.login(user);
			//session 中存放username
			session.setAttribute("username",isExitUser.getUsername());
			return  isExitUser;
		}
		return null;
	}
}
