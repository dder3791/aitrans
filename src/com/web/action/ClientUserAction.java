package com.web.action;

import java.awt.image.RenderedImage;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.model.Model;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.support.ModelAndViewContainer;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.domain.ClientUserD;
import com.web.domain.Translator;
import com.web.service.ClientCustomerService;
import com.web.service.ClientUserService;
import com.web.service.TranslatorService;
import com.web.util.GraphicsUtil;
import com.web.util.MD5Util;

/**
 * 前台注册登录页面
 * @author vampire
 *
 */
@Controller
@Scope("prototype")
@RequestMapping("/ClientUser")
@Transactional
public class ClientUserAction {
   
	@Resource
	private ClientUserService clientUserService;
	@Resource
	private ClientCustomerService clientCustomerService ;
	@Resource
	private TranslatorService translatorService;
	
	
	//通过前台注册页面信息传入数据库
	@RequestMapping("clientUserAction_saveUser")
	public String clientUserAction_saveUser(HttpServletRequest request,String type) throws UnknownHostException, UnsupportedEncodingException{
		String radioValues="";
		String btnSendCode="";//根据注册选项，可能是手机号，也可能是邮箱
		String password="";
		String newPassword="";
		//String email="";
		/*String accountName="";//用户名
*/		
		try {
			/*accountName=request.getParameter("accountName");//用户名
*/			radioValues=request.getParameter("radioValue");//客户或译员
			password=request.getParameter("oldpassword");//初始密码
			newPassword=MD5Util.ecode(MD5Util.ecode(password));//加密密码
			
			
			if("phone".equals(type)){//手机号注册
				btnSendCode=request.getParameter("cellphone");//电话
			}
			else if("email".equals(type)){//邮箱注册
				btnSendCode=request.getParameter("email");
			}
			
			
			if(radioValues.equals("我是客户")){//客户注册
				ClientUserD cilentUserD=new ClientUserD();
				cilentUserD.setInitialPassword(password);
				cilentUserD.setLoginStatu("1");
				
				if("phone".equals(type)){//手机号注册
					cilentUserD.setTel(btnSendCode);
				}
				else if("email".equals(type)){//邮箱注册
					cilentUserD.setEmaile(btnSendCode);
				}
				/*cilentUserD.setUserName(btnSendCode);*/
				cilentUserD.setPassword(newPassword);
				cilentUserD.setRoleName("客户");
				cilentUserD.setCertificationState(0);
				cilentUserD.setCertificationType(0);
				cilentUserD.setBalance(0);
				cilentUserD.setUserType(0);
				/*cilentUserD.setServiceLanguage("ZH");*/
				
				clientUserService.saveUser(cilentUserD);
			}else if(radioValues.equals("我是译员")){//译员注册
				
				Translator translator=new Translator();
				/*translator.setAccountName(btnSendCode);*/
				translator.setPassword(newPassword);
				translator.setInitialPassword(password);
				translator.setRoleName("译员");
				translator.setState("空闲");
				translator.setLoginStatus("1");
				translator.setPoint(0);
				
				if("phone".equals(type)){//手机号注册
					translator.setTel(btnSendCode);
				}
				else if("email".equals(type)){//邮箱注册
					translator.setEmail(btnSendCode);
				}
				
				translator.setHonor(500);
				translator.setIsVerifty(0);
				translator.setIsProofread(0);
				translator.setIsAudit(0);
				translator.setRank(10);
				translator.setIsToolUse(0);
				translator.setCertificationStatus("0");
				
				translatorService.saveTranslator(translator);
			}
			
			request.setAttribute("type", radioValues);
			request.setAttribute("cellphone", btnSendCode);
			request.setAttribute("password", password);
			return "forward:./userLogin.do";
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("message", "fail");
			return "forward:/forwardAction/forward_toRegister.do";
		}

	}
	
	
	//用户登录 
	@ResponseBody
	@RequestMapping("userLogin")
	public ModelAndView findUserLogin(HttpServletRequest request){
		ModelAndView mav=new ModelAndView();
		
		String type=request.getParameter("radioValue");//客户或译员
		
		if(request.getSession().getAttribute("language")==null || request.getSession().getAttribute("language")==""){
			request.getSession().setAttribute("language", "zh");
		};
		String cellphone="";
		String password="";
		//注册后登陆
		cellphone=request.getAttribute("cellphone")+"";
		password=request.getAttribute("password")+"";
		
		//自然登陆
		if((cellphone.equals("null") || cellphone.equals("") || cellphone==null) && (password.equals("null")|| password==null || cellphone.equals("")) ){
			cellphone=request.getParameter("cellphone");
			password=request.getParameter("password");
		}
		
		
		if(null!=cellphone && !"null".equals(cellphone) && !"".equals(cellphone) && !"null".equals(password)&& null!=password && !"".equals(cellphone) ){
			
			if("trans".equals(type) || "我是译员".equals(type)){//译员登陆
				Translator translator=new Translator();
				translator.setAccountName(cellphone);
				translator.setPassword(MD5Util.ecode(MD5Util.ecode(password)));
				Translator trans=translatorService.findTransById(translator);//查找条件，邮箱，手机号
				if(trans==null){//译员不存在
					mav.addObject("account", cellphone);
					mav.addObject("message", "账号或密码错误！");
					mav.setViewName("forward:/forwardAction/forward_toLogin.do");
				}else{//译员存在
					if(trans.getLoginStatus().equals("1")){//修改客户登陆状态1-->未登录，2--->已登录
						trans.setLoginStatus("2");
						request.getSession().setAttribute("transid", trans);
						
						mav.addObject("message", "transSuccess");//译员登陆成功
						
					}else if(trans.getLoginStatus().equals("2")){
						request.setAttribute("message", "译员已登录！");//已登录
					}
					mav.setViewName("forward:/cilentCustomer/findNeedListUI.do");
				}
			}
			else if("client".equals(type) || "我是客户".equals(type)){//客户登陆
				ClientUserD clientUserOld=new ClientUserD(cellphone, MD5Util.ecode(MD5Util.ecode(password)));
				ClientUserD clientUser=clientUserService.findUserByid(clientUserOld);//查找条件，邮箱，手机号
				if(clientUser==null){//说明客户不存在
					mav.addObject("message", "账号或密码错误！");
					mav.addObject("account", cellphone);
					mav.addObject("fromClient", "1");
					mav.setViewName("forward:/forwardAction/forward_toLogin.do");
				}else{//客户存在
					if(clientUser.getLoginStatu().equals("1")){//修改客户登陆状态1-->未登录，2--->已登录
						clientUser.setLoginStatu("2");
						request.getSession().setAttribute("clientid", clientUser);
						mav.addObject("message", "clientSuccess");
					}else if(clientUser.getLoginStatu().equals("2")){
						mav.addObject("message", "clientLogined");
					}
					mav.setViewName("forward:/forwardAction/forward_toIndex.do");
				}
			}
			else{//登录身份不明确
				mav.setViewName("forward:/forwardAction/forward_toLogin.do");
			}		
		}else{//密码或账号为null
			mav.setViewName("forward:/forwardAction/forward_toLogin.do");
		}
		return mav;
	}
	
