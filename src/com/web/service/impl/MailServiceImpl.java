package com.web.service.impl;


import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.web.dao.ClientCustomerDao;
import com.web.dao.ClientCustomerTransDao;
import com.web.dao.ClientUserDao;
import com.web.dao.DomainDao;
import com.web.dao.OrderDao;
import com.web.dao.TranslatorDao;
import com.web.domain.ClientCustomerNeed;
import com.web.domain.ClientCustomerNeedTrans;
import com.web.domain.ClientUserD;
import com.web.domain.Order;
import com.web.domain.Translator;
import com.web.service.MailService;
import com.web.util.DateUtils;
import com.web.util.MailSendReceive;
@Service
public class MailServiceImpl implements MailService{
	@Resource
	private OrderDao orderDao;
	@Resource
	private DomainDao domainDao;
	@Resource
	private ClientUserDao clientUserDao;
	@Resource
	private TranslatorDao translatorDao;
	@Resource
	private ClientCustomerDao clientCustomerDao;
	@Resource
	private ClientCustomerTransDao clientCustomerTransDao;
	
	private static Logger log = Logger.getLogger(MailService.class);
	
	/**
     * 根据邮件中的内容，生成订单
     * @return
     */
    public String createOrder(){
    	log.debug("服务层-创建订单开始...");
    	//Test data
    	//String title = "爱译社新案件--AYVIVA1909213--GMCHINA0168--(P048871-CN-NP)--英译中--机械--5507E--蔡烜--13690031417--20190928--20191012--ADAPTIVE TIME SCALING FOR ACCELERATING EXPLICIT FINITE ELEMENT ANALYSIS";
    	//String contents = "";    	
    	/*for(int i=0;i<titles.length;i++){
    		System.out.println(titles[i]);
    		System.out.println("-------------");
    	}*/
    	//int clientUserId = clientUser.getId();
    	
    	StringBuffer errors = new StringBuffer();
    	
    	List<Map<String,Object>>inboxMails = null;
    	try {
			inboxMails = MailSendReceive.resceive();
			int i=0;
			for(Map<String,Object> mail:inboxMails){
				i++;
	    		String title = (String)mail.get("subject");
	    		String[] titles = title.split("--");
	    		String orderReference = titles[1];//爱译社案号
	        	String clientNumber = titles[2];//客户
	        	String languagePair = titles[4];//翻译方向
	        	String domainName = titles[5];//专业
	        	String wordSize = titles[6];//字数
	        	String nickname = titles[7];//译员姓名
	        	String tel = "";//titles[8];//译员电话
	        	String transTime = titles[8];//发稿日期
	        	String completeTime = titles[9];//交稿日期
	        	String needName = titles[10];//项目名称
	        	List<String> receiveAddress = (List<String>)mail.get("receiveAddress");//收件人列表 
	        	if(titles.length<12){
	        		errors.append(i+"_数据不完整，请检查邮件标题格式是否正确");
	        		continue;	   
	        	}
	        	//对邮件中取出的数据进行校验
	        	if(StringUtils.isEmpty(needName)){
	        		errors.append(i+"_没有找到【项目名称】，请检查邮件标题格式是否正确");
	        		continue;	 
	        		     		
	        	}    	
	        	if(StringUtils.isEmpty(languagePair)){
	        		errors.append(i+"没有找到【翻译方向】，请检查邮件标题格式是否正确");
	        		continue;	 
	        	}
	        	if(StringUtils.isEmpty(domainName)){
	        		errors.append(i+"_没有找到【专业】，请检查邮件标题格式是否正确");
	        		continue;	 
	        	}
	        	if(StringUtils.isEmpty(wordSize)){
	        		errors.append(i+"_没有找到【字数】，请检查邮件标题格式是否正确");
	        		continue;	 
	        	}
	        	if(StringUtils.isEmpty(nickname)){
	        		errors.append(i+"_没有找到【译员姓名】，请检查邮件标题格式是否正确");
	        		continue;	 
	        	}
	        	/*if(StringUtils.isEmpty(tel)){
	        		errors.append(i+"_没有找到【译员电话】，请检查邮件标题格式是否正确");
	        		continue;	 
	        	}*/
	        	if(StringUtils.isEmpty(clientNumber)){
	        		errors.append(i+"_没有找到【客户号】，请检查邮件标题格式是否正确");
	        		continue;	 
	        	}  
	        	if(StringUtils.isEmpty(transTime)){
	        		errors.append(i+"_没有找到【发稿日期】，请检查邮件标题格式是否正确");
	        		continue;	 
	        	}
	        	if(StringUtils.isEmpty(completeTime)){
	        		errors.append(i+"_没有找到【交稿日期】，请检查邮件标题格式是否正确");
	        		continue;	 
	        	}
	        	
	        	//生成需求
	        	log.debug("服务层-创建订单-生成需求..->"+i);
	        	ClientCustomerNeed clientCustomerNeed=new ClientCustomerNeed();
	        	//clientCustomerNeed.setClientUserId(clientUserId);
	        	clientCustomerNeed.setTitle(needName);
	        	clientCustomerNeed.setProcedureTypeId(1);//需要确认titles[3]中的字段(P048871-CN-NP) P048871这个值如何匹配 仅翻译，翻译校对，翻译校对审核，这三种类型
	        	clientCustomerNeed.setLanguagePair(languagePair);
	        	clientCustomerNeed.setDomainId(domainDao.getDomainId(domainName));
	        	clientCustomerNeed.setLength(Integer.valueOf(wordSize.substring(0, wordSize.length()-2)));
	        	clientCustomerNeed.setAcceptState("发布中");
	        	ClientUserD clientUser = clientUserDao.queryByName(clientNumber);
	        	if(clientUser==null){
	        		return "客户不存在，请检查客户号是否正确";
	        	}
	        	clientCustomerNeed.setClientUserId(clientUser.getId());
	        	clientCustomerNeed.setPublishModel("邮件选定译员模式");    	
	        	clientCustomerNeed.setPublishTime(DateUtils.dateToStr(new Date()));    	
	        	clientCustomerDao.addCustomerNeed(clientCustomerNeed);//保存项目
	        	//int clientCustomerNeedId = clientCustomerDao.getIdentity();//获取刚刚保存的项目的需求id
	        	
	        	//查询译员
	        	log.debug("服务层-创建订单-查询译员..->"+i);
	        	Translator translator = new Translator();
	        	int translatorId = -1;
	        	translator.setNickname(nickname);//译员姓名
	        	if(receiveAddress.size()<2){
	        		translatorId = translatorDao.getTranstionIdByNickName(translator);
	        	}
	        	//translator.setTel(tel);//译员电话
	        	String email = "";
	        	for(String trans:receiveAddress){
	        		if(trans.equals("shangqiang@aitrans.org")){
	        			continue;
	        		}
	        		email=trans;
	        	}
	        	
	        	if(StringUtils.isEmpty(email)){
	        		translatorId = translatorDao.getTranstionIdByNickName(translator);
	        	}else{
	        		translatorId = translatorDao.getTranstionIdByNickNameAndEmail(translator);
	        	}
	        	
	        	//生成关系表数据
	        	log.debug("服务层-创建订单-生成关系表数据-译员ID客户ID..->"+i);
	        	ClientCustomerNeedTrans clientCustomerNeedTrans = new ClientCustomerNeedTrans();
	        	clientCustomerNeedTrans.setClientCustomerNeedId(clientCustomerNeed.getId());
	        	clientCustomerNeedTrans.setTranslatorId(translatorId);
	        	clientCustomerTransDao.addtransCustomer(clientCustomerNeedTrans);
	        	//生成订单
	        	log.debug("服务层-创建订单-生成订单表数据..->"+i);
	        	Order order = new Order();
	        	order.setOrderTitle(needName);
	        	String orderNumber = UUID.randomUUID().toString().replaceAll("-", "");
	        	order.setOrderNumber(orderNumber);
	        	order.setClientUserId(clientUser.getId());
	        	order.setOrderReference(orderReference);
	        	order.setTransTime(transTime);
	        	order.setCompleteTime(completeTime);
	        	order.setGeneratedTime(DateUtils.dateToStr(new Date()));
	        	order.setTranslatorid(translatorId);
	        	order.setClientCustomerNeedId(clientCustomerNeed.getId());
	        	order.setTaskStateId(2);//需要确认从邮件生成的订单的初始状态值
	        	orderDao.addOrder(order);
	    	}
		} catch (Exception e) {
			e.printStackTrace();
			log.debug("服务层-创建订单结束-失败-发生异常");
			return "订单已生成失败";
		}
    	log.debug("服务层-创建订单结束-成功返回..");
    	return StringUtils.isEmpty(errors)?errors.toString():"订单已生成";
    }
    
}
