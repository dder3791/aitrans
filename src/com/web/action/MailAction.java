package com.web.action;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.service.MailService;

@Controller
@Scope("prototype")
@RequestMapping("/mail")
@Transactional
public class MailAction {
	private static Logger log = Logger.getLogger(MailAction.class);
	@Resource
	private MailService mailService;
	@ResponseBody
	@RequestMapping("createorder")
	public Map<String,Object> createOrder(){
		log.debug("访问WEB层-测试邮件生成订单-开始");
		Map<String , Object> rs = new HashMap<>();		
		rs.put("msg", mailService.createOrder());
		log.debug("访问WEB层-测试邮件生成订单-结束");
		return rs;
	}
	@RequestMapping("testpage")
	public String testPage(HttpServletRequest request){
		log.debug("访问WEB层-测试邮件生成订单-测试页面");
		return "forward:/testpage.jsp";
	}

}