	//判断客户信息是否登录
	@RequestMapping("clientUserAction_findUserLogin")
	public String findUserLogin(HttpServletRequest request,HttpServletResponse response,RedirectAttributes model){
		if(request.getSession().getAttribute("language")==null || request.getSession().getAttribute("language")==""){
			request.getSession().setAttribute("language", "zh");
		};
		String cellphone="";
		String password="";
		//注册后登陆
		cellphone=request.getAttribute("cellphone")+"";
		password=request.getAttribute("password")+"";
		
		//自然登陆
		if((cellphone.equals("null") || cellphone.equals("") || cellphone==null) && (password.equals("null")|| password==null || cellphone.equals("")) ){
			cellphone=request.getParameter("cellphone");
			password=request.getParameter("password");
		}
		
		
		if(null!=cellphone && !"null".equals(cellphone) && !"".equals(cellphone) && !"null".equals(password)&& null!=password && !"".equals(cellphone) ){
			ClientUserD clientUserOld=new ClientUserD(cellphone, MD5Util.ecode(MD5Util.ecode(password)));
			ClientUserD clientUser=clientUserService.findUserByid(clientUserOld);
			if(clientUser==null){//说明客户不存在
				Translator translator=new Translator();
				translator.setAccountName(cellphone);
				translator.setPassword(MD5Util.ecode(MD5Util.ecode(password)));
				Translator trans=translatorService.findTransById(translator);
				if(trans==null){//译员不存在，客户也不存在
					request.setAttribute("message", "passwordError");
					return "forward:/forwardAction/forward_toLogin.do";
				}else{//译员存在
					if(trans.getLoginStatus().equals("1")){//修改客户登陆状态1-->未登录，2--->已登录
						trans.setLoginStatus("2");
						request.getSession().setAttribute("transid", trans);
						request.setAttribute("successs", "loginSuccess");
					}else if(trans.getLoginStatus().equals("2")){
						request.setAttribute("successs", "logined");
					}
					return "forward:/cilentCustomer/findNeedListUI.do";
				}
			}else{//客户存在
				if(clientUser.getLoginStatu().equals("1")){//修改客户登陆状态1-->未登录，2--->已登录
					clientUser.setLoginStatu("2");
					request.getSession().setAttribute("clientid", clientUser);
					request.setAttribute("successs", "loginSuccess");
				}else if(clientUser.getLoginStatu().equals("2")){
					request.setAttribute("successs", "logined");
				}
			}
			return "forward:/forwardAction/forward_toIndex.do";
		}else{
			return "forward:/forwardAction/forward_toLogin.do";
		}
		
		
		
/*		if(savetime ==null){
			savetime="-1";
		}
		if(type.equals("trans")){
			Translator translator=new Translator();
			translator.setAccountName(userName);
			translator.setPassword(MD5Util.ecode(MD5Util.ecode(password)));
			Translator trans=translatorService.findTransById(translator);
			if(trans == null){
				request.setAttribute("message", "passwordError");
				request.setAttribute("message", "passwordError");
				return "forward:/forwardAction/forward_toLogin.do";
				return "forward:/login.jsp";
			}
			Translator transs=(Translator) request.getSession().getAttribute("transid");
		    String loginStatus=trans.getLoginStatus();
		if(transs!=null ){
		String loginstate=transs.getLoginStatus();
		if(!loginStatus.equals(loginstate) ){
			request.getSession().invalidate();
			request.setAttribute("message", "logined");
			request.setAttribute("message", "logined");
			return "forward:/forwardAction/forward_toLogin.do";
		}
		}
		if(loginStatus.equals("1")){
			loginStatus="2";
		}else if(loginStatus.equals("2")){
			loginStatus="1";
		}
		trans.setLoginStatus(loginStatus);
		if(!savetime.equals("-1")){
			int day = Integer.parseInt(savetime);//1|7
			 int seconds = 60*60*24*day;
			//声明cookie
			  Cookie cookie  = new Cookie("userName",userName);
			  cookie.setMaxAge(seconds);
			  //保存cookie
			  response.addCookie(cookie);
		}else{
            Cookie[] cookies = request.getCookies();
            if(cookies != null && cookies.length > 0){
                for(Cookie cookie:cookies){
                    String cookieName = cookie.getName();
                    if("userName".equals(cookieName)){
                        String val = cookie.getValue();
                        userName = val;
                    }
                }
            }
        }
		//application.setAttribute("transid", trans);
		request.getSession().setAttribute("transid", trans);
		request.setAttribute("successs", "loginSuccess");
		}else if(type.equals("client")){
			ClientUserD clientUserD=new ClientUserD(userName, MD5Util.ecode(MD5Util.ecode(password)));
			ClientUserD clientUser=clientUserService.findUserByid(clientUserD);
			if(clientUser==null){
				request.setAttribute("message", "passwordError");
				return "forward:/forwardAction/forward_toLogin.do";
				return "forward:/login.jsp";
			}
			ClientUserD client=(ClientUserD) application.getAttribute("clientid");
			ClientUserD client=(ClientUserD) request.getSession().getAttribute("clientid");
			 String clientStatus=clientUser.getLoginStatu();
			if(client!=null ){
				String clientstate=client.getLoginStatu();
				if(!clientStatus.equals(clientstate) ){
					request.getSession().invalidate();
					request.setAttribute("message", "logined");
					return "forward:/forwardAction/forward_toLogin.do";
					return "forward:/login.jsp";
				}
				}
				if(clientStatus.equals("1")){
					clientStatus="2";
				}else if(clientStatus.equals("2")){
					clientStatus="1";
				}
				clientUser.setLoginStatu(clientStatus);
				if(clientUser!=null){
					if(!savetime.equals("-1")){
					int day = Integer.parseInt(savetime);//1|7
					int seconds = 60*60*24*day;
					//声明cookie
					  Cookie cookie  = new Cookie("userName",userName);
					  cookie .setMaxAge(seconds);
					  //保存cookie
					  response.addCookie(cookie);
				}else{
					 //在这儿读取cookie,并获取所有的cookie
			            Cookie[] cookies = request.getCookies();
			            if(cookies != null && cookies.length > 0){
			                for(Cookie cookie:cookies){
			                    String cookieName = cookie.getName();
			                    if("userName".equals(cookieName)){
			                        String val = cookie.getValue();
			                        userName = val;
			                    }
			                }
			            }
			        }
			
					//application.setAttribute("clientid", clientUser);
					request.getSession().setAttribute("clientid", clientUser);
					request.setAttribute("successs", "loginSuccess");
					model.addAttribute("successs", "loginSuccess");
					request.getSession().setAttribute("successs", "loginSuccess");
					return "redirect:/forwardAction/forward_toIndex.do";
					return "forward:/index.jsp";
		      }
		}
		return "redirect:/forwardAction/forward_toIndex.do";*/
		/*return "forward:/index.jsp";*/
	}
      
	
	/**
	 * 验证手机号唯一
	 * @return
	 * 
	 * 时间：20180319  twl
	 */
	@ResponseBody
	@RequestMapping("onlyTel")
	public int onlyTel(String tel,String type){
		int count=0;
		if("client".equals(type)){//客户
			 ClientUserD clientUser=new ClientUserD();
			 clientUser.setTel(tel);
			 count =clientUserService.checkUserPhone(clientUser);
		}
		else if("trans".equals(type)){//译员
			 Translator translator=new Translator();
			 translator.setTel(tel);
			 count=translatorService.checkUserName(translator);
		}
		
		return count;
	}
	
