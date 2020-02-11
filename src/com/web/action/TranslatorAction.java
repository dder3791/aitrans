package com.web.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.web.domain.AppealClient;
import com.web.domain.BasicPrice;
import com.web.domain.ClientCustomerNeed;
import com.web.domain.ClientCustomerNeedTrans;
import com.web.domain.ClientUserD;
import com.web.domain.Domain;
import com.web.domain.EvaluateClient;
import com.web.domain.Exchange;
import com.web.domain.Field;
import com.web.domain.Integral;
import com.web.domain.KeyAndValueVo;
import com.web.domain.LanguagesVo;
import com.web.domain.Order;
import com.web.domain.OrderState;
import com.web.domain.Quotation;
import com.web.domain.Schedule;
import com.web.domain.TransVerify;
import com.web.domain.Translator;
import com.web.domain.TranslatorLevel;
import com.web.service.AppealClientService;
import com.web.service.BasicPriceService;
import com.web.service.ClientCustomerService;
import com.web.service.ClientCustomerTransService;
import com.web.service.ClientUserService;
import com.web.service.DomainService;
import com.web.service.EvaluateService;
import com.web.service.ExchangeService;
import com.web.service.FieldService;
import com.web.service.IntegralService;
import com.web.service.OrderService;
import com.web.service.OrderStateService;
import com.web.service.QuotationService;
import com.web.service.ScheduleService;
import com.web.service.TransVerifyService;
import com.web.service.TranslatorLevelService;
import com.web.service.TranslatorService;
import com.web.util.BankUtil;
import com.web.util.MD5Util;
import com.web.util.Page;
import com.web.util.SimpleAliDMSendMail;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * 译员信息管理
 * @author vampire
 *
 */
@Controller
@Scope("prototype")
@RequestMapping("/translator")
@Transactional
public class TranslatorAction{
	
	@Resource
	private FieldService fieldService;
	
	/*@Resource
	private TranslatorLevelService TransLevelService;*/
	 
	@Resource
	private TranslatorService translatorService;
	
	@Resource
	private TranslatorLevelService TransLevelService;
	
	@Resource
	private ClientUserService clientUserService;
	
	@Resource
    private TranslatorLevelService translatorLevelService;
	
	@Resource
	private DomainService domainService;
	
	@Resource
	private ClientCustomerService clientCustomerService;
	
	@Resource
	private ClientCustomerTransService clientCustomerTransService;
	
	@Resource
	private BasicPriceService basicPriceService;
	
	@Resource
	private ScheduleService scheduleService;
	

	/*@Resource
	private OrderService tranOrderService;*/
	
	@Resource
	private OrderService orderService;
	
	@Resource
	private OrderStateService orderStateService;
	
	@Resource
	private TransVerifyService transVerifyService;
	
	@Resource
	private IntegralService integralService;
	
	@Resource
	private ExchangeService exchangeService;
	
	@Resource
	private EvaluateService  evaluateService;
	
	@Resource
	private AppealClientService appealCilentService;
	
	@Resource
	private QuotationService quotationService;
	

	/**
	 * 修改译员基本信息
	 * @return
	 * 时间20180308  twl
	 * @throws IOException 
	 * @throws ServletException 
	 */
	@RequestMapping("translatorAction_updataTranslator")
	public String updataTranslator(HttpServletRequest req,Translator translator){
		
		//session 中的译员，
 		Translator trans=(Translator) req.getSession().getAttribute("transid");
		String sessionId="";//session中译员Id
		if(null!=trans){
			sessionId=trans.getId()+"";
		}
		String transId="";
		if(null!=translator){
			transId=translator.getId()+"";
		}
		//1  session为空，或修改译员id为空，或 session 与被修改的译员不是同一个人
		//2  session 与 被修改是同一人
		if(null!=sessionId && !"".equals(sessionId) && null!=transId && !"".equals(transId)){
			if(transId.equals(sessionId)){//2
				translatorService.updateInfo(translator);
				trans.setNickname(translator.getNickname());
				return "forward:./translatorAction_findTrans.do";
			}else{//1
				return "forward:./updateBasicInfo.do?type=update";
			}
		}else{//1
			return "forward:./updateBasicInfo.do?type=update";
		}
	}
	
	/**
	 * 修改译员基本信息
	 * @return zl
	 * @throws IOException 
	 * @throws ServletException 
	 */
	/*public String translatorAction_updataTranslator(
			@Param(value="workfile") MultipartFile workfile,
			@Param(value="proofile") MultipartFile proofile,
			@Param(value="auditfile") MultipartFile auditfile,
			HttpServletResponse response,HttpServletRequest request) throws ServletException, IOException{
		try {
			Translator transs=(Translator) request.getSession().getAttribute("transid");
			String accountName=transs.getAccountName();
			String gende=request.getParameter("gender");
			//String realName=request.getParameter("realName");
			Translator translator=new Translator();
			translator.setNickname(request.getParameter("nickname"));
			translator.setNameid(request.getParameter("nameid"));
			translator.setJob(request.getParameter("job"));
			if(gende.equals("男")){
				translator.setGender(0);
			}else if(gende.equals("女")){
				translator.setGender(1);
			}
			translator.setAddress(request.getParameter("address"));
			translator.setBirthday(request.getParameter("birth"));
			translator.setTel(request.getParameter("tel"));
			translator.setDegree(request.getParameter("degree"));
			translator.setEmail(request.getParameter("email"));
			translator.setIsToolUse(Integer.parseInt(request.getParameter("isToolUse")));
			translator.setCompanyAddress(request.getParameter("companyAddress"));
		    // 获取图片原始文件名  
			String originalFilename = workfile.getOriginalFilename();
			String prooUrlFilename = proofile.getOriginalFilename(); 
		    String auditUrlFilename = auditfile.getOriginalFilename(); 
		    String originalFile;
		    String prooUrlPath;
		    String auditUrlPath;
		    // 图片上传的相对路径（因为相对路径放到页面上就可以显示图片）  
		       if(!originalFilename.equals("")){
		    	   if(transs.getIsVerifty() != 2){
		    		   originalFile="/upload/" + accountName+"/"+"个人简历"+"/"+originalFilename;
			    	   String originalURL = request.getSession().getServletContext().getRealPath("") + originalFile;
			    	   File originalDIR=new File(originalURL);
				       if(!originalDIR.exists()) {  
				    	   originalDIR.mkdirs();  
				       }
				     // 上传图片  
				       workfile.transferTo(new File(originalURL)); 
				      //MultipartFile自带的解析方法  
					   translator.setResumeUrl(originalFile);
					   translator.setIsVerifty(1);
		    	   }
		       }
		       if(!prooUrlFilename.equals("")){
		    	   if(transs.getIsProofread() != 2){
		    		   prooUrlPath = "/upload/" + accountName+"/"+"校对资料"+"/"+prooUrlFilename; 
			    	   String prooURL = request.getSession().getServletContext().getRealPath("") + prooUrlPath; 
			    	   File prooDIR = new File(prooURL);  
				       if(!prooDIR.exists()) {  
				    	   prooDIR.mkdirs();  
				       } 
				       proofile.transferTo(new File(prooURL)); 
				       translator.setProofreadUrl(prooUrlPath);
				       translator.setIsProofread(1);
		    	   }
		       }
		       if(!auditUrlFilename.equals("")){
		    	   if(transs.getIsAudit() != 2){
		    		   auditUrlPath = "/upload/" + accountName+"/"+"审核资料"+"/"+auditUrlFilename;
			    	   String auditURL = request.getSession().getServletContext().getRealPath("") + auditUrlPath; 
			    	   File auditDIR = new File(auditURL);  
				       if(!auditDIR.exists()) {  
				    	   auditDIR.mkdirs();  
				       }
				       auditfile.transferTo(new File(auditURL)); 
				       translator.setAuditUrl(auditUrlPath);
				       translator.setIsAudit(1);
		    	   }
		       }
		    translator.setId(Integer.parseInt(request.getParameter("transId")));
		    translatorService.updataTranslator(translator);
		    transs.setNickname(request.getParameter("nickname"));
		    request.getSession().setAttribute("transid", transs);
			}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("success", "success");
		return "forward:./translatorAction_findTrans.do";
	}*/
   
	 
	 
	/**
	 * 根据id查询并展示译员基本信息
	 * @param transId
	 * @param request
	 * @return
	 */
	@RequestMapping("translatorAction_findTrans")
	public String translatorAction_findTrans(HttpServletRequest request,String page){
		Translator trans=(Translator) request.getSession().getAttribute("transid");
		int transId=trans.getId();
		request.getSession().setAttribute("transid", trans);
		Translator translator=translatorService.queryTransById(transId);
		List<Translator> translatorQ = translatorService.selectQuoLanguages(transId);
		for (Translator translator2 : translatorQ) {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("languages", translator2.getLanguages());
			map.put("id", transId);
			List<Quotation> quoByIdAndLanguage = translatorService.getQuoByIdAndLanguage(map);
			String domainsStr = "";
			for (Quotation quotation : quoByIdAndLanguage) {
				domainsStr = domainsStr + "," + quotation.getDomain();
			}
			translator2.setDomain(domainsStr.substring(1));
		}
		/*List<Translator> translatorQ=translatorService.queryByQuotation(transId);*/
		int honors=trans.getHonor();
		//获取译员注册时间
	    Date date1=trans.getRegisterTime();
	    //获取当前时间计算时间差
		Date date2=new Date();    
	     int days=differentDaysByMillisecond(date1, date2);
		if(days>365){
			honors+=10;
		 }
	    int rank=0;
		List<Order> orderList=orderService.queryTransOrder(transId);
		for (int i = 0; i < orderList.size(); i++) {
		    //获取需求id
			int clientCustomerNeedid=orderList.get(i).getClientCustomerNeedId();
			//根据订单id查询评价信息
			EvaluateClient  evaluateClient=evaluateService.queryByEvaluteOrder(orderList.get(i).getId());
			if(evaluateClient!=null){
			//获取评价分数
			float scores=Float.parseFloat(evaluateClient.getScore());
			BigDecimal score = new BigDecimal(scores).setScale(0, RoundingMode.DOWN);
			int scoress=score.intValue();
			//通过需求id查询需求信息
			ClientCustomerNeed clientCustomerNeed=clientCustomerService.findTransNeedByid(clientCustomerNeedid);
			//通过需求查询对应的字数信息
			int length=clientCustomerNeed.getLength();
			rank+=length/100+scoress/10+honors/50;
			}
		}
		Translator translators=new Translator();
		translators.setNickname(translatorService.queryTransById(transId).getNickname());
		translators.setRank(rank);
		translators.setId(transId);
		translatorService.updataTranslator(translators);
		trans.setRank(rank);
		request.getSession().setAttribute("transid", trans);
		List<Quotation> quotationTransList=quotationService.queryByTransPrice(transId);
		List<Quotation> quotationProoList=quotationService.queryByProoPrice(transId);
		List<Quotation> quotationAuditList=quotationService.queryByAuditPrice(transId);
		request.setAttribute("quotationTransList", quotationTransList);
		request.setAttribute("quotationProoList", quotationProoList);
		request.setAttribute("quotationAuditList", quotationAuditList);
		request.setAttribute("translatorQ", translatorQ);
		request.setAttribute("translators", translator);
		/*return "forward:/usercenter/user.center.interpreter.show.jsp";*/
		request.setAttribute("page", page);
		return "forward:/usercenter/user.center.interpreter.show.new.jsp";
	}
	
	/**
	 * 查询相关领域信息
	 * @return
	 */
	@ResponseBody
	@RequestMapping("translatorAction_findDomain")
	public List<Domain> translatorAction_findDomain(){
		List<Domain> domainList=domainService.queryByAll();
		return domainList;
	}
	
	/**
	 * 修改银行账户信息
	 */
    @RequestMapping("translatorAction_editBankInfo")
    public String translatorAction_editBankInfo(HttpServletRequest request){
    	Translator trans=(Translator) request.getSession().getAttribute("transid");
		Translator translators=new Translator();
	    translators.setNickname(trans.getNickname());
		translators.setRealName(request.getParameter("realName"));
		translators.setOpeningBank(request.getParameter("openingBank"));
		translators.setAccountNumber(request.getParameter("accountNumber"));
		translators.setId(trans.getId());
		translatorService.updataTranslator(translators);
    	request.setAttribute("message", "success");
    /* return "forward:/usercenter/user.center.interpreter.show.jsp";*/
    	return "forward:./translatorAction_findTrans.do";
    }
    
	/**
	 * 详细展示译员作品信息
	 * @param request
	 * @return
	 */
	@RequestMapping("translatorAction_findTransById")
	public String translatorAction_findTransById(HttpServletRequest request,int transId){
		Translator translator=translatorService.queryTransById(transId);
		String languagesStr = "";
		String domainsStr = "";
		List<LanguagesVo> transLanguages = translatorService.getTransLanguages(transId);
		for (LanguagesVo languagesVo : transLanguages) {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("id", transId);
			map.put("languages", languagesVo.getLanguageName());
			languagesStr = languagesStr + "," + languagesVo.getLanguageName();
			List<Quotation> quoList = translatorService.getQuoByIdAndLanguage(map);
			for (Quotation quotation : quoList) {
				if(domainsStr.indexOf(quotation.getDomain()) == -1){
					domainsStr = domainsStr + "," + quotation.getDomain();
				}
			}
			languagesVo.setQuoList(quoList);
		}
		if(languagesStr.length()>0){
			languagesStr = languagesStr.substring(1);
		}
		if(domainsStr.length()>0){
			domainsStr = domainsStr.substring(1); 
		}
		//获取当前译员所有的评价信息
		List<EvaluateClient> translatorEvalute=evaluateService.queryTransEvaluates(transId);
		for(int i=0;i<translatorEvalute.size();i++){
			//根据评价信息获取id
			Order order=orderService.findOrderId(translatorEvalute.get(i).getOrderId());
			ClientUserD clientUsers=clientUserService.findCustomerById(order.getClientUserId());
			request.setAttribute("realName", clientUsers.getRealName());
		}
		//对于语言进行去重
		List<Translator> translatorQ=translatorService.queryByQuotation(transId);
		List<Object> transLanguage=new ArrayList<Object>();
		HashMap<String, String> hashMap = new HashMap<String, String>();
	       for (Translator translators : translatorQ) {
	            if (translator == null) {
	                continue;
	            }
	            String  languages = translators.getLanguages();
	            if (languages != null) {
	               // String listIdStr = listId.longValue() + "";
	                String value = hashMap.get(languages);
	                if (StringUtils.isBlank(value)) { //如果value是空的  说明取到的值是第一次取到
	                    hashMap.put(languages, languages);
	                    transLanguage.add(translators); //transLanguage就是去重之后的结果
	                } else {
	                    continue;
	                }
	            }   
	      }
		long countEvaluate=evaluateService.queryEvaluateCount(transId);
		long counts=orderService.queryCompstate(transId);
		request.setAttribute("domainsStr", domainsStr);
		request.setAttribute("languagesStr", languagesStr);
		request.setAttribute("transLanguages", transLanguages);
		request.setAttribute("counts", counts);
		request.setAttribute("translatorQ", translatorQ);
		request.setAttribute("transLanguage", transLanguage);
		request.setAttribute("translator", translator);
		request.setAttribute("needId",request.getParameter("needId"));
		request.setAttribute("translatorEvalute", translatorEvalute);
		request.setAttribute("countEvaluate", countEvaluate);
		return "forward:/interpreter.show.works.details.jsp";
	}
	
	/**
	 * 向选定译员填入信息
	 * @param request
	 * @return
	 */
	@RequestMapping("translatorAction_addTransById")
	public String translatorAction_addTransById(HttpServletRequest request,int transId){
		Translator translator=translatorService.queryTransById(transId);
		request.setAttribute("translator", translator);
		return "forward:/publishNeed/publish.need.jsp";
	}
	
	/**
	 * 对译员上传所有证件信息进行验证
	 */
	@ResponseBody
	@RequestMapping("translatorAction_checkPapers")
	public Map<String,String> translatorAction_checkPapers(HttpServletRequest request,String nameid,String tel,String email,String accountNumber){
		Translator translator=new Translator();
		String result="";
		Map<String,String> map=new HashMap<String,String>();
		String type=request.getParameter("type");
		int checkTotal=0;
		if(type.equals("checkphone")){
			translator.setTel(tel);
			checkTotal=translatorService.checkUserName(translator);
		}
		if(type.equals("checkemail")){
			translator.setEmail(email);
			checkTotal=translatorService.checkEmail(translator);
		}
		if(type.equals("checknameid")){
			translator.setNameid(nameid);
			checkTotal=translatorService.checknameid(translator);
		}
		if(checkTotal==0){
			result="success";
		}else{
			result="fail";
		}
	  map.put("result", result);
	  return map;	
	}
	
	/**
	 * 根据多条件查询译员信息
	 * @param request
	 * @param pageNum
	 * @param language语言类型
	 * @param domain领域
	 * @param msg查询字段
	 * @return
	 */
	@ResponseBody
	@RequestMapping("translatorAction_queryByAll")
	public Map<String,Object> translatorAction_queryByAll(HttpServletRequest request,String pageNum,
	    String language,String domains,String msg,String levels,String degree){
		//如未制定语言，则按照英语查询
		if("null".equals(language) || "".equals(language) || language==null || "undefined".equals(language)){
			language=null;
		}else if("汉英".equals(language) || "英汉".equals(language)){
			language="%EN%";
		}else if("日汉".equals(language) || "汉日".equals(language)){
			language="%JP%";
		}else if("韩汉".equals(language) || "汉韩".equals(language)){
			language="%KOR%";
		}else if("法汉".equals(language) || "汉法".equals(language) ){
			language="%FR%";
		}else if("德汉".equals(language) || "汉德".equals(language)){
			language="%GER%";
		}
	    //如未制定领域给予初始值
		if("null".equals(domains) || "".equals(domains) || domains==null || domains.equals("0") || "undefined".equals(domains)){
			domains=null;
		}else {
			domains="%"+domains+"%";
		}
		//如未制定等级，则按5级查询
		if("null".equals(levels) || "".equals(levels) || levels==null || "undefined".equals(levels)){
			levels=null;
		}
		if("null".equals(degree) || "".equals(degree) || degree==null || "undefined".equals(degree)){
			degree=null;
		}
		//如未给予当前页面，则给予初始值
		if("null".equals(pageNum) || "".equals(pageNum) || "0".equals(pageNum) || pageNum==null || "undefined".equals(pageNum)){
			pageNum="1";
		}
		//如未制定查询字段，则全查询
		if(msg==null || msg=="" || "undefined".equals(msg)){
		  msg=null;
		}else {
	      msg="%"+msg+"%";
		}
		long totalCount;
		//构建一个page分页属性对象
		Page page =new Page();
		page.setMsg(msg);
		page.setMsgType(language);
		page.setSecondmsg(levels);
		page.setNamemsg(degree);
		if(domains == null && levels == null){
			page.setDateType(0);
		}else{
			page.setDateType(1);
		}
		page.setThirdmsg(domains);
		Map<String, Object> map = new HashMap<String, Object>();
		totalCount= translatorService.getTotalCount(page);
		if(totalCount==0){
			Page page1 = new Page(totalCount, pageNum, 8);
			page1.setMsgType(language);
			page1.setMsg(msg);
			page1.setDateType(0);
			page1.setSecondmsg(levels);
			List<Translator> translatorList=new ArrayList<Translator>();
			List<Domain> domainList=domainService.queryByAll();
			List<TranslatorLevel> translatorLevel=translatorLevelService.queryByAll();
			map.put("page", page1);
		    map.put("domainList", domainList);
		    map.put("translatorList", translatorList);
		    map.put("translatorLevel", translatorLevel);
		}else{
			Page page1 = new Page(totalCount, pageNum, 8);
			page1.setMsgType(language);
			page1.setMsg(msg);
			if(domains == null){
				page1.setDateType(0);
			}else{
				page1.setDateType(1);
			}
			page1.setSecondmsg(levels);
			page1.setThirdmsg("%"+domains+"%");
			page1.setNamemsg(degree);
			List<Translator> translatorList=translatorService.queryByAll(page1);
			/*Map<Object,Object> maps=new HashMap<Object,Object>();*/
			/*for (Translator translator : translatorList) {
				int transId=translator.getId();
				Quotation quotation=quotationService.queryByQuoted(transId);
				if(quotation!=null){
				if(quotation.getMajorTotals()!=0 ){
					translator.setMajorTotals(quotation.getMajorTotals());
				}
				if(quotation.getProoTotals()!=0){
					translator.setProoTotals(quotation.getProoTotals());
				}
				}
			}*/
			/*List<Domain> domainList=domainService.queryByAll();
			List<TranslatorLevel> translatorLevel=translatorLevelService.queryByAll();*/
			/*request.setAttribute("page", page1);*/
		    map.put("page", page1);
		    /*map.put("domainList", domainList);*/
		    map.put("translatorList", translatorList);
		    /*request.setAttribute("translatorList", translatorList);*/
		    /*map.put("translatorLevel", translatorLevel);*/
		}
		return map ;
	}
	
