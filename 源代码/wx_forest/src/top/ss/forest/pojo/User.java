package top.ss.forest.pojo;

import java.io.Serializable;

/**
 * 用户
 * @author Snake
 *
 */
public class User {

	  /*`uid` varchar(64) NOT NULL COMMENT '用户id',
	  `username` varchar(64) NOT NULL COMMENT '用户名',
	  `password` varchar(64) NOT NULL COMMENT '密码',
	  `identity` char(1) NOT NULL COMMENT '用户身份;0管理员，1用户',*/
	private String uid;
	private String username;
	private String password;
	private char identity;
	
	//附加属性 登录凭证 默认为失败
	private String message;
	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public char getIdentity() {
		return identity;
	}
	public void setIdentity(char identity) {
		this.identity = identity;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	
	
	
	
}