	/**
	 * 验证账号是否重复
	 */
	 @ResponseBody
	 @RequestMapping("clientUserAction_checkUsername")
	 public int checkUsername(String tel){
	  Translator translator=new Translator();
	  ClientUserD clientUserD=new ClientUserD();
	  clientUserD.setTel(tel);
	  translator.setTel(tel);
	  int countTrans =translatorService.checkUserName(translator);
	  if(countTrans==0){
		  int countClient =clientUserService.checkUserPhone(clientUserD);
		  if(countClient==0){
			   return 0;
		  }else{
				 return countClient;
		 }
	  }
	return countTrans;
	 }
	 /**
		 * 验证邮箱是否重复
		 */
		 @ResponseBody
		 @RequestMapping("clientUserAction_checkEmail")
		 public int checkEmail(String email){
		  Translator translator=new Translator();
		  ClientUserD clientUserD=new ClientUserD();
		  clientUserD.setEmaile(email);
		  translator.setEmail(email);
		  int countTrans =translatorService.checkEmail(translator);
		  if(countTrans==0){
			  int countClient =clientUserService.checkEmail(clientUserD);
			  if(countClient==0){
				   return 0;
			  }else{
				return countClient;
				 }
		  }
		return countTrans;
		 }
	
		 
		 
	/**
	 * 邮箱唯一
	 * @param email
	 * @param type
	 * @return
	 * 
	 * 时间 20180319  twl
	 */
	@ResponseBody
	@RequestMapping("onlyEmail")	 
	public int onlyEmail(String email,String type){
		int count=0;
		if("client".equals(type)){//客户
			 ClientUserD clientUser=new ClientUserD();
			 clientUser.setEmaile(email);
			 count =clientUserService.checkEmail(clientUser);
		}
		else if("trans".equals(type)){//译员
			 Translator translator=new Translator();
			 translator.setEmail(email);
			 count=translatorService.checkEmail(translator);
		}
		
		return count;
	}
	