	/**
	 * 获取译员的总记录数
	 * @param request
	 */
	@RequestMapping("translatorAction_getTotalCount")
	public String getTotalCount(HttpServletRequest request,String msg){
		//构建一个分页信息对象
		Page page = new Page();
		page.setDateType(1);
		page.setMsgType("%%");
		page.setThirdmsg("%%");
		//判断并给予分页信息赋值
		if(msg==null || msg==""){
		 page.setMsg("%%");
		}else {
	     page.setMsg("%"+msg+"%");
	   }
		page.setSecondmsg("%%");
		//获取总记录数
		long totalCount= translatorService.getTotalCount(page);	
		//存储总记录数
		page.setMsg(msg);
		page.setTotalCount(totalCount);
		//传递page
		request.setAttribute("page", page);
		return "forward:/interpreter.show.jsp";
	} 
	/**
	 * 随机展示译员信息
	 */
	@ResponseBody
	@RequestMapping("translatorAction_findRandowTrans")
	public Map<String,Object> findRandowTrans(String msg){
		int finalCount=0;
		Map<String, Object> map = new HashMap<String, Object>();
		Page page=new Page();
		if(msg==null || msg==""){
		  page.setMsg("%%");
		}else {
		  page.setMsg("%"+msg+"%");
		 }
		page.setPageSize(3);
		page.setMsgType("%%");
		//获取总记录数
		int totalCount=(int) translatorService.getTotalCount(page);
		if(totalCount%3==0){
			finalCount = (int) (totalCount/3);
			
		}else{
			finalCount = (int) (totalCount/3 + 1) ;
		}
		//计算随机显示译员
		int startIndex=1+(int)(Math.random()*finalCount);
		page.setStartIndex(startIndex);
		page.setDateType(0);
		page.setSecondmsg("%%");
		List<Translator> translatorList=translatorService.queryByAll(page);
		map.put("translatorList", translatorList);
		return map;
		
	}
	/**
	 * 积分商城换一批
	 * @return
	 */
	@ResponseBody
	@RequestMapping("translatorAction_changeintegral")
	public Map<String,Object> translatorAction_changeintegral(){
		Map<String, Object> map = new HashMap<String, Object>();
		int finalCount=0;
		//构建一个page分页属性对象
		Page page1 =new Page();
		page1.setPageSize(3);
		long totalCount= integralService.queryByCount();
		if(totalCount%3==0){
			finalCount = (int) (totalCount/3);
			
		}else{
			finalCount = (int) (totalCount/3 + 1) ;
		}
		int startIndex=1+(int)(Math.random()*finalCount);
		page1.setStartIndex(startIndex);
		List<Integral>  IntegralLists=integralService.queryByAllIntegral(page1);
		map.put("IntegralLists", IntegralLists);
		return map;
		}
	
	/**
	 * 获取精英译员的总记录数
	 * @param request
	 */
	@RequestMapping("translatorAction_getTransCount")
	public String getTransCount(HttpServletRequest request,String msg,String language){
		//构建一个分页信息对象
		Page page = new Page();
		//判断并给予分页信息赋值
		if(msg==null || msg==""){
		 page.setMsg("%%");
		}else {
	     page.setMsg("%"+msg+"%");
	   }
	   String level="%%";
	   if(language==null || "".equals(language)){
		   page.setMsgType("%%");
	   }else{
		   page.setMsgType(""+language+"");
	   }
		page.setDateType(0);
		page.setSecondmsg(level);
		//获取总记录数
		long totalCount= translatorService.getTotalCount(page);	
		//存储总记录数
		page.setTotalCount(totalCount);
		//传递page
		request.setAttribute("page", page);
		request.setAttribute("language", language);
		return "forward:/interpreterPublic.show.jsp";
	} 
	/**
	 * 获取专家团队的总记录数
	 * @param request
	 */
	@RequestMapping("translatorAction_getProfessorCount")
	public String getProfessorCount(HttpServletRequest request,String msg,String level){
		//构建一个分页信息对象
		Page page = new Page();
		//判断并给予分页信息赋值
		if(msg==null || msg==""){
		 page.setMsg("%%");
		}else {
	     page.setMsg("%"+msg+"%");
	    }
		page.setMsgType("%EN%");
		page.setThirdmsg("%%");
		page.setSecondmsg(level);
		page.setDateType(1);
		//获取总记录数
		long totalCount= translatorService.getTotalCount(page);	
		//存储总记录数
		page.setTotalCount(totalCount);
		//传递page
		request.setAttribute("page", page);
		return "forward:/interpreterProfessor.show.jsp";
	  } 
	  //查询积分总数
   @RequestMapping("translatorAction_exchangegetCount")
   public String translatorAction_exchangegetCount(HttpServletRequest request,String msg){
	   //构建一个分页信息对象
	   Page page = new Page();
	   //判断并给予分页信息赋值
	   if(msg==null || msg==""){
		  page.setMsg("%%");
	  }else{
	     page.setMsg("%"+msg+"%");
	   }
	     page.setMsgType("%%");
		 page.setDateType(1);
	   //获取总记录数
	   long totalCount= integralService.queryByCount();	
	   //存储总记录数
	   page.setTotalCount(totalCount);
	   //传递page
	   request.setAttribute("page", page);
	   return "forward:/interpreter/user.interpreter.exchange.jsp";
	}
	 //查询积分中数量
	 @ResponseBody
	 @RequestMapping("translatorAction_queryByAllIntegral")
	 public Map<String,Object>  translatorAction_queryByAllIntegral(HttpServletRequest request,String pageNum){
	    Map<String, Object> map = new HashMap<String, Object>();
		//如未给予当前页面，则给予初始值
		if("null".equals(pageNum) || "".equals(pageNum) || "0".equals(pageNum) || pageNum==null){
		  pageNum="1";
		}
		//构建一个page分页属性对象
		 Page page =new Page();
		long totalCount= integralService.queryByCount();
		 if(totalCount==0){
			Page page1 = new Page(totalCount, pageNum, 8);
			List<Integral> IntegralList=new ArrayList<Integral>();
			request.setAttribute("IntegralList", IntegralList);
			map.put("IntegralList", IntegralList);
			map.put("page", page1);
		 }else{
			Page page1 = new Page(totalCount, pageNum, 8);
			List<Integral>  IntegralList=integralService.queryByAllIntegral(page1);
			map.put("IntegralList", IntegralList);
			map.put("page", page1);
		 }
			return map;
		}
	   
	   
	/**
	 * 查询符合条件的招标译员
	 */
	@ResponseBody
	@RequestMapping("translatorAction_queryBytransNeed")
	public Map<String,Object> translatorAction_queryBytransNeed(HttpServletRequest request,
			String domain,String languagePair,int transLevel,String procedureTypeId){
		String result="";
		Map<String,Object> map=new HashMap<String,Object>();
		Translator trans=(Translator) request.getSession().getAttribute("transid");
		int transId=trans.getId();
		//流程等于仅翻译查询翻译等级
		Translator translator=new Translator();
		if(procedureTypeId.equals("1")){
			translator.setTranlevels(transLevel);
		//流程等于仅翻译加校对查询校对等级
		}else if(procedureTypeId.equals("2")){
			translator.setProolevels(transLevel);
		//流程等于仅翻译校对审核查询审核等级
		}else if(procedureTypeId.equals("3")){
			translator.setAuditlevels(transLevel);
		}
		translator.setLanguages(languagePair);
		translator.setDomain(domain);
		translator.setId(transId);
		long total=translatorService.getCountTransNeed(translator);
		if(total>0){
			map.put("result", "success");
		}else{
			map.put("result", "fail");
		}
	return map;
	}
	
	
	/**
	 * 多条件查询所有需求信息
	 * @param request
	 * @param pageNum
	 * @param publishModel
	 * @param title
	 * @param msg
	 * @return
	 */
	@ResponseBody
	@RequestMapping("translatorAction_queryByPublishNeed")
	public Map<String,Object> translatorAction_queryByPublishNeed(HttpServletRequest request,String pageNum,
	    String publishModel,String title,String thirdmsg,String type,String acceptState,String msg){
		Translator trans=(Translator) request.getSession().getAttribute("transid");
		int transId=trans.getId();
		long totalCount=0;
		//如未制定查询字段，则全查询
		/*if(thirdmsg==null || thirdmsg==""){
			thirdmsg="%%";
		}else {
			thirdmsg="%"+thirdmsg+"%";
		}*/
		if(publishModel==null || publishModel==""){
			publishModel="%%";
		}else {
		 publishModel="%"+publishModel+"%";
		}
		if("null".equals(acceptState) || "".equals(acceptState) || "0".equals(acceptState) || acceptState==null){
			acceptState="发布中";
		}
		if("null".equals(pageNum) || "".equals(pageNum) || "0".equals(pageNum) || pageNum==null){
			pageNum="1";
		}
		if(msg==null || msg==""){
			msg="%%";
		}else{
			msg="%"+msg+"%";
		}
		//构建一个page分页属性对象
		Page page =new Page();
		page.setMsgId(transId);
		page.setMsgType(publishModel);
		page.setMsg(msg);
		Map<String, Object> map = new HashMap<String, Object>();
		if(type =="mytask" || "mytask".equals(type)){
			 totalCount= translatorService.queryTransNeedCount(page);
		}else if(type == "accept" || "accept".equals(type.trim())){
			totalCount=translatorService.queryTransNeedCount(page);
		}
		if(totalCount==0){
			Page page1 = new Page(totalCount, pageNum, 4);
			page1.setThirdmsg(thirdmsg);
			page1.setDateType(0);
			List<ClientCustomerNeed> clientCustomerNeedList=new ArrayList<ClientCustomerNeed>();
			map.put("clientCustomerNeedList", clientCustomerNeedList);
			map.put("page", page1);
		}else{
			if(type =="mytask" || "mytask".equals(type)){
				page.setMsgId(transId);
				page.setMsgType(publishModel);
				Page page1 = new Page(translatorService.queryTransNeedCount(page), pageNum, 4);
				page1.setDateType(transId);
				page1.setMsgType(publishModel);
				page1.setMsg(msg);
				List<ClientCustomerNeed> clientCustomerNeedList=clientCustomerService.findTransNeed(page1);
				map.put("clientCustomerNeedList", clientCustomerNeedList);
			    map.put("page", page1);
			    request.setAttribute("page",page1);
			}else if(type =="accept" || "accept".equals(type)){
				page.setMsgId(transId);
				page.setMsgType(publishModel);
				Page page1 = new Page(totalCount, pageNum, 4);
				page1.setDateType(transId);
				page1.setMsgType(publishModel);
				page1.setMsg(msg);
				List<ClientCustomerNeed> clientCustomerNeedList=clientCustomerService.findTransNeed(page1);
				map.put("clientCustomerNeedList", clientCustomerNeedList);
				map.put("page", page1);
				request.setAttribute("page",page1);
			}
		}
		return map ;
	}
	
	
	/**
	 * 获取所有需求的总记录数
	 * @param request
	 */
	@RequestMapping("translatorAction_getpublishNeedCount")
	public String getpublishNeedCount(HttpServletRequest request,String msg,String publishModel){
		Translator trans=(Translator) request.getSession().getAttribute("transid");
		int transId=trans.getId();
		//构建一个分页信息对象
		Page page = new Page();
		//判断并给予分页信息赋值
		if(msg==null || msg==""){
		 page.setMsg("%%");
		}else {
	     page.setMsg("%"+msg+"%");
	   }
		if(publishModel==null || publishModel==""){
			publishModel="%%";
		}else {
		 publishModel="%"+publishModel+"%";
		}
		 page.setMsgId(transId);
		 page.setMsgType(publishModel);
		//获取总记录数
		long totalCount= translatorService.queryTransNeedCount(page);
		//存储总记录数
		page.setTotalCount(totalCount);
		//传递page
		request.setAttribute("page", page);
		return "forward:/usercenter/user.interpreter.mytasks.jsp";
	} 
	/**
	 * 获取订单总记录数
	 * @param request
	 * @param msg
	 * @return
	 */
	@RequestMapping("translatorAction_getOrderCount")
	public String  translatorAction_getOrderCount(HttpServletRequest request,String msg,String timeInut){
	Translator trans=(Translator) request.getSession().getAttribute("transid");
		//构建一个分页信息对象
	Page page = new Page();
	int transId=trans.getId();
	page.setMsgType(transId+"");
	long totalCount=orderService.getTransOrderCount(page);
	Page page2=new Page(totalCount,"1",4);
	request.setAttribute("page", page2);
	
	return "forward:/interpreter/user.interpreter.order.jsp";
	}
	/**
	 * 查询所有订单
	 * @param request
	 * @param pageNum
	 * @param type
	 * @return
	 */
	@ResponseBody
	@RequestMapping("translatorAction_queryOrder")
	public  Map<String,Object>  translatorAction_queryOrder(HttpServletRequest request,String pageNum,String type
			,String timeInut){
		Translator trans=(Translator) request.getSession().getAttribute("transid");
		Map<String, Object> map = new HashMap<String, Object>();
		Page page = new Page();
		int transId=trans.getId();
		page.setMsgType(transId+"");
		page.setNamemsg(type);
		page.setSecondmsg(timeInut);
		long totalCount=orderService.getTransOrderCount(page);
		Page page2=new Page(totalCount,pageNum,4);
		page2.setMsgId(transId);
		page2.setNamemsg(type);
		page2.setSecondmsg(timeInut);
		List<Order> orderList=new ArrayList<Order>();
        if(totalCount>0){
        	orderList=orderService.queryByTransOrder(page2);
        	for (Order order : orderList) {
        		ClientCustomerNeed clientCustomerNeed=clientCustomerService.findTransNeedByid(order.getClientCustomerNeedId());
        		if(clientCustomerNeed.getTransTotal() == 0){
        			if("系统分配模式".equals(clientCustomerNeed.getPublishModel())){
            			BasicPrice basicPrice = new BasicPrice();
            			basicPrice=basicPriceService.queryByLanguage(clientCustomerNeed.getLanguagePair());
            			
            			Field domain = new Field();
            			domain=fieldService.queryById(clientCustomerNeed.getDomainId());
            			
            			TranslatorLevel translatorLevel = new TranslatorLevel();
            			translatorLevel=translatorLevelService.queryByLevel(clientCustomerNeed.getTransLevel());
            			
            			Schedule schedule = new Schedule();
            			if("特急+".equals(clientCustomerNeed.getCycle())){
            				/*addTime=Double.parseDouble(time);
            				addTime=addTime*1.1;*/
            				clientCustomerNeed.setCycle("特急");
            			}
            			schedule=scheduleService.queryBySchedule(clientCustomerNeed.getCycle());
            			
            			//只翻译     最终每千字价格 = 基础每千字价格	 *    领域系数    *   等级系数    *   周期系数   *  1
            			double transP=basicPrice.getBasicPrice()*domain.getFactor()*translatorLevel.getFactor()*schedule.getFactor();
            			
            			
            			//翻译和校对 最终每千字价格 = 基础每千字价格	 *    领域系数    *   等级系数    *   周期系数   *  1  +  （（基础每千字价格	 *    领域系数   *   周期系数） *0.5）/*等级系数
            			double veriP=transP+basicPrice.getBasicPrice()*domain.getFactor()*schedule.getFactor()*0.5/translatorLevel.getFactor();
            			
            			//翻译校对和审核  最终每千字价格 = 基础每千字价格	 *    领域系数    *   等级系数    *   周期系数   *  1  +  （（基础每千字价格	 *    领域系数   *   周期系数） *0.5）/*等级系数    +    （基础每千字价格	 *    领域系数   *   周期系数） *0.5 
            			double proofP=veriP+basicPrice.getBasicPrice()*domain.getFactor()*schedule.getFactor()*0.5;
            			
            			//流程id
            			int procedure=clientCustomerNeed.getProcedureTypeId();
            			double single = 0;
            			if(procedure==1){
            				//只翻译
            				single=transP;
            			}else if(procedure==2){
            				//翻译和校对 
            				single=veriP;
            			}else if(procedure==3){
            				//翻译校对及审核 	最终每千字价格 = 基础每千字价格	 *    领域系数    *   等级系数    *   周期系数   *  1  +  （（基础每千字价格	 *    领域系数   *   周期系数） *0.5）/*等级系数    +    （基础每千字价格	 *    领域系数   *   周期系数） *0.5 
            				single=proofP;
            			}
            			BigDecimal totalPrice = new BigDecimal(0);
            			BigDecimal length = new BigDecimal(clientCustomerNeed.getLength());
            			BigDecimal count = new BigDecimal(single);
            			if(length.intValue() < 500){
            				BigDecimal half = new BigDecimal(0.5);
            				totalPrice = count.multiply(half);
            				totalPrice = totalPrice.setScale(1, BigDecimal.ROUND_HALF_UP);
            			}else if(length.intValue() >= 500){
            				BigDecimal thousand = new BigDecimal(1000);
            				totalPrice = count.divide(thousand).multiply(length);
            				totalPrice = totalPrice.setScale(1, BigDecimal.ROUND_HALF_UP);
            			}else{
            				totalPrice = null;
            			}
            			order.setPayNumber(totalPrice.multiply(new BigDecimal(0.8)).doubleValue());
            		}else{
            			BigDecimal totalPrice = new BigDecimal(order.getPayNumber());
            			order.setPayNumber(totalPrice.multiply(new BigDecimal(0.8)).setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue());
            		}
        		}else{
        			order.setPayNumber(clientCustomerNeed.getTransTotal());
        		}
        		
			}
        }
		map.put("orderList", orderList);
		map.put("page", page2);
		//request.setAttribute("page", page2);
		return map;
	}
	
	/**
	 * 根据id查询对应需求信息
	 * @return
	 */
	@RequestMapping("translatorAction_findTransNeedById")
	public String translatorAction_findTransNeedById(int id,String pageNum,HttpServletRequest request){
		ClientCustomerNeed clientCustomerNeed=clientCustomerService.findTransNeedByid(id);
		if(clientCustomerNeed.getTransTotal() == 0){
			if("系统分配模式".equals(clientCustomerNeed.getPublishModel())){
				BasicPrice basicPrice = new BasicPrice();
				basicPrice=basicPriceService.queryByLanguage(clientCustomerNeed.getLanguagePair());
				
				Field domain = new Field();
				domain=fieldService.queryById(clientCustomerNeed.getDomainId());
				
				TranslatorLevel translatorLevel = new TranslatorLevel();
				translatorLevel=translatorLevelService.queryByLevel(clientCustomerNeed.getTransLevel());
				
				Schedule schedule = new Schedule();
				if("特急+".equals(clientCustomerNeed.getCycle())){
					/*addTime=Double.parseDouble(time);
					addTime=addTime*1.1;*/
					clientCustomerNeed.setCycle("特急");
				}
				schedule=scheduleService.queryBySchedule(clientCustomerNeed.getCycle());
				
				//只翻译     最终每千字价格 = 基础每千字价格	 *    领域系数    *   等级系数    *   周期系数   *  1
				double trans=basicPrice.getBasicPrice()*domain.getFactor()*translatorLevel.getFactor()*schedule.getFactor();
				
				
				//翻译和校对 最终每千字价格 = 基础每千字价格	 *    领域系数    *   等级系数    *   周期系数   *  1  +  （（基础每千字价格	 *    领域系数   *   周期系数） *0.5）/*等级系数
				double veri=trans+basicPrice.getBasicPrice()*domain.getFactor()*schedule.getFactor()*0.5/translatorLevel.getFactor();
				
				//翻译校对和审核  最终每千字价格 = 基础每千字价格	 *    领域系数    *   等级系数    *   周期系数   *  1  +  （（基础每千字价格	 *    领域系数   *   周期系数） *0.5）/*等级系数    +    （基础每千字价格	 *    领域系数   *   周期系数） *0.5 
				double proof=veri+basicPrice.getBasicPrice()*domain.getFactor()*schedule.getFactor()*0.5;
				
				//流程id
				int procedure=clientCustomerNeed.getProcedureTypeId();
				double single = 0;
				if(procedure==1){
					//只翻译
					single=trans;
				}else if(procedure==2){
					//翻译和校对 
					single=veri;
				}else if(procedure==3){
					//翻译校对及审核 	最终每千字价格 = 基础每千字价格	 *    领域系数    *   等级系数    *   周期系数   *  1  +  （（基础每千字价格	 *    领域系数   *   周期系数） *0.5）/*等级系数    +    （基础每千字价格	 *    领域系数   *   周期系数） *0.5 
					single=proof;
				}
				BigDecimal totalPrice = new BigDecimal(0);
				BigDecimal length = new BigDecimal(clientCustomerNeed.getLength());
				BigDecimal count = new BigDecimal(single);
				if(length.intValue() < 500){
					BigDecimal half = new BigDecimal(0.5);
					totalPrice = count.multiply(half);
					totalPrice = totalPrice.setScale(1, BigDecimal.ROUND_HALF_UP);
				}else if(length.intValue() >= 500){
					BigDecimal thousand = new BigDecimal(1000);
					totalPrice = count.divide(thousand).multiply(length);
					totalPrice = totalPrice.setScale(1, BigDecimal.ROUND_HALF_UP);
				}else{
					totalPrice = null;
				}
				clientCustomerNeed.setTotalMoney(totalPrice.multiply(new BigDecimal(0.8)).doubleValue());
			}else{
				clientCustomerNeed.setTotalMoney(new BigDecimal(clientCustomerNeed.getTotalMoney() * 0.8).setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue());
			}
		}else{
			clientCustomerNeed.setTotalMoney(clientCustomerNeed.getTransTotal());
		}
		//项目类型
		int projectTypeId=clientCustomerNeed.getClientProjectTypeId();
		String projectType="";
		if(projectTypeId==1){projectType="OA翻译";}
		if(projectTypeId==2){projectType="部分全文翻译";}
		if(projectTypeId==3){projectType="摘要翻译";}
		if(projectTypeId==4){projectType="其他";}
		if(projectTypeId==5){projectType="全文翻译";}
		request.setAttribute("projectTypeId", projectType);
		
		Field field=fieldService.queryById(clientCustomerNeed.getDomainId());
		request.setAttribute("domain", field.getField());
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("clientCustomerNeed", clientCustomerNeed);
		return "forward:/usercenter/user.interpreter.mytasks.details.jsp";
	}
	 
