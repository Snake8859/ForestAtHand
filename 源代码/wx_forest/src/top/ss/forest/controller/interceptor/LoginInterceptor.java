package top.ss.forest.controller.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 登录拦截器
 * @author Administrator
 *
 */
public class LoginInterceptor implements HandlerInterceptor{

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		//获得URI
		String requestURI = request.getRequestURI();
		if(requestURI.contains("login")){
			//若是登录页面，则放行
			return true;
		}else{
			//若不是登录页面
			//获得用户名
			String username = (String) request.getSession().getAttribute("username");
			if(username!=null){
				//放行
				return true;
			}else{
				//用户未登录 不放行,去登陆
				response.sendRedirect(request.getContextPath()+"/forest/login.action");
				return false;
			}
		}
	}
	
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	

}
