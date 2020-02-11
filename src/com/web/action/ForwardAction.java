package com.web.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



//转发器，用于国际化调用静态国际化文件
@Controller
@Scope("prototype")
@RequestMapping("/forwardAction")
@Transactional
public class ForwardAction {
		
	@RequestMapping("/forward_toOffer")
	public String toOffer(){
		
		return "forward:/offer.details.jsp";
	}
	
	@RequestMapping("/forward_toLogin")
	public String toLogin(){
		
		return "forward:/login.jsp";
	}
	
	@RequestMapping("/forward_toLoginFromClient")
	public ModelAndView forward_toLoginFromClient(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("fromClient", "1");
		mav.setViewName("forward:/login.jsp");
		return mav;
	}
	
	@RequestMapping("/forward_toRegister")
	public String toRegister(){
		
		return "forward:/register.jsp";
	}
	
	@RequestMapping("/forward_toRegisterInter")
	public String toRegisterInter(){
		
		return "forward:/registerInter.jsp";
	}
	
	@RequestMapping("/forward_toRegisterCustomer")
	public String toRegisterCustomer(){
		
		return "forward:/registerCustomer.jsp";
	}
	
	@RequestMapping("/forward_toHelp")
	public String toHelp(){
		
		return "forward:/help.center.jsp";
	}
	@RequestMapping("/forward_toIndex")
	public String toIndex(RedirectAttributes model){
		return "forward:/index.jsp";
	}
	
	@RequestMapping("/forward_toTeam")
	public String toTeam(){
		
		return "forward:/team.presentation.jsp";
	}
	
	@RequestMapping("/forward_toOA")
	public String toOA(){
		
		return "forward:/OA.translation.jsp";
	}
	@RequestMapping("/forward_toQuality")
	public String toQuality(){
		
		return "forward:/quality.control.jsp";
	}
		@RequestMapping("/forward_toTranslationProcess")
	public String toTranslationProcess(){
		
		return "forward:/translation.process.jsp";
	}
	@RequestMapping("/forward_toSoftwareTranslation")
	public String toSoftwareTranslation(){
		
		return "forward:/software/software.translation.jsp";
	}
	@RequestMapping("/forward_toInstructions")
	public String toInstructions(){
		
		return "forward:/software/software.instructions.jsp";
	}
	@RequestMapping("/forward_toUse")
	public String toUse(){
		
		return "forward:/software/software.use.jsp";
	}
	@RequestMapping("/forward_toFunction")
	public String toFunction(){
		
		return "forward:/software/software.function.jsp";
	}
	@RequestMapping("/forward_toMenu")
	public String toMenu(){
		
		return "forward:/software/software.menu.jsp";
	}
	@RequestMapping("/forward_toIdentification")
	public String toIdentification(){
		
		return "forward:/identification.process.jsp";
	}
	@RequestMapping("/forward_toRegisterProcess")
	public String toRegisterProcess(){
		
		return "forward:/register.process.jsp";
	}
	@RequestMapping("/forward_toPublishProcess")
	public String toPublishProcess(){
		
		return "forward:/publish.process.jsp";
	}
	
	@RequestMapping("/forward_toInterpreterPasswordProtection")
	public String toInterpreterPasswordProtection(){
		
		return "forward:/usercenter/user.interpreter.password.protection.jsp";
	}
		
	@RequestMapping("/forward_toInterpreterModifyPassword")
	public String toInterpreterModifyPassword(){
		
		return "forward:/usercenter/user.interpreter.modify.password.jsp";
	}
	@RequestMapping("/forward_toInterpreterAgreement")
	public String toInterpreterAgreement(){
		
		return "forward:/usercenter/user.interpreter.agreement.jsp";
	}
	@RequestMapping("/forward_toCustomerShow")
	public String toCustomerShow(){
		
		return "forward:/usercenter/user.center.customer.show.jsp";
	}
	@RequestMapping("/forward_toCustomerReputation")
	public String toCustomerReputation(){
		
		return "forward:/usercenter/user.customer.reputation.jsp";
	}
		@RequestMapping("/forward_toCustomerPasswordProtection")
	public String toCustomerPasswordProtection(){
		
		return "forward:/usercenter/user.customer.password.protection.jsp";
	}
		@RequestMapping("/forward_toCustomerAgreement")
	public String toCustomerAgreement(){
		
		return "forward:/usercenter/user.customer.agreement.jsp";
}
		@RequestMapping("/forward_toRuleDescription")
	public String toRuleDescription(){
		
		return "forward:/rule.description.jsp";
	}
	@RequestMapping("/forward_toSecurityCenter")
	public String toSecurityCenter(){
		
		return "forward:/security.center.jsp";
	}
	@RequestMapping("/forward_toCustomerInstructions")
	public String toCustomerInstructions(){
		
		return "forward:/customer.instructions.jsp";
	}
	@RequestMapping("/forward_toInterpreterTips")
	public String toInterpreterTips(){
		
		return "forward:/interpreter.tips.jsp";
	}
	@RequestMapping("/forward_toInterpreterOrders")
	public String toInterpreterOrders(){
		
		return "forward:/interpreter.orders.jsp";
	}
	
	@RequestMapping("/forward_toForgetPassword")
	public String toForgetPassword(){
		
		return "forward:/usercenter/ForgetPassword.jsp";
	}
	@RequestMapping("/forward_toUserVoice")
	public String toUserVoice(){
		
		return "forward:/user.voice.jsp";
	}
	@RequestMapping("/forward_toPublicAgreement")
	public String toPublicAgreement(){
		
		return "forward:/publicAgreement.jsp";
	}
	@RequestMapping("/forward_toRemuneration")
	public String toRemuneration(){
		return "forward:/tranRemuneration.jsp";
	}
          
}