	/**
	 * 验证用户名	 
	 * @param accountName
	 * @return
	 */
	  @ResponseBody
	  @RequestMapping("clientUserAction_checkAccountname")
	  public int checkAccountName(String accountName){
	 Translator translator=new Translator();
	 ClientUserD clientUserD=new ClientUserD();
	 clientUserD.setUserName(accountName);
	  translator.setAccountName(accountName);
	 int countTrans =translatorService.checkAccountName(translator);
	 if(countTrans==0){
	 int countClient =clientUserService.checkUserName(clientUserD);
	 if(countClient==0){
		return 0;
	 }else{
		 return countClient;
	 }
	 }
	return countTrans;
	}	 
	//注销当前用户
	@RequestMapping("/clientUserAction_exit")
	public String exit(HttpServletRequest request,String userName,HttpServletResponse response){
		String lang= (String) request.getSession().getAttribute("language");
		request.getSession().invalidate();
		//清除浏览器缓存
		response.setDateHeader("Expires",0);
		response.setHeader("Cache-Control","no-cache");
		response.setHeader("Pragma","no-cache");
		Cookie[] cookies = request.getCookies(); 
            for(Cookie cookie : cookies){  
                if(cookie.getName().equals(userName)){  
                    cookie.setValue(null);  
                    cookie.setMaxAge(0);// 立即销毁cookie  
                    cookie.setPath("/");  
                    System.out.println("被删除的cookie名字为:"+cookie.getName());  
                    response.addCookie(cookie);  
                    break;  
                }  
            }  
    	/*	request.getSession().setAttribute("language", lang);*/
       return "forward:/forwardAction/forward_toLogin.do";
		/*return "forward:/login.jsp";*/
	} 
	/**
	 * 生成验证码
	 * @param request
	 * @param response
	 */
	@RequestMapping("/clientUserAction_getCode")
	public void clientUserAction_getCode(HttpServletRequest request,HttpServletResponse response){  
	    try {  
	        response.setHeader("Pragma","No-cache");       
	        response.setHeader("Cache-Control","no-cache");       
	        response.setDateHeader("Expires", 0);       
	        //表明生成的响应是图片       
	        response.setContentType("image/jpeg");  
	          
	        Map<String, Object> map=new GraphicsUtil().getGraphics();  
	        request.getSession().setAttribute("rand", map.get("rand"));  
	        ImageIO.write((RenderedImage) map.get("image"), "JPEG", response.getOutputStream());  
	    } catch (IOException e) {  
	        e.printStackTrace();  
	    }  
	}  
	