	/**
	 * 接受任务
	 * @param request
	 * @param needid
	 * @return
	 */
	@ResponseBody
	@RequestMapping("translatorAction_acceptTask")
	public Map<String, String> translatorAction_acceptTask(HttpServletRequest request,int needid) throws HttpException, IOException{
		    String result="";
		    Map<String,String> map=new HashMap<String,String>();
				Translator translator=new Translator();
				Translator trans=(Translator) request.getSession().getAttribute("transid");
				int id=trans.getId();
				//查询译员填入资料信息
				long infoCount=translatorService.selectTransInfo(id);
				if(infoCount>0){
			    //修改译员状态
				/* translator.setState("非空闲");
					translator.setId(id);
					translatorService.updatestate(translator);*/
					//删除需求id并重新添加
					ClientCustomerNeedTrans clientCustomerNeedTran=new ClientCustomerNeedTrans();
					synchronized (clientCustomerNeedTran){
					clientCustomerNeedTran.setClientCustomerNeedId(needid);
					clientCustomerTransService.delete(clientCustomerNeedTran);
					ClientCustomerNeedTrans clientCustomerNeedTrans=new ClientCustomerNeedTrans();
					clientCustomerNeedTrans.setTranslatorId(id);
					clientCustomerNeedTrans.setClientCustomerNeedId(needid);
					clientCustomerTransService.addtransCustomer(clientCustomerNeedTrans);
					}
					//修改需求信息状态
					ClientCustomerNeed clientCustomerNeed=new ClientCustomerNeed();
					clientCustomerNeed.setAcceptState("订单");
					clientCustomerNeed.setId(needid);
					clientCustomerService.updateAcceptState(clientCustomerNeed);
					ClientCustomerNeed clientCustomerNeeds=clientCustomerService.findTransNeedByid(needid);
					double totalMoney=clientCustomerNeeds.getTotalMoney();
					int clientUserId=clientCustomerNeeds.getClientUserId();
					String needTitle=clientCustomerNeeds.getTitle();
					int clientId=clientCustomerNeeds.getClientUserId();
					String needReference=clientCustomerNeeds.getNeedReference();
					ClientCustomerNeed  clientCustomerneed=new ClientCustomerNeed();
					clientCustomerneed.setNeedReference(needReference);
					List<ClientCustomerNeed> needReferences=clientCustomerService.queryNeedReference(clientCustomerneed);
					//根据案号进行查询并接受任务
					if(needReferences!=null){
						for (int i = 0; i < needReferences.size(); i++) {
							int needids=needReferences.get(i).getId();
							ClientCustomerNeed  clientCustomerneeds=new ClientCustomerNeed();
							clientCustomerneeds.setId(needids);
							clientCustomerneeds.setAcceptState("已删除");
							clientCustomerService.updateAcceptState(clientCustomerneeds);
						}
					}
					sendMessageAction_sendPhone(trans.getTel(), request, needTitle,trans.getAccountName(),needid+"","");
					//添加订单信息
					Order order=new Order();
					String orderNumber = UUID.randomUUID().toString().replaceAll("-", "");
					SimpleDateFormat  sdf=new  SimpleDateFormat("yyyy-MM-dd HH:mm:ss");    
					java.util.Date  date=new  java.util.Date(); 
				    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMM");
					String date1 =simpleDateFormat.format(new Date());
					ClientUserD clientUser=clientUserService.findCustomerById(clientId);
					String userName=clientUser.getUserName();
					//命名方式AY+Date+当前客户第几个项目
					Page page=new Page();
					page.setMsgType(clientUser.getId()+"");
					long clientCount=clientCustomerService.countCusNeesByCusId(page);
					if(clientCount<10){
						clientCount=0+clientCount;
					}
					String orderReference="AY"+date1+userName+clientCount;
			 		String  generatedTime=sdf.format(date);  
			 		order.setOrderNumber(orderNumber);
			 		order.setGeneratedTime(generatedTime);
			 		order.setTranslatorid(id);
			 		order.setPayNumber(totalMoney);
			 		order.setTaskStateId(2);
			 		order.setTransTime("0%");
			 		order.setOrderReference(orderReference);
			 		order.setOrderTitle(needTitle);
			 		order.setClientUserId(clientUserId);
			 		order.setClientCustomerNeedId(needid);
			 		orderService.addOrder(order);
					result="success";
					sendMessageAction_sendPhone(clientUser.getTel(), request, orderReference,trans.getAccountName(),needTitle,"receive");
				}else{
					result="faile";
				}
				map.put("result", result);
		        return map;
	}	
	/**
	    * 发送手机消息
	    * @param args
	    * @author vampire
	    * @throws IOException 
	    * @throws HttpException 
	    * @throws Exception
	    */
	    @ResponseBody
	    @RequestMapping("sendMessageAction_sendPhone")
	    public void sendMessageAction_sendPhone(String phone,HttpServletRequest request,String needTitle,String accountName,String needid,String message) throws HttpException, IOException{
	      HttpClient client = new HttpClient();
	      PostMethod post = new PostMethod("http://gbk.sms.webchinese.cn"); 
	      post.addRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=gbk");//在头文件中设置转码
	      String code="";
	      if("receive".equals(message)){//译员接单
	    	  code="尊敬的客户您好，您的项目"+needid+"已被译员"+accountName+"接受，订单案号为"+needTitle+"。了解详情拨打010-82893875";
	      }else if("reject".equals(message)){//取消任务
	    	  code="尊敬的客户您好，您的项目"+needTitle+"已被译员取消任务，项目将会过期，如有需要您可以重新发布该项目。了解详情拨打010-82893875";
	      }else if("sign".equals(message)){
	    	  code=needid;
	      }else if("newIdentity".equals(message)){//译员实名
	    	  code="Aitrans管理员您好，平台有译员正在实名制，请尽快审核!";
	    	  phone="18710132879";
	      }
	      else{
	    	  code="尊敬的译员"+accountName+",您接受到一个标题为"+needTitle+"的任务,请尽快完成任务。了解详情拨打010-82893875";
	      }
	      NameValuePair[] data ={ new NameValuePair("Uid", "zhaolei123"),new NameValuePair("Key", "1a5ca651cd2f7335d1c9"),new NameValuePair("smsMob",phone),new NameValuePair("smsText",code)};
	      post.setRequestBody(data);
	      client.executeMethod(post);
	      Header[] headers = post.getResponseHeaders();
	      int statusCode = post.getStatusCode();
	      //System.out.println("statusCode:"+statusCode);
	      for(Header h : headers){
	     // System.out.println(h.toString());
	      }
	     String result = new String(post.getResponseBodyAsString().getBytes("gbk")); 
	     post.releaseConnection();
	}   
	
	
	/**
	 * 取消任务
	 * @param request
	 * @param needid
	 * @return
	 */
	@ResponseBody
	@RequestMapping("translatorAction_cancelTask")
	public Map<String,String> translatorAction_cancelTask(HttpServletRequest request,int needid){
		String result="";
	    Map<String,String> map=new HashMap<String,String>();
	    Translator translator=new Translator();
		Translator trans=(Translator) request.getSession().getAttribute("transid");
		int id=trans.getId();
		translator.setState("空闲");
		translator.setId(id);
		translatorService.updatestate(translator);
		ClientCustomerNeed clientCustomerNeed=new ClientCustomerNeed();
		clientCustomerNeed.setAcceptState("失效");
		clientCustomerNeed.setId(needid);
		clientCustomerService.updateNeed(clientCustomerNeed);
		ClientCustomerNeedTrans clientCustomerNeedTrans=new ClientCustomerNeedTrans();
		clientCustomerNeedTrans.setTranslatorId(id);
		clientCustomerNeedTrans.setClientCustomerNeedId(needid);
		clientCustomerTransService.deleteTransNeed(clientCustomerNeedTrans);
		result="success";
		
		//通知客户任务取消
		ClientCustomerNeed clientCustomerNeeds=clientCustomerService.findTransNeedByid(needid);//取消的 项目信息
		ClientUserD clientUser=clientUserService.findCustomerById(clientCustomerNeeds.getClientUserId());//找到对应的客户
		try {
			sendMessageAction_sendPhone(clientUser.getTel(), request, clientCustomerNeeds.getTitle(),trans.getAccountName(),"","reject");
		} catch (IOException e) {
			result="error";
			e.printStackTrace();
		}
		
		map.put("result", result);
		return map;
	}
	
	
	
	
	/**
	 * 添加译员报价信息
	 * @param request
	 * @return
	 */
	@RequestMapping("translatorAction_addTransQuotation")
	public String translatorAction_addTransQuotation(HttpServletRequest request){
		Translator trans=(Translator) request.getSession().getAttribute("transid");
		int transId=trans.getId();
		String nickname=trans.getNickname();
		String worksOrigin;
		String worksTarget;
		//接受翻译报价
		String languages=request.getParameter("translanguage");
		if(languages!=null){
		/*String[] transDomain=request.getParameterValues("Transdomain");*/
		String transDomain=request.getParameter("transdomain");
		String tranPrices=request.getParameter("tranPrice");
		if(tranPrices==null || tranPrices=="" ){
			tranPrices="0";
		}
		String majorTotal=request.getParameter("majorTotal");
		if(majorTotal==null || majorTotal==""){
			majorTotal="0";
		}
		int majorTotals=Integer.parseInt(majorTotal);
		double tranPrice=Double.parseDouble(tranPrices);
		String dayTranss=request.getParameter("dayTrans");
		if(dayTranss==null || dayTranss==""){
			dayTranss="0";
		}
		int dayTrans=Integer.parseInt(dayTranss);
		worksOrigin=request.getParameter("worksOrigin");
		worksTarget=request.getParameter("worksTarget");
		/*for (String qdomain : transDomain) {*/
			Quotation quotation=new Quotation();
			quotation.setTranPrice(tranPrice);
			quotation.setMajorTotal(majorTotals);
			quotation.setDayTrans(dayTrans);
			quotation.setWorksOrigin(worksOrigin);
			quotation.setWorksTarget(worksTarget);
			quotation.setLanguages(languages);
			quotation.setDomain(transDomain);
			quotation.setId(transId);
		   quotationService.updatePrice(quotation);
			/*}*/
		}
		//接受校对报价
		String ProolanguageDomain=request.getParameter("proolanguage");
		if(ProolanguageDomain!=null){
		/*String[]  prooDomain=request.getParameterValues("proodomain");*/
		String prooDomain=request.getParameter("proodomain");
		String prooPrices=request.getParameter("prooPrice");
		if(prooPrices==null || prooPrices==""  ){
			prooPrices="0";
		}
		double prooPrice=Double.parseDouble(prooPrices);
		String prooTotal=request.getParameter("prooTotal");
		if(prooTotal==null || prooTotal=="" ){
			prooTotal="0";
		}
		int prooTotals=Integer.parseInt(prooTotal);
		String dayProo=request.getParameter("dayProo");
		if(dayProo==null || dayProo==""){
			dayProo="0";
		}
		int dayProos=Integer.parseInt(dayProo);
		worksOrigin=request.getParameter("worksOrigin");
		worksTarget=request.getParameter("worksTarget");
			/*for (String qdomain : prooDomain) {*/
				Quotation quotation2=new Quotation();
				quotation2.setProoPrice(prooPrice);
				quotation2.setProoTotal(prooTotals);
				quotation2.setDayProo(dayProos);
				quotation2.setWorksOrigin(worksOrigin);
				quotation2.setWorksTarget(worksTarget);
				quotation2.setLanguages(ProolanguageDomain);
				quotation2.setDomain(prooDomain);
				quotation2.setId(transId);
			    quotationService.updatePrice(quotation2);
			/*}*/
		}
		//接受审核报价
		String AuditlanguageDomain=request.getParameter("auditLanguage");
		if(AuditlanguageDomain!=null){
		/*String[] auditDomain=request.getParameterValues("Auditdomain");*/
		String auditDomain=request.getParameter("Auditdomain");
		String auditPrice=request.getParameter("auditPrice");
		if(auditPrice==null || auditPrice=="" ){
			auditPrice="0";
		}
		double auditPrices=Double.parseDouble(auditPrice);
		String auditTotal=request.getParameter("auditTotal");
		if(auditTotal==null || auditTotal==""){
			auditTotal="0";
		}
		int auditTotals=Integer.parseInt(auditTotal);
		String dayAudit=request.getParameter("dayAudit");
		if(dayAudit==null || dayAudit=="" ){
			dayAudit="0";
		}
		int dayAudits=Integer.parseInt(dayAudit);
		worksOrigin=request.getParameter("worksOrigin");
		worksTarget=request.getParameter("worksTarget");
			/*for (String qdomain : auditDomain) {*/
				Quotation quotation3=new Quotation();
				quotation3.setAuditPrice(auditPrices);
				quotation3.setAuditTotal(auditTotals);
				quotation3.setDayAudit(dayAudits);
				quotation3.setWorksOrigin(worksOrigin);
				quotation3.setWorksTarget(worksTarget);
				quotation3.setLanguages(AuditlanguageDomain);
				quotation3.setDomain(auditDomain);
				quotation3.setId(transId);
			    quotationService.updatePrice(quotation3);
			/*}*/
		}
		StringBuffer sb=new StringBuffer();
		Translator translator=new Translator();
		Translator translatorlanguage=translatorService.queryTransById(transId);
		List<Quotation> quotations=quotationService.queryTransQuotation(transId);
		String domainTrans="";
		for (int i = 0; i < quotations.size(); i++) {
			String domains=quotations.get(i).getDomain();
			if(i<(quotations.size()-1)){
				if(!quotations.contains(domains)){
				    domainTrans+=domains+",";
				}
			}else{
				if(!quotations.contains(domains)){
					domainTrans+=domains;
				}
			}
		}
		translator.setDomain(domainTrans);
		String language=translatorlanguage.getLanguage();
		if(language==null ||"".equals(language)){
		if("英汉".equals(languages) || languages.equals("汉英")){
			languages="EN";
		} 
		if("日汉".equals(languages) || "汉日".equals(languages)){
			languages="JP";
		}
		if("德汉".equals(languages) || "汉德".equals(languages)){
			languages="GER";
		}
		if("韩汉".equals(languages) || "汉韩".equals(languages)){
			languages="KOR";
		}
		if("法汉".equals(languages) || "汉法".equals(languages)){
			languages="FR";
		}
		translator.setLanguage(languages);
		}
		
		translator.setNickname(nickname);
		translator.setId(transId);
		translatorService.updataTranslator(translator);
		request.setAttribute("success", "success");
		return "forward:./translatorAction_findTrans.do";
	}
	
	
	//跳转添加个人报价信息
	@RequestMapping("translatorAction_updateQuotations")
	public String  updateQuotation(HttpServletRequest request){
		Translator trans=(Translator) request.getSession().getAttribute("transid");
		int transId=trans.getId();
		Translator translator=translatorService.queryTransById(transId);
		List<Translator> translatorQ=translatorService.queryByQuotation(transId);
		List<Quotation> quotationTransList=quotationService.queryByTransPrice(transId);
		List<Quotation> quotationProoList=quotationService.queryByProoPrice(transId);
		List<Quotation> quotationAuditList=quotationService.queryByAuditPrice(transId);
		request.setAttribute("quotationTransList", quotationTransList);
		request.setAttribute("quotationProoList", quotationProoList);
		request.setAttribute("quotationAuditList", quotationAuditList);
		request.setAttribute("translatorQ", translatorQ);
		request.setAttribute("translators", translator);
		return "forward:/usercenter/user.center.interpreterQuotation.jsp";
		
	}
	/**
	 * 修改译员报价
	 * @param request
	 * @return
	 */
	@RequestMapping("translatorAction_updateTransQuotation")
	public String translatorAction_updateTransQuotation(HttpServletRequest request){
		Translator trans=(Translator) request.getSession().getAttribute("transid");
		int transId=trans.getId();
		String nickname=trans.getNickname();
		/*String ids=request.getParameter("id");
		int id=Integer.parseInt(ids);*/
		String languages=request.getParameter("tranLanguage");
		String domain=request.getParameter("transDomain");
		/*String[] param = request.getParameterValues("domain");*/
		String tranPrices=request.getParameter("tranPrice");
		double tranPrice=Double.parseDouble(tranPrices);
		String prooPrices=request.getParameter("prooPrice");
		if(prooPrices==null || prooPrices==""){
			prooPrices="0";
		}
		double prooPrice=Double.parseDouble(prooPrices);
		String dayTranss=request.getParameter("dayTrans");
		if(dayTranss==null || dayTranss==""){
			dayTranss="0";
		}
		int dayTrans=Integer.parseInt(dayTranss);
		String dayProos=request.getParameter("dayProo");
		if(dayProos==null || dayProos==""){
			dayProos="0";
		}
		int dayProo=Integer.parseInt(dayProos);
		String dayAudits=request.getParameter("dayAudit");
		if(dayAudits==null || dayAudits==""){
			dayAudits="0";
		}
		int dayAudit=Integer.parseInt(dayAudits);
		String majorTotals=request.getParameter("majorTotal");
		int majorTotal=Integer.parseInt(majorTotals);
		String prooTotals=request.getParameter("prooTotal");
		if(prooTotals ==null || prooTotals==""){
			prooTotals="0";
		}
		int prooTotal=Integer.parseInt(prooTotals);
		String auditPrices=request.getParameter("auditPrice");
		if(auditPrices ==null || auditPrices==""){
			auditPrices="0";
		}
		String auditTotals=request.getParameter("auditTotal");
		if(auditTotals==null || auditTotals==""){
			auditTotals="0";
		}
		double auditPrice=Double.parseDouble(auditPrices);
		int auditTotal=Integer.parseInt(auditTotals);
		String worksOrigin=request.getParameter("worksOrigin");
		String worksTarget=request.getParameter("worksTarget");
		Quotation quotation=new Quotation();
		quotation.setTranPrice(tranPrice);
		quotation.setProoPrice(prooPrice);
		quotation.setDayTrans(dayTrans);
		quotation.setDayProo(dayProo);
		quotation.setDayAudit(dayAudit);
		quotation.setMajorTotal(majorTotal);
		quotation.setProoTotal(prooTotal);
		quotation.setLanguages(languages);
		quotation.setAuditPrice(auditPrice);
		quotation.setAuditTotal(auditTotal);
		quotation.setLanguages(languages);
		quotation.setTranstionId(transId);
		quotation.setWorksOrigin(worksOrigin);
		quotation.setWorksTarget(worksTarget);
		quotation.setDomain(domain);
		/*if(param != null){
			for (String qdomain : param) {
				quotation.setDomain(qdomain);
			}
			//将数组转换为字符串
			String domain = Arrays.toString(param);
			//转换后的字符串个带有空格(暂不知原因),去掉
			domain=domain.substring(1, domain.length()-1);
			
		}*/
		quotation.setId(transId);
		quotationService.updatePrice(quotation);
		StringBuffer sb=new StringBuffer();
		Translator translator=new Translator();
		Translator translatorlanguage=translatorService.queryTransById(transId);
		List<Quotation> quotations=quotationService.queryTransQuotation(transId);
		String domainTrans="";
		/*for (int i = 0; i < quotations.size(); i++) {
			String domains=quotations.get(i).getDomain();
			if(i<(quotations.size()-1)){
				if(!domains.contains(domains)){
					domainTrans+=domains+",";
				}
			}else{
				if(!domains.contains(domains)){
					domainTrans+=domains;
				}
				
			}
		}
		translator.setDomain(domainTrans);*/
		String language=translatorlanguage.getLanguage();
		if(language==null ||"".equals(language)){
		if("英汉".equals(languages) || languages.equals("汉英")){
			languages="EN";
		} 
		if("日汉".equals(languages) || "汉日".equals(languages)){
			languages="JP";
		}
		if("德汉".equals(languages) || "汉德".equals(languages)){
			languages="GER";
		}
		if("韩汉".equals(languages) || "汉韩".equals(languages)){
			languages="KOR";
		}
		if("法汉".equals(languages) || "汉法".equals(languages)){
			languages="FR";
		}
		translator.setLanguage(languages);
		}
		translator.setNickname(nickname);
		translator.setId(transId);
		translatorService.updataTranslator(translator);
		request.setAttribute("success", "success");
		return "forward:./reviewLanguage.do?languages="+languages+"&id="+transId;
	}

	
	/**
	 * 根据id查询执行修改
	 * @param transId
	 * @param request
	 * @return
	 */
	@RequestMapping("translatorAction_updateUI")
	public String translatorAction_updateUI(int transId,HttpServletRequest request){
		request.setAttribute("translators", translatorService.queryTransById(transId));
		request.setAttribute("domainList", domainService.queryByAll());
		request.setAttribute("translatorQ", translatorService.queryByQuotation(transId));
		return "forward:/usercenter/user.center.interpreter.jsp";
	}
    /**
     * 修改银行信息
     * @param transId
     * @param request
     * @return
     */
	@RequestMapping("translatorAction_editBank")
	public String translatorAction_editBank(int transId,HttpServletRequest request){
		request.setAttribute("translatorQ", translatorService.queryByQuotation(transId));
		request.setAttribute("translator", translatorService.queryTransById(transId));
		return "forward:/usercenter/user.center.interpreter.jsp";
	}
	
	
	/**
	 * 查询等级
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping("translatorAction_lookLevel")
	 public String translatorAction_lookLevel(int id,HttpServletRequest request){
		request.setAttribute("quotations", quotationService.queryByQuotationid(id)); 
		return "forward:/interpreter/user.interpreter.updateLevel.jsp";
	 }
	
	
	/**
	 * 根据id查询执行修改
	 * @param transId
	 * @param request
	 * @return
	 */
	@RequestMapping("translatorAction_updateUU")
	public String translatorAction_updateUU(int id,HttpServletRequest request){
		Translator trans=(Translator) request.getSession().getAttribute("transid");
		int transId=trans.getId();
		request.setAttribute("quotationTransList", quotationService.queryByTransPrice(transId));
		request.setAttribute("quotationProoList", quotationService.queryByProoPrice(transId));
		request.setAttribute("quotationAuditList", quotationService.queryByAuditPrice(transId));
		request.setAttribute("translatorsQ", translatorService.queryQuotationByid(id));
		request.setAttribute("translators", translatorService.queryTransById(transId));
		request.setAttribute("id", id);
		request.setAttribute("page", "addQuo");
		return "forward:/usercenter/user.center.new.updateQuotation.jsp";
	}
	
