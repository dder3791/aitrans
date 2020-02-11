package com.web.filter;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Map;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

public class EcodingFilter implements Filter{
	
	/*private String encoding ;

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException
   {
		//转换成带http协议
		HttpServletRequest request=(HttpServletRequest) req;
		HttpServletResponse response=(HttpServletResponse) resp;
		//POST中文乱码
		request.setCharacterEncoding(encoding);
		//Response输出乱码问题
		response.setContentType("text/html;charset="+encoding);
		request=new EncodingRequest(request);
		chain.doFilter(request, response);
		
	}

	class EncodingRequest extends HttpServletRequestWrapper {

		private HttpServletRequest request;
		private boolean hasEncode = false;
		public EncodingRequest(HttpServletRequest request) {
			super(request);
			this.request=request;
		}
		
		public String getParameter(String name) {
			// 通过getParameterMap方法完成
			String[] values = getParameterValues(name);
			if (values == null) {
				return null;
			}
			return values[0];
		}

		
		public String[] getParameterValues(String name) {
			// 通过getParameterMap方法完成
			Map<String, String[]> parameterMap =getParameterMap();
			String[] values = parameterMap.get(name);
			return values;
		}
		
		public Map<String, String[]> getParameterMap() {
			Map<String, String[]> parameterMap = request.getParameterMap();
			String method = request.getMethod();
			if (method.equalsIgnoreCase("post")) {
				return parameterMap;
			}

			// get提交方式 手动转码 , 这里的转码只进行一次 所以通过 hasEncode 布尔类型变量控制
			if (!hasEncode) { 
				Set<String> keys = parameterMap.keySet();
				for (String key : keys) {
					String[] values = parameterMap.get(key);
					if (values == null) {
						continue;
					}
					for (int i = 0; i < values.length; i++) {
						String value = values[i];
						// 解决get
						try {
							value = new String(value.getBytes("ISO-8859-1"),
									encoding);
							
							// values是一个地址
							values[i] = value;
						} catch (UnsupportedEncodingException e) {
							e.printStackTrace();
						}
					}
					// 一次转码完成后，设置转码状态为true
					hasEncode = true;
				}
			}
			return parameterMap;
		}
		
	
		
	}
	@Override
	public void init(FilterConfig config) throws ServletException {
		encoding = config.getInitParameter("encoding");
		
	} */
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest req , ServletResponse res ,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res ;
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
