package com.web.action;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.SortedMap;
import java.util.TreeMap;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.jdom2.JDOMException;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.web.domain.ClientUserD;
import com.web.domain.TradingRecord;
import com.web.domain.WxPayConfig;
import com.web.service.ClientUserService;
import com.web.service.TradingRecordService;
import com.web.util.AlipayConfig;
import com.web.util.DateUtils;
import com.web.util.HttpUtils;
import com.web.util.MD5Utils;
import com.web.util.QRCodeUtil;
import com.web.util.XMLUtil;

@Controller
@RequestMapping("/payReturn")
@Transactional
public class PayReturnAction {
	/*@Resource
	private ClientCustomerService  clientCustomerService;*/
	@Resource
	private ClientUserService  clientUserService;
	@Resource
	private TradingRecordService  tradingRecordService;
	
	public void sendMessageAction_sendPhone(String phone,HttpServletRequest request,String message) throws HttpException, IOException{
		HttpClient client = new HttpClient();
		PostMethod post = new PostMethod("http://gbk.sms.webchinese.cn"); 
		post.addRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=gbk");//在头文件中设置转码             
		NameValuePair[] data ={ new NameValuePair("Uid", "zhaolei123"),new NameValuePair("Key", "1a5ca651cd2f7335d1c9"),new NameValuePair("smsMob",phone),new NameValuePair("smsText",message)};
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
	
	String payMoneyCode="";
	
	private static String baseUrl = "http://global.aitrans.org";//http://global.aitrans.org/payReturn/weixin.do/
	//private static String baseUrl = "http://localhsot:8080";

	@RequestMapping(value = "/toGetcodeUrl")   
	public void WxPayUnifiedorder(Double total,HttpServletResponse response,String payType,String userId,String out_trade_no,HttpServletRequest request) throws Exception{  
		
		if(payType.endsWith("weixin")){
				String urlCode = weixin_pay(out_trade_no,total);
				OutputStream os = null;  
		    	try {
		    		os=response.getOutputStream();  
		    		
					QRCodeUtil.encode(urlCode, null,os, true);
					  if(os!=null){  
			                os.close();  
			          }  
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
		}else if(payType.endsWith("alibaba")){
				/*Random ran = new java.util.Random();
				Date data = new Date();
				out_trade_no = DateUtils.dateToStr("yyMMddhhmmss", data);
				for (int i = 0; i < 3; i++) {
					out_trade_no += ran.nextInt(10);
				}
				TradingRecord tradingRecord=new TradingRecord();
				tradingRecord.setType("充值");
				tradingRecord.setPayer(userId);
				tradingRecord.setPayee("环宇爱译");
				tradingRecord.setPayTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
				tradingRecord.setPayMoney(Double.valueOf(total.toString()));//这是yi 元为单位的
				tradingRecord.setPayState("未转账");
				tradingRecord.setAccountNumber(out_trade_no);
				tradingRecord.setPayeeModel("支付宝扫一扫");
				int row=tradingRecordService.addTradRecord(tradingRecord);*/
			     total = (Double)request.getAttribute("total");
			     out_trade_no = (String)request.getAttribute("out_trade_no");
		    	System.out.println(out_trade_no);
				AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
					
				//设置请求参数
				AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
				alipayRequest.setReturnUrl(AlipayConfig.return_url);
				alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
				
				//订单名称，必填
				String subject = "Aitrans";
				//商品描述，可空
				String body = "AitransAddMoney";
				alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
						+ "\"total_amount\":\""+ total +"\"," 
						+ "\"subject\":\""+ subject +"\"," 
						+ "\"body\":\""+ body +"\"," 
						+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");			
				//请求
				String result = alipayClient.pageExecute(alipayRequest).getBody();
				
				//输出
				OutputStream os = null;  
		    	try {
		    		os=response.getOutputStream();  
					os.write(result.getBytes());
					  if(os!=null){  
			                os.close();  
			          }  
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		    	
			}
		
	} 
	public String weixin_pay(String out_trade_no,double total) throws JDOMException, IOException, org.jdom2.JDOMException {
		//String body = pnameStr;
		// 商户订单号
		// 订单生成的机器 IP
		String spbill_create_ip = "118.192.12.187";
		// 总金额
		//提示给用户的信息
		String body = "爱译备用金";
		Float fee = (float)total;
		Integer total_fee = Math.round(fee * 100);//以分为单位
		// 这里notify_url是 支付完成后微信发给该链接信息，可以判断会员是否支付成功，改变订单状态等。
		String notify_url = baseUrl + "/payReturn/winxin.do";

		String nonce_str = UUID.randomUUID().toString().replace("-", "");

		SortedMap<String, String> packageParams = new TreeMap<String, String>();
		packageParams.put("appid", WxPayConfig.appid);
		packageParams.put("mch_id", WxPayConfig.partner);
		packageParams.put("nonce_str", nonce_str);
		packageParams.put("body", body);
		packageParams.put("out_trade_no", out_trade_no);
		packageParams.put("total_fee", total_fee + "");
		packageParams.put("spbill_create_ip", spbill_create_ip);
		packageParams.put("notify_url", notify_url);
		//二维码支付
		packageParams.put("trade_type", "NATIVE");
		packageParams.put("product_id",out_trade_no);
		/*packageParams.put("userId", userId+"");*/
		String sign = createSign(packageParams);
		System.out.println("sign:" + sign);
		String xml = "<xml>" + "<appid>" + WxPayConfig.appid + "</appid>"
				+ "<mch_id>" + WxPayConfig.partner + "</mch_id>"
				+ "<nonce_str>" + nonce_str + "</nonce_str>" + "<sign>" + sign
				+ "</sign>" + "<body><![CDATA[" + body + "]]></body>"
				+ "<out_trade_no>" + out_trade_no + "</out_trade_no>"
				/*+"<userId>"+userId+"</userId>"*/
				+"<product_id>"+out_trade_no+"</product_id>"
				+ "<total_fee>" + total_fee + "" + "</total_fee>"
				+ "<spbill_create_ip>" + spbill_create_ip
				+ "</spbill_create_ip>" + "<notify_url>" + notify_url
				+ "</notify_url>" + "<trade_type>" + "NATIVE"
				+ "</trade_type>"
				+ "</xml>";
		System.out.println("xml：" + xml);
		// 调用微信接口
		String createOrderURL = "https://api.mch.weixin.qq.com/pay/unifiedorder";
		

	   
	        String resXml = HttpUtils.postData(createOrderURL, xml);  
	        System.out.println("返回xml：：：："+resXml);  
	          
	        Map map = XMLUtil.doXMLParse(resXml);  
	        //String return_code = (String) map.get("return_code");  
	        //String prepay_id = (String) map.get("prepay_id");
	        
	        String urlCode = (String) map.get("code_url");
	        payMoneyCode=urlCode;
	        //将生成的付款吗放到        
	    /*	SuccessPay successpay=new SuccessPay();	        		   					      	    
	        successpay.setCode(payMoneyCode);
    		successpay.setPayOid(out_trade_no);        
	        int row1=tickeOrderService.insertSuccessPay(successpay);*/
	        System.out.println("打印调用统一下单接口生成二维码url:::::"+urlCode);  
	        
	        return urlCode;  
	}

	//微信 回调
	@RequestMapping("/winxin")
	public void weixinNotify(HttpServletRequest request,HttpServletResponse response,String userId) throws Exception{  
	    System.out.println("支付回调方法开始！");  
	    HashMap<String,Object> map = new HashMap<String,Object>();  
	    weixin_notify(request, response);  
	    System.out.println("支付回调方法结束！");  
	   /* map.put("result", result);
	    return "/test.jsp";*/
	}  
	
	

	public void weixin_notify(HttpServletRequest request,HttpServletResponse response) throws Exception{  
		//int result=0;//返回结果值  作者lily       0--》已支付     1---》 修改用户余额成功   2--》修改交易记录成功    3--->支付失败   4-->验证失败
		
	    //读取参数  
	    InputStream inputStream ;  
	    StringBuffer sb = new StringBuffer();  
	    inputStream = request.getInputStream();  
	    String s ;  
	    BufferedReader in = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));  
	    while ((s = in.readLine()) != null){  
	        sb.append(s);  
	    }  
	    in.close();  
	    inputStream.close();  
	   
	    //解析xml成map  
	    Map<String, String> m = new HashMap<String, String>();  
	    m = XMLUtil.doXMLParse(sb.toString());  
	      
	    //过滤空 设置 TreeMap  
	    SortedMap<Object,Object> packageParams = new TreeMap<Object,Object>();        
	    Iterator it = m.keySet().iterator();  
	    while (it.hasNext()) {  
	        String parameter = (String) it.next();  
	        String parameterValue = m.get(parameter);  
	          
	        String v = "";  
	        if(null != parameterValue) {  
	            v = parameterValue.trim();  
	        }  
	        packageParams.put(parameter, v);  
	    }  
	      
	    // 账号信息  
	       String key = WxPayConfig.partnerkey; // key  
	       String out_trade_no = (String)packageParams.get("out_trade_no");  
	       //logger.info(packageParams);  
	    //判断签名是否正确  
	    if(isTenpaySign("UTF-8", packageParams,key)) {  
	    	
	        //------------------------------  
	        //处理业务开始  
	        //------------------------------  
	        String resXml = "";  
	        if("SUCCESS".equals((String)packageParams.get("result_code"))){  
	            // 这里是支付成功  
        		/*String userId=(String)packageParams.get("userId"); */
        	 	String mch_id = (String)packageParams.get("mch_id");  
	            String openid = (String)packageParams.get("openid");  
	            String is_subscribe = (String)packageParams.get("is_subscribe");  
	              
	            String bank_type = (String)packageParams.get("bank_type");  
	            String total_fee = (String)packageParams.get("total_fee");  
	            String transaction_id = (String)packageParams.get("transaction_id");  
	              
	            System.out.println("mch_id:"+mch_id);  
	            System.out.println("openid:"+openid);  
	            System.out.println("is_subscribe:"+is_subscribe);  
	            System.out.println("out_trade_no:"+out_trade_no);  
	            System.out.println("total_fee:"+total_fee);  
	            System.out.println("bank_type:"+bank_type);  
	            System.out.println("transaction_id:"+transaction_id);  
	         //这里根据 out_trade_no 到数据库 查出来 谁支付的  顺便验证一下 返回来的钱和订单里的钱是否一致  以防 财产损失  
	            String userId = null;
	            //自己写个查询的方法
	            TradingRecord tradingRecord =  tradingRecordService.selectTradRecordByouttradeno("accountNumber='"+out_trade_no+"'");
	            if(tradingRecord!=null ){
	            	if(tradingRecord.getPayMoney()*100==Double.valueOf(total_fee)){
	            		//支付成功
	            		userId = tradingRecord.getPayer();
	            		//是这里的问题吗这是充值成功，你应该把每次充值成功返回一下
	            
	            	}
	            }
	            
	           //String userId = 。。。。自己写
	            
		              
		            //成功回调后需要处理预生成订单的状态和一些支付信息  
	        
	            //////////执行自己的业务逻辑////////////////  
	        	
	            
	          //提醒客户充值成功
    			//1.如果是已经登录的客户，可从clientUser中找到客户电话
    			//2.如果是未登录的客户，可从tradingRecord.intro中找到客户电话
    			
    			//注意，两种客户提醒短信内容不同
	            
	        	if(userId!=null && userId!=""){
	        		
	        		/*1.修改用户余额信息
	        		    查找用户原来余额 oldBalance
	        		    计算新余额信息 oldBalance+total*/
	        		ClientUserD clientUser=clientUserService.findCustomerById(Integer.parseInt(userId));
	        		if(clientUser!=null){
	        			//clientUser.setId(Integer.parseInt(userId));
	        			
	        			/*2修改交易记 录状态*/ 
	        			int updateRow=tradingRecordService.updateTradRecordBYwhere(tradingRecord);
	        			if(updateRow>0){
	        				clientUser.setBalance(clientUser.getBalance()+Double.valueOf(tradingRecord.getPayMoney()));
		        			clientUserService.updateUserWallet(clientUser);
		        			
		        			String tel=clientUser.getTel();
		        			String message="尊敬的用户您好，您已成功在爱译全球翻译平台（www.aitrans.org）充值人民币"+tradingRecord.getPayMoney()+"元。您的备用金剩余："+clientUser.getBalance()+Double.valueOf(tradingRecord.getPayMoney())+"元。";
		        			sendMessageAction_sendPhone(tel,request,message);
	        			}
	        			//result=1;	
	        			//这里修改 充值记录  改为支付状态 好啦  
	        			resXml = "<xml>"
								+ "<return_code><![CDATA[SUCCESS]]></return_code>"
								+ "<return_msg><![CDATA[OK]]></return_msg>"
								+ "</xml> ";
	        		}
	        	}else if(userId==null || "".equals(userId)){
	        		int updateRow=tradingRecordService.updateTradRecordBYwhere(tradingRecord);
        			if(updateRow>0){
        				String tel=tradingRecord.getIntro();
        				String message="尊敬的用户您好，您已成功在爱译全球翻译平台（www.aitrans.org）办理翻译智能软件——PAT年费业务，共人民币"+tradingRecord.getPayMoney()+"元。";
        				sendMessageAction_sendPhone(tel,request,message);
        			}
	        		
	        	}
	        	
	        	
	        } else {
	        	//result=3;
	            System.out.println("支付失败,错误信息：" + packageParams.get("err_code")+  
	                                "-----订单号：：："+out_trade_no+"*******支付失败时间：：：："  
	                    +new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));  
	              
	            String err_code = (String)packageParams.get("err_code");  
	      
	            resXml = "<xml>" + "<return_code><![CDATA[FAIL]]></return_code>"  
	                     + "<return_msg><![CDATA[报文为空]]></return_msg>" + "</xml> ";  
	        
	        }  
	        //------------------------------  
	        //处理业务完毕  
	        //------------------------------  
	        BufferedOutputStream out = new BufferedOutputStream(  
	                response.getOutputStream());  
	        out.write(resXml.getBytes());  
	        out.flush();  
	        out.close();  
	    } else{
	    	//result=4;
	        System.out.println("通知签名验证失败---时间::::"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));  
	    }  
	    
