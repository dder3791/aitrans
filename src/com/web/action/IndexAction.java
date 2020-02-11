package com.web.action;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.httpclient.HttpException;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.domain.AdvertiseList;
import com.web.domain.BasicPrice;
import com.web.domain.ClientAdVo;
import com.web.domain.ClientCustomerNeed;
import com.web.domain.ClientCustomerNeedTrans;
import com.web.domain.ClientUserD;
import com.web.domain.ClientUserShowVo;
import com.web.domain.Field;
import com.web.domain.OnLineCustomer;
import com.web.domain.Order;
import com.web.domain.QuestionAndAnswer;
import com.web.domain.Schedule;
import com.web.domain.Translator;
import com.web.domain.TranslatorLevel;
import com.web.domain.Voice;
import com.web.service.AdvertiseListService;
import com.web.service.ArticleService;
import com.web.service.BasicPriceService;
import com.web.service.ClientCustomerService;
import com.web.service.ClientCustomerTransService;
import com.web.service.ClientUserService;
import com.web.service.FieldService;
import com.web.service.OrderService;
import com.web.service.QuestionAndAnswerService;
import com.web.service.QuotationService;
import com.web.service.ScheduleService;
import com.web.service.TranslatorLevelService;
import com.web.service.TranslatorService;
import com.web.service.VoiceService;
import com.web.util.Page;


@Controller
@Scope("prototype")
@RequestMapping("/index")
@Transactional
public class IndexAction {
		
	
	@Resource
	private ArticleService articleService;
	
	@Resource
	private ScheduleService scheduleService;
	
	@Resource
	private TranslatorLevelService TransLevelService;
	
	@Resource
	private TranslatorService translatorService;
	
	@Resource
	private BasicPriceService basicPriceService;
	
	@Resource
	private ClientCustomerService clientCustomerService;
	
	@Resource
	private ClientCustomerTransService clientCustomerTransService;
	
	@Resource
	private FieldService fieldService;
	
	@Resource
	private OrderService tranOrderService;
	
	@Resource
	private ClientUserService clientUserService;
	
	@Resource
	private VoiceService voiceService;
	
	@Resource
	private QuestionAndAnswerService questionAndAnswerService;
	
	@Resource
	private QuotationService quotationService;
	
	@Resource
	private AdvertiseListService advertiseListService;
	
	@ResponseBody
	@RequestMapping("indexAction_getAll")
	public Map<String,Object> getAll(){
		Map<String , Object> map = new HashMap<String, Object>();
		//添加活动资讯信息
		map.put("ActivityArticle", articleService.getActivityArticle());
		//添加公告资讯信息
		map.put("NoticeArticle", articleService.getNoticeArticle());
		//添加平台资讯信息
		map.put("PlatformArticle", articleService.getPlatformArticle());
		//添加新注册译员信息
		map.put("NewTranslators", translatorService.getNewTranslators());
		
		return map;
	}
	
	/**
	 * 给予首页需求展示的翻页处理
	 */
	@ResponseBody
	@RequestMapping("indexAction_getNeeds")
	public Map<Object,Object> getNeeds(String pageNum,String language){
		//判断当前传入的当前页是否为空，为空则赋予初始值
		if(pageNum=="" || pageNum==null || "null".equals(pageNum)){
			pageNum="1";
		}
		//判断当前页小于等于0则给予重新赋值
		int pageNum1 = Integer.parseInt(pageNum);
		if(pageNum1<=0){
			pageNum="1";
		}
		//判断language语言是否为空
		if(language==null || "".equals(language) || "undefined".equals(language)){
			language="";
		}
		
		Map<Object , Object> map = new HashMap<Object, Object>();
		Page page1 = new Page();
		page1.setMsg(language);
		//根据语言类型查询总记录数
		long totalCount = clientCustomerService.getTotalCount(page1);
		//结果为0时
		if(totalCount==0){
			//给予自定义集合传递到前台
			List<ClientCustomerNeed> clientCustomerNeed =new  ArrayList<ClientCustomerNeed>();
			Page page = new Page();
			page.setMsg(language);
			page.setTotalCount(0);
			page.setPageNum(1);
			map.put("page", page);	
			map.put("needs", clientCustomerNeed);
		}else {
			//结果不为0，根据page信息查询总的需求数
		Page page =new Page(totalCount, pageNum, 8);	
		page.setMsg(language);
		List<ClientCustomerNeed>  clientCustomerNeed= clientCustomerService.getNeeds(page);
		map.put("page", page);	
		map.put("needs", clientCustomerNeed);
			
		}
		
		
		
		return map;
		
	}
	
