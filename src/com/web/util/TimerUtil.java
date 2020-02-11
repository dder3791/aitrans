package com.web.util;


import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.domain.ClientCustomerNeed;
import com.web.domain.ClientUserD;
import com.web.domain.EvaluateClient;
import com.web.domain.Order;
import com.web.domain.Translator;
import com.web.service.ClientCustomerService;
import com.web.service.ClientUserService;
import com.web.service.EvaluateService;
import com.web.service.OrderService;
import com.web.service.TranslatorService;


/**
 * 定时任务
 * @param date  定时时间
 */
@Service("TimerService")
@Transactional
public class TimerUtil{

	@Resource
	ClientCustomerService clientCustomerService;
	@Resource
	OrderService orderService;
	@Resource
	TranslatorService translatorService;
	@Resource
	EvaluateService evaluateService;
	@Resource
	ClientUserService clientUserService;
	
	
	/**
	 * 定时任务
	 * @param date
	 * @param id
	 */
	/*//需求发布后，一定时间内失效，需修改需求状态
		public void MyTimer( Date date,final int needids ) {
		    Timer timer = new Timer();

		    //定时任务，指定时间进行
		    timer.schedule(new TimerTask() {
		        public void run() {
		            System.out.println("需求定是--------------------------------"+needids);
		        }

		    }, date);
		}
		*/
		Timer timer=null;
		public void EvalueteClientTimer(Date date,final int orderId){
			timer= new Timer(); 
			
			  //评价超时添加默认评价。定时任务，指定时间进行
		    timer.schedule(new TimerTask() {
		        public void run() {
		        	int id1 =orderService.getEvalueteId(orderId) ;
		        	if(id1==0 ){
		        	System.out.println("执行定时任务开始！！！！！！！！！！！！！");
		        	EvaluateClient evaluateClient = new EvaluateClient();
		    		evaluateClient.setCompletionSpeed("居中");
		    		evaluateClient.setEvaluateDetails("客户于15天内未作出评价，系统默认好评！");
		    		evaluateClient.setOrderId(orderId);
		    		evaluateClient.setScore("100");
		    		evaluateClient.setFormat("3");
		    		evaluateClient.setIntegrality("2");
		    		evaluateClient.setUnderstandLevel("50");
		    		evaluateClient.setDegreeOfSmooth("15");
		    		evaluateClient.setRigor("15");
		    		evaluateClient.setState(0);
		    		evaluateClient.setTechnicalCorpus("10");
		    		evaluateClient.setTechnicalDifficulties("简单");
		    		evaluateClient.setLanguageDifficulties("简单");
		    		evaluateClient.setPatentCorpus("5");
		    		evaluateClient.setMissingParagraph("50");
		    		evaluateClient.setMissingSentence("30");
		    		evaluateClient.setMissingWord("10");
		    		evaluateClient.setSyntaxError("10");
		    		evaluateClient.setOtherError("无");
		    		evaluateService.addEvaluate(evaluateClient);
		    		int id = evaluateService.queryById(orderId);
		    		Order order1 =new Order();
		    		order1.setId(orderId);
		    		order1.setEvaluateId(id);
		    		
		    		//完成时间，评价时间
		    		Date date=new Date();
		    		SimpleDateFormat  sdf=new  SimpleDateFormat("yyyy-MM-dd hh:mm:ss");    
		     		String  nowTime=sdf.format(date); 
		     		
		    		order1.setCustomerEvaluate(nowTime);
		    		order1.setCompleteTime(nowTime);
		    		
		    		orderService.setEvaluateId(order1);
		    	
		    		/*ClientUserD clientUser=(ClientUserD) request.getSession().getAttribute("clientid");*/
		    		ClientUserD clientUser = clientUserService.findCustomerById(orderService.findOrderId(orderId).getClientUserId());
		    		clientUser.setReputation(clientUser.getReputation()+5);
		    		clientUserService.editReputation(clientUser);
		    		/*request.getSession().setAttribute("clientid",clientUser );*/
		    		Map<String, String> map = new HashMap<String, String>();
		    		map.put("message","评价成功");
		    		//查询订单id查询译员id
		    		int transId=orderService.queryOrderTrans(orderId);
		    		//根据译员id查询译员信息
		    		Translator translator=translatorService.queryTransById(transId);
		    		//获取当前译员积分
		    		int point=translator.getPoint();
		    		//获取当前译员信誉
		    		int honor=translator.getHonor();
		    		String nickname=translator.getNickname();
		    		//根据订单id查询评价信息
		    		EvaluateClient  evaluateClients=evaluateService.queryByEvaluteOrder(orderId);
		    		//获取评价分数
		    		BigDecimal score = new BigDecimal(Double.parseDouble(evaluateClients.getScore())).setScale(0, RoundingMode.DOWN);
		    		double scores=score.doubleValue();
		    		Order orders=orderService.findOrderId(orderId);
		    		int clientCustomerNeedid=orders.getClientCustomerNeedId();
		    		//通过需求id查询需求信息
		    		ClientCustomerNeed clientCustomerNeed=clientCustomerService.findTransNeedByid(clientCustomerNeedid);
		    		//通过需求查询对应的字数信息
		    		int length=clientCustomerNeed.getLength();
		    		//使用软件可以调高部分积分的加成。
		    		int isToolUse=translator.getIsToolUse();
		    		if(isToolUse==1){
		    			point+=10;
		    		}
		    		point+=length/100+scores/10;
		    		
		    	honor+=point*0.1+scores*0.1;
		    	Translator translators=new Translator();
		    	translator.setNickname(nickname);
		    	translator.setPoint(point);
		    	translator.setHonor(honor);
		    	translator.setId(transId);
		    	translatorService.updataTranslator(translators);
		    		Order order = new Order();
		    		order.setId(orderId);
		    		order.setTaskStateId(8);
		    		orderService.updateTaskstateId(order);
		    		timer.cancel();
		            
		        }else{
		        	timer.cancel();
		        }
		        }
		    }, date);
		   
		}
}