	    //return result;
	} 

	
	//支付宝 回调
		@RequestMapping("/alipayNotify_url")
		public void alipayNotifyUrl(HttpServletRequest request,HttpServletResponse response,String userId) throws Exception{  
		    System.out.println("支付回调方法开始！");  
		    HashMap<String,Object> map = new HashMap<String,Object>();  
		    ali_notify(request, response);  
		    System.out.println("支付回调方法结束！");  
		   /* map.put("result", result);
		    return "/test.jsp";*/
		}  
	
	
	public void ali_notify(HttpServletRequest request,HttpServletResponse response) throws Exception{  
		//int result=0;//返回结果值  作者lily       0--》已支付     1---》 修改用户余额成功   2--》修改交易记录成功    3--->支付失败   4-->验证失败
		
	    //读取参数  
	    InputStream inputStream ;  
	    StringBuffer sb = new StringBuffer();  
	    inputStream = request.getInputStream();  
	    String s ;  
	    BufferedReader in = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));  
	    while ((s = in.readLine()) != null){  
	        sb.append(s);  
	    }  
	    in.close();  
	    inputStream.close();  
		//获取支付宝GET过来反馈信息
		Map<String,String> params = new HashMap<String,String>();
		Map<String,String[]> requestParams = request.getParameterMap();
		for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			//乱码解决，这段代码在出现乱码时使用
			//valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}
		
		boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名

		//——请在这里编写您的程序（以下代码仅作参考）——
		if(signVerified) {
			String trade_status = (String)params.get("trade_status");
			
			if(trade_status.equals("TRADE_SUCCESS")){
				  // 这里是支付成功  
			    String out_trade_no = (String)params.get("out_trade_no");        
	            String total_fee = (String)params.get("total_amount");  
	           
	         //这里根据 out_trade_no 到数据库 查出来 谁支付的  顺便验证一下 返回来的钱和订单里的钱是否一致  以防 财产损失  
	            String userId = null;
	            //自己写个查询的方法
	            TradingRecord tradingRecord =  tradingRecordService.selectTradRecordByouttradeno("accountNumber='"+out_trade_no+"'");
	            if(tradingRecord!=null ){
	            	if(tradingRecord.getPayMoney()==Double.valueOf(total_fee)){
	            		//支付成功
	            		userId = tradingRecord.getPayer();
	            		//是这里的问题吗这是充值成功，你应该把每次充值成功返回一下
	            
	            	}
	            }
	            
	           //String userId = 。。。。自己写
	            
		              
		            //成功回调后需要处理预生成订单的状态和一些支付信息  
	        
	            //////////执行自己的业务逻辑////////////////  
	        	
	            //提醒客户充值成功
    			//1.如果是已经登录的客户，可从clientUser中找到客户电话
    			//2.如果是未登录的客户，可从tradingRecord.intro中找到客户电话
    			
    			//注意，两种客户提醒短信内容不同
	        	if(userId!=null && userId!=""){
	        		
	        		/*1.修改用户余额信息
	        		    查找用户原来余额 oldBalance
	        		    计算新余额信息 oldBalance+total*/
	        		ClientUserD clientUser=clientUserService.findCustomerById(Integer.parseInt(userId));
	        		if(clientUser!=null){
	        			//clientUser.setId(Integer.parseInt(userId));
	        			
	        			/*2修改交易记 录状态*/ 
	        			int updateRow=tradingRecordService.updateTradRecordBYwhere(tradingRecord);
	        			if(updateRow>0){
	        				clientUser.setBalance(clientUser.getBalance()+Double.valueOf(tradingRecord.getPayMoney()));
		        			clientUserService.updateUserWallet(clientUser);
	        			}
	        		}
	        	}else{
	        		int updateRow=tradingRecordService.updateTradRecordBYwhere(tradingRecord);
        			if(updateRow>0){
        				String tel=tradingRecord.getIntro();
        				String message="尊敬的用户您好，您已成功在爱译全球翻译平台（www.aitrans.org）办理翻译智能软件——PAT年费业务，共人民币"+tradingRecord.getPayMoney()+"元。";
        				sendMessageAction_sendPhone(tel,request,message);
        			}
	        	}
				
			}
		
		}
	} 