    /**
     * 首页译员展示
     * @param request
     * @param language
     * @return
     */
	@ResponseBody
	@RequestMapping("indexAction_queryTrans")
	public Map<String,Object> indexAction_queryTrans(HttpServletRequest request,String pageNum,String language){
		Map<String,Object> map=new HashMap<String,Object>();
		if(pageNum=="" || pageNum==null || "null".equals(pageNum)){
			pageNum="1";
		}
		int pageNum1 = Integer.parseInt(pageNum);
		if(pageNum1<=0){
			pageNum="1";
		}
		if("".equals(language) || language==null || "undefined".equals(language)){
			language=null;
		}else if("英汉".equals(language) || "汉英".equals(language)){
			language="EN";
		}else if("日汉".equals(language) || "汉日".equals(language)){
			language="JP";
		}else if("德汉".equals(language) || "汉德".equals(language)){
			language="GER";
		}else if("韩汉".equals(language) || "汉韩".equals(language)){
			language="KOR";
		}else if("法汉".equals(language) || "汉法".equals(language)){
			language="FR";
		} 
		Page page=new Page();
		page.setMsg(null);
		page.setMsgType(language);
		page.setSecondmsg(null);
		page.setNamemsg(null);
		page.setDateType(0);
		//获取总记录数
		long totalCount=translatorService.getTotalCount(page);
		if(totalCount==0){
			List<Translator> translatorList=new ArrayList<Translator>();
			map.put("translatorList", translatorList);
		}else{
			Page page1=new Page(totalCount,pageNum,10);
			page1.setMsgType(language);
			page1.setMsg(null);
			page1.setSecondmsg(null);
			page1.setDateType(0);
			page1.setNamemsg(null);
			List<Translator> translatorList=translatorService.queryByAll(page1);
			/*Map<Object,Object> maps=new HashMap<Object,Object>();*/
			/*for (Translator translator : translatorList) {
				int transId=translator.getId();
				List<Quotation> qutationList=quotationService.queryByTransPrice(transId);
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
			map.put("translatorList", translatorList);
			map.put("page", page1);
		}
		
		return map;
	}
	
	
	/**
	 * 首页展示客户信息
	 * @param top
	 * @return
	 */
	@ResponseBody
	@RequestMapping("fundIndexCus")
	public Map<String,List<ClientUserD>> fundIndexCus(){
		List<ClientUserD> list=new ArrayList<ClientUserD>();
		Map<String,List<ClientUserD>> reslutList=new HashMap<String,List<ClientUserD>>();
		OnLineCustomer onlinecustomer=new OnLineCustomer();
		onlinecustomer.setRegistrationAddress("中国");
		list=clientCustomerService.findOnlineUser(onlinecustomer);//国内   
		reslutList.put("ch",list);
		onlinecustomer.setRegistrationAddress("国外");
		list=clientCustomerService.findOnlineUser(onlinecustomer);//国外
		/*for(int i=0;i<list.size();i++){
			System.out.println(list.get(i).getCertificationType());
		}*/
		reslutList.put("en",list);
		
		return reslutList;
	}
	/**
	 * 短信回复跳转页面
	 * @param needid
	 * @param transId
	 * @param request
	 * @return
	 */
	/*@RequestMapping("indexAction_isAccept")
	public String indexAction_isAccept(int needid,int transId,HttpServletRequest request){
		ClientCustomerNeed clientCustomerNeed=clientCustomerService.findTransNeedByid(needid);
		Field field=fieldService.queryById(clientCustomerNeed.getDomainId());
		request.setAttribute("clientCustomerNeed", clientCustomerNeed);
		request.setAttribute("field", field.getField());
		request.setAttribute("needid", needid);
		request.setAttribute("transId", transId);
		return "forward:/message.jsp";
	}
	*/
	/**
	 * 短信回复接受任务
	 * @param request
	 * @param needid
	 * @param transId
	 * @return
	 * @throws HttpException
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping("indexAction_acceptTask")
	public Map<String, String> indexAction_acceptTask(HttpServletRequest request,int needid,int transId) throws HttpException, IOException{
		    String result="";
		    Map<String,String> map=new HashMap<String,String>();
				Translator translator=new Translator();
				//查询译员填入资料信息
				long infoCount=translatorService.selectTransInfo(transId);
				if(infoCount>0){
					    //修改译员状态
						 translator.setState("非空闲");
							translator.setId(transId);
							translatorService.updatestate(translator);
							//删除需求id并重新添加
							ClientCustomerNeedTrans clientCustomerNeedTran=new ClientCustomerNeedTrans();
							synchronized (clientCustomerNeedTran){
							clientCustomerNeedTran.setClientCustomerNeedId(needid);
							clientCustomerTransService.delete(clientCustomerNeedTran);
							ClientCustomerNeedTrans clientCustomerNeedTrans=new ClientCustomerNeedTrans();
							clientCustomerNeedTrans.setTranslatorId(transId);
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
							//寻找相同需求号，接受任务为订单，其他为已删除
							if(needReferences!=null){
								for (int i = 0; i < needReferences.size(); i++) {
									int needids=needReferences.get(i).getId();
									ClientCustomerNeed  clientCustomerneeds=new ClientCustomerNeed();
									clientCustomerneeds.setId(needids);
									clientCustomerneeds.setAcceptState("已删除");
									clientCustomerService.updateAcceptState(clientCustomerneeds);
								}
							}
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
					 		order.setTranslatorid(transId);
					 		order.setPayNumber(totalMoney);
					 		order.setTaskStateId(2);
					 		order.setTransTime("0%");
					 		order.setOrderReference(orderReference);
					 		order.setOrderTitle(needTitle);
					 		order.setClientUserId(clientUserId);
					 		order.setClientCustomerNeedId(needid);
					 		tranOrderService.addOrder(order);
							result="success";	
					
				}else{
					result="faile";
				}
				map.put("result", result);
				return map;
	}
	/**
	 * 短信回复取消任务
	 * @param request
	 * @param needid
	 * @param transId
	 * @return
	 */
	@ResponseBody
	@RequestMapping("indexAction_cancelTask")
	public Map<String, String> indexAction_cancelTask(HttpServletRequest request,int needid,int transId){
		String result="";
	    Map<String,String> map=new HashMap<String,String>();
	    Translator translator=new Translator();
		translator.setState("空闲");
		translator.setId(transId);
		translatorService.updatestate(translator);
		ClientCustomerNeed clientCustomerNeed=new ClientCustomerNeed();
		clientCustomerNeed.setAcceptState("失效");
		clientCustomerNeed.setId(needid);
		clientCustomerService.updateNeed(clientCustomerNeed);
		ClientCustomerNeedTrans clientCustomerNeedTrans=new ClientCustomerNeedTrans();
		clientCustomerNeedTrans.setTranslatorId(transId);
		clientCustomerNeedTrans.setClientCustomerNeedId(needid);
		clientCustomerTransService.deleteTransNeed(clientCustomerNeedTrans);
		result="success";
		map.put("result", result);
		return map;
	}
	
	/**
	 * 用户新增留言
	 * @return
	 */
	@RequestMapping("indexAction_addVoice")
	public String indexAction_addVoice(HttpServletRequest request){
	 String name=request.getParameter("name");
	 String tel=request.getParameter("tel");
	 String email=request.getParameter("email");
	 String voiceTitle=request.getParameter("voiceTitle");
	 String voiceContent=request.getParameter("voiceContent");
	 Voice voice=new Voice();
	 voice.setName(name);
	 voice.setTel(tel);
	 voice.setEmail(email);
	 voice.setVoiceTitle(voiceTitle);
	 voice.setVoiceContent(voiceContent);
	 voiceService.saveVoice(voice);
	 request.setAttribute("success", "receivedSuccess");
	 return "/help.center.jsp";
	}
	
	

	/**
	 * 获取国家
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getCountry")
	private Map<String,String> getCountry(HttpServletRequest request,String country,String provinces){
		Map<String,String> list=new HashMap<String,String>();
		CilentCustomerAction clientCusAction=new CilentCustomerAction();
		list=clientCusAction.getCountry(request,country,provinces);
		 return list;
	}
	
	
	
	
	/**
	 * 跳转客户分页展示页面
	 * @param request
	 * @param mm
	 * @return
	 */
	/*@RequestMapping("getCustomerByCountryUI")
	public ModelAndView getCustomerByCountryUI(HttpServletRequest request,String mm,String country,String msg,String islocal){
		ModelAndView mav = new ModelAndView();
		Page page = new Page();
		//length 格式   a--b
		String slength="";
		String blength="";
		if(length!=null && length!=""){
			slength=length.substring(0, length.lastIndexOf("-"));
			blength=length.substring(length.lastIndexOf("-")+1);
		}
		String language=(String) request.getSession().getAttribute("language");//版本语言
		if("en".equals(language)){
			islocal="2";
		}else if("zh".equals(language)){
			islocal="1";
		}
		page.setMsg(msg);
		page.setNamemsg(islocal);
		
		page.setNamemsg(slength);
		page.setSecondmsg(blength);
		page.setPhonemsg(domain);
		page.setMsgType(country);
		
		
		Page page2=new Page(clientCustomerService.countCompanyCustomerByPage(page),"1",10);
		page2.setMsg(msg);
		page2.setNamemsg(slength);
		page2.setSecondmsg(blength);
		page2.setPhonemsg(domain);
		page2.setMsgType(country);
		page2.setNamemsg(islocal);
		doaminList=fieldService.queryByAll();
		request.setAttribute("page", page2);
		request.setAttribute("doaminList", doaminList);
		return "forward:/case.lists.jsp";
	}*/
	
	/**
	 * 跳转客户分页展示页面
	 * @param request
	 * @param mm
	 * @return
	 */
	@RequestMapping("getCustomerByCountryUI")
	public ModelAndView getCustomerByCountryUI(HttpServletRequest request,String mm,String country,String province,String msg,String islocal){
		Page page = new Page();
		ModelAndView mav = new ModelAndView();
		String language=(String) request.getSession().getAttribute("language");//版本语言
		if("en".equals(language)){
			islocal="2";
		}else if("zh".equals(language)){
			islocal="1";
		}
		page.setMsg(msg);
		page.setNamemsg(islocal);
		page.setPhonemsg(province);
		/*page.setNamemsg(slength);
		page.setSecondmsg(blength);
		page.setPhonemsg(domain);*/
		page.setMsgType(country);
		
		long countPage=advertiseListService.countAdvertiseByPage(page);
		
		Page page2=new Page(countPage,"1",10);
		page2.setMsg(msg);
		/*page2.setNamemsg(slength);
		page2.setSecondmsg(blength);
		page2.setPhonemsg(domain);*/
		page2.setMsgType(country);
		page2.setNamemsg(islocal);
		page2.setPhonemsg(province);
		/*doaminList=fieldService.queryByAll();*/
		ClientAdVo ad1Type = clientUserService.getAd1Type();
		List<ClientAdVo> ad2Type = clientUserService.getAd2Type();
		List<ClientAdVo> ad3Type = clientUserService.getAd3Type();
		List<ClientAdVo> ad4Type = clientUserService.getAd4Type();
		mav.addObject("ad1", ad1Type);
		mav.addObject("ad2", ad2Type);
		mav.addObject("ad3", ad3Type);
		mav.addObject("ad4", ad4Type);
		mav.addObject("page", page2);
		request.setAttribute("page", page2);
		/*request.setAttribute("doaminList", doaminList);*/
		mav.setViewName("forward:/case.lists.jsp");
		return mav;
	}
	
	
	/**
	 * 企业客户分页展示
	 * @param mm
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getCustomerByCountry")
	public Map<Object,Object> getCustomerByCountry(String mm,String country,String msg,String province,String islocal){
		Page page = new Page();
		page.setMsg(msg);
		page.setMsgType(country);
		page.setNamemsg(islocal);
		page.setPhonemsg(province);
		Page page2=new Page(advertiseListService.countAdvertiseByPage(page),mm,10);
		page2.setMsg(msg);
		page2.setMsgType(country);
		page2.setNamemsg(islocal);
		page2.setPhonemsg(province);
		List<AdvertiseList> advertiseList=new ArrayList<AdvertiseList>();
		Map<Object,Object> map=new HashMap<Object,Object>();
		if(page2.getTotalCount()>0){
			advertiseList=advertiseListService.findAdvertiseByPage(page2);
		}
		
		map.put("onlineCustomerList", advertiseList);
		map.put("page", page2);
		return map;
	}
	
	
	/**
	 * 用户添加问题
	 * @param type
	 * @param question
	 * @return
	 */
	 @ResponseBody
	 @RequestMapping("indexAction_addQuestion")
	 public Map<String,Object> indexAction_addQuestion(String type ,String question){
		 Map<String,Object> map=new HashMap<String,Object>();
		 QuestionAndAnswer questionAndAnswer=new QuestionAndAnswer();
		 questionAndAnswer.setType(type);
		 questionAndAnswer.setQuestion(question);
		 questionAndAnswerService.addQuestion(questionAndAnswer);
		 map.put("result", "success");
		 return map;
	 }
	
	/**
	 * 企业客户分页展示
	 * @param mm
	 * @return
	 *//*
	@ResponseBody
	@RequestMapping("getCustomerByCountry")
	public Map<Object,Object> getCustomerByCountry(String mm,String country,String msg,String islocal){
		Page page = new Page();
		page.setMsg(msg);
		page.setMsgType(country);
		page.setNamemsg(islocal);
		
		Page page2=new Page(clientCustomerService.countCompanyCustomerByPage(page),mm,10);
		page2.setMsg(msg);
		page2.setMsgType(country);
		page2.setNamemsg(islocal);
		
		List<OnLineCustomer> cusNeedList=new ArrayList<OnLineCustomer>();
		Map<Object,Object> map=new HashMap<Object,Object>();
		if(page2.getTotalCount()>0){
			cusNeedList=clientCustomerService.findCompanyCustomerByPage(page2);
		}
		
		map.put("onlineCustomerList", cusNeedList);
		map.put("page", page2);
		return map;
	}*/
	
	/**
	 * 新注册译员首页展示
	 * @return
	 */
	@ResponseBody
	@RequestMapping("indexAction_findTransRandow")
	public List<Translator> findTransRandow(){
		//获取新注册译员集合
		List<Translator> translatorList=translatorService.getNewTranslators();
        return translatorList;
	}
	
	@RequestMapping("indexAction_isAccept")
	public String isAccept(int needid,int transId,HttpServletRequest request){
		ClientCustomerNeed clientCustomerNeed=clientCustomerService.findTransNeedByid(needid);
		if(clientCustomerNeed.getTransTotal() != 0){
			clientCustomerNeed.setTotalMoney(clientCustomerNeed.getTransTotal());
		}else{
			if("系统分配模式".equals(clientCustomerNeed.getPublishModel())){
				BasicPrice basicPrice = new BasicPrice();
				basicPrice=basicPriceService.queryByLanguage(clientCustomerNeed.getLanguagePair());
				
				Field domain = new Field();
				domain=fieldService.queryById(clientCustomerNeed.getDomainId());
				
				TranslatorLevel translatorLevel = new TranslatorLevel();
				translatorLevel=TransLevelService.queryByLevel(clientCustomerNeed.getTransLevel());
				
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
				clientCustomerNeed.setTotalMoney(clientCustomerNeed.getTotalMoney() * 0.8);
			}
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
		request.setAttribute("clientCustomerNeed", clientCustomerNeed);
		request.setAttribute("field", field.getField());
		request.setAttribute("needid", needid);
		request.setAttribute("transId", transId);
		
		return "forward:/message.jsp";
	}
	
	/**
	 * 首页展示客户
	 * @return
	 */
	@RequestMapping("/getUserShow")
	@ResponseBody
	public List<ClientUserShowVo> getUserShow(){
		List<ClientUserShowVo> userShow = clientUserService.getUserShow();
		return userShow;
	}
}
