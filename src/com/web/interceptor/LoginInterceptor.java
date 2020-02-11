package com.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor{


	//在回调目标方法之前调用
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		    Object obj=request.getSession().getAttribute("clientid");
		    Object obj1=request.getSession().getAttribute("transid");
		    if(obj==null && obj1==null)
		    {
		    	request.setAttribute("message", "NotLogin");
		    	request.getRequestDispatcher("/login.jsp").forward(request, response);
		    	return false;
		    }
		    return true;
	}
	
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	
	

	

}
