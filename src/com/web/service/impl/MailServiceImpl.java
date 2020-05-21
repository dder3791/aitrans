package com.web.service.impl;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;


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
	    		
	    		/*String[] titles = title.split("-");
	    		String orderReference = titles[1];//爱译社案号
	        	String clientNumber = titles[2];//客户号
	        	String languagePair = titles[4];//翻译方向
	        	String domainName = titles[5];//专业
	        	String wordSize = titles[6];//字数
	        	String nickname = titles[7];//译员姓名
	        	
	        	String transTime = titles[8];//发稿日期
	        	String completeTime = titles[9];//交稿日期
	        	String needName = titles[10];//项目名称
	        	
*/	        	
	        	/*if(titles.length<11){
	        		errors.append(i+"_数据不完整，请检查邮件标题格式是否正确");
	        		continue;	   
	        	}*/
	        	//对邮件中取出的数据进行校验
	        	/*if(StringUtils.isEmpty(needName)){
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
	        	}*/
	        	/*if(StringUtils.isEmpty(tel)){
	        		errors.append(i+"_没有找到【译员电话】，请检查邮件标题格式是否正确");
	        		continue;	 
	        	}*/
	        	/*if(StringUtils.isEmpty(clientNumber)){
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
	        	}*/
	    		Map<String,String> orderData = parseHeader(title);
	    		if(orderData.size()<1){
	    			continue;
	    		}
	    		List<String> receiveAddress = (List<String>)mail.get("receiveAddress");//收件人列表 
	    		
	        	//生成需求
	        	log.debug("服务层-创建订单-生成需求000..->"+i);	        	
	        	ClientCustomerNeed clientCustomerNeed=new ClientCustomerNeed();
	        	//clientCustomerNeed.setClientUserId(clientUserId);
	        	clientCustomerNeed.setTitle(orderData.get("needName"));
	        	clientCustomerNeed.setProcedureTypeId(1);//需要确认titles[3]中的字段(P048871-CN-NP) P048871这个值如何匹配 仅翻译，翻译校对，翻译校对审核，这三种类型
	        	clientCustomerNeed.setLanguagePair(orderData.get("languagePair"));
	        	String domain = orderData.get("domainName");
	        	clientCustomerNeed.setDomainId(domainDao.getDomainId(domain));
	        	String wordSize = orderData.get("wordSize");
	        	clientCustomerNeed.setLength(Integer.valueOf(wordSize.substring(0, wordSize.length()-1)));
	        	clientCustomerNeed.setAcceptState("发布中");
	        	ClientUserD clientUser = clientUserDao.queryByName(orderData.get("clientNumber"));
	        	if(clientUser==null){
	        		errors.append("客户不存在，请检查客户号是否正确");
	        		continue;
	        	}
	        	clientCustomerNeed.setClientUserId(clientUser.getId());
	        	clientCustomerNeed.setPublishModel("邮件选定译员模式");    	
	        	clientCustomerNeed.setPublishTime(DateUtils.dateToStr(new Date()));  
	        	log.debug("要保存的项目："+clientCustomerNeed);
	        	clientCustomerDao.addCustomerNeed(clientCustomerNeed);//保存项目//打开这行代码 
	        	//int clientCustomerNeedId = clientCustomerDao.getIdentity();//获取刚刚保存的项目的需求id
	        	
	        	//查询译员
	        	log.debug("服务层-创建订单-查询译员..->"+i);
	        	Translator translator = new Translator();
	        	int translatorId = -1;
	        	translator.setNickname(orderData.get("nickname"));//译员姓名
	        	if(receiveAddress.size()<2){
	        		//translatorId = translatorDao.getTranstionIdByNickName(translator);
	        		errors.append("没有发送邮件给译员，无法生成订单");
	        		continue;
	        	}
	        	//translator.setTel(tel);//译员电话
	        	
	        	for(String trans:receiveAddress){
	        		if(trans.equals("shangqiang@aitrans.org")){
	        			continue;
	        		}
	        		translator.setEmail(trans);
	        	}
	        	//根据email和姓名查找译员
	        	translatorId = translatorDao.getTranstionIdByNickNameAndEmail(translator);  	
	        	//生成关系表数据
	        	log.debug("服务层-创建订单-生成关系表数据-译员ID客户ID..->"+i);
	        	ClientCustomerNeedTrans clientCustomerNeedTrans = new ClientCustomerNeedTrans();
	        	clientCustomerNeedTrans.setClientCustomerNeedId(clientCustomerNeed.getId());
	        	clientCustomerNeedTrans.setTranslatorId(translatorId);
	        	log.debug("要保存的项目和客户关系表数据："+clientCustomerNeedTrans);
	        	clientCustomerTransDao.addtransCustomer(clientCustomerNeedTrans);//打开这行代码 
	        	//生成订单
	        	log.debug("服务层-创建订单-生成订单表数据..->"+i);
	        	Order order = new Order();
	        	order.setOrderTitle(orderData.get("needName"));
	        	String orderNumber = UUID.randomUUID().toString().replaceAll("-", "");
	        	order.setOrderNumber(orderNumber);
	        	order.setClientUserId(clientUser.getId());
	        	order.setOrderReference(orderData.get("orderReference"));
	        	order.setTransTime(orderData.get("transTime"));
	        	order.setCompleteTime(orderData.get("completeTime"));
	        	order.setGeneratedTime(DateUtils.dateToStr(new Date()));
	        	order.setTranslatorid(translatorId);
	        	order.setClientCustomerNeedId(clientCustomerNeed.getId());
	        	order.setTaskStateId(2);//需要确认从邮件生成的订单的初始状态值
	        	log.debug("要保存的订单数据："+order);
	        	orderDao.addOrder(order);//打开这行代码 
	    	}
		} catch (Exception e) {
			e.printStackTrace();
			log.debug("服务层-创建订单结束-失败-发生异常");
			return "订单生成失败";
		}
    	log.debug("服务层-创建订单结束-成功返回..");
    	
    	return errors.length()>0?errors.toString():"订单已生成";
    }
    
    private boolean isProtoMail(String title,String m){
    	int i = title.indexOf(m);    	
    	if(i>-1){
    		return checkHead(title,i);
    	}    	
    	return false;
    }
    private boolean checkHead(String t,int x){
    	String h = t.substring(0,x);
		if(h.contains("爱译社")||h.contains("案件")||h.contains("翻译")||h.contains("校对")){
			return true;
		}else{
			return false;
		}
    }
    private String getProtoMailBody(String title,String m){
    	int i = title.indexOf(m);     	
    	return title.substring(i+1,title.length());
    }
    private String paseBrackets(String s){
    	List<String> r = new ArrayList<>();
		StringBuffer t = new StringBuffer();
		int sp = s.indexOf("(");
		int ep = s.indexOf(")");
		if(sp>-1&&ep>-1){
			t.append(s.substring(0,sp));
			String k = s.substring(sp,ep);
			k = k.replace("-", "|");
			t.append(k);
			t.append(s.substring(ep));
			return t.toString();
		}else{
			return s;
		}
    }
    private Map<String,String> parseHeader(String title){
    	Map<String,String> rs = 	parseHeaderDetial(title,":");
		if(rs.size()<1){
			rs = 	parseHeaderDetial(title,"：");
		}
		if(rs.size()<1){
			rs = 	parseHeaderDetial(title,"--");
		}
		if(rs.size()<1){
			rs = 	parseHeaderDetial(title,"-");
		}		
		return rs;
    }
    private Map<String,String> parseHeaderDetial(String title,String m){
    	Map<String,String> rs = new HashMap<>();
    	if(isProtoMail(title,m)){
    		String body = getProtoMailBody(title,m);
    		body =  paseBrackets(body);
    		String titles[] = body.split("--");
    		if(titles.length>1){
    			rs.put("orderReference", titles[0]);//爱译社案号
    			rs.put("clientNumber", titles[1]);//客户号
    			rs.put("languagePair", titles[3]);//翻译方向
    			rs.put("domainName", titles[4]);//专业
    			rs.put("wordSize", titles[5]);//字数
    			rs.put("nickname", titles[6]);//译员姓名
    			rs.put("transTime", titles[7]);//发稿日期
    			rs.put("completeTime", titles[8]);//交稿日期
    			rs.put("needName", titles[9]);//项目名称
    		}else{
    			titles = body.split("-");
    			if(titles.length>1&&titles.length<8){
    				rs.put("orderReference", titles[0]);//爱译社案号
        			rs.put("clientNumber", titles[1]);//客户号
        			rs.put("languagePair", titles[2]);//翻译方向   
        			rs.put("domainName", "日常");//专业           			
        			rs.put("wordSize", titles[3]);//字数
        			rs.put("nickname", titles[4]);//译员姓名
        			rs.put("transTime", titles[5]);//发稿日期
        			rs.put("completeTime", titles[6]);//交稿日期
        			rs.put("needName", titles[4]+","+titles[2]+","+titles[3]);//项目名称
    			}
    			if(titles.length>8&&titles.length<11){
    				rs.put("orderReference", titles[0]);//爱译社案号
        			rs.put("clientNumber", titles[1]);//客户号
        			rs.put("languagePair", titles[3]);//翻译方向
        			rs.put("domainName", titles[4]);//专业
        			rs.put("wordSize", titles[5]);//字数
        			rs.put("nickname", titles[6]);//译员姓名
        			rs.put("transTime", titles[7]);//发稿日期
        			rs.put("completeTime", titles[8]);//交稿日期
        			rs.put("needName", titles[9]);//项目名称
    			}
    		}
    	}    	
    	return rs;
    }
    public static void main(String[] args) {
    	String contents = "爱译社新案件--AYVIVA1909213--GMCHINA0168--(P048871-CN-NP)--英译中--机械--5507E--蔡烜--20190928--20191012--ADAPTIVE";
    	String contents2 = "爱1译2社3新4案0件-AYFHWY20200202-FIE20230021P-日译中-8100J-张俊杰-20200218-20200224";
    	String contents3 = "爱译社新案件:AYVIVA1909213-GMCHINA0168-(P048871-CN-NP)-英译中-机械-5507E-蔡烜-20190928-20191012-ADAPTIVE";
    	//System.out.println(new MailServiceImpl().parseHeader(contents2));
    	String wordSize = "5507E";
    	System.out.println(wordSize.substring(0, wordSize.length()-1));
    }
}