	/**
	 * 查询用户名是否存在
	 * @param name
	 * @param code
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/clientUserAction_queryByName")
	public Map<String, String>  queryByName(String name,String code,HttpServletRequest request) {
		String rand = (String) request.getSession().getAttribute("rand");
		Map<String , String> map = new HashMap<String, String>();
		if(rand.equalsIgnoreCase(code)){
			ClientUserD user = clientUserService.queryByName(name);
			if(user!=null){	
			map.put("message", "success");
			}else if(user==null){
				Translator translator = translatorService.queryByName(name);
				if(translator!=null){
					map.put("message", "success");
				}else {
					map.put( "message","UserExist");
				}
			}
		}else{
			map.put("message","codeError");
		}	
		return map;
	}
	
	/**
	 * 查询身份证号是否存在
	 * @param name
	 * @param uname
	 * @param cardId
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/clientUserAction_queryByCardId")
	public Map<String, String>  queryByCardId(String name,String uname,String cardId ,HttpServletRequest request) {
		Map<String , String> map = new HashMap<String, String>();
		ClientUserD user = new ClientUserD();
			user.setUserName(name);
			user.setRealName(uname);
			user.setCardId(cardId);
			ClientUserD user1 = clientUserService.queryByCardId(user);
			if(user1 != null){
				map.put("message", "success");
			}else if(user1 == null){
				Translator translator  = new Translator();
				translator.setAccountName(name);
				translator.setNameid(cardId);
				translator.setRealName(uname);
				Translator translator1 = translatorService.queryByCardId(translator);
				if(translator1!=null){
					map.put("message", "success");
				}else {
					map.put( "message","cardIdError");
				}
				}
					return map;
			}
	
	/**
	 * 修改密码
	 * @param name
	 * @param newpassword
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/clientUserAction_updatePassword")
	public Map<String, String>  updatePassword(String name,String newpassword ,HttpServletRequest request) {
		Map<String , String> map = new HashMap<String, String>();
			ClientUserD user = clientUserService.queryByName(name);
			if(user!=null){
				user.setPassword(MD5Util.ecode(MD5Util.ecode(newpassword)));
				user.setInitialPassword(newpassword);
				clientCustomerService.editCilentCustomerById(user);
				map.put("message", "success");
			}else{
				Translator translator = translatorService.queryByName(name);
				if(translator!=null){
					translator.setPassword(MD5Util.ecode(MD5Util.ecode(newpassword)));
					translator.setInitialPassword(newpassword);;
					translatorService.updatePassword(translator);
					map.put("message", "success");
				}else{
					map.put("message","error");
				}
				}
			return map;
		
			}
	
	/**
	 * 获取手机号
	 * @param name
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/clientUserAction_getIphone")
	public Map<String, String>  getIphone(String name ,HttpServletRequest request) {
		Map<String , String> map = new HashMap<String, String>();
			String ctel = clientUserService.getIphone(name);
			if(ctel !=null && ctel!=""){
				
				map.put("tel", ctel);
			
			}else if(ctel == null || ctel == ""){
				String ttel = translatorService.getIphone(name);
				if(ttel!=null && ttel!=""){
					
				map.put("tel", ttel);
				}else{
					map.put("message","NotPhone");
				}
				}
			return map;
		
		}
	
	/**
	 * 查询密保问题
	 */
	@ResponseBody
	@RequestMapping("/clientUserAction_getSecurityQuestion")
	public Map<String, String>  getSecurityQuestion(String name ,HttpServletRequest request) {
		Map<String , String> map = new HashMap<String, String>();
		String  cQuestion= clientUserService.getSecurityQuestion(name);
		if(cQuestion!=null && cQuestion!=""){
			
			map.put("securityQuestion", cQuestion);
			
		}else if(cQuestion == null || cQuestion == ""){
			String tQuestion = translatorService.getSecurityQuestion(name);
			if(tQuestion!=null && tQuestion!=""){
				
				map.put("securityQuestion", tQuestion);
				}else{
					map.put("message","Nosecurity");
				}
		}
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/clientUserAction_checkAnswer")
	public Map<String, String> checkAnswer(String securityQuestion,String answer,String name ){
		Map<String , String> map = new HashMap<String, String>();
		ClientUserD clientUser = new ClientUserD();
		clientUser.setSecurityQuestion(securityQuestion);
		clientUser.setAnswer(answer);
		clientUser.setUserName(name);
		ClientUserD c1= clientUserService.checkAnswer(clientUser);
		if(c1==null){
			Translator translator = new Translator();
			translator.setProblem(securityQuestion);
			translator.setAnswer(answer);
			translator.setAccountName(name);
			Translator t1=translatorService.checkAnswer(translator);
			if(t1==null){
				map.put( "message","answerError");
			}else {
				map.put("message", "success");
			}
		}else {
			map.put("message", "success");
		}
		return map;
	}
	
	
}