	/**
	 * 查看订单详细
	 * @param request
	 * @param id
	 * @return
	 * @throws ParseException 
	 */
	@RequestMapping("translatorAction_lookOrder")
	public String translatorAction_lookOrder(HttpServletRequest request,int id, HttpServletResponse response) throws ParseException{
		Order orders=orderService.queryByOrderId(id);
		int needId=orders.getClientCustomerNeedId();
		int transId=orders.getTranslatorid();
		int clientId=orders.getClientUserId();
		ClientCustomerNeed clientCustomerNeed=clientCustomerService.findTransNeedByid(needId);
		//翻译比例
		double transRatio=0;
		BigDecimal transTime=new BigDecimal(0);
		double transNeedTime=0;
		//校对比例
		double proosRatio=0;
		BigDecimal proosTime=new BigDecimal(0);
		double prooNeedTime=0;
		//审核比例
		double auditRatio=0;
		BigDecimal auditTime=new BigDecimal(0);
		double auditNeedTime=0;
		//当前需求对应日期的流程
		int procedureSate;
		Map<String,String> map=new HashMap<String,String>();
		//根据订单id查询需求
		Order order=orderService.findOrderId(id);
		int clientCustomerId=order.getClientCustomerNeedId();
		//根据id查询需求详情
		ClientCustomerNeed ClientCustomerNeed=clientCustomerService.findTransNeedByid(clientCustomerId);
		//获得需求发布时间
		String publishTimes=ClientCustomerNeed.getPublishTime();
		//获取交稿时间
		String completeTimes=ClientCustomerNeed.getCompleteTime();
		String generatedTimes=order.getGeneratedTime();
		SimpleDateFormat  sdf=new  SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat  oldsdf=new  SimpleDateFormat("yyyy-MM-dd");
		/*java.util.Date date1=oldsdf.parse(completeTimes);*/
		java.util.Date  completedate=oldsdf.parse(completeTimes); //完成时间
		java.util.Date  orderdate=sdf.parse(generatedTimes); //订单生成时间
		long ordertimes=orderdate.getTime();
		
		//计算完成时间与订单时间相差天数
		long time=completedate.getTime()-orderdate.getTime();
		BigDecimal times=new BigDecimal(time);
		//获取当前需求流程类型
		int procedureTypeId=ClientCustomerNeed.getProcedureTypeId();
	    //获取需求字数
		int lengths=ClientCustomerNeed.getLength();
		double length=(double)lengths;
		//获得需求状态
		String cycle=ClientCustomerNeed.getCycle();
		String finalTrans=null;
		String finalProos=null;
		String finalAudit=null;
		Date dates=new Date();
		String str;
		 if(procedureTypeId==3){
		//判断流程周期是否为一般	 
		if("一般".equals(cycle)){
			transTime=times.multiply(new BigDecimal(0.57));//57%
			proosTime=times.multiply(new BigDecimal(0.29));//29%
			auditTime=times.multiply(new BigDecimal(0.14));//14%
			BigDecimal transTimes = new BigDecimal(transTime.doubleValue()).setScale(0, RoundingMode.DOWN);
			BigDecimal prooTimes = new BigDecimal(proosTime.doubleValue()).setScale(0, RoundingMode.DOWN);
			BigDecimal auditTimes= new BigDecimal(auditTime.doubleValue()).setScale(0, RoundingMode.DOWN);
			
			/*finalTrans=sdf.format(new Date(transTimes.longValue()));
			finalProos=sdf.format(new Date(prooTimes.longValue()));
			finalAudit=sdf.format(new Date(auditTimes.longValue()));*/
			long tt=transTimes.longValue()+ordertimes;
		    finalTrans=sdf.format(new Date(tt));//翻译最终截至时间
		    long pp=prooTimes.longValue()+tt;
		    finalProos=sdf.format(new Date(pp));//校对最终截至时间
		    long aa=auditTimes.longValue()+pp;
		    finalAudit=sdf.format(new Date(aa));//审核最终截至时间
			 request.setAttribute("transTime", finalTrans);
			 request.setAttribute("proosTime", finalProos);
			 request.setAttribute("auditTime", finalAudit);
			 
			double transauditTime=(double)(length/3000)+(length/6000)+(length/8000);
			transNeedTime=(double)(length/3000);//一般周期下翻译所需时间
			prooNeedTime=(double)(length/4000);//一般周期下校对所需时间
			auditNeedTime=(double)(length/5000);//一般周期下审核所需时间
    			int stateId = orders.getTaskStateId();
				//获取当前订单流程状态为翻译
				if(stateId==2){
				double  d = (double)(((length/3000))/transauditTime)*time;
			    transRatio=(double)(dates.getTime()-orderdate.getTime())/d;
			    if(transRatio<1){
			    	transRatio=0;
			    }
			    if(transRatio!=0.0){
			    	 str = (transRatio*100+"").substring(0, 2)+"%";
			    }else{
			    	 str = (transRatio*100+"").substring(0, 1)+"%";
			    }
			    request.setAttribute("transRatio",  str);
			  //获取当前订单流程状态为校对
				}else if(stateId==3){
					double  d =(double)(prooNeedTime/transauditTime)*time;
					proosRatio=(double)(dates.getTime()-(orderdate.getTime()+((length/3000)*24*60*60*1000)))/d;
					if(proosRatio<1){
						proosRatio=0;
					} 
					if(proosRatio!=0.0){
						str = (proosRatio*100+"").substring(0, 2)+"%";	
					}else{
						str = (proosRatio*100+"").substring(0, 1)+"%";	
					}
					
					request.setAttribute("transRatio", "100%");
				    request.setAttribute("proosRatio",  str);
				  //获取当前订单流程状态为审核
				}else if (stateId==4) {
					double  d = (double)(auditNeedTime/transauditTime)*time;
					auditRatio=(double)(dates.getTime()-(orderdate.getTime()+(((length/3000)+(length/4000))*24*60*60*1000)))/d;
					 if(auditRatio<1){
						 auditRatio=0;
					  }
					  request.setAttribute("transRatio", "100%");
					  request.setAttribute("proosRatio",  "100%");
					  if(auditRatio!=0.0){
						  str = (auditRatio*100+"").substring(0, 2)+"%";
					  }else{
						  str = (auditRatio*100+"").substring(0, 1)+"%"; 
					  }
					    request.setAttribute("auditRatio",  str);
				}else if(stateId==5){
					  request.setAttribute("transRatio", "100%");
					  request.setAttribute("proosRatio",  "100%");
					  request.setAttribute("auditRatio",  "100%");
				}
		    
		}else if(cycle=="加急"){
			    transTime=times.multiply(new BigDecimal(0.57));//57%
				proosTime=times.multiply(new BigDecimal(0.29));//29%
				auditTime=times.multiply(new BigDecimal(0.14));//14%
				BigDecimal transTimes = new BigDecimal(transTime.doubleValue()).setScale(0, RoundingMode.DOWN);
				BigDecimal prooTimes = new BigDecimal(proosTime.doubleValue()).setScale(0, RoundingMode.DOWN);
				BigDecimal auditTimes= new BigDecimal(auditTime.doubleValue()).setScale(0, RoundingMode.DOWN);
				long tt=transTimes.longValue()+ordertimes;
			    finalTrans=sdf.format(new Date(tt));//翻译最终截至时间
			    long pp=prooTimes.longValue()+tt;
			    finalProos=sdf.format(new Date(pp));//校对最终截至时间
			    long aa=auditTimes.longValue()+pp;
			    finalAudit=sdf.format(new Date(aa));//审核最终截至时间
				 request.setAttribute("transTime", finalTrans);
				 request.setAttribute("proosTime", finalProos);
				 request.setAttribute("auditTime", finalAudit);
			 double transauditTime=(double)(length/4000)+(length/8000)+(length/10000);
			 transNeedTime=(double)(length/4000);//加急周期下翻译所需时间
			 prooNeedTime=(double)(length/8000);//加急周期下翻译所需时间
			 auditNeedTime=(double)(length/10000);//加急周期下翻译所需时间
				int stateId = orders.getTaskStateId();
				if(stateId==2){
				double  d = (double)(((length/3000))/transauditTime)*time;
			    transRatio=(double)(dates.getTime()-orderdate.getTime())/d;
			    if(transRatio<1){
			    	transRatio=0;
			    }
			    if(transRatio!=0.0){
			    	 str = (transRatio*100+"").substring(0, 2)+"%";
			    }else{
			    	 str = (transRatio*100+"").substring(0, 1)+"%";
			    }
			    request.setAttribute("transRatio",  str);
				}else if(stateId==3){
					double  d = (double)(prooNeedTime/transauditTime)*time;
					proosRatio=(double)(dates.getTime()-(orderdate.getTime()+((length/4000)*24*60*60*1000)))/d;
					if(proosRatio<1){
						proosRatio=0;
					}
					request.setAttribute("transRatio",  "100%");
					if(proosRatio!=0.0){
						str = (proosRatio*100+"").substring(0, 2)+"%";
					}else{
						str = (proosRatio*100+"").substring(0, 1)+"%";
					}
				    request.setAttribute("proosRatio",  str);
				}else if (stateId==4) {
					double  d = (double)(auditNeedTime/transauditTime)*time;
					auditRatio=(double)(dates.getTime()-(orderdate.getTime()+(((length/4000)+(length/8000))*24*60*60*1000)))/d;
					 if(auditRatio<1){
						 auditRatio=0;
					 }
					 request.setAttribute("transRatio",  "100%");
					 request.setAttribute("proosRatio",  "100%");
					 if(auditRatio!=0.0){
						 str = (auditRatio*100+"").substring(0, 2)+"%"; 
					 }else{
						 str = (auditRatio*100+"").substring(0, 1)+"%";
					 }
					 request.setAttribute("auditRatio",  str);
				}else if(stateId==5){
					request.setAttribute("transRatio",  "100%");
					 request.setAttribute("proosRatio",  "100%");
					 request.setAttribute("auditRatio",  "100%");
				}
			    
		}else if(cycle=="特急"){
			transTime=times.multiply(new BigDecimal(0.57));//57%
			proosTime=times.multiply(new BigDecimal(0.29));//29%
			auditTime=times.multiply(new BigDecimal(0.14));//14%
			BigDecimal transTimes = new BigDecimal(transTime.doubleValue()).setScale(0, RoundingMode.DOWN);
			BigDecimal prooTimes = new BigDecimal(proosTime.doubleValue()).setScale(0, RoundingMode.DOWN);
			BigDecimal auditTimes= new BigDecimal(auditTime.doubleValue()).setScale(0, RoundingMode.DOWN);
			long tt=transTimes.longValue()+ordertimes;
		    finalTrans=sdf.format(new Date(tt));//翻译最终截至时间
		    long pp=prooTimes.longValue()+tt;
		    finalProos=sdf.format(new Date(pp));//校对最终截至时间
		    long aa=auditTimes.longValue()+pp;
		    finalAudit=sdf.format(new Date(aa));//审核最终截至时间
			 request.setAttribute("transTime", finalTrans);
			 request.setAttribute("proosTime", finalProos);
			 request.setAttribute("auditTime", finalAudit);
			double transauditTime=(double)(length/5000)+(length/10000)+(length/15000);
			 transNeedTime=(double)(length/5000);//特急周期下翻译所需时间
			 prooNeedTime=(double)(length/10000);//特急周期下翻译所需时间
			 auditNeedTime=(double)(length/15000);//特急周期下翻译所需时间
				int stateId = orders.getTaskStateId();
				if(stateId==2){
				double  d = (double)(((length/5000))/transauditTime)*time;
			    transRatio=(double)(dates.getTime()-orderdate.getTime())/d;
			    if(transRatio>1){
			    	transRatio=0;
			    }
			    if(transRatio!=0.0){
			    	str = (transRatio*100+"").substring(0, 2)+"%";	
			    }else{
			    	str = (transRatio*100+"").substring(0, 1)+"%";
			    }
			    request.setAttribute("transRatio",  str);
				}else if(stateId==3){
					double  d = (double)(prooNeedTime/transauditTime)*time;
					proosRatio=(double)(dates.getTime()-(orderdate.getTime()+((length/5000)*24*60*60*1000)))/d;
					if(proosRatio<1){
						proosRatio=0;
					}
					 request.setAttribute("transRatio",  "100%");
					 if(proosRatio!=0.0){
						 str = (proosRatio*100+"").substring(0, 2)+"%";
					 }else{
						 str = (proosRatio*100+"").substring(0, 1)+"%";
					 }
				    request.setAttribute("proosRatio",  str);
				}else if (stateId==4) {
					double  d =(double) (auditNeedTime/transauditTime)*time;
					auditRatio=(double)(dates.getTime()-(orderdate.getTime()+(((length/5000)+(length/10000))*24*60*60*1000)))/d;
					 if(auditRatio<1){
						 auditRatio=0;
					 }
					 request.setAttribute("transRatio",  "100%");
					 request.setAttribute("proosRatio",  "100%");
					 if(auditRatio!=0.0){
						 str = (auditRatio*100+"").substring(0, 2)+"%";
					 }else{
						 str = (auditRatio*100+"").substring(0, 1)+"%"; 
					 }
					 request.setAttribute("auditRatio",  str);
				}else if(stateId==5){
					request.setAttribute("transRatio",  "100%");
					 request.setAttribute("proosRatio", "100%");
					 request.setAttribute("auditRatio", "100%");
				}
		}
		}else if(procedureTypeId==2){
			if("一般".equals(cycle)){
				transTime=times.multiply(new BigDecimal(0.66));//66%
				proosTime=times.multiply(new BigDecimal(0.34));//34%
				BigDecimal transTimes = new BigDecimal(transTime.doubleValue()).setScale(0, RoundingMode.DOWN);
				BigDecimal prooTimes = new BigDecimal(proosTime.doubleValue()).setScale(0, RoundingMode.DOWN);
				long tt=transTimes.longValue()+ordertimes;
			    finalTrans=sdf.format(new Date(tt));//翻译最终截至时间
			    long pp=prooTimes.longValue()+tt;
			    finalProos=sdf.format(new Date(pp));//校对最终截至时间
				 request.setAttribute("transTime", finalTrans);
				 request.setAttribute("proosTime", finalProos);
				 transNeedTime=(double)(length/4000)+(length/8000);
				 prooNeedTime=(double)(length/6000);
				int stateId = orders.getTaskStateId();
				if(stateId==2){
					double  d =(double) (((length/3000))/transNeedTime)*time;
			    transRatio=(double)(dates.getTime()-orderdate.getTime())/d;
			    if(transRatio<1){
			    	transRatio=0;
			    }
			    if(transRatio!=0.0){
			    	str = (transRatio*100+"").substring(0, 2)+"%";
			    }else{
			    	str = (transRatio*100+"").substring(0, 1)+"%";
			    }
			    request.setAttribute("transRatio",  str);
				}else if(stateId==3){
					double  d = (double)(prooNeedTime/transNeedTime)*time; 
					proosRatio=(double)(dates.getTime()-(orderdate.getTime()+((length/4000)*24*60*60*1000)))/d;
					if(proosRatio<1){
						proosRatio=0;
					}
					request.setAttribute("transRatio",  "100%");
					if(proosRatio!=0.0){
						str = (proosRatio*100+"").substring(0, 2)+"%";	
					}else{
						str = (proosRatio*100+"").substring(0, 1)+"%";
					}
					
					request.setAttribute("proosRatio",  str);
				}else if(stateId==4){
					request.setAttribute("transRatio",  "100%"); 
					 request.setAttribute("proosRatio",  "100%");
				}else if(stateId==5){
					request.setAttribute("transRatio",  "100%");
					request.setAttribute("proosRatio",  "100%");
				}
			}else if(cycle=="加急"){
				transTime=times.multiply(new BigDecimal(0.66));//66%
				proosTime=times.multiply(new BigDecimal(0.34));//34%
				BigDecimal transTimes = new BigDecimal(transTime.doubleValue()).setScale(0, RoundingMode.DOWN);
				BigDecimal prooTimes = new BigDecimal(proosTime.doubleValue()).setScale(0, RoundingMode.DOWN);
				long tt=transTimes.longValue()+ordertimes;
			    finalTrans=sdf.format(new Date(tt));//翻译最终截至时间
			    long pp=prooTimes.longValue()+tt;
			    finalProos=sdf.format(new Date(pp));//校对最终截至时间
				 request.setAttribute("transTime", finalTrans);
				 request.setAttribute("proosTime", finalProos);
				 transNeedTime=(double)(length/4000)+(length/8000);
				 prooNeedTime=(double)(length/6000);
					int stateId = orders.getTaskStateId();
					if(stateId==2){
						double  d =(double) (((length/3000))/transNeedTime)*time;
				    transRatio=(double)(dates.getTime()-orderdate.getTime())/d;
				    if(transRatio<1){
				    	transRatio=0;
				    }
				    if(transRatio!=0.0){
				    	str = (transRatio*100+"").substring(0, 2)+"%";
				    }else{
				    	str = (transRatio*100+"").substring(0, 1)+"%";
				    }
				    request.setAttribute("transRatio",  str);
					}else if(stateId==3){
						double  d =(double) (prooNeedTime/transNeedTime)*time;
						proosRatio=(double)(dates.getTime()-(orderdate.getTime()+((length/3000)*24*60*60*1000)))/d;
						if(proosRatio<1){
							proosRatio=0;
						}
						if(proosRatio!=0.0){
							str = (proosRatio*100+"").substring(0, 2)+"%";
						}else{
							str = (proosRatio*100+"").substring(0, 1)+"%";
						}
						request.setAttribute("transRatio",  "100%");
						
					    request.setAttribute("proosRatio",  str);
					}else if(stateId==4){
						request.setAttribute("transRatio",  "100%");
						request.setAttribute("proosRatio",  "100%");
					}else if(stateId==5){
						request.setAttribute("transRatio",  "100%");
						request.setAttribute("proosRatio",  "100%");
					}
			}else if(cycle=="特急"){
				transTime=times.multiply(new BigDecimal(0.66));//66%
				proosTime=times.multiply(new BigDecimal(0.34));//34%
				BigDecimal transTimes = new BigDecimal(transTime.doubleValue()).setScale(0, RoundingMode.DOWN);
				BigDecimal prooTimes = new BigDecimal(proosTime.doubleValue()).setScale(0, RoundingMode.DOWN);
				long tt=transTimes.longValue()+ordertimes;
			    finalTrans=sdf.format(new Date(tt));//翻译最终截至时间
			    long pp=prooTimes.longValue()+tt;
			    finalProos=sdf.format(new Date(pp));//校对最终截至时间
				 request.setAttribute("transTime", finalTrans);
				 request.setAttribute("proosTime", finalProos);
				 transNeedTime=(double)(length/5000)+(length/10000);
				 prooNeedTime=(double)(length/6000);
					int stateId = orders.getTaskStateId();
					if(stateId==2){
					double  d = (double)(((length/3000))/transNeedTime)*time;
				    transRatio=(double)(dates.getTime()-orderdate.getTime())/d;
				    if(transRatio<1){
				    	transRatio=0;
				    }
				    if(transRatio!=0.0){
				    	str = (transRatio*100+"").substring(0, 2)+"%";
				    }else{
				    	str = (transRatio*100+"").substring(0, 1)+"%";
				    }
				    request.setAttribute("transRatio",  str);
					}else if(stateId==3){
						double  d =(double) (prooNeedTime/transNeedTime)*time;
						proosRatio=(double)(dates.getTime()-(orderdate.getTime()+((length/3000)*24*60*60*1000)))/d;
						if(proosRatio<1){
							proosRatio=0;
						}
						if(proosRatio!=0.0){
							str = (proosRatio*100+"").substring(0, 2)+"%";	
						}else{
							str = (proosRatio*100+"").substring(0, 1)+"%";
						}
						request.setAttribute("transRatio",  "100%");
						
					    request.setAttribute("proosRatio",  str);
					}else if(stateId==4){
						request.setAttribute("transRatio",  "100%");
						request.setAttribute("proosRatio",  "100%");
					}else if(stateId==5){
						request.setAttribute("transRatio",  "100%");
						 request.setAttribute("proosRatio",  "100%");
					}
				    
			}
		}else if(procedureTypeId==1){
			//当前订单状态
			int stateId = orders.getTaskStateId();
			if("一般".equals(cycle)){
				/*BigDecimal transTimes = new BigDecimal(transTime.doubleValue()).setScale(0, RoundingMode.DOWN);
				long tt=transTimes.longValue()+ordertimes;
			    finalTrans=sdf.format(new Date(tt));//翻译最终截至时间
*/				 request.setAttribute("transTime", completedate);
				procedureSate=2;
				//状态为翻译中	 
				 if(stateId==2){
				//当前时间-发布时间	 
				long l =dates.getTime()-orderdate.getTime();
				//计算完成时间与发布时间相差天数
			    transRatio=(double)l/time;
			    if(transRatio<1){
			    	transRatio=0;
			    }
			    if(transRatio!=0.0){
			        str = (transRatio*100+"").substring(0, 2)+"%";
			    }else{
			    	str = (transRatio*100+"").substring(0, 1)+"%";
			    }
			    request.setAttribute("transRatio",  str);
			    }else if(stateId>=3){
			    	request.setAttribute("transRatio",  "100%");
			    }
			}else if(cycle=="加急"){
				/*transTime=times.multiply(new BigDecimal(0.100));//100%
*/				/*BigDecimal transTimes = new BigDecimal(transTime.doubleValue()).setScale(0, RoundingMode.DOWN);
				long tt=transTimes.longValue()+ordertimes;
			    finalTrans=sdf.format(new Date(tt));//翻译最终截至时间
*/				 request.setAttribute("transTime", completedate);
				procedureSate=2;
				if(stateId==2){
                long l=dates.getTime()-orderdate.getTime();
                transRatio=(double)l/time;
			    if(transRatio<1){
			    	transRatio=0;
			    }
			    if(transRatio!=0.0){
			    	str = (transRatio*100+"").substring(0, 2)+"%";
			    }else{
			    	str = (transRatio*100+"").substring(0, 1)+"%";
			    }
			    request.setAttribute("transRatio",  str);
				}else if(stateId>=3){
					request.setAttribute("transRatio",  "100%");
				}
			}else if(cycle=="特急"){
				/*transTime=times.multiply(new BigDecimal(0.100));//100%
*/				/*BigDecimal transTimes = new BigDecimal(transTime.doubleValue()).setScale(0, RoundingMode.DOWN);
				long tt=transTimes.longValue()+ordertimes;
			    finalTrans=sdf.format(new Date(tt));//翻译最终截至时间
*/			    
				request.setAttribute("transTime", completedate);
			    procedureSate=2;
				if(stateId==2){
				long l=dates.getTime()-orderdate.getTime();
			    transRatio=(dates.getTime()-orderdate.getTime())/time;
				transRatio=(double)l/time;
			    if(transRatio<1){
			    	transRatio=0;
			    }
			    if(transRatio!=0.0){
			    	 str = (transRatio*100+"").substring(0, 2)+"%";
			    }else{
			    	 str = (transRatio*100+"").substring(0, 1)+"%";
			    }
			    request.setAttribute("transRatio",  str);
				}else if(stateId>=3){
					request.setAttribute("transRatio",  "100%");
				}
			}
		}
		 
		Map<String,String> needsNames=new HashMap<String,String>();
		Map<String,String> transNames=new HashMap<String,String>();
		Map<String,String> prooNames=new HashMap<String,String>();
		Map<String,String> auditNames=new HashMap<String,String>();
		String Clientpath=clientCustomerNeed.getFileURL();
		String transUrl=orders.getTransUrl();
		String prooUrl=orders.getProoUrl();
		String auditUrl=orders.getAuditUrl();
		if(transUrl!=null && transUrl!=""){
			File file = new File(request.getSession().getServletContext().getRealPath("")+transUrl);
			File files[]=file.listFiles();
			if(files!=null){
				for(int i=0;i<files.length;i++){
					transNames.put(files[i].getName(), orders.getTransUrl());
				}
			}
			
			request.setAttribute("transNames", transNames);
		}
		
		if(prooUrl!=null && prooUrl!=""){
			File file = new File(request.getSession().getServletContext().getRealPath("")+prooUrl);
			File files[]=file.listFiles();
			if(files!=null){
				for(int i=0;i<files.length;i++){
					prooNames.put(files[i].getName(),orders.getProoUrl());
				}
			}
			
			request.setAttribute("prooNames", prooNames);
		}
		
		
		if(auditUrl!=null && auditUrl!=""){
			File file = new File(request.getSession().getServletContext().getRealPath("")+auditUrl);
			File files[]=file.listFiles();
			if(files!=null){
				for(int i=0;i<files.length;i++){
					auditNames.put(files[i].getName(),orders.getAuditUrl());
				}
			}
			
			request.setAttribute("auditNames", auditNames);
		}
		
		if(Clientpath!=null && Clientpath!=""){
			/*File file=new File(Clientpath);*/
			File file = new File(request.getSession().getServletContext().getRealPath("")+Clientpath);
			File files[]=file.listFiles();
			if(files!=null){
				for(int i=0;i<files.length;i++){
					needsNames.put(files[i].getName(),clientCustomerNeed.getFileURL());
				}
			}
			request.setAttribute("needsNames", needsNames);
		}
		
		if(clientCustomerNeed.getTransTotal() == 0){
			if("系统分配模式".equals(clientCustomerNeed.getPublishModel())){
				BasicPrice basicPrice = new BasicPrice();
				basicPrice=basicPriceService.queryByLanguage(clientCustomerNeed.getLanguagePair());
				
				Field domain = new Field();
				domain=fieldService.queryById(clientCustomerNeed.getDomainId());
				
				TranslatorLevel translatorLevel = new TranslatorLevel();
				translatorLevel=translatorLevelService.queryByLevel(clientCustomerNeed.getTransLevel());
				
				Schedule schedule = new Schedule();
				if("特急+".equals(clientCustomerNeed.getCycle())){
					/*addTime=Double.parseDouble(time);
					addTime=addTime*1.1;*/
					clientCustomerNeed.setCycle("特急");
				}
				schedule=scheduleService.queryBySchedule(clientCustomerNeed.getCycle());
				
				//只翻译     最终每千字价格 = 基础每千字价格	 *    领域系数    *   等级系数    *   周期系数   *  1
				double trans=basicPrice.getBasicPrice()*domain.getFactor()*translatorLevel.getFactor()*schedule.getFactor();
				
				
				//翻译和校对 最终每千字价格 = 基础每千字价格	 *    领域系数    *   等级系数    *   周期系数   *  1  +  （（基础每千字价格	 *    领域系数   *   周期系数） *0.5）/*等级系数
				double veri=trans+basicPrice.getBasicPrice()*domain.getFactor()*schedule.getFactor()*0.5/translatorLevel.getFactor();
				
				//翻译校对和审核  最终每千字价格 = 基础每千字价格	 *    领域系数    *   等级系数    *   周期系数   *  1  +  （（基础每千字价格	 *    领域系数   *   周期系数） *0.5）/*等级系数    +    （基础每千字价格	 *    领域系数   *   周期系数） *0.5 
				double proof=veri+basicPrice.getBasicPrice()*domain.getFactor()*schedule.getFactor()*0.5;
				
				//流程id
				int procedure=clientCustomerNeed.getProcedureTypeId();
				double single = 0;
				if(procedure==1){
					//只翻译
					single=trans;
				}else if(procedure==2){
					//翻译和校对 
					single=veri;
				}else if(procedure==3){
					//翻译校对及审核 	最终每千字价格 = 基础每千字价格	 *    领域系数    *   等级系数    *   周期系数   *  1  +  （（基础每千字价格	 *    领域系数   *   周期系数） *0.5）/*等级系数    +    （基础每千字价格	 *    领域系数   *   周期系数） *0.5 
					single=proof;
				}
				BigDecimal totalPrice = new BigDecimal(0);
				BigDecimal length2 = new BigDecimal(clientCustomerNeed.getLength());
				BigDecimal count = new BigDecimal(single);
				if(length2.intValue() < 500){
					BigDecimal half = new BigDecimal(0.5);
					totalPrice = count.multiply(half);
					totalPrice = totalPrice.setScale(1, BigDecimal.ROUND_HALF_UP);
				}else if(length2.intValue() >= 500){
					BigDecimal thousand = new BigDecimal(1000);
					totalPrice = count.divide(thousand).multiply(length2);
					totalPrice = totalPrice.setScale(1, BigDecimal.ROUND_HALF_UP);
				}else{
					totalPrice = null;
				}
				clientCustomerNeed.setTotalMoney(totalPrice.multiply(new BigDecimal(0.8)).doubleValue());
				orders.setPayNumber(clientCustomerNeed.getTotalMoney());
			}else{
				BigDecimal totalPrice = new BigDecimal(clientCustomerNeed.getTotalMoney());
				clientCustomerNeed.setTotalMoney(totalPrice.multiply(new BigDecimal(0.8)).setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue());
				orders.setPayNumber(clientCustomerNeed.getTotalMoney());
			}
		}else{
			clientCustomerNeed.setTotalMoney(clientCustomerNeed.getTransTotal());
			orders.setPayNumber(clientCustomerNeed.getTotalMoney());
		}
		String nickname=translatorService.findNickname(transId);
		String clientName=clientUserService.findName(clientId);
		request.setAttribute("clientCustomerNeed", clientCustomerNeed);
		List<OrderState> orderStates=orderStateService.queryByOrderState();
		request.setAttribute("orders", orders);
		request.setAttribute("nickname", nickname);
		request.setAttribute("clientName", clientName);
		request.setAttribute("orderStates", orderStates);
		
		//项目类型
		int projectTypeId=clientCustomerNeed.getClientProjectTypeId();
		String projectType="";
		if(projectTypeId==1){projectType="OA翻译";}
		if(projectTypeId==2){projectType="部分全文翻译";}
		if(projectTypeId==3){projectType="摘要翻译";}
		if(projectTypeId==4){projectType="其他";}
		if(projectTypeId==5){projectType="全文翻译";}
		request.setAttribute("projectTypeId", projectType);
		return "forward:/interpreter/user.interpreter.order.details.jsp";
	}
	
	  
	