@RequestMapping("alipayReturn")
public String alipayReturn(HttpServletRequest request,HttpServletResponse response,String  out_trade_no ) throws Exception{  
	//int result=0;//返回结果值  作者lily       0--》已支付     1---》 修改用户余额成功   2--》修改交易记录成功    3--->支付失败   4-->验证失败
	
    //读取参数  
    InputStream inputStream ;  
    StringBuffer sb = new StringBuffer();  
    inputStream = request.getInputStream();  
    String s ;  
    BufferedReader in = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));  
    while ((s = in.readLine()) != null){  
        sb.append(s);  
    }  
    in.close();  
    inputStream.close();  
	//获取支付宝GET过来反馈信息
	Map<String,String> params = new HashMap<String,String>();
	Map<String,String[]> requestParams = request.getParameterMap();
	for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
		String name = (String) iter.next();
		String[] values = (String[]) requestParams.get(name);
		String valueStr = "";
		for (int i = 0; i < values.length; i++) {
			valueStr = (i == values.length - 1) ? valueStr + values[i]
					: valueStr + values[i] + ",";
		}
		//乱码解决，这段代码在出现乱码时使用
		//valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
		params.put(name, valueStr);
	}
	
	boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名
	
	//——请在这里编写您的程序（以下代码仅作参考）——
	if(signVerified) {
	
		String payState = tradingRecordService.checkState(out_trade_no);//yizh	
	if(payState.equals("已支付")){	
			  // 这里是支付成功  
		   /* String out_trade_no = (String)params.get("out_trade_no");        
            String total_fee = (String)params.get("total_amount");  
           
         //这里根据 out_trade_no 到数据库 查出来 谁支付的  顺便验证一下 返回来的钱和订单里的钱是否一致  以防 财产损失  
            String userId = null;
            //自己写个查询的方法
            TradingRecord tradingRecord =  tradingRecordService.selectTradRecordByouttradeno("accountNumber='"+out_trade_no+"'");
            if(tradingRecord!=null ){
            	if(tradingRecord.getPayMoney()==Double.valueOf(total_fee)){
            		//支付成功
            		userId = tradingRecord.getPayer();
            		//是这里的问题吗这是充值成功，你应该把每次充值成功返回一下
            
            	}
            }
            
           //String userId = 。。。。自己写
            
	              
	            //成功回调后需要处理预生成订单的状态和一些支付信息  
        
            //////////执行自己的业务逻辑////////////////  
        	
        	if(userId!=null && userId!=""){
        		
        		1.修改用户余额信息
        		    查找用户原来余额 oldBalance
        		    计算新余额信息 oldBalance+total
        		ClientUserD clientUser=clientUserService.findCustomerById(Integer.parseInt(userId));
        		if(clientUser!=null){
        			//clientUser.setId(Integer.parseInt(userId));
        			
        			2修改交易记 录状态 
        			int updateRow=tradingRecordService.updateTradRecordBYwhere(tradingRecord);
        			if(updateRow>0){
        				clientUser.setBalance(clientUser.getBalance()+Double.valueOf(tradingRecord.getPayMoney()));
	        			clientUserService.updateUserWallet(clientUser);
        			}
        		}
        	}*/
		request.setAttribute("type", "alibaba");
        	return "/pay_success.jsp";
		}
		
	}else {
		
	}
	return "/ReCharge.jsp";
   
} 
	
	
	
	// 成功标志
	@RequestMapping("/success")
	public String toWXPaySuccess(HttpServletRequest request,String type) throws IOException {
		System.out.println(type);
		request.setAttribute("type", "weixin");
		return "/pay_success.jsp";
	}

	private String getRequestTextCode(String xml) throws DocumentException {
		Document doc = DocumentHelper.parseText(xml);
		// 获得根节点
		Element root = doc.getRootElement();

		String result = root.elementText("result_code");

		return result;
	}
	

	/**
	 * 创建md5摘要,规则是:按参数名称a-z排序,遇到空值的参数不参加签名。
	 */
	public String createSign(SortedMap<String, String> packageParams) {
		StringBuffer sb = new StringBuffer();
		Set es = packageParams.entrySet();
		Iterator it = es.iterator();
		while (it.hasNext()) {
			Map.Entry entry = (Map.Entry) it.next();
			String k = (String) entry.getKey();
			String v = (String) entry.getValue();
			if (null != v && !"".equals(v) && !"sign".equals(k)
					&& !"key".equals(k)) {
				sb.append(k + "=" + v + "&");
			}
		}
		sb.append("key=" + WxPayConfig.partnerkey);
		System.out.println("md5 sb:" + sb);
		String sign = MD5Utils.MD5Encode(sb.toString(), "UTF-8")
				.toUpperCase();
		System.out.println("packge签名:" + sign);
		return sign;

	}
	
	 public  boolean isTenpaySign(String characterEncoding, SortedMap<Object, Object> packageParams, String API_KEY) {  
	        StringBuffer sb = new StringBuffer();  
	        Set es = packageParams.entrySet();  
	        Iterator it = es.iterator();  
	        while(it.hasNext()) {  
	            Map.Entry entry = (Map.Entry)it.next();  
	            String k = (String)entry.getKey();  
	            String v = (String)entry.getValue();  
	            if(!"sign".equals(k) && null != v && !"".equals(v)) {  
	                sb.append(k + "=" + v + "&");  
	            }  
	        }  
	        sb.append("key=" + API_KEY);  
	          
	        //算出摘要  
	        String mysign = MD5Utils.MD5Encode(sb.toString(), characterEncoding).toLowerCase();  
	        String tenpaySign = ((String)packageParams.get("sign")).toLowerCase();  
	          
	        //System.out.println(tenpaySign + "    " + mysign);  
	        return tenpaySign.equals(mysign);  
	    } 
	 
	 
	@RequestMapping(value = "/topayUrl")   
	public String topayUrl(HttpServletRequest request,Double total,int userId,String payType,String tel){
		ClientUserD clientUser=(ClientUserD)request.getSession().getAttribute("clientid");
		//userId=.getId();
		Random ran = new java.util.Random();
		Date data = new Date();
		String out_trade_no = DateUtils.dateToStr("yyMMddhhmmss", data);
		for (int i = 0; i < 3; i++) {
			out_trade_no += ran.nextInt(10);
		}
		//这个userId不应该从session读出来吗，不是，这个事前边页面传过来的
		//这种写法有风险,管你呢
		//哪里就要关掉扫码页面
		TradingRecord tradingRecord=new TradingRecord();
		tradingRecord.setPayee("环宇爱译");
		tradingRecord.setPayTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		tradingRecord.setPayMoney(Double.valueOf(total.toString()));//这是yi 元为单位的
		tradingRecord.setPayState("未转账");
		tradingRecord.setAccountNumber(out_trade_no);
		if(clientUser!=null){//登陆
			if("pat".equals(request.getParameter("tt"))){
				tradingRecord.setType("软件购买PAT");
			}else{
				tradingRecord.setType("充值");
			}
			
			tradingRecord.setUserType(1);
			tradingRecord.setPayer(clientUser.getId()+"");
		}else{//未登录
			tradingRecord.setType("软件购买PAT");
			tradingRecord.setUserType(0);
			tradingRecord.setIntro(tel);
		}
		
		if("weixin".equals(payType)){
			tradingRecord.setPayeeModel("微信扫一扫");
			int row=tradingRecordService.addTradRecord(tradingRecord);
			request.setAttribute("payType", payType);
			request.setAttribute("out_trade_no", out_trade_no);
			request.setAttribute("total", total);
			request.setAttribute("userId", userId);
			
			return "/pay_weixin.jsp";
		
		}else{
			tradingRecord.setPayeeModel("支付宝扫一扫");
			int row=tradingRecordService.addTradRecord(tradingRecord);
			request.setAttribute("payType", payType);
			request.setAttribute("out_trade_no", out_trade_no);
			request.setAttribute("total", total);
			request.setAttribute("userId", userId);
			return "/payReturn/toGetcodeUrl.do";
		}
		
		
		//这里将订单信息放到数据库 状态设为支付 zhifufangshi shewei 微信支付   支付宝的同理
		// int row=rechargeService.insertRechargeInformation(out_trade_no);//改掉这句话  判断插入插入成功后生成二维码  out_trade_no一定要放到数据ku 
		
	}
	
	@RequestMapping(value = "/checkState")   
	public ModelAndView checkState(HttpServletRequest request,String out_trade_no ){
		ModelAndView mav = new ModelAndView(new MappingJackson2JsonView());
		String payState = tradingRecordService.checkState(out_trade_no);
		if(payState.equals("已支付")){
			mav.addObject("result", "success");
		}else{
			mav.addObject("result", "fail");
		}
		
		return mav;
		
		
	}
	

}
