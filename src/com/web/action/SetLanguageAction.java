package com.web.action;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;


//改变语言环境类型，为其它语种。国际化更改当前语言环境
@Controller
@Scope("prototype")
@RequestMapping("/setLanguage")
@Transactional
public class SetLanguageAction {
	
	@RequestMapping("/setLanguage_setLang")
	public void setLang(String lang,HttpServletRequest request){
		
			request.getSession().setAttribute("language", lang);
		
	}
	

}