	/**
	 * 文件下载
	 * @param request
	 * @param response
	 */
	@RequestMapping("translatorAction_downloadTransFile")
    public void translatorAction_download(HttpServletRequest request,HttpServletResponse response)throws IOException{ 
		response.setContentType("application/vnd.ms-txt;charset=utf-8");
		String urlname = null;
		String fileName=null;
		String type=request.getParameter("transFile");
		String url=request.getParameter("url");
		urlname =request.getSession().getServletContext().getRealPath("")+url;
	    urlname=urlname.replace("\\/", "\\");
	    urlname=urlname.replace("/", "\\");
	    fileName= request.getParameter("filename");
       //得到要下载的文件
      File file = new File(urlname+"/"+fileName);
      //如果文件不存在
      if(!file.exists()){
     	 response.getWriter().println("<font color=red>资源不存在</font>");
      }else{
      //设置响应头，控制浏览器下载该文件
      String headName=fileName;
      String userAgent = request.getHeader("User-Agent");
		//针对IE或者以IE为内核的浏览器：
		if (userAgent.contains("MSIE")||userAgent.contains("Trident")) {
			fileName = java.net.URLEncoder.encode(fileName, "UTF-8");
		} else {
		//非IE浏览器的处理：
			fileName = new String(fileName.getBytes("UTF-8"),"ISO-8859-1");
		}
		response.setHeader("Content-disposition", String.format("attachment; filename=\"%s\"", fileName));
		/*response.setContentType("application/vnd.ms-excel;charset=utf-8");*/
		  response.setContentType("application/x-msdownload;charset=UTF-8"); 
		response.setCharacterEncoding("UTF-8"); 
      
   
      
      //读取要下载的文件，保存到文件输入流
      BufferedInputStream bis = new BufferedInputStream(new FileInputStream(urlname+"/"+headName));
      //创建输出流
      BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
      //创建一个缓冲区
      byte[] buffer = new byte[1024*8];
      //循环将缓冲输入流读入到缓冲区当中
      while(true){
          //循环将缓冲输入流读入到缓冲区当中
          int length = bis.read(buffer);
          //判断是否读取到文件末尾
          if(length == -1){
              break;
          }
          //使用BufferedOutputStream缓冲输出流将缓冲区的数据写入到指定的目录(savePath + "\\" + filename)当中
          bos.write(buffer,0,length);
      }
      //关闭文件输入流
      bis.close();
      //刷新此输入流并强制写出所有缓冲的输出字节数
      bos.flush();
      //关闭文件输出流
      bos.close();
      }	
    }
	
	
	/**
	 * 文件下载
	 * @param request
	 * @param response
	 */
	@RequestMapping("translatorAction_downloadTrans")
    public void translatorAction_downloadTrans(HttpServletRequest request,HttpServletResponse response)throws IOException{ 
		response.setContentType("application/vnd.ms-txt;charset=utf-8");
		String url="";
		String fileName="";
		url=request.getParameter("url");
		String urlname =request.getSession().getServletContext().getRealPath("")+url;
	    urlname=urlname.replace("\\/", "\\");
	    urlname=urlname.replace("/", "\\");
	    fileName= request.getParameter("filename");
       //得到要下载的文件
      File file = new File(urlname+"/"+fileName);
      //如果文件不存在
      if(!file.exists()){
     	 response.getWriter().println("<font color=red>资源不存在</font>");
      }else{
      	
      
      //设置响应头，控制浏览器下载该文件
      String headName=fileName;
      String userAgent = request.getHeader("User-Agent");
		//针对IE或者以IE为内核的浏览器：
		if (userAgent.contains("MSIE")||userAgent.contains("Trident")) {
			fileName = java.net.URLEncoder.encode(fileName, "UTF-8");
		} else {
		//非IE浏览器的处理：
			fileName = new String(fileName.getBytes("UTF-8"),"ISO-8859-1");
		}
		response.setHeader("Content-disposition", String.format("attachment; filename=\"%s\"", fileName));
		response.setContentType("application/vnd.ms-excel;charset=utf-8");
		response.setCharacterEncoding("UTF-8"); 
      
   
      
      //读取要下载的文件，保存到文件输入流
      BufferedInputStream bis = new BufferedInputStream(new FileInputStream(urlname+"/"+headName));
      //创建输出流
      BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
      //创建一个缓冲区
      byte[] buffer = new byte[1024*8];
      //循环将缓冲输入流读入到缓冲区当中
      while(true){
          //循环将缓冲输入流读入到缓冲区当中
          int length = bis.read(buffer);
          //判断是否读取到文件末尾
          if(length == -1){
              break;
          }
          //使用BufferedOutputStream缓冲输出流将缓冲区的数据写入到指定的目录(savePath + "\\" + filename)当中
          bos.write(buffer,0,length);
      }
      //关闭文件输入流
      bis.close();
      //刷新此输入流并强制写出所有缓冲的输出字节数
      bos.flush();
      //关闭文件输出流
      bos.close();
      }	
    }
	/**
	 * 修改订单任务状态
	 * @param taskState
	 * @return
	 * @throws ParseException 
	 */
	@ResponseBody
	@RequestMapping("translatorAction_updateTaskState")
	public Map<String,String> updateTaskState(HttpServletRequest request,int orderstat,int ordersId,
		int procedureTypeId	) throws ParseException{
		Order order=new Order();
		String result="";
		Map<String,String> map=new HashMap<String,String>();
		SimpleDateFormat  sdf=new  SimpleDateFormat("yyyy-MM-dd HH:mm");   
		java.util.Date  date=new  java.util.Date(); 
		String examinationTime=sdf.format(date);
		String message="";//记录订单流程
		//翻译流程为仅翻译
		if(procedureTypeId==1){
			//翻译
			if(orderstat==2){
			order.setTransTime("100%");
			order.setProoTime("暂无校对要求");
			order.setExpertTime("暂无审核要求");
			order.setTaskStateId(5);
			order.setExaminationTime(examinationTime);
			message="尊敬的客户您好，译员已上传翻译文件，请查收。订单任务已完毕，请您尽快签收订单。了解详情拨打010-82893875";
			}
		//翻译流程为翻译加校对	
		}else if(procedureTypeId==2){
			//翻译
			if(orderstat==2){
				order.setTransTime("100%");
				order.setTaskStateId(3);
				message="尊敬的客户您好，译员已上传翻译文件，请查收。了解详情拨打010-82893875";
				//校对
				}else if(orderstat==3){
					order.setProoTime("100%");
					order.setExpertTime("暂无审核要求");
					order.setTaskStateId(5);
					order.setExaminationTime(examinationTime);
					message="尊敬的客户您好，译员已上传校对文件，请查收。订单任务已完毕，请您尽快签收订单。了解详情拨打010-82893875";
				}
		//翻译流程为翻译校对审核	
		}else if(procedureTypeId==3){
			//翻译
			if(orderstat==2){
				order.setTransTime("100%");
				order.setTaskStateId(3);
				message="尊敬的客户您好，译员已上传翻译文件，请查收。了解详情拨打010-82893875";
				//校对
				}else if(orderstat==3){
					order.setProoTime("100%");
					order.setTaskStateId(4);
					message="尊敬的客户您好，译员已上传校对文件，请查收。了解详情拨打010-82893875";
				//审核	
				}else if(orderstat==4){
					order.setExpertTime("100%");
					order.setTaskStateId(5);
					order.setExaminationTime(examinationTime);
					message="尊敬的客户您好，译员已上传审核文件，请查收。订单任务已完毕，请您尽快签收订单。了解详情拨打010-82893875";
				}
		}
		
		
		order.setId(ordersId);
		orderService.updateTaskstateId(order);
		Order orderNeed=orderService.findOrderId(ordersId);
		ClientUserD clientUser=clientUserService.findCustomerById(orderNeed.getClientUserId());//找到对应的客户
		try {
			sendMessageAction_sendPhone(clientUser.getTel(), request, "","",message,"sign");
		} catch (IOException e) {
			result="error";
			e.printStackTrace();
		}
		result="success";
		map.put("result", result);
		return map;
	}
	
	
	
	
	
	
	/**
	 * 删除译员上传文件
	 * @param request
	 * @param fileName
	 * @return
	 */
	 @ResponseBody
	 @RequestMapping("translatorAction_deleteFile")
	 public Map<String,String> translatorAction_deleteFile(HttpServletRequest request,String fileName){
		 Map<String,String> map=new HashMap<String,String>();
		 Translator trans=(Translator) request.getSession().getAttribute("transid");
		 fileName = request.getSession().getServletContext().getRealPath("") + fileName; 
		 String result="";
		  File file = new File(fileName);
	        // 如果文件路径所对应的文件存在，并且是一个文件，则直接删除
	        if (file.exists() && file.isFile()) {
	            if (file.delete()) {
	                result="success";
	            } else {
	                result="fail";
	            }
	        } else {
	            result="fail";
	        }
	        map.put("result", result);
	        return map;
	    }
	    /**
	     * 验证手机,邮箱
	     * @param request
	     * @param cardID
	     * @param tel
	     * @param email
	     * @param bankNumber
	     * @return
	     */
	    @ResponseBody
		@RequestMapping("translatorAction_exportCardId")
		public Map<String,String> translatorAction_exportCardId(HttpServletRequest request,String cardID,String tel,String email,String bankNumber){
			List<ClientUserD> list=new ArrayList<ClientUserD>();
			List<Translator> listTran=new ArrayList<Translator>();
			Map<String,String> map=new HashMap<String,String>();
			String result="";
			String sql="";
			return map;
		}
	 
	 
	    
	    /**
	     * 时间20180308  twl
	     * 译员认证信息
	     * @param frontUrl
	     * @param reverseUrl
	     * @param request
	     * @return
	     * @throws IllegalStateException
	     * @throws IOException
	     */
	    @RequestMapping("translatorAction_addTransQuotationverify")
		public String addTransQuotationverify(@RequestParam("frontUrl")CommonsMultipartFile frontUrl,@RequestParam("reverseUrl")CommonsMultipartFile reverseUrl,HttpServletRequest request) throws IllegalStateException, IOException{
			
	    	//session 中的译员
	    	Translator transSession=(Translator) request.getSession().getAttribute("transid");
	    	String seeionId="";//session 中译员Id
	    	
	    	if(null!=transSession){
	    		seeionId=transSession.getId()+"";
	    	}
	    	
	    	String transId=request.getParameter("id");//前端（页面）返回数据 译员id
	    	
	    	//1  session为空，或修改译员id为空，或 session 与被修改的译员不是同一个人
			//2  session 与 被修改是同一人
	    	if(null!=transId && !"".equals(transId) && null!=seeionId && !"".equals(seeionId)){
	    		if(seeionId.equals(transId)){//2
					String realName=request.getParameter("realname");//真实姓名
					String idCard=request.getParameter("nameid");//证件号
					String accountName=transSession.getAccountName();
					
					
					//证件正反面照片
					String fornetUrlFilename = frontUrl.getOriginalFilename(); 
				    String reverseUrlFilename = reverseUrl.getOriginalFilename(); 
				    
				    // 图片上传的相对路径（因为相对路径放到页面上就可以显示图片） 存入数据库路劲 
			        String fornetUrlPath = "/upload/" + accountName+"/"+idCard+"/"+fornetUrlFilename; 
			        String reverseUrlPath = "/upload/" + accountName+"/"+idCard+"/"+reverseUrlFilename;
				       
			        // 图片上传的绝对路径  
			        String forentURL = request.getSession().getServletContext().getRealPath("") + fornetUrlPath; 
			        String reverseURL = request.getSession().getServletContext().getRealPath("") + reverseUrlPath;
			       
			        File forentDIR = new File(forentURL);  
			        if(!forentDIR.exists()) {  
			    	   forentDIR.mkdirs();  
			        } 
			        File reverseDIR = new File(reverseURL);  
			        if(!reverseDIR.exists()) {  
			    	   reverseDIR.mkdirs();  
			        }
			         
			        // 上传图片  
			        frontUrl.transferTo(new File(forentURL));  
			        reverseUrl.transferTo(new File(reverseURL));
			        
			        //添加译员认证信息
			        TransVerify transVerify=new TransVerify();
			        transVerify.setRealName(realName);
				    transVerify.setIdCard(idCard);
	                transVerify.setFrontUrl(fornetUrlPath);
	                transVerify.setReverseUrl(reverseUrlPath);
				    transVerify.setTranslatorId(Integer.parseInt(transId));
				    transVerifyService.saveTransVerify(transVerify);
			        
				    //修改译员表   realName  nameid 与认证表信息一致    修改译员认证状态为等待审核（编码1）
				    //认证信息也包括 出生日期，性别
				    String gender=request.getParameter("gender");//前端返回（页面）信息  性别
				    int genderNum=0;
				    if(null!=gender && !"".equals(gender)){
				    	genderNum=Integer.parseInt(gender);
				    }
				    Translator translator=new Translator();
					translator.setCertificationStatus("1");
					translator.setRealName(realName);
					translator.setNameid(idCard);
					translator.setBirthday(request.getParameter("birthday"));//出生日期
					translator.setGender(genderNum);//性别
					translator.setId(Integer.parseInt(transId));
					translatorService.updateVerifty(translator);
					
					//发送短信告诉管理员
					sendMessageAction_sendPhone("",request, "","","","newIdentity");
					try {
						SimpleAliDMSendMail simpleAliDMSendMail=new SimpleAliDMSendMail();
						simpleAliDMSendMail.sendEmail();
						//sendEmail();
					} catch (Exception e) {
						System.out.println("发送失败-----------------------------------------");
						e.printStackTrace();
					}
					return "forward:./translatorAction_findTrans.do";
	    		}else{//1
	    			return "forward:./updateBasicInfo.do?type=update";//跳转到译员认证页面
	    		}
	    	}else{//1
	    		return "forward:./updateBasicInfo.do?type=update";//跳转到译员认证页面
	    	}
			 
		}
	    
	 
	 
