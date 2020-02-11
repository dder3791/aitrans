package com.web.action;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 软件控制类
 * @author Dell
 *
 */
@Controller
@Scope("prototype")  
@RequestMapping("/software/")
@Transactional
public class SoftwareAction {

	/**
	 * 跳转选择支付方式页面
	 * 2018.03.06
	 * @return
	 */
	@RequestMapping("reChargeUI")
	public String reChargeUI(HttpServletRequest request){
		request.setAttribute("patMoney", "980");
		return  "forward:/software/ReCharge.jsp";
	}
	
	
}