	/**
	 * 添加个人信息认证
	 * @param files
	 * @param request
	 * @return
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	/*@RequestMapping("translatorAction_addTransQuotationverify")
	public String addTransQuotationverify(@RequestParam("frontUrl")CommonsMultipartFile frontUrl,
			@RequestParam("reverseUrl")CommonsMultipartFile reverseUrl,HttpServletRequest request) throws IllegalStateException, IOException{
			TransVerify transVerify=new TransVerify();
			String realName=request.getParameter("names");
			String idCard=request.getParameter("IdCard");
			Translator transs=(Translator) request.getSession().getAttribute("transid");
			String accountName=transs.getAccountName();
			
			String fornetUrlFilename = frontUrl.getOriginalFilename(); 
		    String reverseUrlFilename = reverseUrl.getOriginalFilename(); 
		       
		    // 图片上传的相对路径（因为相对路径放到页面上就可以显示图片）  
		       String fornetUrlPath = "/upload/" + accountName+"/"+idCard+"/"+fornetUrlFilename; 
		       String reverseUrlPath = "/upload/" + accountName+"/"+idCard+"/"+reverseUrlFilename;  
		       
		    // 图片上传的绝对路径  
		       String forentURL = request.getSession().getServletContext().getRealPath("") + fornetUrlPath; 
		       String reverseURL = request.getSession().getServletContext().getRealPath("") + reverseUrlPath; 
		       
		       File forentDIR = new File(forentURL);  
		       if(!forentDIR.exists()) {  
		    	   forentDIR.mkdirs();  
		       } 
		       File reverseDIR = new File(reverseURL);  
		       if(!reverseDIR.exists()) {  
		    	   reverseDIR.mkdirs();  
		       }
		         
		       // 上传图片  
		       frontUrl.transferTo(new File(forentURL));  
		       reverseUrl.transferTo(new File(reverseURL));  
			   int transId=transs.getId();
			   transVerify.setRealName(realName);
			   transVerify.setIdCard(idCard);
               transVerify.setFrontUrl(fornetUrlPath);
               transVerify.setReverseUrl(reverseUrlPath);
			   transVerify.setTranslatorId(transId);
			   transVerifyService.saveTransVerify(transVerify);
			   Translator translator=new Translator();
			   translator.setIsVerifty(1);
			   translator.setId(transId);
			   translatorService.updateVerifty(translator);
		 return "forward:./translatorAction_findTrans.do";
	}*/
	 /** 
	     * 使用Ajax异步上传图片 
	     *  
	     * @param file 封装图片对象 
	     * @param request 
	     * @param response 
	     * @throws IOException  
	     * @throws IllegalStateException  
	     */ 
	  @RequestMapping("uploadUtils")  
	  public void uploadUtils(@RequestParam("file")CommonsMultipartFile file, 
	    	HttpServletRequest request,HttpServletResponse response) throws IllegalStateException, IOException {  
	      
	     try {
			Translator translator=new Translator();
			  // 获取图片原始文件名  
			String originalFilename = file.getOriginalFilename();  
			String newFileName=originalFilename.substring(0, originalFilename.indexOf("."));
		     // 文件名使用当前时间  
			String name = new SimpleDateFormat("yyyyMMddHH").format(new Date());  
        
			// 获取上传图片的扩展名(jpg/png/...)  
			String extension = FilenameUtils.getExtension(originalFilename);  
					  
			Translator trans=(Translator) request.getSession().getAttribute("transid");
			int id=trans.getId();
			String accountName=trans.getAccountName();
			// 图片上传的相对路径（因为相对路径放到页面上就可以显示图片）  
			String path = "/upload"+"/"+accountName+"/"+ name +newFileName+ "." + extension;  
			// 图片上传的绝对路径  
			String url = request.getSession().getServletContext().getRealPath("") + path; 
			translator.setUserUrl(path);
			translator.setId(id);
			translatorService.updateUrl(translator);
			File dir = new File(url); 
			if(!dir.exists()){  
		     dir.mkdirs();  
		    } 
			// 上传图片  
			file.transferTo(new File(url));  
        
			// 将相对路径写回（json格式）  
			JSONObject jsonObject = new JSONObject();  
			// 将图片上传到本地  
			jsonObject.put("path", "/Aitrans"+path);  
         
			// 设置响应数据的类型json  
			response.setContentType("application/json; charset=utf-8");  
			// 写回  
			response.getWriter().write(jsonObject.toString());
			} catch (Exception e) {
			e.printStackTrace();
		}  
	         
	    }   
	  

		/*@ResponseBody
		@RequestMapping("findByWhere")
		public List<Object> findByWhere(String transLanguage,String level,String transDomain,String procedureType,String length,String cycle,String time){
			List<Object> list=new ArrayList<Object>();
			//计算需求每千字加钱
			//查找周期系数
			Schedule schedule = new Schedule();
			double addTime=1;
			if("特急+".equals(cycle)){
				addTime=Double.parseDouble(time);
				addTime=addTime*1.1;
				cycle="特急";
			}
			schedule=scheduleService.queryBySchedule(cycle);
			
			
			//翻译字数
			int transLength =Integer.parseInt(length);
			
			//查找语言的基础价格；
			BasicPrice basicPrice = new BasicPrice();
			basicPrice=basicPriceService.queryByLanguage(transLanguage);
			
			//查找领域价格
			Field domain = new Field();
			int fld = Integer.parseInt(transDomain);
			domain=fieldService.queryById(fld);
			
			
			//查找译员等级系数
			TranslatorLevel translatorLevel = new TranslatorLevel();
			int transLevel = Integer.parseInt(level);
			translatorLevel=translatorLevelService.queryByLevel(transLevel);
			
			Double totalMoney=0.0;
			//只翻译     最终每千字价格 = 基础每千字价格	 *    领域系数    *   等级系数    *   周期系数   *  1
			double trans=basicPrice.getBasicPrice()*domain.getFactor()*translatorLevel.getFactor()*schedule.getFactor();
			
			
			//翻译和校对 最终每千字价格 = 基础每千字价格	 *    领域系数    *   等级系数    *   周期系数   *  1  +  （（基础每千字价格	 *    领域系数   *   周期系数） *0.5）/*等级系数
			double veri=trans+basicPrice.getBasicPrice()*domain.getFactor()*schedule.getFactor()*0.5/translatorLevel.getFactor();
			
			//翻译校对和审核  最终每千字价格 = 基础每千字价格	 *    领域系数    *   等级系数    *   周期系数   *  1  +  （（基础每千字价格	 *    领域系数   *   周期系数） *0.5）/*等级系数    +    （基础每千字价格	 *    领域系数   *   周期系数） *0.5 
			double proof=veri+basicPrice.getBasicPrice()*domain.getFactor()*schedule.getFactor()*0.5;
			
			//流程id
			int procedure=Integer.parseInt(procedureType);
			//流程名称
			String procedureName="";
			if(procedure==1){
				//只翻译
				totalMoney=trans;
				procedureName="只翻译";
			}
			if(procedure==2){
				//翻译和校对 
				totalMoney=veri;
				procedureName="翻译和校对";
			}
			if(procedure==3){
				//翻译校对及审核 	最终每千字价格 = 基础每千字价格	 *    领域系数    *   等级系数    *   周期系数   *  1  +  （（基础每千字价格	 *    领域系数   *   周期系数） *0.5）/*等级系数    +    （基础每千字价格	 *    领域系数   *   周期系数） *0.5 
				totalMoney=proof;
				procedureName="翻译校对和审核";
			}
			
			//四舍五入
			BigDecimal bg = new BigDecimal(totalMoney).setScale(2, RoundingMode.DOWN);
			
			
			
			 * 查找译员时通过查找译员报价中符合条件的id查找译员，译员等级根据流程判断，
			 * 如procedure==1翻译等级为level ，procedure=2校对等级为 level，procedure审核等级为level，
			 
			List<Translator> transList = new ArrayList<Translator>();
			//译员语言
			Translator translator = new Translator();
			translator.setDomain(domain.getField());
			translator.setLanguages(transLanguage);
			if(procedure==1){
				//只翻译
				translator.setMsg("1");
				translator.setTranlevels(Integer.parseInt(level));
			}
			if(procedure==2){
				//翻译和校对 
				translator.setMsg("2");
				translator.setProolevels(Integer.parseInt(level));
			}
			if(procedure==3){
				//翻译校对及审核
				translator.setMsg("3");
				translator.setAuditlevels(Integer.parseInt(level));
			}
			
			
			transList=translatorService.queryByWhere(translator);//符合条件总记录数
			int page=getRandom(transList.size(),6);
			//取出随机数前项
			for(int i=page;i>=0;i--){
				transList.remove(i);
			}
			for(int i=page+6;i<transList.size();){
				transList.remove(6);
				
			}
			list.add(transList);
			list.add(transList.size());
			list.add(bg);
			System.out.println(list.get(0));
			System.out.println(list.get(1));
			System.out.println(list.get(2));
				return list;
			}

		public int getRandom(int totalCount,int size){
			Random random = new Random();	//随机数对象
			int arrLength=0;//随机数
			int result=0;
	 
			if(totalCount<=size){//总数小于size，不需要随机数
				result=0;
			}
			//总数大于size，取随机数，随机数+size<=总记录数
			else if(totalCount>size){
				arrLength=random.nextInt(totalCount);//兑换数中取随机数
				
				while(arrLength<=0){//随机数小于0，重新取值
					arrLength=random.nextInt(totalCount);
				}
				
				//size+arrLength<=totalCount
				if(size+arrLength<=totalCount){
					result=arrLength;
				}else{
					result=getRandom(totalCount,size);
				}
				
			}
			
			return result;
		}*/
    
	  	@ResponseBody
		@RequestMapping("findByWhere")
		public List<Object> findByWhere(String transLanguage,String level,String transDomain,String procedureType,String length,String cycle,String time){
			List<Object> list=new ArrayList<Object>();
			//计算需求每千字加钱
			//查找周期系数
			Schedule schedule = new Schedule();
			//double addTime=1;
			if("特急+".equals(cycle)){
				/*addTime=Double.parseDouble(time);
				addTime=addTime*1.1;*/
				cycle="特急";
			}
			schedule=scheduleService.queryBySchedule(cycle);
			
			//翻译字数
			//int transLength =Integer.parseInt(length);
			
			//查找语言的基础价格；
			BasicPrice basicPrice = new BasicPrice();
			basicPrice=basicPriceService.queryByLanguage(transLanguage);
			
			//查找领域价格
			Field domain = new Field();
			int fld = Integer.parseInt(transDomain);
			domain=fieldService.queryById(fld);
			
			
			//查找译员等级系数
			TranslatorLevel translatorLevel = new TranslatorLevel();
			int transLevel = Integer.parseInt(level);
			translatorLevel=translatorLevelService.queryByLevel(transLevel);
			
			Double totalMoney=0.0;
			//只翻译     最终每千字价格 = 基础每千字价格	 *    领域系数    *   等级系数    *   周期系数   *  1
			double trans=basicPrice.getBasicPrice()*domain.getFactor()*translatorLevel.getFactor()*schedule.getFactor();
			
			
			//翻译和校对 最终每千字价格 = 基础每千字价格	 *    领域系数    *   等级系数    *   周期系数   *  1  +  （（基础每千字价格	 *    领域系数   *   周期系数） *0.5）/*等级系数
			double veri=trans+basicPrice.getBasicPrice()*domain.getFactor()*schedule.getFactor()*0.5/translatorLevel.getFactor();
			
			//翻译校对和审核  最终每千字价格 = 基础每千字价格	 *    领域系数    *   等级系数    *   周期系数   *  1  +  （（基础每千字价格	 *    领域系数   *   周期系数） *0.5）/*等级系数    +    （基础每千字价格	 *    领域系数   *   周期系数） *0.5 
			double proof=veri+basicPrice.getBasicPrice()*domain.getFactor()*schedule.getFactor()*0.5;
			
			//流程id
			int procedure=Integer.parseInt(procedureType);
			//流程名称
			//String procedureName="";
			if(procedure==1){
				//只翻译
				totalMoney=trans;
				//procedureName="只翻译";
			}
			if(procedure==2){
				//翻译和校对 
				totalMoney=veri;
				//procedureName="翻译和校对";
			}
			if(procedure==3){
				//翻译校对及审核 	最终每千字价格 = 基础每千字价格	 *    领域系数    *   等级系数    *   周期系数   *  1  +  （（基础每千字价格	 *    领域系数   *   周期系数） *0.5）/*等级系数    +    （基础每千字价格	 *    领域系数   *   周期系数） *0.5 
				totalMoney=proof;
				//procedureName="翻译校对和审核";
			}
			
			//四舍五入
			BigDecimal bg = new BigDecimal(totalMoney).setScale(2, RoundingMode.DOWN);
			
			
			/*
			 * 查找译员时通过查找译员报价中符合条件的id查找译员，译员等级根据流程判断，
			 * 如procedure==1翻译等级为level ，procedure=2校对等级为 level，procedure审核等级为level，
			 */
			List<Translator> transList = new ArrayList<Translator>();
			//译员语言
			Translator translator = new Translator();
			translator.setDomain(domain.getField());
			translator.setLanguages(transLanguage);
			if(procedure==1){
				//只翻译
				translator.setMsg("1");
				translator.setTranlevels(Integer.parseInt(level));
			}
			if(procedure==2){
				//翻译和校对 
				translator.setMsg("2");
				translator.setProolevels(Integer.parseInt(level));
			}
			if(procedure==3){
				//翻译校对及审核
				translator.setMsg("3");
				translator.setAuditlevels(Integer.parseInt(level));
			}
			
			
			transList=translatorService.queryByWhere(translator);//符合条件总记录数
			int page1=getRandom(transList.size(),6);
			//arrLength=getRandom(totalCount,3);
			if(transList.size()>6){
			Page page=new Page();
			page.setStartIndex(page1);
			page.setPageSize(6);
			page.setTotalCount(transList.size());
			transList=translatorService.queryByAll(page);
			//return integralList;
			}
			
			
			//取出list中重复的译员
			/*for(int i=0;i<transList.size();i++){
				for(int j=0;j<transList.size();j++){
					if(i!=j){//不是同一个
						int tidi=transList.get(i).getId();
						int tidj=transList.get(j).getId();
						if(tidi==tidj){
							transList.remove(j);
						}
					}
				}
			}*/
			//取出随机数前项
			/*
				for(int i=page-1;i>=0;i--){
					transList.remove(i);
				}
				for(int i=page+6;i<transList.size();){
					transList.remove(6);
					
				}
			}*/
			/*for(int i=page-1;i>0;i--){
				transList.remove(i);
			}
			for(int i=page+6;i<transList.size();){
				transList.remove(6);
				
			}*/
			list.add(transList);
			list.add(transList.size());
			list.add(bg);
			/*System.out.println(list.get(0));
			System.out.println(list.get(1));
			System.out.println(list.get(2));*/
				return list;
		}

		public int getRandom(int totalCount,int size){
			Random random = new Random();	//随机数对象
			int arrLength=0;//随机数
			int result=0;
	 
			if(totalCount<=size){//总数小于size，不需要随机数
				result=totalCount;
			}
			//总数大于size，取随机数，随机数+size<=总记录数
			else if(totalCount>size){
				arrLength=random.nextInt(totalCount);//兑换数中取随机数
				
				while(arrLength<=0){//随机数小于0，重新取值
					arrLength=random.nextInt(totalCount);
				}
				
				//size+arrLength<=totalCount
				if(size+arrLength<=totalCount){
					result=arrLength;
				}else{
					result=getRandom(totalCount,size);
				}
				
			}
			
			return result;
		}
	 
	 
	/**
	 * 执行修改密码操作
	 * @param request
	 * @return
	 */
	@RequestMapping("translatorAction_updatePassword")
	public String translatorAction_updatePassword(HttpServletRequest request){
		Translator trans=(Translator) request.getSession().getAttribute("transid");
		int transId=trans.getId();
		Map<String,String> map=new HashMap<String,String>();
		String password03=request.getParameter("password03");
		Translator translator=new Translator();
			translator.setPassword(MD5Util.ecode(MD5Util.ecode(password03)));
			translator.setInitialPassword(password03);
			translator.setId(transId);
			translatorService.updatePassword(translator);
			request.setAttribute("transid", translator);
			request.setAttribute("updateSucc", "passwordUpdateSucc");
			request.getSession().invalidate();
			return "forward:/forwardAction/forward_toLogin.do";
	}
	
	    
	    
	    /**
	     * 订单文件上传
	     * @param request
	     * @param files
	     * @return
	     */
	    @RequestMapping("translatorAction_uploadFile")
		public String translatorAction_uploadFile(HttpServletRequest request,@RequestParam(required=false) CommonsMultipartFile files[]){
	    	String current=request.getParameter("current");
	    	String ordersId=request.getParameter("orderId");
	    	int orderId=Integer.parseInt(ordersId);
	    	String fileNames="";
	    	if(current.equals("2")){
	    		fileNames="翻译文件";
	    	}else if(current.equals("3")){
	    		fileNames="校对文件";
	    	}else if(current.equals("4")){
	    		fileNames="审核文件";
	    	} 
	    	Translator trans=(Translator) request.getSession().getAttribute("transid");
			int id=trans.getId();
			String accountName=trans.getAccountName();
			String orginspath = "/upload"+"/"+accountName+"/"+ordersId+"/"+fileNames;  
			String path = request.getSession().getServletContext().getRealPath("") + orginspath;
			Order order=new Order();
			if(fileNames.equals("翻译文件")){
				order.setTransUrl(orginspath);
				order.setTaskStateId(2);
			}else if(fileNames.equals("校对文件")){
				order.setProoUrl(orginspath);
				order.setTaskStateId(3);
			}else if(fileNames.equals("审核文件")){
				order.setTaskStateId(4);
				order.setAuditUrl(orginspath);
			}
			order.setId(orderId);
			orderService.editOrderId(order);
			//创建path目录下的文件对象
			File saveDir = new File(path);
			//判断文件是否存在
			if(!saveDir.exists()){
				saveDir.mkdirs();
			}
			for(int i=0;i<files.length;i++){
				if(!files[i].isEmpty()){
					// 获取这个文件的传过来的名字
					String name=files[i].getOriginalFilename();
					File saveFile = new File(path,name);
					
					//从方法传入的文件对象获取输入流
					InputStream instream;
					try {
						instream = files[i].getInputStream();
						 //	创建一个新的输出流输出的文件就是saveFile这个文件类型
						FileOutputStream fos = new FileOutputStream(saveFile);
			      //	定义一个数组，来规定上传的速率 
						byte [] buffer = new byte [1024*10];
			      //	定义一个变量来判断是否读取完毕，
						int len = 0;
			      //	每次循环给len赋值赋予输入流读取的数据长度不为-1则一直循环下去
						while(((len=instream.read(buffer))!=-1)){
							//写出已读入buffer的内容
							fos.write(buffer,0,len);
						}
						fos.close();//关闭输入输出流
						instream.close();
					} catch (IOException e) {
						request.setAttribute("message", "fail");
						e.printStackTrace();
					}						
				}	
			}
			request.setAttribute("message", "success");
			return "./translatorAction_lookOrder.do?id="+ordersId;
		}
	    
	 
	    
	   
	    
	    /**
	     * 积分兑换
	     * @param request
	     * @return
	     */
	    @ResponseBody
	    @RequestMapping("translatorAction_exchange")
	    public Map<String,String> translatorAction_exchange(HttpServletRequest request,int goodsMark,String goodId,int cusMark){
	    	Translator trans=(Translator) request.getSession().getAttribute("transid");
	    	String result="";
	    	Map<String,String> map=new HashMap<String,String>();
			int id=trans.getId();
			String nickname=trans.getNickname();
			int point=cusMark-goodsMark;
			trans.setPoint(point);
			Translator translator=new Translator();
			translator.setNickname(nickname);
			translator.setPoint(point);
			translator.setId(id);
			translatorService.updataTranslator(translator);
			Date date1=new Date();
			SimpleDateFormat  sdff=new  SimpleDateFormat("yyyy-MM-dd hh:mm:ss");    
	 		String  exchangeTime=sdff.format(date1);  
			Exchange exchange=new Exchange();
			exchange.setExchangeState("待发货");
			exchange.setIntegralId(Integer.parseInt(goodId));
			exchange.setUsId(trans.getId());
			exchange.setExchangeTime(exchangeTime);
			exchangeService.saveExchange(exchange);
			map.put("result", "success");
			request.getSession().setAttribute("transid", trans);
			return map;
	    }
	    
	    /**
	     * 通过时间秒毫秒数判断两个时间的间隔
	     * @param date1
	     * @param date2
	     * @return
	     */
	    public static int differentDaysByMillisecond(Date date1,Date date2){
	        int days = (int) ((date2.getTime() - date1.getTime()) / (1000*3600*24));
	        return days;
	    }
	  /**
      * 译员荣誉评定
	  * @return
	  * @throws ParseException 
	  */
	  /*@RequestMapping("translatorAction_queryByhonor") 
	  public String translatorAction_queryByhonor(HttpServletRequest request) throws ParseException{
	    Translator trans=(Translator) request.getSession().getAttribute("transid");
	    int id=trans.getId();
		int honor=trans.getHonor();
	    String nickname=trans.getNickname();
		//查询译员完成订单数量    
		long orderCount=OrderService.queryCompstate(id);
	    //获取当前译员积分数量
		int point=trans.getPoint();
		//获取译员注册时间
		Date date1=trans.getRegisterTime();
	    //获取当前时间计算时间差
		Date date2=new Date();    
	    int days=differentDaysByMillisecond(date1, date2);
	    honor=(int) (honor+(point+days+orderCount));
	    Translator translator=new Translator();
	    translator.setNickname(nickname);
		translator.setHonor(honor);
		translator.setId(id);
		translatorService.updataTranslator(translator);
		trans.setHonor(honor);
		request.getSession().setAttribute("transid", trans);
		request.setAttribute("honor", honor);
	    return "forward:/interpreter/user.interpreter.reputation.jsp";
	 }*/
	   /**
	    * 译员排名展示
	    * @param request
	    * @return
	    * 译员将针对等级*10平台内完成总字数/100+评价总分数/10 译员信誉/50等进行排名。
	    */
	  @RequestMapping("translatorAction_queryByRank")
	  public String translatorAction_queryByRank(HttpServletRequest request){
		  Translator trans=(Translator) request.getSession().getAttribute("transid");
		  int id=trans.getId();
		  List<Translator> translatorRankList=translatorService.queryByTranRank();
		  for (int i = 0; i < translatorRankList.size(); i++) {
			  int transId=translatorRankList.get(i).getId();
			  if(transId==id){
				  String ranking=translatorRankList.get(i).getMsg();
				  request.setAttribute("ranking", ranking);
				  break;
			  }
		}
		  return "forward:/interpreter/user.interpreter.ranking.jsp";
	  }
	  
	  
	  /**
		 * 验证银行卡号与开户行是否一致
		 * @param bankNumber
		 * @return
		 */
		@RequestMapping("translatorAction_getOpenBank")
		@ResponseBody
		public Map<String,String> getOpenBank(String bankNumber){
			BankUtil bankUtil=new BankUtil();
			String openBank=bankUtil.getNameOfBank(bankNumber);
			Map<String,String> map=new HashMap<String,String>();
			map.put("msg", openBank);
			return map;
			
		}
		
	/**
	 * 根据语言以及领域查询对应信息	
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("translatorAction_transQuotationInfos")
	public Map<Object,Object> translatorAction_transQuotationInfos(HttpServletRequest request){
		Map<Object,Object> map=new HashMap<Object,Object>();
		String language=request.getParameter("language");
		String domain=request.getParameter("domain");
		int transtionId=Integer.parseInt(request.getParameter("id"));
		Quotation quotation=new Quotation();
		quotation.setLanguages(language);
		quotation.setDomain(domain);
		quotation.setTranstionId(transtionId);
		List<Integer> levels=quotationService.queryByLevels(quotation);
		map.put("quotationlevel", levels);
		return map;
	}
	 
		
	/**
	 * 根据语言以及领域查询流程类型	
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("translatorAction_procedureType")
	public Map<Object,Object> translatorAction_procedureType(HttpServletRequest request){
		Map<Object,Object> map=new HashMap<Object,Object>();
		String language=request.getParameter("language");
		String domain=request.getParameter("domain");
		int transtionId=Integer.parseInt(request.getParameter("id"));
		String levels=request.getParameter("level");
		Quotation quotation=new Quotation();
		quotation.setLanguages(language);
		quotation.setDomain(domain);
		quotation.setTranstionId(transtionId);
		quotation.setTranlevels(Integer.parseInt(levels));
		List<KeyAndValueVo> transProcedureType=quotationService.queryByProcedureType(quotation);
		map.put("transProcedureType", transProcedureType);
		return map;
	}	
		
	/**
	 * 获取译员等级信息
	 * @param request
	 * @return
	 */
	@RequestMapping("translatorAction_getTranlevels")    
	public String translatorAction_getTranlevels(HttpServletRequest request){
		Translator trans=(Translator) request.getSession().getAttribute("transid");
		request.setAttribute("transquotation", translatorService.queryByQuotation(trans.getId()));
		return "forward:/interpreter/user.interpreter.grade.jsp";
	}
	
	
	/**
	 * 获取评价总数
	 */
	@RequestMapping("translatorAction_getEvaluate")
	public String translatorAction_getEvaluate(HttpServletRequest request,String msg){
		Translator trans=(Translator) request.getSession().getAttribute("transid");
		int transId=trans.getId();
		//构建一个分页信息对象
		Page page = new Page();
		//判断并给予分页信息赋值
		if(msg==null || msg==""){
		 page.setMsg("%%");
		}else {
	     page.setMsg("%"+msg+"%");
	   }
		//获取总记录数
		long totalCount= evaluateService.queryEvaluateCount(transId);
		//存储总记录数
		page.setTotalCount(totalCount);
		//传递page
		request.setAttribute("page", page);
		return "forward:/interpreter/user.interpreter.myeValuate.jsp";
	} 
	
	  //查询评价数量
	   @ResponseBody
	   @RequestMapping("translatorAction_queryByAllEvaluate")
		public Map<String,Object>  translatorAction_queryByAllEvaluate(HttpServletRequest request,String pageNum){
			Map<String, Object> map = new HashMap<String, Object>();
			Translator trans=(Translator) request.getSession().getAttribute("transid");
			int transId=trans.getId();
			//如未给予当前页面，则给予初始值
			if("null".equals(pageNum) || "".equals(pageNum) || "0".equals(pageNum) || pageNum==null){
				pageNum="1";
			}
			//构建一个page分页属性对象
			Page page =new Page();
			//获取总记录数
			long totalCount= evaluateService.queryEvaluateCount(transId);
			if(totalCount==0){
				Page page1 = new Page(totalCount, pageNum, 4);
				List<EvaluateClient> evaluateList=new ArrayList<EvaluateClient>();
				request.setAttribute("evaluateList", evaluateList);
				map.put("evaluateList", evaluateList);
				map.put("page", page1);
			}else{
				Page page1 = new Page(totalCount, pageNum, 4);
				page1.setMsgId(transId);
				List<EvaluateClient>  evaluateList=evaluateService.queryByAllEvaluate(page1);
				String ss=evaluateList.toString();
				map.put("evaluateList", evaluateList);
				 map.put("page", page1);
			}
			return map;
		}
	   
	   /**
		 * 获取译员评价详细信息
		 * @param request
		 * @return
		 */
		@RequestMapping("translatorAction_getEvaluatedetails")    
		public String translatorAction_getEvaluatedetails(HttpServletRequest request,int id){
			EvaluateClient evaluateClient=evaluateService.queryByEvaluateId(id);
			int orderId=evaluateClient.getOrderId();
			Order order=orderService.findOrderId(orderId);
			if(order!=null){
				order.setExaminationTime(order.getExaminationTime().substring(0,10));
				request.setAttribute("orderImpl", order);
				ClientUserD clinetUser=clientUserService.findCustomerById(order.getClientUserId());
				request.setAttribute("clinetUser", clinetUser);
				ClientCustomerNeed clientCustomerNeed=new ClientCustomerNeed();
				clientCustomerNeed.setId(order.getClientCustomerNeedId());
				int clientCustomerId=order.getClientCustomerNeedId();
				ClientCustomerNeed clientCustomerNeeds=clientCustomerService.findTransNeedByid(clientCustomerId);
				/*clientCustomerNeed=clientCustomerService.queryByWhere(clientCustomerNeed).get(0);*/
				request.setAttribute("clientCustomerNeedImpl", clientCustomerNeeds);
				Translator translator=translatorService.queryTransById(order.getTranslatorid());
				request.setAttribute("translatorImpl", translator);
				request.setAttribute("evaluateClient", evaluateClient);
			}
			return "forward:/interpreter/user.interpreter.myeValuate.details.jsp";
		} 
	   /**
	    * 译员提交申诉请求
	    * @param id
	    * @return
	    */
		@ResponseBody
		@RequestMapping("translatorAction_updateEvaluate")
		private Map<String,String> translatorAction_updateEvaluate(int id,HttpServletRequest request, String text){
			Translator trans=(Translator) request.getSession().getAttribute("transid");
			int translatorId=trans.getId();
			String result="";
			Map<String,String> map=new HashMap<String,String>();
			try {
				EvaluateClient evaluateClient=new EvaluateClient();
				//修改评价状态为已申诉
				evaluateClient.setState(1);
				evaluateClient.setId(id);
				evaluateService.updateEvaluateState(evaluateClient);
				AppealClient appealClient=new AppealClient();
				appealClient.setTranslatorId(translatorId);
				EvaluateClient evaluateClients=evaluateService.queryByEvaluateId(id);
				int orderId=evaluateClients.getOrderId();
				appealClient.setOrderId(orderId);
				appealClient.setCause(text);
				Date date1=new Date();
				SimpleDateFormat  sdf=new  SimpleDateFormat("yyyy-MM-dd hh:mm:ss");    
				String  appealDate=sdf.format(date1); 
				appealClient.setAppealDate(appealDate);
				appealClient.setAppealstate(1);
				appealCilentService.addTransAppeal(appealClient);
			} catch (Exception e) {
				e.printStackTrace();
				result="fail";
			}
			result="success";
			map.put("result", result);
			return map;
		}
		
		
		//判断当前译员有无被选定的条件
		@ResponseBody
		@RequestMapping("translatorAction_findTransQuotation")
		public Map<Object,Object> findTransQuotation(HttpServletRequest request,int id){
			List<Translator>  quotationList=translatorService.queryByQuotation(id);
			String result="";
			Map<Object,Object> map=new HashMap<Object,Object>();
			if(quotationList==null || quotationList.size()==0){
				result="fail";
			}else{
				result="success";
			}
			map.put("result", result);
			return map;
		}
		
	  /**
	   * 接受	译员报价信息并在发布项目进行展示
	   * @param request
	   * @return
	   */
	  @ResponseBody
	  @RequestMapping("translatorAction_queryPrices")
	  public Map<Object,Object> translatorAction_queryPrices(HttpServletRequest request){
		  Map<Object,Object> map=new HashMap<Object,Object>();
		  String language=request.getParameter("language");
		  String domain=request.getParameter("domain");
		  int transtionId=Integer.parseInt(request.getParameter("id"));
		  String levels=request.getParameter("level");
		  String procedureType=request.getParameter("procedureType");
		  Quotation quotation=new Quotation();
		  quotation.setLanguages(language);
		  quotation.setDomain(domain);
		  quotation.setTranstionId(transtionId);
		  if(procedureType.equals("仅翻译")){
			  quotation.setTranlevels(Integer.parseInt(levels));
		  }
		  if(procedureType.equals("翻译校对")){
			  quotation.setProolevels(Integer.parseInt(levels)); 
		  }
		  if(procedureType.equals("翻译校对审核")){
			  quotation.setAuditlevels(Integer.parseInt(levels));
		  }
		  
		  Quotation transPrices=quotationService.queryByTranPrices(quotation);
		  map.put("transPrices", transPrices);
		  return map;
	  }
		
		
		/**
		 * 设置密保问题
		 * @param problem
		 * @param answer
		 * @param request
		 * @return
		 */
		@RequestMapping("translatorAction_saveTransQuestion")
		public String translatorAction_saveTransQuestion(String problem,String answer,HttpServletRequest request){
			Translator trans=(Translator) request.getSession().getAttribute("transid");
			int id=trans.getId();
			String nickname=trans.getNickname();
			trans.setProblem(problem);
			trans.setAnswer(answer);
			Translator translator=new Translator();
			translator.setNickname(nickname);
			translator.setProblem(problem);
			translator.setAnswer(answer);
			translator.setId(id);
			translatorService.updataTranslator(translator);
			request.getSession().setAttribute("transid", trans);
			request.setAttribute("transid", trans);
			return "forward:/usercenter/user.interpreter.password.protection.jsp";
		} 	
		/**
		 * 查询译员荣誉值
		 * @param request
		 * @return
		 */
		@RequestMapping("translatorAction_saveTransHonor")
		public String translatorAction_queryTransHonor(HttpServletRequest request){
			Translator trans=(Translator) request.getSession().getAttribute("transid");
			int honor=trans.getHonor();
			request.setAttribute("honor", honor);
			return "forward:/interpreter/user.interpreter.reputation.jsp";
		}
	
	 /**
	  * 对于译员报价信息进行校验
	  * @param request
	  * @param languageDomain
	  * @param domain
	  * @return
	  */
	 @ResponseBody
	 @RequestMapping("translatorAction_checkTransPrice")
	 public Map<String,Double>  translatorAction_checkTransPrice(HttpServletRequest request,String languageDomain,String domain,String tranPrice,int translevel){
		  //查找语言的基础价格；
		 Map<String,Double> map=new HashMap<String,Double>();
		 double trans=0;
		 double veri=0;
		 double proof=0;
			BasicPrice basicPrice = new BasicPrice();
			basicPrice.setType(languageDomain);
			basicPrice=basicPriceService.queryByLanguage(languageDomain);
			TranslatorLevel transLevels=translatorLevelService.queryByLevel(translevel);
			//拿到前台选中的复选框中的值(domain);因为是多个,所以是数组类型的
			String[] checkdomain=domain.split(",");
			double tranPrices=Double.parseDouble(tranPrice);
			//查找领域价格
			Field field = new Field();
			for (int i = 0; i < checkdomain.length; i++) {
				String domain1=checkdomain[i];
				field.setField(domain1);
				int domains=fieldService.getDomainId(domain1);
				field=fieldService.queryById(domains);
				//只翻译     最终每千字价格 = 基础每千字价格	 *    领域系数    
				 trans=basicPrice.getBasicPrice()*field.getFactor()*transLevels.getFactor();
				 if(tranPrices < trans){
					 break;
				 }
			}
			/*//翻译和校对 最终每千字价格 = 基础每千字价格	 *    领域系数    *   等级系数    *   周期系数   *  1  +  （（基础每千字价格	 *    领域系数   *   周期系数） *0.5）/*等级系数
			veri=trans+basicPrice.getBasicPrice()*field.getFactor()*0.5;
			if(tranPrices < veri){
			}
			//翻译校对和审核  最终每千字价格 = 基础每千字价格	 *    领域系数    *   等级系数    *   周期系数   *  1  +  （（基础每千字价格	 *    领域系数   *   周期系数） *0.5）/*等级系数    +    （基础每千字价格	 *    领域系数   *   周期系数） *0.5 
			proof=veri+basicPrice.getBasicPrice()*field.getFactor()*0.5;
			if(tranPrices < veri){
			}
			map.put("proof", proof);
	        map.put("veri", veri);*/
	        map.put("trans", trans);
		 return map;
	 }
	 /**
	  * 校对价格校验
	  * @param request
	  * @param languageDomain
	  * @param domain
	  * @param tranPrice
	  * @return
	  */
	 @ResponseBody
	 @RequestMapping("translatorAction_checkProoPrice")
	 public Map<String,Double>  translatorAction_checkProoPrice(HttpServletRequest request,String languageDomain,String domain,String tranPrice,int proolevel){
		  //查找语言的基础价格；
		 Map<String,Double> map=new HashMap<String,Double>();
		 double trans=0;
		 double veri=0;
		 double proof=0;
			BasicPrice basicPrice = new BasicPrice();
			basicPrice.setType(languageDomain);
			basicPrice=basicPriceService.queryByLanguage(languageDomain);
			TranslatorLevel prooLevels=translatorLevelService.queryByLevel(proolevel);
			//拿到前台选中的复选框中的值(domain);因为是多个,所以是数组类型的
			String[] checkdomain=domain.split(",");
			double tranPrices=Double.parseDouble(tranPrice);
			//查找领域价格
			Field field = new Field();
			for (int i = 0; i < checkdomain.length; i++) {
				String domain1=checkdomain[i];
				field.setField(domain1);
				int domains=fieldService.getDomainId(domain1);
				field=fieldService.queryById(domains);
				//翻译校对和审核  最终每千字价格 = 基础每千字价格	 *    领域系数    *   等级系数    *   周期系数   *  1  +  （（基础每千字价格	 *    领域系数   *   周期系数） *0.5）/*等级系数    +    （基础每千字价格	 *    领域系数   *   周期系数） *0.5 
				proof=veri+basicPrice.getBasicPrice()*field.getFactor()*0.5*prooLevels.getFactor();
				if(tranPrices < proof){
					break;
				}
			}
			  map.put("proof", proof);
		 return map;
	 }
	 /**
	  * 审核价格校验
	  * @param request
	  * @param languageDomain
	  * @param domain
	  * @param tranPrice
	  * @return
	  */
	 @ResponseBody
	 @RequestMapping("translatorAction_checkAuditPrice")
	 public Map<String,Double>  translatorAction_checkAuditPrice(HttpServletRequest request,String languageDomain,String domain,String tranPrice,int auditLevel){
		  //查找语言的基础价格；
		 Map<String,Double> map=new HashMap<String,Double>();
		 double trans=0;
		 double veri=0;
		 double proof=0;
			BasicPrice basicPrice = new BasicPrice();
			basicPrice.setType(languageDomain);
			basicPrice=basicPriceService.queryByLanguage(languageDomain);
			TranslatorLevel auditLevels=translatorLevelService.queryByLevel(auditLevel);
			//拿到前台选中的复选框中的值(domain);因为是多个,所以是数组类型的
			String[] checkdomain=domain.split(",");
			double tranPrices=Double.parseDouble(tranPrice);
			//查找领域价格
			Field field = new Field();
			for (int i = 0; i < checkdomain.length; i++) {
				String domain1=checkdomain[i];
				field.setField(domain1);
				int domains=fieldService.getDomainId(domain1);
				field=fieldService.queryById(domains);
				//翻译和校对 最终每千字价格 = 基础每千字价格	 *    领域系数    *   等级系数    *   周期系数   *  1  +  （（基础每千字价格	 *    领域系数   *   周期系数） *0.5）/*等级系数
				veri=trans+basicPrice.getBasicPrice()*field.getFactor()*0.5*auditLevels.getFactor();
				if(tranPrices < veri){
					break;
				}
			}
	        map.put("veri", veri);
		 return map;
	 }
/*	*//**
	 * 返回译员报价
	 * @return
	 *//*
	@RequestMapping("quotation")
	public double quotation(String procedureType,String transLanguage,String transDomain,String tid){
		
		//查找译员报价
		Field field=new Field();
		int fieldId=Integer.parseInt(transDomain);
		field=fieldService.queryById(fieldId);
		
		Translator translator=new Translator();
		translator.setId(Integer.parseInt(tid));
		translator.setLanguages(transLanguage);
		translator.setDomain(field.getField());
		translator=translatorService.queryQuotation(translator);
		if(translator!=null){
			//根据流程返回译员各种报价
			if("1".equals(procedureType)){
				//查找翻译报价
				return translator.getTranPrice();
			}
			else if("2".equals(procedureType)){
				//查找校对报价
				return translator.getProoPrice();
			}
			else if("3".equals(procedureType)){
				//查找审核报价
				return translator.getAuditPrice();
			}
			else{
				return 0.0;
			}
		}else{
			return 0;
		}
		
	}
*/	
	 
	 
	/**
	 * 译员申请等级提升 
	 * @param quotataionId
	 * @return
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@ResponseBody
	@RequestMapping("translatorAction_promoteRank")
	public String translatorAction_promoteRank(HttpServletRequest request,@RequestParam(value="filename") CommonsMultipartFile filename) throws IllegalStateException, IOException{
		try {
			Translator transs=(Translator) request.getSession().getAttribute("transid");
			String accountName=transs.getAccountName();
			Quotation quotation=new Quotation();
			String reason=request.getParameter("reason");
			String updateLevel=request.getParameter("updateLevel");
			int qutationId=Integer.parseInt(request.getParameter("quotationId"));
			if("翻译等级".equals(updateLevel)){
					quotation.setApplyStateT(1);
					String filenames = filename.getOriginalFilename();
					 String originalFile="/upload/" + accountName+"/"+"个人简历"+"/"+filenames;
					 String originalURL = request.getSession().getServletContext().getRealPath("") + originalFile;
					 File originalDIR=new File(originalURL);
					   if(!originalDIR.exists()) {  
						   originalDIR.mkdirs();  
					   }
					   filename.transferTo(new File(originalURL)); 
					   quotation.setTranReason(reason);
			}else if("校对等级".equals(updateLevel)){
				quotation.setApplyStateP(1);
				String filenames = filename.getOriginalFilename();
				 String prooUrlPath = "/upload/" + accountName+"/"+"校对资料"+"/"+filenames;
				 String prooURL = request.getSession().getServletContext().getRealPath("") + prooUrlPath;
				 File prooDIR = new File(prooURL);  
			       if(!prooDIR.exists()) {  
			    	   prooDIR.mkdirs();  
			       } 
			       filename.transferTo(new File(prooURL));
			       quotation.setProoReason(reason);
			}else if("审核等级".equals(updateLevel)){
				quotation.setApplyStateA(1);
				String filenames = filename.getOriginalFilename();
				String auditUrlPath = "/upload/" + accountName+"/"+"审核资料"+"/"+filenames;
				String auditURL = request.getSession().getServletContext().getRealPath("") + auditUrlPath; 
				File auditDIR = new File(auditURL);  
			       if(!auditDIR.exists()) {  
			    	   auditDIR.mkdirs();  
			       }
			       filename.transferTo(new File(auditURL)); 
			       quotation.setAuditReason(reason);
			}
			quotation.setId(qutationId);
			quotationService.updateTranLevel(quotation);
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
		return "success";
	}
	
	 
	/**
	 * 跳转钱包页面
	 * @param request
	 * @return
	 */
	  @RequestMapping("mywallet")
	  public String mywallet(HttpServletRequest request){
		  Translator t1 = (Translator)request.getSession().getAttribute("transid");
		  int id = t1.getId();
		  Translator translator = translatorService.queryTransById(id);
		  request.setAttribute("translator", translator);
		  return "forward:/interpreter/user.interpreter.wallet.jsp"; 
	  }
	
	  
	  
	/**
	 * 新跳转修改基本资料页面
	 */
	 @RequestMapping("/updateBasicInfo")
	 public String updateBasicInfo(HttpServletRequest request){
		 Translator t1 = (Translator)request.getSession().getAttribute("transid");
		 int id = t1.getId();
		 Translator translator = translatorService.queryTransById(id);
		 request.setAttribute("translator", translator);
		 return "forward:/usercenter/user.center.interpreter.new.updateInfo.jsp";
	 }
	 
	 /**
	  * 检查昵称
	  */
	 @RequestMapping("/checkNickname")
	 @ResponseBody
	 public Map<String,String> checkNickname(String nickname){
		 Map<String,String> map = new HashMap<String,String>();
		 Integer count = translatorService.checkNickname(nickname);
		 if(count == null || count == 0){
			 map.put("result", "success");
		 }else{
			 map.put("result", "error");
		 }
		 return map;
	 }
	 
	 /**
	  * 跳转实名认证
	  */
	 @RequestMapping("/newIdentity")
	 public String newIdentity(HttpServletRequest request){
		 Translator t1 = (Translator)request.getSession().getAttribute("transid");
		 int id = t1.getId();
		 Translator translator = translatorService.queryTransById(id);
		 request.setAttribute("translator", translator);
		 return "forward:/usercenter/user.center.interpreter.new.identity.jsp";
	 }
	 
	 /**
	  * 跳转翻译资格申请
	  */
	 @RequestMapping("/newLanguage")
	 public String newLanguage(HttpServletRequest request){
		 List<String> languageList = new ArrayList<String>();
		 String languageStr = "英汉,汉英,韩汉,汉韩,汉日,日汉,法汉,汉法,德汉,汉德";
		 String[] split = languageStr.split(",");
		 for (int i = 0; i < split.length; i++) {
			 languageList.add(split[i]);
		}
		 Translator t1 = (Translator)request.getSession().getAttribute("transid");
		 int id = t1.getId();
		 Translator translator = translatorService.queryTransById(id);
		 List<String> transLanguagesStr = translatorService.getTransLanguagesStr(id);
		 for (String string : transLanguagesStr) {
			 languageList.remove(string);
		}
		 request.setAttribute("languageList", languageList);
		 request.setAttribute("translator", translator);
		 return "forward:/usercenter/user.center.interpreter.new.addLanguage.jsp";
		 
	 }
	 
	 /**
		 * 根据id查询执行修改
		 * @param transId
		 * @param request
		 * @return
		 */
		@RequestMapping("translatorAction_reviewUU")
		public String translatorAction_reviewUU(int id,HttpServletRequest request){
			Translator trans=(Translator) request.getSession().getAttribute("transid");
			int transId=trans.getId();
			request.setAttribute("quotationTransList", quotationService.queryByTransPrice(transId));
			request.setAttribute("quotationProoList", quotationService.queryByProoPrice(transId));
			request.setAttribute("quotationAuditList", quotationService.queryByAuditPrice(transId));
			request.setAttribute("translatorsQ", translatorService.queryQuotationByid(id));
			request.setAttribute("translators", translatorService.queryTransById(transId));
			request.setAttribute("id", id);
			request.setAttribute("page", "addQuo");
			return "forward:/usercenter/user.center.new.reviewQuotation.jsp";
		}
		
	/**
	 * 
	 * @param id
	 * @param language
	 * @return
	 */
	@RequestMapping("/getDomainsByLanguage")
	@ResponseBody
	public List<String> getDomainsByLanguage(int id,String language){
		Map<String,Object> map = new HashMap<String,Object>();
		List<String> doamins = new ArrayList<String>();
		String existsDomains = ""; 
		if(language != null && !"".equals(language)){
			map.put("id", id);
			map.put("language", language);
			List<String> domainsByLanguage = translatorService.getDomainsByLanguage(map);
			for (int i = 0; i < domainsByLanguage.size(); i++) {
				if(i==0){
					existsDomains = "'" + domainsByLanguage.get(i) + "'";
				}else{
					existsDomains = existsDomains + "," + "'" + domainsByLanguage.get(i) + "'";
				}
			}
			map.put("notin", existsDomains);
			doamins = translatorService.notinDomains(map);
			return doamins;
		}else{
			return doamins;
		}
	}
	
	
	@RequestMapping("/addNewLanguage")
	public ModelAndView addNewLanguage(HttpServletRequest request,Integer id,String language,String domain,Integer transLevel,Integer prooLevel,Integer auditLevel,Integer transWords,Integer prooWords,
			Integer auditWords,Integer transWordsDay,Integer prooWordsDay,Integer auditWordsDay,Double transPrice,Double prooPrice,Double auditPrice,String orignalEssay,String transEssay,
					@RequestParam("personalFile")CommonsMultipartFile personalFile,@RequestParam("transFile") CommonsMultipartFile transFile,
					@RequestParam("proofFile") CommonsMultipartFile proofFile,@RequestParam("auditFile") CommonsMultipartFile auditFile){
		ModelAndView mav = new ModelAndView();
		try {
			//获取添加报价人  ====session
			Translator trans=(Translator) request.getSession().getAttribute("transid");
			
			//获取服务器路径
			String classPath=request.getSession().getServletContext().getRealPath("");
			String[] doaminArr = domain.split(",");
			for (int i = 0; i < doaminArr.length; i++) {
				int fieldId = translatorService.findFieldId(doaminArr[i]);
				Translator translator = new Translator();
				if(transLevel != null && transLevel != 0){
					BigDecimal singlePriceT = getSinglePrice(language,""+transLevel,""+fieldId,"1","一般");
					if(transPrice != null && transPrice != 0){
						BigDecimal payT = new BigDecimal(transPrice).multiply(new BigDecimal(1.2));
						if(payT.doubleValue() > singlePriceT.doubleValue()){
							payT = payT.setScale(2, BigDecimal.ROUND_HALF_UP);
							translator.setTranPrice(payT.doubleValue());
						}
					}
				}
				if(prooLevel != null && prooLevel != 0){
					BigDecimal singlePricep = getSinglePrice(language,""+prooLevel,""+fieldId,"2","一般");
					if(prooPrice != null && prooPrice != 0){
						BigDecimal payP = new BigDecimal(prooPrice).multiply(new BigDecimal(1.2));
						if(payP.doubleValue() > singlePricep.doubleValue()){
							payP = payP.setScale(2, BigDecimal.ROUND_HALF_UP);
							translator.setProoPrice(payP.doubleValue());
						}
					}
				}
				if(auditLevel != null && auditLevel != 0){
					BigDecimal singlePriceA = getSinglePrice(language,""+auditLevel,""+fieldId,"3","一般");
					if(auditPrice != null && auditPrice != 0){
						BigDecimal payA = new BigDecimal(auditPrice).multiply(new BigDecimal(1.2));
						if(payA.doubleValue() > singlePriceA.doubleValue()){
							payA = payA.setScale(2, BigDecimal.ROUND_HALF_UP);
							translator.setAuditPrice(payA.doubleValue());
						}
					}
				}
				if(transWordsDay != null){
					translator.setDayTrans(transWordsDay);
				}
				if(prooWordsDay != null){
					translator.setDayProo(prooWordsDay);
				}
				if(auditWordsDay != null){
					translator.setDayAudit(auditWordsDay);
				}
				if(transPrice != null){
					translator.setWantTranPrice(transPrice);
				}
				if(prooPrice != null){
					translator.setWantProoPrice(prooPrice);
				}
				if(auditPrice != null){
					translator.setWantAuditPrice(auditPrice);
				}
				if(transLevel != null){
					translator.setTranlevels(transLevel);
				}
				if(prooLevel != null){
					translator.setProolevels(prooLevel);
				}
				if(auditLevel != null){
					translator.setAuditlevels(auditLevel);
				}
				if(transWords != null){
					translator.setMajorTotals(transWords);
				}
				if(prooWords != null){
					translator.setProoTotal(prooWords);
				}
				if(auditWords != null){
					translator.setAuditTotal(auditWords);
				}
				translator.setWorksOrigin(orignalEssay);
				translator.setWorksTarget(transEssay);
				/*translator.setTranPrice(singlePriceT.doubleValue());
				translator.setProoPrice(singlePricep.doubleValue());
				translator.setAuditPrice(singlePriceA.doubleValue());*/
				translator.setId(id);
				translator.setLanguages(language);
				translator.setDomain(doaminArr[i]);
				translator.setApplyStateT(1);
				translator.setApplyStateP(1);
				translator.setApplyStateA(1);
				translatorService.addQuo(translator);
			}
			if(0!=personalFile.getSize()){
				//设置翻译文件  数据库存储路径
				String resumeURL="/upload/" + trans.getAccountName()+"/"+"个人简历"+"/"+personalFile.getOriginalFilename();
				//上传文件路径==classPath+transURL
				String resumePath=classPath+resumeURL;
				File originalDIR=new File(resumePath);
				if(!originalDIR.exists()) {  
					originalDIR.mkdirs();  
			       }
				//上传文件
				personalFile.transferTo(originalDIR); 
				
				trans.setResumeUrl(resumeURL);//设置个人简历文件存储路径
			}
			if(0!=transFile.getSize()){
				//设置翻译文件  数据库存储路径
				String transURL="/upload/" + trans.getAccountName()+"/"+"翻译简历"+"/"+transFile.getOriginalFilename();
				//上传文件路径==classPath+transURL
				String transPath=classPath+transURL;
				File originalDIR=new File(transPath);
				if(!originalDIR.exists()) {  
					originalDIR.mkdirs();  
			       }
				//上传文件
				transFile.transferTo(originalDIR); 
				
				//设置翻译资格
				if(trans.getIsVerifty()!=2){
					trans.setIsVerifty(1);
				}
				
				trans.setTransUrl(transURL);//设置翻译文件存储路径
			}
			
			//处理校对文件
			if(0!=proofFile.getSize()){
				//设置校对文件  数据库存储路径
				String proofURL="/upload/" + trans.getAccountName()+"/"+"校对简历"+"/"+proofFile.getOriginalFilename();
				//上传文件路劲==classPath+transURL
				String proofPath=classPath+proofURL;
				//上传文件
				File originalDIR=new File(proofPath);
				if(!originalDIR.exists()) {  
					originalDIR.mkdirs();  
			       }
				proofFile.transferTo(originalDIR); 
				
				//设置校对资格
				if(trans.getIsProofread()!=2){
					trans.setIsProofread(1);
				}
				trans.setProofreadUrl(proofURL);//设置校对文件存储路径
			}
			
			
			if(0!=auditFile.getSize()){
				//设置翻译文件  数据库存储路径
				String auditURL="/upload/" + trans.getAccountName()+"/"+"审核简历"+"/"+auditFile.getOriginalFilename();
				//上传文件路径==classPath+transURL
				String auditPath=classPath+auditURL;
				//上传文件
				File originalDIR=new File(auditPath);
				if(!originalDIR.exists()) {  
					originalDIR.mkdirs();  
			       }
				auditFile.transferTo(originalDIR); 
				
				//设置审核资格
				if(trans.getIsAudit()!=2){
					trans.setIsAudit(1);
				}
				trans.setAuditUrl(auditURL);//设置审核文件存储路径
			}
			translatorService.updateQualify(trans);
			mav.setViewName("./translatorAction_findTrans.do?page=addQuo");
			return mav;
		} catch (IOException e) {
			e.printStackTrace();
			mav.setViewName("forward:/error/500Error.jsp");
			return mav;
		}
	}
	
	public BigDecimal getSinglePrice(String transLanguage,String level,String transDomain,String procedureType,String cycle){
		Schedule schedule = new Schedule();
		if("特急+".equals(cycle)){
			/*addTime=Double.parseDouble(time);
			addTime=addTime*1.1;*/
			cycle="特急";
		}
		schedule=scheduleService.queryBySchedule(cycle);
		
		//查找语言的基础价格；
		BasicPrice basicPrice = new BasicPrice();
		basicPrice=basicPriceService.queryByLanguage(transLanguage);
		
		//查找领域价格
		Field domain = new Field();
		int fld = Integer.parseInt(transDomain);
		domain=fieldService.queryById(fld);
		
		
		//查找译员等级系数
		TranslatorLevel translatorLevel = new TranslatorLevel();
		int transLevel = Integer.parseInt(level);
		translatorLevel=TransLevelService.queryByLevel(transLevel);
		
		Double totalMoney=0.0;
		//只翻译     最终每千字价格 = 基础每千字价格	 *    领域系数    *   等级系数    *   周期系数   *  1
		double trans=basicPrice.getBasicPrice()*domain.getFactor()*translatorLevel.getFactor()*schedule.getFactor();
		
		
		//翻译和校对 最终每千字价格 = 基础每千字价格	 *    领域系数    *   等级系数    *   周期系数   *  1  +  （（基础每千字价格	 *    领域系数   *   周期系数） *0.5）/*等级系数
		double veri=trans+basicPrice.getBasicPrice()*domain.getFactor()*schedule.getFactor()*0.5/translatorLevel.getFactor();
		
		//翻译校对和审核  最终每千字价格 = 基础每千字价格	 *    领域系数    *   等级系数    *   周期系数   *  1  +  （（基础每千字价格	 *    领域系数   *   周期系数） *0.5）/*等级系数    +    （基础每千字价格	 *    领域系数   *   周期系数） *0.5 
		double proof=veri+basicPrice.getBasicPrice()*domain.getFactor()*schedule.getFactor()*0.5;
		
		//流程id
		int procedure=Integer.parseInt(procedureType);
		if(procedure==1){
			//只翻译
			totalMoney=trans;
		}else if(procedure==2){
			//翻译和校对 
			totalMoney=veri;
		}else if(procedure==3){
			//翻译校对及审核 	最终每千字价格 = 基础每千字价格	 *    领域系数    *   等级系数    *   周期系数   *  1  +  （（基础每千字价格	 *    领域系数   *   周期系数） *0.5）/*等级系数    +    （基础每千字价格	 *    领域系数   *   周期系数） *0.5 
			totalMoney=proof;
		}
		
		//四舍五入
		BigDecimal bg = new BigDecimal(totalMoney).setScale(2, BigDecimal.ROUND_HALF_UP);
		return bg;
	}
	
	@RequestMapping("/reviewLanguage")
	public ModelAndView reviewLanguage(HttpServletRequest request,String languages,int id){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("languages", languages);
		map.put("id", id);
		List<Quotation> quoList = translatorService.getQuoByIdAndLanguage(map);
		Translator trans=(Translator) request.getSession().getAttribute("transid");
		ModelAndView mav = new ModelAndView();
		mav.addObject("trans", trans);
		mav.addObject("quoList", quoList);
		mav.addObject("language", languages);
		mav.addObject("id", id);
		mav.setViewName("forward:/usercenter/user.center.new.reviewLanguage.jsp");
		return mav;
	}
	
	@RequestMapping("/toupdateLanguage")
	public ModelAndView toupdateLanguage(HttpServletRequest request,String languages,int id){
		ModelAndView mav = new ModelAndView();
		String domains = "";
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("languages", languages);
		map.put("id", id);
		List<Quotation> quoList = translatorService.getQuoByIdAndLanguage(map);
		Translator trans=translatorService.queryTransById(id);
		for (int i = 0; i < quoList.size(); i++) {
			if(i==0){
				domains = domains + quoList.get(i).getDomain();
			}else{
				domains = domains + "," + quoList.get(i).getDomain();
			}
		}
		if(quoList.get(0).getDayTrans() != null){
			trans.setDayTrans(quoList.get(0).getDayTrans());
		}
		if(quoList.get(0).getDayProo() != null){
			trans.setDayProo(quoList.get(0).getDayProo());
		}
		if(quoList.get(0).getDayAudit() != null){
			trans.setDayAudit(quoList.get(0).getDayAudit());
		}
		if(quoList.get(0).getTranPrice() != null){
			trans.setTranPrice(quoList.get(0).getTranPrice());
		}
		if(quoList.get(0).getProoPrice() != null){
			trans.setProoPrice(quoList.get(0).getProoPrice());
		}
		if(quoList.get(0).getAuditPrice() != null){
			trans.setAuditPrice(quoList.get(0).getAuditPrice());
		}
		if(quoList.get(0).getMajorTotal() != null){
			trans.setMajorTotal(quoList.get(0).getMajorTotal());
		}
		if(quoList.get(0).getProoTotal() != null){
			trans.setProoTotal(quoList.get(0).getProoTotal());
		}
		if(quoList.get(0).getAuditTotal() != null){
			trans.setAuditTotal(quoList.get(0).getAuditTotal());
		}
		if(quoList.get(0).getTranlevels() != null){
			trans.setTranlevels(quoList.get(0).getTranlevels());
		}
		if(quoList.get(0).getProolevels() != null){
			trans.setProolevels(quoList.get(0).getProolevels());
		}
		if(quoList.get(0).getAuditlevels() != null){
			trans.setAuditlevels(quoList.get(0).getAuditlevels());
		}
		if(quoList.get(0).getDayTrans() != null){
			trans.setDayTrans(quoList.get(0).getDayTrans());
		}
		if(quoList.get(0).getDayProo() != null){
			trans.setDayProo(quoList.get(0).getDayProo());
		}
		if(quoList.get(0).getDayAudit() != null){
			trans.setDayAudit(quoList.get(0).getDayAudit());
		}
		if(quoList.get(0).getWantTranPrice() != null){
			trans.setWantTranPrice(quoList.get(0).getWantTranPrice());
		}
		if(quoList.get(0).getWantProoPrice() != null){
			trans.setWantProoPrice(quoList.get(0).getWantProoPrice());
		}
		if(quoList.get(0).getWantAuditPrice() != null){
			trans.setWantAuditPrice(quoList.get(0).getWantAuditPrice());
		}
		if(quoList.get(0).getWorksOrigin() != null){
			trans.setWorksOrigin(quoList.get(0).getWorksOrigin());
		}
		if(quoList.get(0).getWorksTarget() != null){
			trans.setWorksTarget(quoList.get(0).getWorksTarget());
		}
		mav.addObject("trans", trans);
		mav.addObject("domains", domains);
		mav.addObject("language", languages);
		mav.addObject("id", id);
		mav.setViewName("forward:/usercenter/user.center.interpreter.new.updateLanguage.jsp");
		return mav;
	}
	
	@RequestMapping("/updateLanguage")
	public String updateLanguage(HttpServletRequest request,Integer id,String language,String domain,Integer transLevel,Integer prooLevel,Integer auditLevel,Integer transWords,Integer prooWords,
			Integer auditWords,Integer transWordsDay,Integer prooWordsDay,Integer auditWordsDay,Double transPrice,Double prooPrice,Double auditPrice,String orignalEssay,String transEssay){
		String[] doaminArr = domain.split(",");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("language", language);
		List<String> domainsOld = translatorService.getDomainsByLanguage(map);
		Translator translator = null;
		for (int i = 0; i < doaminArr.length; i++) {
			int fieldId = translatorService.findFieldId(doaminArr[i]);
			translator = new Translator();
			if(transLevel != null && transLevel != 0){
				BigDecimal singlePriceT = getSinglePrice(language,""+transLevel,""+fieldId,"1","一般");
				if(transPrice != null && transPrice != 0){
					BigDecimal payT = new BigDecimal(transPrice).multiply(new BigDecimal(1.2));
					if(payT.doubleValue() > singlePriceT.doubleValue()){
						payT = payT.setScale(2, BigDecimal.ROUND_HALF_UP);
						translator.setTranPrice(payT.doubleValue());
					}
				}
			}
			if(prooLevel != null && prooLevel != 0){
				BigDecimal singlePricep = getSinglePrice(language,""+prooLevel,""+fieldId,"2","一般");
				if(prooPrice != null && prooPrice != 0){
					BigDecimal payP = new BigDecimal(prooPrice).multiply(new BigDecimal(1.2));
					if(payP.doubleValue() > singlePricep.doubleValue()){
						payP = payP.setScale(2, BigDecimal.ROUND_HALF_UP);
						translator.setProoPrice(payP.doubleValue());
					}
				}
			}
			if(auditLevel != null && auditLevel != 0){
				BigDecimal singlePriceA = getSinglePrice(language,""+auditLevel,""+fieldId,"3","一般");
				if(auditPrice != null && auditPrice != 0){
					BigDecimal payA = new BigDecimal(auditPrice).multiply(new BigDecimal(1.2));
					if(payA.doubleValue() > singlePriceA.doubleValue()){
						payA = payA.setScale(2, BigDecimal.ROUND_HALF_UP);
						translator.setAuditPrice(payA.doubleValue());
					}
				}
			}
			translator.setDayTrans(transWordsDay);
			translator.setDayProo(prooWordsDay);
			translator.setDayAudit(auditWordsDay);
			translator.setWantTranPrice(transPrice);
			translator.setWantProoPrice(prooPrice);
			translator.setWantAuditPrice(auditPrice);
			translator.setTranlevels(transLevel);
			translator.setProolevels(prooLevel);
			translator.setAuditlevels(auditLevel);
			translator.setMajorTotals(transWords);
			translator.setProoTotal(prooWords);
			translator.setAuditTotal(auditWords);
			translator.setWorksOrigin(orignalEssay);
			translator.setWorksTarget(transEssay);
			/*translator.setTranPrice(singlePriceT.doubleValue());
			translator.setProoPrice(singlePricep.doubleValue());
			translator.setAuditPrice(singlePriceA.doubleValue());*/
			translator.setId(id);
			translator.setLanguages(language);
			translator.setDomain(doaminArr[i]);
			translator.setApplyStateT(1);
			translator.setApplyStateP(1);
			translator.setApplyStateA(1);
			if(domainsOld.contains(doaminArr[i])){
				translatorService.updateQuo(translator);
				domainsOld.remove(doaminArr[i]);
			}else{
				translatorService.addQuo(translator);
			}
		}
		if(domainsOld.size() > 0){
			for (String string : domainsOld) {
				deteleQuo(id,language,string);
			}
		}
		return "./translatorAction_findTrans.do?page=addQuo";
	}
	
		
		
		/**
		 * 跳转到查找译员页面
		 * @return
		 * 时间 20180321 twl
		 */
		@RequestMapping("interShowUI")
		public ModelAndView interShowUI(String msg,String namemsg,String phonemsg,String secondmsg,String msgtype,String mm){
			ModelAndView mav=new ModelAndView();
			//构建一个分页信息对象
			Page page = new Page();
			page.setMsg(msg);//搜索框的值
			page.setNamemsg(namemsg);//语言对
			page.setPhonemsg(phonemsg);//领域
			page.setSecondmsg(secondmsg);//等级
			page.setMsgType(msgtype);//流程--翻译，校对，审核
			
			if("".equals(mm) || null==mm){
				mm="1";
			}
			
			//获取总记录数
			long totalCount= translatorService.countTranPage(page);
			//存储总记录数
			Page page2=new Page(totalCount,mm,8);
			page2.setMsg(msg);
			page2.setNamemsg(namemsg);
			page2.setSecondmsg(secondmsg);
			page2.setPhonemsg(phonemsg);
			page2.setMsgType(msgtype);
			mav.addObject("page2", page2);
			mav.setViewName("forward:/interpreter.show.new.jsp");
			return mav;
			
		}
		
		@ResponseBody
		@RequestMapping("findInterByPage")
		public Map<Object,Object> findInterByaPage(HttpServletRequest request,String msg,String namemsg,String phonemsg,String secondmsg,String msgtype,String mm){
			Map<Object,Object> map=new HashMap<Object,Object>();
			
			Page page = new Page();
			page.setMsg(msg);
			page.setNamemsg(namemsg);
			page.setSecondmsg(secondmsg);
			page.setPhonemsg(phonemsg);
			page.setMsgType(msgtype);
			
			//获取总记录数
			long totalCount= translatorService.countTranPage(page);
			//存储总记录数
			if("".equals(mm) || null==mm){
				mm="1";
			}
			
			Page page2=new Page(totalCount,mm,8);
			page2.setMsg(msg);
			page2.setNamemsg(namemsg);
			page2.setSecondmsg(secondmsg);
			page2.setPhonemsg(phonemsg);
			page2.setMsgType(msgtype);
			request.setAttribute("page", page2);
			
			List<Translator> transList=new ArrayList<Translator>();
			List<Translator> newTransList=new ArrayList<Translator>();//去除重复后
			if(totalCount>0){
				transList=translatorService.transByPage(page2);
			
				//去除重复
				Map<Object,Translator> mapTrans=new HashMap<Object,Translator>();
				for(int i=0;i<transList.size();i++){
					mapTrans.put(transList.get(i).getId(), transList.get(i));
				}
				for (Translator value : mapTrans.values()) { 
					newTransList.add(value);
					}
			}
			
			map.put("transList", newTransList);
			map.put("page", page2);
			return map;
		}
		
		@RequestMapping("/deleteQuos")
		public ModelAndView deleteQuos(int id,String languages){
			ModelAndView mav = new ModelAndView();
			Quotation quotation=new Quotation();
			quotation.setTranstionId(id);
			quotation.setLanguages(languages);
			quotationService.deleteQuotation(quotation);
			mav.setViewName("./translatorAction_findTrans.do?page=addQuo");
			return mav;
		}
		
		public void deteleQuo(int id,String language,String domain){
			Quotation quotation=new Quotation();
			quotation.setTranstionId(id);
			quotation.setLanguages(language);
			quotation.setDomain(domain);
			quotationService.deleteQuoByDomain(quotation);
		}
}
