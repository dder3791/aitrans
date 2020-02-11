package com.web.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Timer;
import java.util.TimerTask;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.io.FilenameUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.web.domain.BasicPrice;
import com.web.domain.ClientCustomerNeed;
import com.web.domain.ClientCustomerNeedTrans;
import com.web.domain.ClientUserD;
import com.web.domain.EvaluateClient;
import com.web.domain.Exchange;
import com.web.domain.Field;
import com.web.domain.Integral;
import com.web.domain.OnLineCustomer;
import com.web.domain.Order;
import com.web.domain.OrderState;
import com.web.domain.ProcedureType;
import com.web.domain.Quotation;
import com.web.domain.Schedule;
import com.web.domain.TradingRecord;
import com.web.domain.Translator;
import com.web.domain.TranslatorLevel;
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
import com.web.service.ProcedureService;
import com.web.service.QuotationService;
import com.web.service.ScheduleService;
import com.web.service.TradingRecordService;
import com.web.service.TranslatorLevelService;
import com.web.service.TranslatorService;
import com.web.util.BankUtil;
import com.web.util.DateUtils;
import com.web.util.LocalUtil;
import com.web.util.MD5Util;
import com.web.util.Page;
import com.web.util.TimerUtil;


/**
 * 前台客户相关Action
 * @author Dell
 *
 */
@Controller
@Scope("prototype")  
@RequestMapping("/cilentCustomer/")
@Transactional
public class CilentCustomerAction {
	
	@Resource
	private EvaluateService evaluateService;
	@Resource
	private ClientCustomerService clientCustomerService; 
	@Resource
	private ProcedureService procedureService;
	@Resource
	private DomainService domainService;
	@Resource
	private TranslatorService translatorService;
	@Resource
	private BasicPriceService basicPriceService;
	@Resource
	private FieldService fieldService;
	@Resource
	private TranslatorLevelService TransLevelService;
	@Resource
	private ScheduleService scheduleService;
	@Resource
	private ClientCustomerTransService clientCustomerTransService;
	@Resource
	private ClientUserService clientUserService;
	@Resource
	private OrderService orderService;
	@Resource
	private OrderStateService orderStateService;
	@Resource
	private IntegralService integralService;
	@Resource
	private ExchangeService exchangeService;
	@Resource
	private QuotationService quotationService;
	@Resource
	private TradingRecordService  tradingRecordService;
	/**
	 * 文件上传
	 * @param oldpath 
	 * @param files
	 */
	public List<String> upload(String path,CommonsMultipartFile files[]){
		
		List<String> fileName=new ArrayList<String>();
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
				fileName.add(name);
				File saveFile = new File(path,name);				
				//从方法传入的人间对象获取输入流
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
					System.out.println("上传失败！");
					e.printStackTrace();
				}						
			}	
		}
		
		return fileName;
	}
	
	
	public void sendMessageAction_sendPhone(String phone,HttpServletRequest request,String needTitle,String accountName,int needid,int transId,String message) throws HttpException, IOException{
		HttpClient client = new HttpClient();
		PostMethod post = new PostMethod("http://gbk.sms.webchinese.cn"); 
		post.addRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=gbk");//在头文件中设置转码             
		String code="";
		
		
		if("deleteOrder".equals(message)){//取消订单
			code="尊敬的译员"+accountName+"您好，很抱歉客户已经取消案号为"+needTitle+"的订单。了解详情拨打010-82893875";
		}else if("okState".equals(message)){//订单签收
			code="尊敬的译员"+accountName+"您好，客户已签收案号为"+needTitle+"的订单。了解详情拨打010-82893875";
		}else if("customerSign".equals(message)){//客户签收订单
			code="尊敬的客户您好,您已签收案号为"+needTitle+"的订单，共计人民币"+accountName+"元。了解详情拨打010-82893875";
		}else if(null==message || message==""){//通知译员任务
			code="尊敬的译员"+accountName+",您接受到一个标题为"+needTitle+"的任务，请登陆: http://www.aitrans.org/index/indexAction_isAccept.do?needid="+needid+"&transId="+transId;
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
	 * 上传头像
	 * @param url
	 */
	public String upload(MultipartFile headPortrait, HttpServletRequest request){
		ClientUserD client= (ClientUserD) request.getSession().getAttribute("clientid");
		//System.out.println("-----------------------------");
		 try {  
		 // 获取图片原始文件名  
       String originalFilename = headPortrait.getOriginalFilename();  
       
       // 文件名使用当前时间  
       String name = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());  
       
       // 获取上传图片的扩展名(jpg/png/...)  
       String extension = FilenameUtils.getExtension(originalFilename); 
       
    // 图片上传的相对路径（因为相对路径放到页面上就可以显示图片）  
       String path = "upload/customer/"+client.getId()+"/customersface/" + name + "." + extension;  
       
    // 图片上传的绝对路径  
       String url = request.getSession().getServletContext().getRealPath("")+"/" + path; 
       
       File dir = new File(url);  
       if(!dir.exists()) {  
       dir.mkdirs();  
       }  
         
       // 上传图片  
       headPortrait.transferTo(new File(url));  
     
       /*// 将相对路径写回（json格式）  
       JSONObject jsonObject = new JSONObject();  
       // 将图片上传到本地  
       jsonObject.put("path", path);  
     
       // 设置响应数据的类型json  
       response.setContentType("application/json; charset=utf-8");  
       // 写回  */
       //response.getWriter().write(path);  
       return path;
		 } catch (Exception e) {  
	            throw new RuntimeException("服务器繁忙，上传图片失败");  
	        } 
	}
	
	
	
	/**
	 * 文件下载
	 * @param request
	 * @param response
	 */
	@RequestMapping("downloadTransFile")
    public void download(HttpServletRequest request,HttpServletResponse response)throws IOException{ 
		response.setContentType("application/vnd.ms-txt;charset=utf-8");
		//得到要下载的文件路劲，文件名
        String urlname =request.getParameter("url");
        urlname=urlname.replace("\\/", "\\");
        urlname=urlname.replace("/", "\\");
        String  fileName= request.getParameter("filename");

		  //通过文件名找出文件的所在目录
			//System.out.println("下载文件路径为"+path);
       //得到要下载的文件
      File file = new File(urlname);
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
      BufferedInputStream bis = new BufferedInputStream(new FileInputStream(urlname));
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
	
	
	@ResponseBody
	@RequestMapping("deleteFile")
	public Map<String,String> deleteFile(HttpServletRequest request,String fileURL){
		 Map<String,String> map=new HashMap<String,String>();
		 String result="";
		 File file = new File(fileURL);
	        // 如果文件路径所对应的文件存在，并且是一个文件，则直接删除
	        if (file.exists() && file.isFile()) {
	            if (file.delete()) {
	                System.out.println("删除单个文件" + fileURL + "成功！");
	                result="success";
	                map.put("result", result);
	            } else {
	                System.out.println("删除单个文件" + fileURL + "失败！");
	                result="fail";
	                map.put("result", result);
	            }
	        } else {
	            System.out.println("删除单个文件失败：" + fileURL + "不存在！");
	            result="fail";
             map.put("result", result);
	        }
		 
		 return map;
		
	}
	
	/**
	 * 定时任务
	 * @param date
	 * @param id
	 */
	//需求发布后，一定时间内失效，需修改需求状态
    /*Timer timer =null;*/
    Timer timer/*=new Timer();*/;
	public void MyTimer( Date date,final ClientCustomerNeed clientCustomerNeed) {
		timer= new Timer();

	    //定时任务，指定时间进行
	    timer.schedule(new TimerTask() {
	        public void run() {
	        	ClientCustomerNeed	clientCustomerNeed1 =clientCustomerService.queryByWhere(clientCustomerNeed);
	        	clientCustomerNeed1.setAcceptState("失效");
	        	clientCustomerService.updateNeed(clientCustomerNeed1);
	        	timer.cancel();
	        }

	    }, date);
	}
	
	//时间段定时任务
	public void timerTask(final ClientCustomerNeed clientCustomerNeed,final HttpServletRequest request){
		timer= new Timer();
		timer.schedule(new TimerTask() {
			@Override
			public void run() {
			//有效时间转化为date类型
			SimpleDateFormat  sdf=new  SimpleDateFormat("yyyy-MM-dd");//小写的						mm表示的是分钟
			//String  dstr="2008-4-24"; 
			Date needDate;
			try {
				needDate = sdf.parse(clientCustomerNeed.getCompleteTime());
			 if(needDate.after(new Date())){//需求有效期在现在时间之前
				System.out.println("定时任务开始------------");
				Field field=fieldService.queryById(clientCustomerNeed.getDomainId());
				
				List<Translator> listTranslator=new ArrayList<Translator>();
				Translator translator = new Translator();
		    	translator.setLanguages(clientCustomerNeed.getLanguagePair());
		    	translator.setLevel(clientCustomerNeed.getTransLevel());
		    	translator.setDomain(field.getField());
		    	translator.setState("空闲");
		    	translator.setMsg(clientCustomerNeed.getProcedureTypeId()+"");
		    	listTranslator=translatorService.queryOutCusNeed(translator);
		    	if(listTranslator.size()==0){
		    		translator.setState("");
		    		listTranslator=translatorService.queryOutCusNeed(translator);
		    		if(listTranslator.size()==0){
		    			listTranslator=translatorService.queryOutCusNeed(new Translator());
		    		}
		    	}
		    	if(listTranslator.size()!=0){
		    		try {
		    			int num=0;
		    			/*if(listTranslator.size()>100){
		    				num=100;
		    			}else{*/
		    				num=listTranslator.size();
		    			/*}*/
		    		//listTranslator.size();
		    		for(int i=0;i<num;i++){
		    			ClientCustomerNeedTrans clientCustomerNeedTrans=new ClientCustomerNeedTrans();
						int trid=listTranslator.get(i).getId();
						clientCustomerNeedTrans.setClientCustomerNeedId(clientCustomerNeed.getId());
						clientCustomerNeedTrans.setTranslatorId(trid);
						List<ClientCustomerNeedTrans> cusNeedList=clientCustomerTransService.queryById(clientCustomerNeedTrans);
						/*for(int j=0;j<=cusNeedList.size();j++){*/
							if(cusNeedList.size()==0){
								/*clientCustomerNeedTrans.setClientCustomerNeedId(cusNeedList.get(j).getClientCustomerNeedId());
								clientCustomerNeedTrans.setTranslatorId(trid);*/
								clientCustomerTransService.addtransCustomer(clientCustomerNeedTrans);
								/*int needid=clientCustomerNeed.getId();*/
								//短信通知译员有任务
								sendMessageAction_sendPhone(listTranslator.get(i).getTel(),request,clientCustomerNeed.getTitle(),listTranslator.get(i).getAccountName(),clientCustomerNeed.getId(),listTranslator.get(i).getId(),"");
									
								}
						   /* }*/
						}
		    		}catch (Exception e) {
						e.printStackTrace();
					} 
			    }
			}else{
				timer.cancel();
			}
		  }catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		  }
		},5000,10000);
	}

	/**
	 * 跳转个人信息路径
	 */
	@RequestMapping("findUI")
	public String findUI(HttpServletRequest request){
		String type=request.getParameter("type");
		ClientUserD client= (ClientUserD) request.getSession().getAttribute("clientid");

		/*client=clientUserService.findCustomerById(client.getId());*/

		if(client!=null){
		client=clientUserService.findCustomerById(client.getId());
		}

		//System.out.println(client);
		Translator trans=(Translator) request.getSession().getAttribute("transid");
		/*ClientUserD client=new ClientUserD();
		 client.setHeadPortrait("/Aitrans/upload/20170810172616649.jpg");
		 client.setBirthday(new Date());*/
		
		if(client!=null){
			request.setAttribute("clientid", client);
			if("edit".equals(type)){//修改客户信息
				//如果客户是企业类型，查询企业有关信息
				//如果客户是个人类型，不需要查询
				
				if(client.getCertificationType()==1){
					OnLineCustomer onlineCustomer = clientCustomerService.findUserID(client.getId());
					request.setAttribute("onlineCustomer",onlineCustomer);
				}
				return "forward:/usercenter/user.center.customer.jsp";
			}
			else if("password".equals(type)){//密码修改
				return "forward:/usercenter/user.customer.modify.password.jsp";
			}
			
			else{//展示客户信息
				OnLineCustomer onlineCustomer = clientCustomerService.findUserID(client.getId());
				request.setAttribute("onlineCustomer",onlineCustomer);
				return "forward:/usercenter/user.center.customer.show.jsp";
			}
		}else if(trans!=null){
			
			request.setAttribute("translators",trans);
			return "forward:/translator/translatorAction_findTrans.do";
		}else {
			return "forward:/login.jsp";
		}	

		
		
	}
	
	
	/**
	 * 验证银行卡号与开户行是否一致
	 * @param bankNumber
	 * @return
	 */
	@RequestMapping("getOpenBank")
	@ResponseBody
	public Map<String,String> getOpenBank(String bankNumber){
		BankUtil bankUtil=new BankUtil();
		String openBank=bankUtil.getNameOfBank(bankNumber);
		Map<String,String> map=new HashMap<String,String>();
		map.put("msg", openBank);
		return map;
		
	}
	
	
	/**
	 * 客户用户头像上传
	 * @param request
	 */
	@RequestMapping("uploadheadPortraitSRC")
	public String uploadheadPortraitSRC(@Param(value="headPortrait") MultipartFile headPortrait, HttpServletRequest request){
		ClientUserD client= (ClientUserD) request.getSession().getAttribute("clientid");
		/*ClientUserD client=new ClientUserD();*/
		String path=upload(headPortrait,request);
		client.setHeadPortrait(path);
		clientCustomerService.editCilentCustomerById(client);
		return "forward:./findUI.do";
		
	}
	
	/**
	 * 修改客户用户信息
	 * @param request
	 * @param headPortrait
	 */
	@RequestMapping("editClientCustomer")
	public String editClientCustomer(HttpServletRequest request,@Param(value="headPortrait") MultipartFile headPortrait){
		//System.out.println(path);
		//修改信息
		
			ClientUserD clientUser= (ClientUserD) request.getSession().getAttribute("clientid");
			/*ClientUserD clientUser = new ClientUserD();*/
			clientUser.setRealName(request.getParameter("realName"));
			clientUser.setCardId(request.getParameter("cardId"));
			clientUser.setSex(request.getParameter("sex"));
			clientUser.setRoleName(request.getParameter("roleName"));
			clientUser.setBirthday(request.getParameter("birthday"));
			clientUser.setAddress(request.getParameter("address"));
			clientUser.setTel(request.getParameter("tel"));
			clientUser.setEmaile(request.getParameter("email"));
			clientUser.setIntro(request.getParameter("intro"));
			clientUser.setJob(request.getParameter("job"));
			clientUser.setCompany(request.getParameter("company"));
			clientUser.setBankAccount(request.getParameter("bankAccount"));
			/*clientUser.setUserName(request.getParameter("userName"));*/
			if(clientUser.getCertificationState()==0){
				clientUser.setCertificationType(Integer.parseInt(request.getParameter("certificationType")));
			}
			
			clientUser.setOpeningBank(request.getParameter("openingBank"));
			if(0==clientUser.getUserType()){
				clientUser.setUserType(1);
			}
			
			//上传头像
			String originalFilename = headPortrait.getOriginalFilename();  
			if(originalFilename!=null && originalFilename!=""){
				String path=upload(headPortrait,request);
				clientUser.setHeadPortrait(path);
			}
			//个人信息修改完毕
			
			//企业信息修改开始
			if(clientUser.getCertificationType()==1){
				
				clientUser.setTel(request.getParameter("companytel"));
				clientUser.setJob(request.getParameter("companyjob"));
				clientUser.setRealName(request.getParameter("companyrealName"));
				clientUser.setEmaile(request.getParameter("companyemail"));
				clientUser.setBankAccount(request.getParameter("companybankAccount"));
				clientUser.setOpeningBank(request.getParameter("copanyopeningBank"));
				
				OnLineCustomer onlineCustomer=new OnLineCustomer();
				onlineCustomer.setClientUserId(clientUser.getId());
				onlineCustomer.setAddress(request.getParameter("companyaddress"));
				onlineCustomer.setCel(request.getParameter("companycel"));
				onlineCustomer.setContact(clientUser.getRealName());
				onlineCustomer.setLtd(request.getParameter("Ltd"));
				onlineCustomer.setIntro(request.getParameter("companyintro"));
				onlineCustomer.setIntroEN(request.getParameter("companyintroEN"));
				onlineCustomer.setNameEN(request.getParameter("nameEN"));
				onlineCustomer.setNameZH(request.getParameter("nameZH"));
				onlineCustomer.setNameShort(request.getParameter("nameShort"));
				String country=request.getParameter("country");
				String province=request.getParameter("province");
				String city=request.getParameter("city");
				//String registrationAddress=country+"  "+province+"  "+city;
				String hiddenCountry=request.getParameter("hiddenCountry");//过去对应版本国家值
				
				String languageSession=(String)request.getSession().getAttribute("language");
				Map<String,String> map=LocalUtil.getInstance(languageSession).getAddressENAndCN(country, province, city);
				//如果是中文版，返回英文地址，如果是英文版，返回中文地址
				if("".equals(languageSession)||languageSession==null||"undefined".equals(languageSession)||"zh".equals(languageSession)){
					onlineCustomer.setRegistrationAddress(request.getParameter("registrationAddress"));
					onlineCustomer.setCountry(hiddenCountry);
					onlineCustomer.setRegistrationAddressEN(map.get("address"));
					onlineCustomer.setCountryEN(map.get("countryStr"));
				}else if("en".equals(languageSession)){
					onlineCustomer.setRegistrationAddress(map.get("address"));
					onlineCustomer.setRegistrationAddressEN(request.getParameter("registrationAddress"));
					onlineCustomer.setCountry(map.get("countryStr"));
					onlineCustomer.setCountryEN(hiddenCountry);
				}
				
				
				
				/*onlineCustomer.setCountry(country);*/
				
				
				//1.查询企业表是否有对应的信息
				OnLineCustomer onlineCustomer1 = clientCustomerService.findUserID(clientUser.getId());
				if(onlineCustomer1==null){
					//没有对应信息，做添加
					clientCustomerService.saveOnliCustomer(onlineCustomer);
				}else{
					//有对应信息，做修改
					int onlineId=Integer.parseInt(request.getParameter("onlineCusId"));
					onlineCustomer.setId(onlineId);
					clientCustomerService.updateOnlineCustomer(onlineCustomer);
				}
				
			}
			
			clientCustomerService.editCilentCustomerById(clientUser);
		return "forward:./findUI.do";
	}
	
	
	/*
	 * 验证证件号
	 */
	@ResponseBody
	@RequestMapping("exportCardId")
	public Map<String,String> exportCardId(HttpServletRequest request,String cardID,String tel,String email,String bankNumber){
		ClientUserD clientUser1= (ClientUserD) request.getSession().getAttribute("clientid");
		List<ClientUserD> list=new ArrayList<ClientUserD>();
		String result="";
		String sql="";
		if(cardID!=null && cardID!=""){
			//1.查找是否有相同的证件号
			sql="and cardId='"+cardID+"'";
		}
		else if(tel!=null && tel!=""){
			sql="and tel='"+tel+"'";
		}
		else if(email!=null && email!=""){
			sql="and emaile='"+email+"'";
		}
		else if(bankNumber!=null && bankNumber!=""){
			sql="and bankAccount='"+bankNumber+"'";
		}
		list=clientCustomerService.findCardId(sql);
		//2.如果没有，直接通过
		if(list.size()==0){
			result="success";
		}else{
			//3.如果有1个，是否和现在登录的客户是同一个人，如果相同--》通过，不同提示已存在
			if(list.size()==1){
				ClientUserD clientUser=list.get(0);
				if(clientUser.getId()==clientUser1.getId()){
					result="success";
				}else{
					result="error";
				}
			}else{
				result="error";
			}
		}
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("result", result);
		return map;
	}
	
	
	
	/**
	 * 修改密码是否正确
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("checkPassword")
	public Map<String,String> checkPassword(HttpServletRequest request){
		
		ClientUserD clientUser= (ClientUserD) request.getSession().getAttribute("clientid");
		String oldpassword=clientUser.getPassword();
		String password01=request.getParameter("password01");
		String password02=request.getParameter("password02");
		String password03=request.getParameter("password03");
		String result="";
		
		if(password01!=null && password01!=""){
			//加密
			password01=MD5Util.ecode(MD5Util.ecode(password01));
  		  if(oldpassword.equals(password01)){
  			  if((password02==null || password02=="")&&(password03!=null&&password03!="")){
  				result= "请先输入新密码";
  			  }
  			  else if(password02.equals(oldpassword)){
  				result= "新密码不能与原始密码重复！请重新输入...";
  			  }
  			  else{
  				  if(password03!=null && password03!=""){
  					  if(!password03.equals(password02)){
  						result= "两次密码输入不一致！";
  					  }else{
  						  //修改
  						clientUser.setPassword(MD5Util.ecode(MD5Util.ecode(password02)));
  						clientUser.setInitialPassword(password02);
  						clientCustomerService.editCilentCustomerById(clientUser);
  						request.setAttribute("clientid", clientUser);
  						result="修改密码成功！";
  					  }
  				  }else{
  					result= "请确认再次新密码！";
  				  }
  			  }
  		  }else{
  			result= "原始密码输入错误！请重新输入...";
  		  }
  		  
  	  }else{
  		result= "请先输入原始密码";
  	  }
		Map<String,String> map=new HashMap<String,String>();
		map.put("result", result);
		return map;
	}
	
	
	
	/**
	 * 跳转需求填写信息页面
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("publishNeed")
	public String publishNeed(Model model,HttpServletRequest request,String domain,String procedure,String cycle,String language,String level){
		//发布类似需求----首页展示项目详情---右边按钮
		
		//首页面的在线询价，快速发布
		if(domain!=null && domain!=""){
			int domainId = fieldService.getDomainId(domain);
			int procedureId;
			if(cycle!=null && cycle!=""){
				procedureId = procedureService.getProcedureId(procedure);
			}else{
				procedureId=Integer.parseInt(procedure);
			}
			
			ClientCustomerNeed clientCustomerNeed =new ClientCustomerNeed();
			/*clientCustomerNeed.setCycle(cycle);*/
			clientCustomerNeed.setDomainId(domainId);
			clientCustomerNeed.setLanguagePair(language);
			clientCustomerNeed.setProcedureTypeId(procedureId);
			clientCustomerNeed.setTransLevel(Integer.parseInt(level));
			model.addAttribute("clientCustomerNeed", clientCustomerNeed);
			
			request.setAttribute("domain", domain);
			request.setAttribute("procedure", procedure);
			request.setAttribute("languagePair", language);
		}
		
		ClientUserD clientUser= new ClientUserD();
		clientUser=(ClientUserD) request.getSession().getAttribute("clientid");
		if(clientUser==null){
			request.setAttribute("message", "notClient");
			return "forward:/index.jsp";
		}else{
			
			//翻译流程list processList
			List<ProcedureType> procedureList=new ArrayList<ProcedureType>();
			procedureList=procedureService.queryByAll();
			
			String type=request.getParameter("type");
			if("selected".equals(type)){
				ClientCustomerNeed clientCustomerNeed = new ClientCustomerNeed();
				clientCustomerNeed.setId(Integer.parseInt(request.getParameter("needId")));
				clientCustomerNeed=clientCustomerService.queryByWhere(clientCustomerNeed);
				int transId=Integer.parseInt(request.getParameter("transId"));
				String modelselect=request.getParameter("model");
				Translator trans=translatorService.queryTransById(transId);
				//String transDomain=trans.getDomain();
				Field filed=fieldService.queryById(clientCustomerNeed.getDomainId());
				model.addAttribute("transId", transId);
				model.addAttribute("modelselect", modelselect);
				model.addAttribute("clientCustomerNeed", clientCustomerNeed);
				model.addAttribute("filed", filed);
			}else{
				//需求领域list domainList
				List<Field> doaminList=new ArrayList<Field>();
				doaminList=fieldService.queryByAll();
				model.addAttribute("doaminList", doaminList);
			}
			
			model.addAttribute("procedureList", procedureList);
			return "forward:/publishNeed/publish.need.jsp";
		}
		
	}  
   
	/**
	 * 验证标题唯一
	 * @param title
	 * @return
	 */
	@ResponseBody
	@RequestMapping("onlyTitle")
	public Map onlyTitle(String title){
		Map<String,String> map=new HashMap<String, String>();
		//设置查询条件
		String parameter="";
		String result="success";
		if(title!=null && title!=""){
			parameter=" and clientCustomerNeedD.title='"+title+"'";
		}
		
		List<ClientCustomerNeed> list=clientCustomerService.queryOnly(parameter);
		if(list.size()!=0){
			result="error";
		}
		
		map.put("result", result);
		return map;
	}
	
	
	/**
	 * 需求时间对比
	 * @param completeTime 交稿日期
	 * @param trueTime 有效时间
	 * @return model
	 */
	@ResponseBody
	@RequestMapping("exteTime")
	public Map<String,String> exteTime(String completeTime,String trueTime){ 
		
		Map<String,String> map=new HashMap<String, String>();
		String result="success";
		try{
			SimpleDateFormat  sdf1=new  SimpleDateFormat("yyyy-MM-dd"); //交稿时间格式  
			SimpleDateFormat  sdf2=new  SimpleDateFormat("yyyy-MM-dd hh:mm:ss");   //有效时间格式
			
			Date date1=null;//交稿时间
			Date date2=null;//有效时间
			if(completeTime!=null && completeTime!=""){
				date1 = sdf1.parse(completeTime);
				if(date1.before(new Date())){
					result="交稿日期必须晚于今天（提示，今天是"+sdf1.format(new Date())+"）";
				}
			}
			if(trueTime!=null && trueTime!=""){
				date2 = sdf2.parse(trueTime);
				if(date2.before(new Date())){
					result="有效时间必须晚于现在的时间（提示，现在是北京时间："+sdf2.format(new Date())+"）";
				}
				else if(completeTime!=null && completeTime!=""){
					if(date2.after(date1)){
						result="有效时间必须早于交稿日期（提示，交稿日期："+sdf1.format(date1)+"）";
					}
				}
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		map.put("result",result);
		return map;
		
	}
	
	
	/**
	 * 获取符合条件译员总数
	 * @param transLanguage
	 * @param level
	 * @param transDomain
	 * @param procedureType
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getCountTrans")
	public Map<Object,Object> getCountTrans(String transLanguage,String level,String transDomain,String procedureType){
		Map<Object,Object> map=new HashMap<Object, Object>();
		
		//查找领域价格
		Field domain = new Field();
		int fld = Integer.parseInt(transDomain);
		domain=fieldService.queryById(fld);
		
		//流程id
		int procedure=Integer.parseInt(procedureType);
		
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
		/*if(transList.size()==0){
			transList=translatorService.queryByWhere(new Translator());
		}*/
		/*//取出list中重复的译员
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
		map.put("count",transList.size());
			return map;
		}

	
	
	/**
	 * 跳转选定译员发布项目页面（填写需求发布信息页面）
	 * @param id
	 * @return
	 */
	@RequestMapping("transInfo")
	public String transInfo(Model model,HttpServletRequest request,int id){
		Map<Object,Object> map=new HashMap<Object,Object>();
		//译员卡片做准备
		Translator trans=translatorService.queryTransById(id);
		request.setAttribute("tranCard", trans);
		//译员报价
		List<Translator>  quotationList=translatorService.queryByQuotationOnlyLanguage(id);
		map.put("quotationList", quotationList);
		request.setAttribute("quotationList", quotationList);
		map.put("id", id);
		return "forward:/publishNeed/checkPublish.need.jsp";
	}
	
	
	/**
     * 查询译员下报价信息展示到需求页面
     * @return
     */
	@ResponseBody
	@RequestMapping("transQuotationInfo")
	public Map<Object,Object> transQuotationInfo(Model model,HttpServletRequest request){
		    Map<Object,Object> map=new HashMap<Object,Object>();
		    int transtionId=Integer.parseInt(request.getParameter("id"));
		 	String languages=request.getParameter("language");
		 	Quotation quotation=new Quotation();
		 	quotation.setTranstionId(transtionId);
		 	quotation.setLanguages(languages);
		 	List<Field> field=quotationService.queryBylanguagesAndDomain(quotation);
			map.put("quotations", field);
				/*model.addAttribute("quotationList", quotationList);*/
			/*	//译员卡片做准备
				Translator trans=translatorService.queryTransById(id);
				String domainList=trans.getDomain();
				String[] domains=domainList.split(",");
				model.addAttribute("tranCard", trans);
				model.addAttribute("trans", trans);*/
				/*model.addAttribute("trans", trans);*/
				/*Map<Object,Object> map=new HashMap<Object,Object>();
				for (int
				 i = 0; i < domains.length; i++) {
					int domainId=fieldService.getDomainId(domains[i]);
					map.put(domainId, domains[i]);
				}
				model.addAttribute("map", map);*/
				
				//需求领域list domainList
				/*List<Field> doaminList=new ArrayList<Field>();
				doaminList=fieldService.queryByAll();
				model.addAttribute("doaminList", doaminList);
				model.addAttribute("trans", trans);
				model.addAttribute("length", 500);*/
			/*} */
			/*model.addAttribute("procedureList", procedureList);*/
			return map;
		
	}
	 
	/**
	 * 接收需求信息，并跳转查看需求信息页面
	 * @param request
	 * @return
	 */
	@RequestMapping("lookPublish")
	public String lookPublish(HttpServletRequest request,Model model,@RequestParam("filename")CommonsMultipartFile files[]){
		
		try {
			request.setCharacterEncoding("UTF-8");
			
			//翻译字数
			int length1 =Integer.parseInt(request.getParameter("length"));//前台数据
			int length=0;
			if(length1<500){
				length=500;
			}else{
				length=length1;
			}
			//语言；
			String languagePair=request.getParameter("languagePair");
			
			//领域
			Field field = new Field();
			int fieldId = Integer.parseInt(request.getParameter("domain"));
			field=fieldService.queryById(fieldId);
			
			
			//译员等级
			int level = Integer.parseInt(request.getParameter("level"));
			
			//周期
			String cycle1=request.getParameter("cycle");//前台接收
			String cycle="";
			double addTime=1;
			if("特急+".equals(cycle1)){
				//addTime=Double.parseDouble(request.getParameter("addTime"));
				//addTime=addTime*1.1;
				cycle="特急";
			}else{
				cycle=cycle1;
			}
			
			//流程id
			int procedure=Integer.parseInt(request.getParameter("procedureType"));
			//流程名称
			String procedureName="";
			if(procedure==1){
				procedureName="只翻译";
			}
			if(procedure==2){
				procedureName="翻译和校对";
			}
			if(procedure==3){
				procedureName="翻译校对和审核";
			}
			
			
			//项目类型
			int projectTypeId=Integer.parseInt(request.getParameter("projectTypeId"));
			String projectType="";
			if(projectTypeId==1){projectType="OA翻译";}
			if(projectTypeId==2){projectType="部分全文翻译";}
			if(projectTypeId==3){projectType="摘要翻译";}
			if(projectTypeId==4){projectType="其他";}
			if(projectTypeId==5){projectType="全文翻译";}
			
			//用户Id
			ClientUserD clientUser= (ClientUserD) request.getSession().getAttribute("clientid");
		       
		    // 图片上传的绝对路径  
		    String url = "\\upload\\customer\\"+clientUser.getId()+"\\projects\\"+request.getParameter("title")+new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()); 
		   
		    
			ClientCustomerNeed clientCustomerNeed = new ClientCustomerNeed();
			clientCustomerNeed.setLanguagePair(languagePair);
			clientCustomerNeed.setCycle(cycle);
			clientCustomerNeed.setDescription(request.getParameter("description"));
			clientCustomerNeed.setDomainId(fieldId);
			clientCustomerNeed.setLength(length1);
			clientCustomerNeed.setProcedureTypeId(procedure);
			clientCustomerNeed.setClientUserId(clientUser.getId());
			clientCustomerNeed.setFileURL(url);
			clientCustomerNeed.setCompleteTime(request.getParameter("completeTime"));
			clientCustomerNeed.setTel(clientUser.getTel());
			clientCustomerNeed.setTitle(request.getParameter("title"));
			clientCustomerNeed.setTransLevel(level);
			/*clientCustomerNeed.setEXPIRYDATE(request.getParameter("trueTime"));*/
			clientCustomerNeed.setMoneyKilo(Double.parseDouble(request.getParameter("moneyKilo")));//单价
			clientCustomerNeed.setClientProjectTypeId(projectTypeId);
			
			if(clientUser.getUserType()==2){//说明客户是内部客户
				clientCustomerNeed.setTransSingle(Double.parseDouble(request.getParameter("transSingle")));
				clientCustomerNeed.setTransTotal(Double.parseDouble(request.getParameter("transTotal")));
			}
			
			//模式
		    String button=request.getParameter("selected");
			List<Translator> listTranslator=new ArrayList<Translator>();
			if("选定译员模式".equals(button)){
				clientCustomerNeed.setPublishModel("选定译员模式");
				//接收译员信息
				String transIds[]=request.getParameterValues("checkTrans");
				//System.out.println(transIds.length);
				if(transIds!=null){
					for(String transId:transIds){
						int tId=Integer.parseInt(transId);
						Translator translator = new Translator();
						translator.setTranstionId(tId);
						translator.setLanguages(clientCustomerNeed.getLanguagePair());
						translator.setDomain(field.getField());
						translator=translatorService.findtransQuestion(translator);
						listTranslator.add(translator);
					}
					
					model.addAttribute("listTranslator", listTranslator);
					model.addAttribute("listLength", listTranslator.size());
				}
				
		    }
			else if("主动投标模式".equals(button) || "特急+".equals(cycle1)){
				clientCustomerNeed.setPublishModel("主动投标模式");
			}
			else{
		    	clientCustomerNeed.setPublishModel("系统分配模式");
		    }
			
			//翻译总价
		    clientCustomerNeed.setTotalMoney(Double.parseDouble(request.getParameter("totalMoney")));
			
			//上传文件
			List<String> fileList=new ArrayList<String>();
			upload(request.getSession().getServletContext().getRealPath("") +url,files);
			if(clientCustomerNeed.getFileURL()!=null && clientCustomerNeed.getFileURL()!=""){
				File file = new File(request.getSession().getServletContext().getRealPath("")+url);
				File files2[]=file.listFiles();
				if(files2!=null){
					for(int i=0;i<files2.length;i++){
						fileList.add(files2[i].getName());
					}
				}
			}
			
			
			model.addAttribute("transKile",request.getParameter("moneyKilo"));
			model.addAttribute("fileNames", fileList);
			model.addAttribute("publish", clientCustomerNeed);
			model.addAttribute("field", field);
			model.addAttribute("procedureName", procedureName);
			model.addAttribute("projectTypeId", projectType);
			
			
			/*//余额
			double userBanlance=((ClientUserD)request.getSession().getAttribute("clientid")).getBalance();//数据存储余额显示值
			//签收订单总金额 sumPayNumber
			Order order = new Order();
			order.setClientUserId(((ClientUserD)request.getSession().getAttribute("clientid")).getId());
			order.setTaskStateId(6);
			String payMoneyString=orderService.sumPayNumber(order);
			if(payMoneyString!=null && payMoneyString!=""){
				double sumPayNumber=Double.valueOf(payMoneyString).doubleValue(); //为签收订单总的支付金额
				userBanlance=userBanlance-sumPayNumber;//在客户签收所有订单之后，用户钱包所剩余额
				
			}
			model.addAttribute("userBanlance",userBanlance);*/
			return "forward:/publishNeed/lookPublish.need.jsp";
			
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return "forward:/publishNeed/publish.need.error.jsp";
		}
	}
	
	
	@ResponseBody
	@RequestMapping("getUserBlance")
	public Map<Object,Object> getUserBlance(HttpServletRequest request){
		//余额
		ClientUserD clirntUserD=new ClientUserD();
		clirntUserD=clientUserService.findCustomerById(((ClientUserD)request.getSession().getAttribute("clientid")).getId());
		double userBanlance=clirntUserD.getBalance();//数据存储余额显示值
		//签收订单总金额 sumPayNumber
		Order order = new Order();
		order.setClientUserId(((ClientUserD)request.getSession().getAttribute("clientid")).getId());
		order.setTaskStateId(6);
		String payMoneyString=orderService.sumPayNumber(order);
		
		
		//发布中状态需求总价
		ClientCustomerNeed clientCustomerNeed=new ClientCustomerNeed();
		clientCustomerNeed.setClientUserId(clirntUserD.getId());
		String payMoneyPublish=clientCustomerService.getPublishPayNum(clientCustomerNeed);
		
		
		if(payMoneyString!=null && payMoneyString!=""){
			double sumPayNumber=Double.valueOf(payMoneyString).doubleValue(); //为签收订单总的支付金额
			userBanlance=userBanlance-sumPayNumber;//在客户签收所有订单之后，用户钱包所剩余额
		}
		
		if(payMoneyPublish!=null && payMoneyPublish!=""){
			double sumPayNumber=Double.valueOf(payMoneyPublish).doubleValue(); //为“发布中”状态的总金额
			userBanlance=userBanlance-sumPayNumber;//在客户签收所有订单之后，用户钱包所剩余额
		}
		Map<Object,Object> map=new HashMap<Object,Object>();
		map.put("userBanlance", userBanlance);
		return map;
	}
	
	
	
	
	/**
	 * 新项目发布或保存
	 */
	@RequestMapping("newPublishNeed")
	public String newPublishNeed(HttpServletRequest request){
		
		try{
			/*接收项目信息*/
			String button=request.getParameter("publishModel");//项目发布模式
			ClientUserD clientUser= (ClientUserD) request.getSession().getAttribute("clientid");
			ClientCustomerNeed clientCustomerNeed = new ClientCustomerNeed();
			clientCustomerNeed.setLanguagePair(request.getParameter("languagePair"));
			clientCustomerNeed.setCycle(request.getParameter("cycle"));
			clientCustomerNeed.setDescription(request.getParameter("description"));
			clientCustomerNeed.setDomainId(Integer.parseInt(request.getParameter("domainId")));
			clientCustomerNeed.setLength(Integer.parseInt(request.getParameter("length")));
			clientCustomerNeed.setProcedureTypeId(Integer.parseInt(request.getParameter("procedureTypeId")));
			clientCustomerNeed.setClientUserId(clientUser.getId());
			clientCustomerNeed.setFileURL(request.getParameter("fileURL"));
			clientCustomerNeed.setPublishModel(button);
			clientCustomerNeed.setTel(clientUser.getTel());
			clientCustomerNeed.setTitle(request.getParameter("title"));
			clientCustomerNeed.setCompleteTime(request.getParameter("completeTime"));
			clientCustomerNeed.setTransLevel(Integer.parseInt(request.getParameter("transLevel")));
			clientCustomerNeed.setTotalMoney(Double.parseDouble(request.getParameter("totalMoney")));
			/*clientCustomerNeed.setEXPIRYDATE(request.getParameter("EXPIRYDATE"));*/
			clientCustomerNeed.setMoneyKilo(Double.parseDouble(request.getParameter("moneyKilo")));
			//clientCustomerNeed.setNeedReference(request.getParameter("needReference"));//需求号
			clientCustomerNeed.setClientProjectTypeId(Integer.parseInt(request.getParameter("projectTypeId")));
			
			if(clientUser.getUserType()==2){//说明客户是内部客户
				clientCustomerNeed.setTransSingle(Double.parseDouble(request.getParameter("transSingle")));
				clientCustomerNeed.setTransTotal(Double.parseDouble(request.getParameter("transTotal")));
			}
			
//			需求号
			if(request.getParameter("needReference")==null || request.getParameter("needReference")==""){
				//查找客户需求总记录数
				Page page=new Page();
				page.setMsgType(clientUser.getId()+"");
				String countNeed=clientCustomerService.getNeedReference(clientCustomerNeed);//计算客户共有多少个项目，若为空，说明客户还没有项目
				if(countNeed==null){
					clientCustomerNeed.setNeedReference("ONLINE"+clientUser.getUserName()+"1");//需求号
				}else{
					int sum=Integer.parseInt(countNeed);
					sum=sum+1;
					clientCustomerNeed.setNeedReference("ONLINE"+clientUser.getUserName()+sum);//需求号
				}
				
			}else{
				clientCustomerNeed.setNeedReference(request.getParameter("needReference"));
			}
			
			/*接收判断项目是否发布的信息*/
			String type=request.getParameter("type");//是否发布参数，发布=publish，保存=save
			//新项目发布
			if("publish".equals(type)){
				/*获取项目发布时间*/
				//发布时间
				SimpleDateFormat  sdf=new  SimpleDateFormat("yyyy-MM-dd hh:mm:ss");    
				java.util.Date  date=new  java.util.Date();    
		 		String  publishTime=sdf.format(date);  
		 		
		 		
				clientCustomerNeed.setPublishTime(publishTime);
				clientCustomerNeed.setAcceptState("发布中");
				
				request.setAttribute("type", "publish");//成功页面显示信息
			}
			//新项目保存
			if("save".equals(type)){
				clientCustomerNeed.setAcceptState("未发布");	
				
				request.setAttribute("type", "save");//成功页面显示信息
				
			}
			clientCustomerService.addCustomerNeed(clientCustomerNeed);
			
			
			//获取该项目Id--->needid
			ClientCustomerNeed  clientCustomerNeedFianl=clientCustomerService.queryByWhere(clientCustomerNeed);
			int needid=clientCustomerNeedFianl.getId();
			/*判断发布模式，选择是否添加译员信息*/
			if("选定译员模式".equals(button)){
				//添加译员信息
				if(clientCustomerNeed!=null){//项目不为空，说明项目添加成功
					String transIds[]=request.getParameterValues("trans");//接收译员信息
					
					if(transIds!=null){//选定的译员
						for(String transId:transIds){
							int tid=Integer.parseInt(transId);//译员Id--->tid
							ClientCustomerNeedTrans clientCustomerNeedTrans=new ClientCustomerNeedTrans(needid,tid);
							
							List<ClientCustomerNeedTrans> list1=clientCustomerTransService.queryById(clientCustomerNeedTrans);
							if(list1.size()==0){
								clientCustomerTransService.addtransCustomer(clientCustomerNeedTrans);//译员，需求中间表添加信息
								if("publish".equals(type)){//如果现在发布需要通知译员
								//找到译员，并通过短信方式提醒译员
									Translator sendMessageTranslator=translatorService.queryTransById(tid);
									sendMessageAction_sendPhone(sendMessageTranslator.getTel(),request,request.getParameter("title"),sendMessageTranslator.getAccountName(),needid,sendMessageTranslator.getId(),"");
								}
							}
						}
					}
				}
			}else if("系统分配模式".equals(button) && "publish".equals(type)){
				//添加译员，项目中间表信息
				List<Translator> listTranslator=new ArrayList<Translator>();
				Translator translator = new Translator();
				//设置项目条件
				
		    	translator.setLanguages(request.getParameter("languagePair"));
		    	translator.setLevel(Integer.parseInt(request.getParameter("transLevel")));
		    	
		    	/*设置领域*/
		    	String domainId=request.getParameter("domainId");//领域ID
		    	if(domainId!=null && domainId!=""){
		    		int did=Integer.parseInt(domainId);
		    		Field field=fieldService.queryById(did);//查询领域名称
		    		translator.setDomain(field.getField());
		    	}
		    	
		    	translator.setState("空闲");
		    	translator.setAnswer("point");//排序字段
		    	translator.setMsg(request.getParameter("procedureTypeId"));
		    	//设置条件结束
		    	listTranslator=translatorService.queryByWhere(translator);//查找符合条件的译员
		    	if(listTranslator.size()==0){
		    		translator.setState("");
		    		listTranslator=translatorService.queryByWhere(translator);
		    		if(listTranslator.size()==0){
		    			listTranslator=translatorService.queryByWhere(new Translator());
		    		}
		    	}
		    	if(listTranslator.size()!=0){
	    			int num=0;
	    			if(listTranslator.size()>100){
	    				num=100;
	    			}else{
	    				num=listTranslator.size();
	    			}
	    			
	    			//循环通知100名译员
		    		for(int i=0;i<num;i++){
		    			ClientCustomerNeedTrans clientCustomerNeedTrans=new ClientCustomerNeedTrans();
						int trid=listTranslator.get(i).getId();
						clientCustomerNeedTrans.setClientCustomerNeedId(needid);
						clientCustomerNeedTrans.setTranslatorId(trid);
						List<ClientCustomerNeedTrans> list1=clientCustomerTransService.queryById(clientCustomerNeedTrans);//判断是否有重复数据
						if(list1.size()==0){
							clientCustomerTransService.addtransCustomer(clientCustomerNeedTrans);
							//短信通知译员有任务
							sendMessageAction_sendPhone(listTranslator.get(i).getTel(),request,request.getParameter("title"),listTranslator.get(i).getAccountName(),needid,listTranslator.get(i).getId(),"");
						}
						
						
							
						}
		    		timerTask(clientCustomerNeedFianl,request);//顶用定时段方法
					}
			}
			
			//跟踪项目过期
			//定时开始
			 SimpleDateFormat  sdf1=new  SimpleDateFormat("yyyy-MM-dd hh:mm:ss");//小写的mm表示的是分钟
		     /*String dstr=request.getParameter("EXPIRYDATE"); //项目过期时间*/
		     String dstr=request.getParameter("completeTime");
		     dstr+=" 23:59:50";
			 Date date1;
			 date1 = sdf1.parse(dstr);
			 MyTimer(date1,clientCustomerNeed);
			//定时任务结束
			 
			//存储传入项
			ClientCustomerNeed cllientCustomer1=clientCustomerService.queryByWhere(clientCustomerNeed);
			request.setAttribute("id",cllientCustomer1.getId());//成功页面查看项目Id
			request.setAttribute("lookType", "customerCenter");//成功页面查看项目跳转路劲
			request.setAttribute("needReference",cllientCustomer1.getNeedReference());
			
			//成功页面查看项目跳转路劲
			return "forward:/publishNeed/publish.need.success.jsp";
		}catch(Exception e){
			return "forward:/publishNeed/publish.need.error.jsp";
		}
	}
	
	
	/**
	 * 修改需求发布或保存
	 * @param request
	 * @throws ParseException 
	 * @throws IOException 
	 * @throws HttpException 
	 */
	@RequestMapping("updatePublishNeed")
	public String updatePublishNeed(HttpServletRequest request){
		try{
			
			/*接收项目信息*/
			String button=request.getParameter("publishModel");//项目原始发布模式
			ClientUserD clientUser= (ClientUserD) request.getSession().getAttribute("clientid");
			ClientCustomerNeed clientCustomerNeed = new ClientCustomerNeed();
			clientCustomerNeed.setLanguagePair(request.getParameter("languagePair"));
			clientCustomerNeed.setCycle(request.getParameter("cycle"));
			clientCustomerNeed.setDescription(request.getParameter("description"));
			clientCustomerNeed.setDomainId(Integer.parseInt(request.getParameter("domainId")));
			clientCustomerNeed.setLength(Integer.parseInt(request.getParameter("length")));
			clientCustomerNeed.setProcedureTypeId(Integer.parseInt(request.getParameter("procedureTypeId")));
			clientCustomerNeed.setClientUserId(clientUser.getId());
			clientCustomerNeed.setFileURL(request.getParameter("fileURL"));
			clientCustomerNeed.setPublishModel(request.getParameter("publishModel"));
			clientCustomerNeed.setTel(clientUser.getTel());
			clientCustomerNeed.setTitle(request.getParameter("title"));
			clientCustomerNeed.setCompleteTime(request.getParameter("completeTime"));
			clientCustomerNeed.setTransLevel(Integer.parseInt(request.getParameter("transLevel")));
			clientCustomerNeed.setTotalMoney(Double.parseDouble(request.getParameter("totalMoney")));
			/*clientCustomerNeed.setEXPIRYDATE(request.getParameter("EXPIRYDATE"));*/
			clientCustomerNeed.setMoneyKilo(Double.parseDouble(request.getParameter("moneyKilo")));
			//clientCustomerNeed.setNeedReference(request.getParameter("needReference"));//需求号
			clientCustomerNeed.setClientProjectTypeId(Integer.parseInt(request.getParameter("projectTypeId")));
			
			if(clientUser.getUserType()==2){//说明客户是内部客户
				clientCustomerNeed.setTransSingle(Double.parseDouble(request.getParameter("transSingle")));
				clientCustomerNeed.setTransTotal(Double.parseDouble(request.getParameter("transTotal")));
			}
			
			String oldState=request.getParameter("acceptState");
			if("失效".equals(oldState)){
				Page page=new Page();
				page.setMsgType(clientUser.getId()+"");
				String countNeed=clientCustomerService.getNeedReference(clientCustomerNeed);//计算客户共有多少个项目，若为空，说明客户还没有项目
				if(countNeed==null){
					clientCustomerNeed.setNeedReference("ONLINE"+clientUser.getUserName()+"1");//需求号
				}else{
					int sum=Integer.parseInt(countNeed);
					sum=sum+1;
					clientCustomerNeed.setNeedReference("ONLINE"+clientUser.getUserName()+sum);//需求号
				}
			}else if("未发布".equals(oldState)){
				/*clientCustomerNeed.setNeedReference(request.getParameter(""));*/
			}
			
			
			
			String needId=request.getParameter("clientNeedId");//获取需求ID
			String type=request.getParameter("type");//是否发布参数，发布=publish，保存=save
			
			//需求现在发布开始
			int id=Integer.parseInt(needId);
			clientCustomerNeed.setId(id);	
			
			if("publish".equals(type)){
				
				/*获取项目发布时间*/
				//发布时间
				SimpleDateFormat  sdf=new  SimpleDateFormat("yyyy-MM-dd hh:mm:ss");    
				java.util.Date  date=new  java.util.Date();    
		 		String  publishTime=sdf.format(date);
	 			clientCustomerNeed.setPublishTime(publishTime);
				clientCustomerNeed.setAcceptState("发布中");
				request.setAttribute("type", "publish");//成功页面显示信息
					
				
			}
			//需求现在发布结束
			
			
			//需求保存开始
			else if("save".equals(type)){
				clientCustomerNeed.setAcceptState("未发布");
				request.setAttribute("type", "save");//成功页面显示信息
			}
			//需求保存结束
			
			//需求信息设置结束
			
			if("失效".equals(oldState)){
				//新添加，需求如果为失效状态，修改时为添加新需求
				clientCustomerService.addCustomerNeed(clientCustomerNeed);
				//删除id=id的就项目
				clientCustomerNeed.setAcceptState("已删除");
				clientCustomerService.updateAcceptState(clientCustomerNeed);
			}else if("未发布".equals(oldState)){
				//需求为未发布状态，修改时为修改需求
				clientCustomerService.updateNeed(clientCustomerNeed);
			}
			
			
			//获取该项目Id--->needid
			clientCustomerNeed.setId(0);
			ClientCustomerNeed  clientCustomerNeedFianl=clientCustomerService.queryByWhere(clientCustomerNeed);
			int needid=clientCustomerNeedFianl.getId();
			/*判断发布模式，选择是否添加译员信息，修改项目需要先清除原始中间表信息,只删除未发布状态的*/
			/*if("未发布".equals(oldState)){
				clientCustomerTransService.deleteByNeedId(needid);
			}*/
			
			
			if("选定译员模式".equals(button)){
				//添加译员信息
				if(clientCustomerNeed!=null){//项目不为空，说明项目添加成功
					String transIds[]=request.getParameterValues("trans");//接收译员信息
					
					if(transIds!=null){//选定的译员
						for(String transId:transIds){
							int tid=Integer.parseInt(transId);//译员Id--->tid
							ClientCustomerNeedTrans clientCustomerNeedTrans=new ClientCustomerNeedTrans(needid,tid);
							
							List<ClientCustomerNeedTrans> list1=clientCustomerTransService.queryById(clientCustomerNeedTrans);//判断是否有重复数据
							if(list1.size()==0){
								clientCustomerTransService.addtransCustomer(clientCustomerNeedTrans);
								if("publish".equals(type)){//如果现在发布需要通知译员
									//找到译员，并通过短信方式提醒译员
										Translator sendMessageTranslator=translatorService.queryTransById(tid);
										sendMessageAction_sendPhone(sendMessageTranslator.getTel(),request,request.getParameter("title"),sendMessageTranslator.getAccountName(),needid,sendMessageTranslator.getId(),"");
									}
							}
						}
					}
				}
			}else if("系统分配模式".equals(button) && "publish".equals(type)){
				//添加译员，项目中间表信息
				List<Translator> listTranslator=new ArrayList<Translator>();
				Translator translator = new Translator();
				//设置项目条件
		    	translator.setLanguages(request.getParameter("languagePair"));
		    	translator.setLevel(Integer.parseInt(request.getParameter("transLevel")));
		    	
		    	/*设置领域*/
		    	String domainId=request.getParameter("domainId");//领域ID
		    	if(domainId!=null && domainId!=""){
		    		int did=Integer.parseInt(domainId);
		    		Field field=fieldService.queryById(did);//查询领域名称
		    		translator.setDomain(field.getField());
		    	}
		    	
		    	translator.setState("空闲");
		    	translator.setAnswer("point");//排序字段
		    	translator.setMsg(request.getParameter("procedureTypeId"));
		    	//设置条件结束
		    	listTranslator=translatorService.queryByWhere(translator);//查找符合条件的译员
		    	if(listTranslator.size()==0){
		    		translator.setState("");
		    		listTranslator=translatorService.queryByWhere(translator);
		    		if(listTranslator.size()==0){
		    			listTranslator=translatorService.queryByWhere(new Translator());
		    		}
		    	}
		    	if(listTranslator.size()!=0){
	    			int num=0;
	    			if(listTranslator.size()>100){
	    				num=100;
	    			}else{
	    				num=listTranslator.size();
	    			}
	    			
	    			//循环通知100名译员
		    		for(int i=0;i<num;i++){
		    			ClientCustomerNeedTrans clientCustomerNeedTrans=new ClientCustomerNeedTrans();
						int trid=listTranslator.get(i).getId();
						clientCustomerNeedTrans.setClientCustomerNeedId(needid);
						clientCustomerNeedTrans.setTranslatorId(trid);
						List<ClientCustomerNeedTrans> list1=clientCustomerTransService.queryById(clientCustomerNeedTrans);
							if(list1.size()==0){
								clientCustomerTransService.addtransCustomer(clientCustomerNeedTrans);
								//短信通知译员有任务
								sendMessageAction_sendPhone(listTranslator.get(i).getTel(),request,request.getParameter("title"),listTranslator.get(i).getAccountName(),needid,listTranslator.get(i).getId(),"");
							}
						}
		    		timerTask(clientCustomerNeedFianl,request);//顶用定时段方法
					}
			}
					
					
					
			
			//定时开始
			 SimpleDateFormat  sdf1=new  SimpleDateFormat("yyyy-MM-dd hh:mm:ss");//小写的mm表示的是分钟
			 /*String dstr=request.getParameter("EXPIRYDATE"); //项目过期时间*/
		     String dstr=request.getParameter("completeTime");
		     dstr+=" 23:59:50";
		     Date date1;
			 date1 = sdf1.parse(dstr);
			 MyTimer(date1,clientCustomerNeed);
			
			ClientCustomerNeed cllientCustomer1=clientCustomerService.queryByWhere(clientCustomerNeed);
			request.setAttribute("id",cllientCustomer1.getId());//成功页面查看项目Id
			request.setAttribute("lookType", "customerCenter");//成功页面查看项目跳转路劲
			request.setAttribute("needReference",cllientCustomer1.getNeedReference());
			return "forward:/publishNeed/publish.need.success.jsp";
		}catch(Exception e){
			return "forward:/publishNeed/publish.need.error.jsp";
		}
	}
	
/*	
	*//**
	 * 添加客户需求以及客户选中的译员
	 * @param request
	 * @return
	 * @throws IOException 
	 * @throws HttpException 
	 * @throws ParseException 
	 *//*
	@RequestMapping("addPublish")
	public String addPublish(HttpServletRequest request) throws HttpException, IOException, ParseException{
		try {
			request.setCharacterEncoding("UTF-8");
			String button=request.getParameter("publishModel");
			
			//发布时间
			SimpleDateFormat  sdf=new  SimpleDateFormat("yyyy-MM-dd");    
			java.util.Date  date=new  java.util.Date();    
	 		String  publishTime=sdf.format(date);  
	 		
	 		
			ClientUserD clientUser= (ClientUserD) request.getSession().getAttribute("clientid");
			ClientCustomerNeed clientCustomerNeed = new ClientCustomerNeed();
			clientCustomerNeed.setLanguagePair(request.getParameter("languagePair"));
			clientCustomerNeed.setCycle(request.getParameter("cycle"));
			clientCustomerNeed.setDescription(request.getParameter("description"));
			clientCustomerNeed.setDomainId(Integer.parseInt(request.getParameter("domain")));
			clientCustomerNeed.setLength(Integer.parseInt(request.getParameter("length")));
			clientCustomerNeed.setProcedureTypeId(Integer.parseInt(request.getParameter("procedureType")));
			clientCustomerNeed.setClientUserId(clientUser.getId());
			clientCustomerNeed.setFileURL(request.getParameter("fileURL"));
			clientCustomerNeed.setPublishModel(button);
			clientCustomerNeed.setTel(clientUser.getTel());
			clientCustomerNeed.setTitle(request.getParameter("title"));
			clientCustomerNeed.setCompleteTime(request.getParameter("completeTime"));
			clientCustomerNeed.setTransLevel(Integer.parseInt(request.getParameter("level")));
			clientCustomerNeed.setTotalMoney(Double.parseDouble(request.getParameter("totalMoney")));
			clientCustomerNeed.setEXPIRYDATE(request.getParameter("trueTime"));
			clientCustomerNeed.setNeedReference(request.getParameter("needReference"));//需求号
			
			String type=request.getParameter("type");//是否发布参数，发布=publish，保存=save
			//修改需求时发布
			String needId=request.getParameter("clientNeedId");
			if("publish".equals(type)){
				if(needId!=null&&needId!=""){
					int id=Integer.parseInt(needId);
					clientCustomerNeed.setId(id);	
					clientCustomerNeed.setPublishTime(publishTime);
					clientCustomerNeed.setAcceptState("发布中");
					clientCustomerService.updateNeed(clientCustomerNeed);
				}else{
					//首次发布
					clientCustomerNeed.setPublishTime(publishTime);
					clientCustomerNeed.setAcceptState("发布中");
					clientCustomerService.addCustomerNeed(clientCustomerNeed);
				}
				
				//定时开始
				 SimpleDateFormat  sdf1=new  SimpleDateFormat("yyyy-MM-dd hh:mm:ss");//小写的mm表示的是分钟
			     String dstr=request.getParameter("trueTime"); 
			     Date date1;
				 date1 = sdf1.parse(dstr);
				 MyTimer(date1,clientCustomerNeed);
				
				Translator sendMessageTranslator=new Translator();
				//选定译员模式
				int needid=0;
				if("选定译员模式".equals(button)){
					if(needId!=null&&needId!=""){
						//修改需求，只需通知译员
						//找到译员，并通知译员
						needid=Integer.parseInt(needId);
						List<ClientCustomerNeedTrans>  needTransList= clientCustomerTransService.queryByNeedId(Integer.parseInt(needId));
						for(int i=0;i<needTransList.size();i++){
							sendMessageTranslator=translatorService.queryTransById(needTransList.get(i).getTranslatorId());
							sendMessageAction_sendPhone(sendMessageTranslator.getTel(),request,request.getParameter("title"),sendMessageTranslator.getAccountName(),needid);
						}
						
					}else{
						if(clientCustomerNeed.getId()>=0){
							String transIds[]=request.getParameterValues("trans");
							needid=clientCustomerService.queryByWhere(clientCustomerNeed).getId();
							if(transIds!=null){
								for(String transId:transIds){
									int tid=Integer.parseInt(transId);
									ClientCustomerNeedTrans clientCustomerNeedTrans=new ClientCustomerNeedTrans(needid,tid);
									clientCustomerTransService.addtransCustomer(clientCustomerNeedTrans);
									
									//找到译员，并通过短信方式提醒译员
									sendMessageTranslator=translatorService.queryTransById(tid);
									sendMessageAction_sendPhone(sendMessageTranslator.getTel(),request,request.getParameter("title"),sendMessageTranslator.getAccountName(),needid);
								}
							}
						}
					}
					
					
					//选定译员完毕，
				}
				
				else if("系统分配模式".equals(button)){
					List<Translator> listTranslator=new ArrayList<Translator>();
					Translator translator = new Translator();
			    	translator.setLanguages(request.getParameter("languagePair"));
			    	translator.setLevel(Integer.parseInt(request.getParameter("level")));
			    	translator.setDomain(request.getParameter("domain"));
			    	translator.setState("空闲");
			    	translator.setMsg(request.getParameter("procedureType"));
			    	listTranslator=translatorService.queryByWhere(translator);
			    	if(listTranslator.size()==0){
			    		translator.setState("");
			    		listTranslator=translatorService.queryByWhere(translator);
			    		if(listTranslator.size()==0){
			    			listTranslator=translatorService.queryByWhere(new Translator());
			    		}
			    	}
			    	if(listTranslator.size()!=0){
			    		try {
			    			int num=0;
			    			if(listTranslator.size()>100){
			    				num=100;
			    			}else{
			    				num=listTranslator.size();
			    			}
			    		//listTranslator.size();
			    		for(int i=0;i<num;i++){
			    			ClientCustomerNeedTrans clientCustomerNeedTrans=new ClientCustomerNeedTrans();
							int trid=listTranslator.get(i).getId();
							clientCustomerNeedTrans.setClientCustomerNeedId(clientCustomerService.queryByWhere(clientCustomerNeed).getId());
							clientCustomerNeedTrans.setTranslatorId(trid);
							List<ClientCustomerNeedTrans> cusNeedList=clientCustomerTransService.queryById(clientCustomerNeedTrans);
							for(int j=0;j<=cusNeedList.size();j++){
								if(cusNeedList.size()==0){
									clientCustomerNeedTrans.setClientCustomerNeedId(cusNeedList.get(j).getClientCustomerNeedId());
									clientCustomerNeedTrans.setTranslatorId(trid);
									clientCustomerTransService.addtransCustomer(clientCustomerNeedTrans);
									needid=Integer.parseInt(needId);
									//短信通知译员有任务
									sendMessageAction_sendPhone(listTranslator.get(i).getTel(),request,request.getParameter("title"),listTranslator.get(i).getAccountName(),needid);
										
									}
							    }
							}
			    		
			    		//定时任务开始
			    		timerTask(clientCustomerNeed,request);
						request.setAttribute("id", clientCustomerService.queryByWhere(clientCustomerNeed).getId());
						
						request.setAttribute("lookType", "customerCenter");
			    		return "forward:/publishNeed/publish.need.success.jsp";
			    	}
			    	
				}else{
					//主动投标
				}
				request.setAttribute("type", "save");//成功页面显示信息
			}
		//项目发布完成
			
			
			
		//项目保存开始
			if("save".equals(type)){
				
				clientCustomerNeed.setAcceptState("未发布");	
				clientCustomerService.addCustomerNeed(clientCustomerNeed);
				
				
				
				//定时开始
				 SimpleDateFormat  sdf1=new  SimpleDateFormat("yyyy-MM-dd hh:mm:ss");//小写的mm表示的是分钟
			     String dstr=request.getParameter("trueTime"); 
			     Date date1;
				 date1 = sdf1.parse(dstr);
				 MyTimer(date1,clientCustomerNeed);
			     //定时任务结束
			     
				if("选定译员模式".equals(button)){
					//接收译员信息
					String transIds[]=request.getParameterValues("checkTrans");
					//System.out.println(transIds.length);
					if(transIds!=null){
						for(String transId:transIds){
							int tId=Integer.parseInt(transId);
							//Translator translator=translatorService.queryTransById(tId);
							ClientCustomerNeedTrans clientCustomerNeedTrans=new ClientCustomerNeedTrans(clientCustomerService.queryByWhere(clientCustomerNeed).getId(),tId);
							clientCustomerTransService.addtransCustomer(clientCustomerNeedTrans);
						}
					}					
			    }
				

				
				
				
				
				
				
				
				
				
				request.setAttribute("type", "");//成功页面显示信息
			}
		//项目保存结束
			request.setAttribute("id", clientCustomerService.queryByWhere(clientCustomerNeed).getId());//成功页面查看项目Id
			request.setAttribute("lookType", "customerCenter");//成功页面查看项目跳转路劲
			return "forward:/publishNeed/publish.need.success.jsp";
				
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return "forward:/publishNeed/publish.need.error.jsp";
		}
		
			
	}
	*/
	
	/*
	 * 跳转需求展示页面
	 */
	@RequestMapping("findNeedListUI")
	public String findNeedListUI(HttpServletRequest request,String msg,String languagePair,String domain,String length,String mm,String lev,String cycle,String procedure){
		List<Field> doaminList=new ArrayList<Field>();
		Page page = new Page();
		//length 格式   a--b
		String slength="";
		String blength="";
		if(length!=null && length!=""){
			slength=length.substring(0, length.lastIndexOf("-"));
			blength=length.substring(length.lastIndexOf("-")+1);
		}
		if(null==lev || "".equals(lev)){
			lev="1000";
		}
		if(null==procedure || "".equals(procedure)){
			procedure="1000";
		}
		
		page.setMsg(msg);
		page.setNamemsg(slength);
		page.setSecondmsg(blength);
		page.setPhonemsg(domain);
		page.setMsgType(languagePair);
		page.setThirdmsg(cycle);
		page.setMsgId(Integer.parseInt(lev));
		page.setDateType(Integer.parseInt(procedure));
		
		Page page2=new Page(clientCustomerService.countCusNeesByPage(page),"1",10);
		doaminList=fieldService.queryByAll();
		request.setAttribute("page", page2);
		request.setAttribute("doaminList", doaminList);
		
		
		
		//查找特急需求，按有效期排序
		ClientCustomerNeed clientCustomerNeed=new ClientCustomerNeed();
		clientCustomerNeed.setId(5);
		clientCustomerNeed.setTitle("completeTime");
		clientCustomerNeed.setPublishModel("主动投标模式");
		clientCustomerNeed.setCycle("特急");
		List<ClientCustomerNeed> list=clientCustomerService.findNeedOrderBY(clientCustomerNeed);
		
		request.setAttribute("needList", list);
		return "forward:/publishNeed/demand.display.jsp";
	}
	
	
	/**
	 * 分页展示需求
	 * @param model
	 * @param request
	 * @param msg
	 * @param languagePair
	 * @param domain
	 * @param length
	 * @param mm
	 * @return
	 */
	@ResponseBody
	@RequestMapping("findNeedList")
	public Map<Object,Object> findNeedList(Model model,HttpServletRequest request,String msg,String languagePair,String domain,String length,String mm,String lev,String cycle,String procedure){
		
		//length 格式   a--b
		String slength="";
		String blength="";
		if(length!=null && length!=""){
			slength=length.substring(0, length.lastIndexOf("-"));
			blength=length.substring(length.lastIndexOf("-")+1);
		}
		
		
		Page page = new Page();
		page.setMsg(msg);
		page.setNamemsg(slength);
		page.setSecondmsg(blength);
		page.setPhonemsg(domain);
		page.setMsgType(languagePair);
		page.setThirdmsg(cycle);
		page.setMsgId(Integer.parseInt(lev));
		page.setDateType(Integer.parseInt(procedure));
		Page page2=new Page(clientCustomerService.countCusNeesByPage(page),mm,10);
		page2.setMsg(msg);
		page2.setNamemsg(slength);
		page2.setSecondmsg(blength);
		page2.setPhonemsg(domain);
		page2.setMsgType(languagePair);
		page.setThirdmsg(cycle);
		page.setMsgId(Integer.parseInt(lev));
		page.setDateType(Integer.parseInt(procedure));
		
		
		List<ClientCustomerNeed> cusNeedList=new ArrayList<ClientCustomerNeed>();
		Map<Object,Object> map=new HashMap<Object,Object>();
		if(page2.getTotalCount()>0){
			cusNeedList=clientCustomerService.findCusNeedByPage(page2);
		}
		map.put("cusNeedList", cusNeedList);
		map.put("page", page2);
		return map;
	}
	
	/**
	 * 查看需求详情
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping("lookPublishNeedById")
	public String lookPublishNeedById(String id,HttpServletRequest request){
		int needId=Integer.parseInt(id);
		ClientCustomerNeed clientCustomerNeed=clientCustomerService.findTransNeedByid(needId);
		Field field=fieldService.queryById(clientCustomerNeed.getDomainId());
		
		//根据发布时间，交稿时间计算翻译时间
		String publishTime=clientCustomerNeed.getPublishTime();
		String completeTime=clientCustomerNeed.getCompleteTime();
		SimpleDateFormat  sdf=new  SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		SimpleDateFormat  sdf1=new  SimpleDateFormat("yyyy-MM-dd");
		if(publishTime!=null && publishTime!="" && completeTime!=null && completeTime!=""){
			try {
				
				int time;
				java.util.Date  publishTimeDate=sdf.parse(publishTime);
				java.util.Date  completeTimeDate=sdf1.parse(completeTime+" 23:59:59");
				
				
				Calendar calpublishTime = Calendar.getInstance();
				calpublishTime.setTime(publishTimeDate);
				  
				Calendar calcompleteTime = Calendar.getInstance();
				calcompleteTime.setTime(completeTimeDate);
				
				int day1= calpublishTime.get(Calendar.DAY_OF_YEAR);
				int day2 = calcompleteTime.get(Calendar.DAY_OF_YEAR);
				
				int year1 = calpublishTime.get(Calendar.YEAR);
				int year2 = calpublishTime.get(Calendar.YEAR);
				 if(year1 != year2) //同一年
				 {
					  int timeDistance = 0 ;
					  for(int i = year1 ; i < year2 ; i ++)
					  {
						  if(i%4==0 && i%100!=0 || i%400==0) //闰年  
						  {
							  timeDistance += 366;
						  }
						  else //不是闰年
						  {
							  timeDistance += 365;
						  }
					  }
					   
					  time=timeDistance + (day2-day1) ;
					 }
					 else //不同年
					 {
						 time=day2-day1;
					 }
				
				
				
				
				//传入参数翻译时间time
				request.setAttribute("time", time);
			} catch (ParseException e) {
				e.printStackTrace();
			} 
			
		}
		
		List<Translator> listTrans=new ArrayList<Translator>();
		Translator translator=new Translator();
		
		List<ClientCustomerNeedTrans> clientTrans=new ArrayList<ClientCustomerNeedTrans>();
		clientTrans=clientCustomerTransService.queryByNeedId(clientCustomerNeed.getId());
		for(ClientCustomerNeedTrans needTrans:clientTrans){
			
			translator.setTranstionId(needTrans.getTranslatorId());
			translator.setLanguages(clientCustomerNeed.getLanguagePair());
			translator.setDomain(field.getField());
			translator=translatorService.findtransQuestion(translator);
			
			//translator=translatorService.queryTransById(needTrans.getTranslatorId());l
			listTrans.add(translator);
		}
		
		
		
		ClientUserD clientUser=clientUserService.findCustomerById(clientCustomerNeed.getClientUserId());
		
		//传入译员实体类
		request.setAttribute("transList", listTrans);
		//传入参数用户实体类clientUser
		request.setAttribute("clientUser", clientUser);
		//传入参数需求实体类clientCustomerNeed
		request.setAttribute("clientCustomerNeed", clientCustomerNeed);
		//传入参数需求的领域名称
		request.setAttribute("field", field.getField());
		if("customerCenter".equals(request.getParameter("lookType"))){
			//存储客户上传文件名字,文件路劲,存储路劲
			Map<String,String> needUserNames=new HashMap<String,String>();
			String needUserUrl=clientCustomerNeed.getFileURL();
			if(needUserUrl!=null && needUserUrl!="" && !"".equals(needUserUrl)){
				File file = new File(request.getSession().getServletContext().getRealPath("")+needUserUrl);
				File files[]=file.listFiles();
				if(files!=null){
					for(int i=0;i<files.length;i++){
						needUserNames.put(files[i].getName(), files[i].getPath());
						//fileTransURLs.add(files[i].getPath());
					}
				}
				
				//客户上传文件
				request.setAttribute("needUserNames", needUserNames);
				//request.setAttribute("fileTransURLs", fileTransURLs);
			}
			
			
			return "forward:/usercenter/user.customer.myneeds.details.jsp";
		}else{
			return "forward:/publishNeed/demand.details.jsp";
		}
		
	}
	
	/**
	 * 跳转我的需求页面
	 * @param request
	 * @return
	 */
	@RequestMapping("myneedsUI")
	public String myneedsUI(HttpServletRequest request){
		ClientUserD clientUser= (ClientUserD) request.getSession().getAttribute("clientid");
		Page page = new Page();
		page.setMsgType(clientUser.getId()+"");
		
		List<Translator> transList=new ArrayList<Translator>();
		transList=translatorService.queryByWhere(new Translator());
		long pageCount=clientCustomerService.countCusNeesByCusId(page);
		
		Page page2=null;
		if(pageCount>0){
			page2=new Page(pageCount,"1",3);
		}else{
			page2=new Page(0,"0",1);
			
		}
		request.setAttribute("page", page2);
		request.setAttribute("transList", transList);
		return "forward:/usercenter/user.customer.myneeds.jsp";
	}
	
	/**
	 * 查找我的需求
	 * @param request
	 * @param mm
	 * @param transName
	 * @param selectModel
	 * @param searchInput
	 * @return
	 */
	@ResponseBody
	@RequestMapping("myneeds")
	public Map<Object,Object> myneeds(HttpServletRequest request,String mm,String stateModdel,String selectModel,String searchInput){
		ClientUserD clientUser= (ClientUserD) request.getSession().getAttribute("clientid");
		Page page = new Page();
		String cusId = String.valueOf(clientUser.getId());
		page.setMsgType(cusId);
		page.setNamemsg(stateModdel);
		page.setSecondmsg(selectModel);
		page.setThirdmsg(searchInput);
		
		
		Map<Object,Object> map=new HashMap<Object,Object>();
		List<ClientCustomerNeed> cusNeedList=new ArrayList<ClientCustomerNeed>();
		long pageCount=clientCustomerService.countCusNeesByCusId(page);
		Page page2=null;
		int mm2=Integer.parseInt(mm);
		if(pageCount>0 && mm2>0){
			page2=new Page(pageCount,mm,3);
			page2.setMsgType(cusId);
			page2.setNamemsg(stateModdel);
			page2.setSecondmsg(selectModel);
			page2.setThirdmsg(searchInput);
			cusNeedList=clientCustomerService.findCusNeedByCusId(page2);
		}else{			
			page2=new Page(0,"0",1);
		}
		
		
		
		map.put("cusNeedList", cusNeedList);
		map.put("page", page2);
		//Page page2=new Page(clientCustomerService.countCusNeesByCusId(page),mm,3);
		
		
		
		//request.setAttribute("page", page2);
		//request.setAttribute("page", page2);
		return map;
	}
	
	/**
	 * 跳转查看译员页面
	 * @param request
	 */
	@RequestMapping("queryCusNeedTrans") 
	public String queryCusNeedTrans(HttpServletRequest request){
		String needId=request.getParameter("needId");  
		ClientCustomerNeedTrans clientCustomerNeedTrans=new ClientCustomerNeedTrans();
		clientCustomerNeedTrans.setClientCustomerNeedId(Integer.parseInt(needId));
		List<ClientCustomerNeedTrans> idList=clientCustomerTransService.queryByNeedId(Integer.parseInt(needId));
		request.setAttribute("needId", needId);
		return "forward:/translator/translatorAction_findTransById.do?transId="+idList.get(0).getTranslatorId();
	}
	
	
	/**
	 * 跳转修改需求页面
	 * @return
	 */
	@RequestMapping("updateUI")
	public ModelAndView updateUI(String id,HttpServletRequest request,ClientCustomerNeed clientCustomerNeed){
		ModelAndView mav = new ModelAndView();
		Map<String,String> fileNameMap=new HashMap<String, String>();//存储文件
		//id!=null --->普通修改
		int needId=0;
		//id==null --->返回修改，从look页面跳回
		
		if(id!=null && id!=""){
			needId=Integer.parseInt(id);
			clientCustomerNeed=clientCustomerService.findTransNeedByid(needId);
			clientCustomerNeed.setEXPIRYDATE("");
			clientCustomerNeed.setCompleteTime("");
			clientCustomerNeed.setCycle("");
			clientCustomerNeed.setTotalMoney(0);
			clientCustomerNeed.setMoneyKilo(0);
			if(clientCustomerNeed.getAcceptState().equals("失效")){
				clientCustomerNeed.setFileURL("");
			}else{
				if(clientCustomerNeed.getFileURL()!=null && clientCustomerNeed.getFileURL()!=""){
					File file = new File(request.getSession().getServletContext().getRealPath("")+clientCustomerNeed.getFileURL());
					File files[]=file.listFiles();
					if(files!=null){
						for(int i=0;i<files.length;i++){
							fileNameMap.put(files[i].getName(), files[i].getPath());
						}
					}
				}
			}
		}
		
		
		List<Field> doaminList=new ArrayList<Field>();
		doaminList=fieldService.queryByAll();
		
		//翻译流程list processList
		List<ProcedureType> procedureList=new ArrayList<ProcedureType>();
		procedureList=procedureService.queryByAll();
		
		/**
		 * 计算单价开始	
		 */
		/*if(id!=null && id!="" ){
			double kiloMoney=0;//存储每千字价格（单价）
			if(clientCustomerNeed.getLength()<=500){
				kiloMoney=clientCustomerNeed.getTotalMoney()*2;
			}else{
				kiloMoney=clientCustomerNeed.getTotalMoney()/clientCustomerNeed.getLength()*1000;
			}
			
			BigDecimal bg = new BigDecimal(kiloMoney).setScale(2, RoundingMode.DOWN);
			//Double kiloMoney1=bg.doubleValue();
			clientCustomerNeed.setMoneyKilo(bg.doubleValue());
		}*/
		
		
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("fileNames", fileNameMap);
		map.put("clientCustomerNeed", clientCustomerNeed);
		map.put("doaminList", doaminList);
		map.put("procedureList", procedureList);
		if(id!=null && id!=""){//id！=null是传值，
			map.put("needId", needId);
		}
		
		
		//如果项目为选定译员模式，需要找出对应的译员
		/**
		 * id!=null --->普通修改,通过项目Id，从数据库中找到对应译员，并计算单价
		 * 				计算单价时：不满500字，总价*2=单价
		 * 							满500字，总价/总字数*1000			
		 * 
		 * 
		 * id==null --->返回修改,接收jsp传来的译员数组，并查找各译员相关数据
		 * 				计算单价，从jsp获取
		 */
		
		String strings = "";
		if(id == null || "".equals(id)){
			String[] transIds=request.getParameterValues("trans");
			if(transIds!=null){
				for (int i = 0; i < transIds.length; i++) {
					if(i==0){
						strings = strings + transIds[i];
					}else{
						strings = strings + "," + transIds[i];
					}
				}
			}
		}
		
		mav.addObject("trans",strings);
		
		mav.addAllObjects(map);
		
		mav.setViewName("/publishNeed/updatePublish.need.jsp");
		
		return mav;
	}
	
	
	
	/**
	 * 获取修改需求信息，并跳转lookPublish页面
	 * @param request
	 * @return
	 */
	@RequestMapping("updatePublish")
	public String updatePublish(HttpServletRequest request,Model model,@RequestParam("filename")CommonsMultipartFile files[]){
		try{
			//翻译字数
			int length1 =Integer.parseInt(request.getParameter("length"));//前台数据
			int length=0;
			if(length1<500){
				length=500;
			}else{
				length=length1;
			}
			//语言；
			String languagePair=request.getParameter("languagePair");
			
			//领域
			Field field = new Field();
			int fieldId = Integer.parseInt(request.getParameter("domain"));
			field=fieldService.queryById(fieldId);
			
			
			//译员等级
			int level = Integer.parseInt(request.getParameter("level"));
			
			//周期
			String cycle1=request.getParameter("cycle");//前台接收
			String cycle="";
			double addTime=1;
			if("特急+".equals(cycle1)){
				//addTime=Double.parseDouble(request.getParameter("addTime"));
				//addTime=addTime*1.1;
				cycle="特急";
			}else{
				cycle=cycle1;
			}
			
			//流程id
			int procedure=Integer.parseInt(request.getParameter("procedureType"));
			//流程名称
			String procedureName="";
			if(procedure==1){
				procedureName="只翻译";
			}
			if(procedure==2){
				procedureName="翻译和校对";
			}
			if(procedure==3){
				procedureName="翻译校对和审核";
			}
			
			//项目类型
			int projectTypeId=Integer.parseInt(request.getParameter("projectTypeId"));
			String projectType="";
			if(projectTypeId==1){projectType="OA翻译";}
			if(projectTypeId==2){projectType="部分全文翻译";}
			if(projectTypeId==3){projectType="摘要翻译";}
			if(projectTypeId==4){projectType="其他";}
			if(projectTypeId==5){projectType="全文翻译";}
			
			
			//用户Id
			ClientUserD clientUser= (ClientUserD) request.getSession().getAttribute("clientid");
		       
		    // 图片上传的绝对路径
			String url ="";
			if(request.getParameter("fileURL")!=null && request.getParameter("fileURL")!=""){
				url=request.getParameter("fileURL");
			}else{
				url="\\upload\\customer\\"+clientUser.getId()+"\\projects\\"+request.getParameter("title")+new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()); 
			}
		    
		   
			ClientCustomerNeed clientCustomerNeed = new ClientCustomerNeed();
			clientCustomerNeed.setLanguagePair(languagePair);
			clientCustomerNeed.setCycle(cycle);
			clientCustomerNeed.setDescription(request.getParameter("description"));
			clientCustomerNeed.setDomainId(fieldId);
			clientCustomerNeed.setLength(length1);
			clientCustomerNeed.setProcedureTypeId(procedure);
			clientCustomerNeed.setClientUserId(clientUser.getId());
			clientCustomerNeed.setFileURL(url);
			clientCustomerNeed.setCompleteTime(request.getParameter("completeTime"));
			clientCustomerNeed.setTel(clientUser.getTel());
			clientCustomerNeed.setTitle(request.getParameter("title"));
			clientCustomerNeed.setTransLevel(level);
			/*clientCustomerNeed.setEXPIRYDATE(request.getParameter("trueTime"));*/
			clientCustomerNeed.setMoneyKilo(Double.parseDouble(request.getParameter("moneyKilo")));
			clientCustomerNeed.setClientProjectTypeId(projectTypeId);
			
			if(clientUser.getUserType()==2){//说明客户是内部客户
				clientCustomerNeed.setTransSingle(Double.parseDouble(request.getParameter("transSingle")));
				clientCustomerNeed.setTransTotal(Double.parseDouble(request.getParameter("transTotal")));
			}
			//案号，如果是失效需求，案号需要重新计算，未发布的可以直接引用
			//接收变量acceptState，辨别是失效还是未发布做修改
			String accState=request.getParameter("acceptState");
			clientCustomerNeed.setAcceptState(accState);
			String needId=request.getParameter("id");
			//clientCustomerNeed.setId(Integer.parseInt());
			
			

			 //模式
		    String button=request.getParameter("publishModel");
		    /*if("选定译员模式".equals(button)){
		    	clientCustomerNeed.setPublishModel("选定译员模式");
		    }else if("主动投标模式".equals(button) || "特急+".equals(cycle1)){
		    	clientCustomerNeed.setPublishModel("主动投标模式");
		    }else{
		    	clientCustomerNeed.setPublishModel("系统分配模式");
		    }*/
			
		    
		    //翻译总价
		    clientCustomerNeed.setTotalMoney(Double.parseDouble(request.getParameter("totalMoney")));
		    
		    
		    //模式
			List<Translator> listTranslator=new ArrayList<Translator>();
			if("选定译员模式".equals(button)){
				clientCustomerNeed.setPublishModel("选定译员模式");
				//接收译员信息
				String transIds[]=request.getParameterValues("checkTrans");
				//System.out.println(transIds.length);
				if(transIds!=null){
					for(String transId:transIds){
						int tId=Integer.parseInt(transId);
						
						Translator translator=new Translator();
						translator.setTranstionId(tId);
						translator.setLanguages(clientCustomerNeed.getLanguagePair());
						translator.setDomain(field.getField());
						translator=translatorService.findtransQuestion(translator);
						
						//Translator translator=translatorService.queryTransById(tId);
						listTranslator.add(translator);
					}
					
					model.addAttribute("listTranslator", listTranslator);
					model.addAttribute("listLength", listTranslator.size());
				}
				
		    }
			else if("主动投标模式".equals(button) || "特急+".equals(cycle1)){
				clientCustomerNeed.setPublishModel("主动投标模式");
			}
			else{
		    	clientCustomerNeed.setPublishModel("系统分配模式");
		    }
			
			//上传文件
			
			List<String> fileList=new ArrayList<String>();
			upload(request.getSession().getServletContext().getRealPath("")+url,files);
			if(clientCustomerNeed.getFileURL()!=null && clientCustomerNeed.getFileURL()!=""){
				File file = new File(request.getSession().getServletContext().getRealPath("")+url);
				File files2[]=file.listFiles();
				if(files2!=null){
					for(int i=0;i<files2.length;i++){
						fileList.add(files2[i].getName());
					}
				}
			}
		    
			model.addAttribute("fileNames", fileList);
			model.addAttribute("publish", clientCustomerNeed);
			model.addAttribute("field", field);
			model.addAttribute("procedureName", procedureName);
			model.addAttribute("needId",needId);
			model.addAttribute("transKile",request.getParameter("moneyKilo"));//项目单价
			model.addAttribute("projectTypeId", projectType);
			//余额
			double userBanlance=((ClientUserD)request.getSession().getAttribute("clientid")).getBalance();//数据存储余额显示值
			//签收订单总金额 sumPayNumber
			Order order = new Order();
			order.setClientUserId(((ClientUserD)request.getSession().getAttribute("clientid")).getId());
			order.setTaskStateId(6);
			String payMoneyString=orderService.sumPayNumber(order);
			
			//发布中状态需求总价
			ClientCustomerNeed clientCustomerNeed1=new ClientCustomerNeed();
			clientCustomerNeed1.setClientUserId(clientUser.getId());
			String payMoneyPublish=clientCustomerService.getPublishPayNum(clientCustomerNeed1);
			
			
			if(payMoneyString!=null && payMoneyString!=""){
				double sumPayNumber=Double.valueOf(payMoneyString).doubleValue(); //为签收订单总的支付金额
				userBanlance=userBanlance-sumPayNumber;//在客户签收所有订单之后，用户钱包所剩余额
			}
			if(payMoneyPublish!=null && payMoneyPublish!=""){
				double sumPayNumber=Double.valueOf(payMoneyPublish).doubleValue(); //为签收订单总的支付金额
				userBanlance=userBanlance-sumPayNumber;//在客户签收所有订单之后，用户钱包所剩余额
			}
			
			model.addAttribute("userBanlance",userBanlance);
			model.addAttribute("updateType", "update");//说明是做修改并从修改路劲跳转到look页面
			
			
			
			// 返回修改开始
			/*String type=request.getParameter("typePublish");
			if("back".equals(type)){
				
				model.addAttribute("updateType", "back");//说明是新项目做修改并从修改路劲跳转到修改需求页面
				
				List<Field> doaminList=new ArrayList<Field>();
				doaminList=fieldService.queryByAll();
				
				//翻译流程list processList
				List<ProcedureType> procedureList=new ArrayList<ProcedureType>();
				procedureList=procedureService.queryByAll();
				
				List<String> fileList=new ArrayList<String>();
				if(clientCustomerNeed.getFileURL()!=null && clientCustomerNeed.getFileURL()!=""){
					File file = new File(request.getSession().getServletContext().getRealPath("")+clientCustomerNeed.getFileURL());
					File files[]=file.listFiles();
					if(files!=null){
						for(int i=0;i<files.length;i++){
							fileList.add(files[i].getName());
							//fileTransURLs.add(files[i].getPath());
						}
					}
				}
							
				request.setAttribute("clientCustomerNeed", clientCustomerNeed);
				request.setAttribute("doaminList", doaminList);
				request.setAttribute("procedureList", procedureList);
				
				return "forward:/publishNeed/updatePublish.need.jsp";
			}*/
			//返回修改结束
			
			return "forward:/publishNeed/lookPublish.need.jsp";
		}catch(Exception e){
			return "forward:/publishNeed/publish.need.error.jsp";
		}
	}
	
	
	/**
	 * 取消需求（删除需求）
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("deleteNeed")
	public Map<String,String> deleteNeed(String id){
		Map<String,String> map = new HashMap<String,String>();
		ClientCustomerNeed clientCustomerNeed=new ClientCustomerNeed();
		int needId=Integer.parseInt(id);
		clientCustomerNeed.setId(needId);
		clientCustomerNeed.setAcceptState("已删除");
		try{
			clientCustomerService.updateNeed(clientCustomerNeed);
			map.put("msg", "success");
		}catch(Exception e){
			map.put("msg", "error");
		}
		return map;
		
	}

	
	
	//二次发布
	@RequestMapping("secondPublishNeed")
	public String secondPublishNeed(String id,HttpServletRequest request) throws HttpException, IOException{
		//发布项
		int needId=Integer.parseInt(id);
		ClientCustomerNeed clientCustomerNeed=clientCustomerService.findTransNeedByid(needId);
		
		
		//发布时间
		SimpleDateFormat  sdf=new  SimpleDateFormat("yyyy-MM-dd hh:mm:ss");    
		java.util.Date  date=new  java.util.Date();    
 		String  publishTime=sdf.format(date);  
		
 		//重新计算是否加急
 		String cycle="一般";//加急变量
 		int procedureType=clientCustomerNeed.getProcedureTypeId();//流程
 		float length1=clientCustomerNeed.getLength();//字数
 		float length=0;
		if(length1<500){
			length=500;
		}else{
			length=length1;
		}
 		String completeTime=clientCustomerNeed.getCompleteTime();
 		double time=0;//时差
		double addTime=0;//加钱天数 		
 		
 		java.util.Date publishTimeDate;
 		java.util.Date completeTimeDate;
		try {
			publishTimeDate = sdf.parse(publishTime);
			completeTimeDate=sdf.parse(completeTime);
		
		
		
		
		Calendar calpublishTime = Calendar.getInstance();
		calpublishTime.setTime(publishTimeDate);
		  
		Calendar calcompleteTime = Calendar.getInstance();
		calcompleteTime.setTime(completeTimeDate);
		
		int day1= calpublishTime.get(Calendar.DAY_OF_YEAR);
		int day2 = calcompleteTime.get(Calendar.DAY_OF_YEAR);
		
		int year1 = calpublishTime.get(Calendar.YEAR);
		int year2 = calpublishTime.get(Calendar.YEAR);
		 if(year1 != year2) //同一年
		 {
			  int timeDistance = 0 ;
			  for(int i = year1 ; i < year2 ; i ++)
			  {
				  if(i%4==0 && i%100!=0 || i%400==0) //闰年  
				  {
					  timeDistance += 366;
				  }
				  else //不是闰年
				  {
					  timeDistance += 365;
				  }
			  }
			   
			  time=timeDistance + (day2-day1) ;
			 }
			 else //不同年
			 {
				 time=day2-day1;
			 }
		 
		 
		 
 		double transTime=Math.ceil(length/3000);//翻译需要时间
 		double proofTime=Math.ceil(length/6000);//校对时间
 		double audiTime=Math.ceil(length/8000);//审核时间
 		
 		double ptime=1;//流程处理时间 1天
 		if(procedureType==1){
 			ptime=ptime+transTime;
 		}else if(procedureType==2){
 			ptime=ptime+transTime+proofTime;
 		}else if(procedureType==3){
 			ptime=ptime+transTime+proofTime+audiTime;
 		}
 		
 		if(time<ptime){
 			//加急情况 计算加急时间
 			ptime=1;//流程处理时间 1天
 			cycle="加急";
 			transTime=Math.ceil(length/4000);//翻译需要时间
 			proofTime=Math.ceil(length/8000);//校对时间
 			audiTime=Math.ceil(length/10000);//审核时间
 			if(procedureType==1){
 				ptime=ptime+transTime;
 			}else if(procedureType==2){
 				ptime=ptime+transTime+proofTime;
 			}else if(procedureType==3){
 				ptime=ptime+transTime+proofTime+audiTime;
 			}
 			
 			if(time<ptime){
 				ptime=1;//流程处理时间 1天
 				//特急情况 计算特急时间
 				cycle="特急";
 				transTime=Math.ceil(length/5000);//翻译需要时间
 				proofTime=Math.ceil(length/10000);//校对时间
 				audiTime=Math.ceil(length/15000);//审核时间
 				if(procedureType==1){
 					ptime=ptime+transTime;
 				}else if(procedureType==2){
 					ptime=ptime+transTime+proofTime;
 				}else if(procedureType==3){
 					ptime=ptime+transTime+proofTime+audiTime;
 				}
 				
 				/*if(time<ptime){
 					//加钱
 					addTime=ptime-time;
 					//addTime=Double.parseDouble(request.getParameter("addTime"));
 					addTime=addTime*1.1;
 						
 				}*/
 			}
 			
 		}
 		
 		//周期系数
 		Schedule schedule=new Schedule();
 		schedule=scheduleService.queryBySchedule(cycle);
 		
 		//查找语言的基础价格；
		BasicPrice basicPrice = new BasicPrice();
		basicPrice=basicPriceService.queryByLanguage(clientCustomerNeed.getLanguagePair());
		
		//查找领域价格
		Field field = new Field();
		field=fieldService.queryById(clientCustomerNeed.getDomainId());
		
		
		//查找译员等级系数
		TranslatorLevel TranslatorLevel = new TranslatorLevel();
		TranslatorLevel=TransLevelService.queryByLevel(clientCustomerNeed.getTransLevel());
		
		Double totalMoney=0.0;
		//只翻译     最终每千字价格 = 基础每千字价格	 *    领域系数    *   等级系数    *   周期系数   *  1
		double trans=basicPrice.getBasicPrice()*field.getFactor()*TranslatorLevel.getFactor()*schedule.getFactor();
		
		
		//翻译和校对 最终每千字价格 = 基础每千字价格	 *    领域系数    *   等级系数    *   周期系数   *  1  +  （（基础每千字价格	 *    领域系数   *   周期系数） *0.5）/*等级系数
		double veri=trans+basicPrice.getBasicPrice()*field.getFactor()*schedule.getFactor()*0.5/TranslatorLevel.getFactor();
		
		//翻译校对和审核  最终每千字价格 = 基础每千字价格	 *    领域系数    *   等级系数    *   周期系数   *  1  +  （（基础每千字价格	 *    领域系数   *   周期系数） *0.5）/*等级系数    +    （基础每千字价格	 *    领域系数   *   周期系数） *0.5 
		double proof=veri+basicPrice.getBasicPrice()*field.getFactor()*schedule.getFactor()*0.5;
		
		//流程id
		//int procedureType=Integer.parseInt(request.getParameter("procedureType"));
		//流程名称
		String procedureName="";
		if(procedureType==1){
			//只翻译
			totalMoney=trans;
			procedureName="只翻译";
		}
		if(procedureType==2){
			//翻译和校对 
			totalMoney=veri;
			procedureName="翻译和校对";
		}
		if(procedureType==3){
			//翻译校对及审核 	最终每千字价格 = 基础每千字价格	 *    领域系数    *   等级系数    *   周期系数   *  1  +  （（基础每千字价格	 *    领域系数   *   周期系数） *0.5）/*等级系数    +    （基础每千字价格	 *    领域系数   *   周期系数） *0.5 
			totalMoney=proof;
			procedureName="翻译校对和审核";
		}
		
		//四舍五入
		BigDecimal bg = new BigDecimal(totalMoney).setScale(2, RoundingMode.DOWN);
		//实际单价金额
		double shijiMoney=0.0;
		if(bg.doubleValue()>=clientCustomerNeed.getMoneyKilo()){
			shijiMoney=bg.doubleValue();
		}else{
			shijiMoney=clientCustomerNeed.getMoneyKilo();
		}
		
		clientCustomerNeed.setAcceptState("发布中");
		clientCustomerNeed.setCycle(cycle);
		clientCustomerNeed.setTotalMoney(shijiMoney*length/1000);
		clientCustomerNeed.setPublishTime(publishTime);
		clientCustomerService.updateNeed(clientCustomerNeed);
		
		//定时开始
		 SimpleDateFormat  sdf1=new  SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟
	     String dstr=clientCustomerNeed.getCompleteTime();
	     Date date1;
	     try {
			  if(dstr!=null && dstr!=""){	
	    	    date1 = sdf1.parse(dstr+" 23:59:59");
				MyTimer(date1,clientCustomerNeed);
			  }
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		
		if("选定译员模式".equals(clientCustomerNeed.getPublishModel())){
			
			//修改需求，只需通知译员
			
			//找到译员，并通知译员
			List<ClientCustomerNeedTrans>  needTransList= clientCustomerTransService.queryByNeedId(needId);
			for(int i=0;i<needTransList.size();i++){
				Translator sendMessageTranslator=translatorService.queryTransById(needTransList.get(i).getTranslatorId());
				sendMessageAction_sendPhone(sendMessageTranslator.getTel(),request,clientCustomerNeed.getTitle(),sendMessageTranslator.getAccountName(),clientCustomerNeed.getId(),sendMessageTranslator.getId(),"");
			}
			
			
		/*	//选定译员完毕，并通过短信方式提醒译员
			try {
				sendMessageAction_sendPhone(sendMessageTranslator.getTel(),request,clientCustomerNeed.getTitle(),sendMessageTranslator.getAccountName(),clientCustomerNeed.getId(),sendMessageTranslator.getTranstionId());
				
				
				request.setAttribute("type", "save");
				request.setAttribute("id", clientCustomerService.queryByWhere(clientCustomerNeed).getId());
				
				request.setAttribute("lookType", "customerCenter");
				return "forward:/publishNeed/publish.need.success.jsp";
			} catch (Exception e) {
				e.printStackTrace();
				return "forward:/publishNeed/publish.need.error.jsp";
			} 
			*/
		}
		if("系统分配模式".equals(clientCustomerNeed.getPublishModel())){
		List<Translator> listTranslator=new ArrayList<Translator>();
		Translator translator = new Translator();
    	translator.setLanguages(clientCustomerNeed.getLanguagePair());
    	translator.setLevel(clientCustomerNeed.getTransLevel());
    	translator.setDomain(field.getField());
    	translator.setState("空闲");
    	translator.setMsg(clientCustomerNeed.getProcedureTypeId()+"");
    	listTranslator=translatorService.queryByWhere(translator);
    	if(listTranslator.size()==0){
    		translator.setState("");
    		listTranslator=translatorService.queryByWhere(translator);
    		if(listTranslator.size()==0){
    			listTranslator=translatorService.queryByWhere(new Translator());
    		}
    	}
    	if(listTranslator.size()!=0){
		 /* try {*/
    			int num=0;
    			if(listTranslator.size()>100){
    				num=100;
    			}else{
    				num=listTranslator.size();
    			}
	    		//listTranslator.size();
    			int nId=clientCustomerService.queryByWhere(clientCustomerNeed).getId();
	    		for(int i=0;i<num;i++){
    			ClientCustomerNeedTrans clientCustomerNeedTrans=new ClientCustomerNeedTrans();
				int trid=listTranslator.get(i).getId();
				clientCustomerNeedTrans.setClientCustomerNeedId(nId);
				clientCustomerNeedTrans.setTranslatorId(trid);
				List<ClientCustomerNeedTrans> cusNeedList=clientCustomerTransService.queryById(clientCustomerNeedTrans);
				/*for(int j=0;j<=cusNeedList.size();j++){*/
					if(cusNeedList.size()==0){
						/*clientCustomerNeedTrans.setClientCustomerNeedId(cusNeedList.get(j).getClientCustomerNeedId());
						clientCustomerNeedTrans.setTranslatorId(trid);*/
						clientCustomerTransService.addtransCustomer(clientCustomerNeedTrans);
						//短信通知译员有任务
						sendMessageAction_sendPhone(listTranslator.get(i).getTel(),request,request.getParameter("title"),listTranslator.get(i).getAccountName(),needId,listTranslator.get(i).getId(),"");
							
						}
				   /* }*/
				}
			    		//定时任务开始
			    		timerTask(clientCustomerNeed,request);
			    		/*request.setAttribute("type", "save");
						request.setAttribute("id", clientCustomerService.queryByWhere(clientCustomerNeed).getId());
						
						request.setAttribute("lookType", "customerCenter");
			    		return "forward:/publishNeed/publish.need.success.jsp";*/
			    		
						/*}catch (Exception e) {
						e.printStackTrace();
						return "forward:/publishNeed/publish.need.error.jsp";
					} */
				}

      }else{
    	  /*request.setAttribute("type", "save");
			request.setAttribute("id", clientCustomerService.queryByWhere(clientCustomerNeed).getId());
			
			request.setAttribute("lookType", "customerCenter");
    		return "forward:/publishNeed/publish.need.success.jsp";*/
      }		
		request.setAttribute("id", clientCustomerService.queryByWhere(clientCustomerNeed).getId());
		
		request.setAttribute("lookType", "customerCenter");
			return "forward:/publishNeed/publish.need.success.jsp";
		}catch (ParseException e) {
			e.printStackTrace();
			return "forward:/publishNeed/publish.need.error.jsp";
		}
		
	}

	
	
	
	
	/**
	 * 查看我的订单
	 * @param request
	 * @param mm
	 * @param transName
	 * @param selectModel
	 * @param searchInput
	 * @return
	 */
	@ResponseBody
	@RequestMapping("myOrders")
	public Map<Object,Object> myOrders(HttpServletRequest request,String mm,String buttonValue,String timeInut){
		ClientUserD clientUser= (ClientUserD) request.getSession().getAttribute("clientid");
		Page page = new Page();
		String cusId = String.valueOf(clientUser.getId());
		page.setMsgType(cusId);
		page.setNamemsg(buttonValue);
		page.setSecondmsg(timeInut);
		
		
		Map<Object,Object> map=new HashMap<Object,Object>();
		List<Order> orderList=new ArrayList<Order>();
		List<Translator> trList=new ArrayList<Translator>();
		
		long pageCount=orderService.countCusOrderByCusId(page);
		Page page2=null;
		if(pageCount>0){
			page2=new Page(pageCount,mm,4);

			page2.setMsgType(cusId);
			page2.setNamemsg(buttonValue);
			page2.setSecondmsg(timeInut);			
			
			orderList=orderService.findCusOrderByCusId(page2);
						
			//存储译员信息List
			
			for(Order ord:orderList){
				Translator trans=translatorService.queryTransById(ord.getTranslatorid());
				trList.add(trans);
			}
			
			
		}else{
			page2=new Page(0,"0",1);
		}
		
		
		
		
		map.put("orderList", orderList);
		map.put("trList", trList);
		map.put("page", page2);
		
		//request.setAttribute("page", page2);
		return map;
	}

	
	
	/**
	 * 跳转我的订单页面
	 * @return
	 */
	@RequestMapping("myOrdersUI")
	public String myOrdersUI(HttpServletRequest request){
		ClientUserD clientUser= (ClientUserD) request.getSession().getAttribute("clientid");
		Page page = new Page();
		page.setMsgType(clientUser.getId()+"");
		
		/*List<Translator> transList=new ArrayList<Translator>();
		transList=translatorService.queryByWhere(new Translator());*/
		long pageCount=orderService.countCusOrderByCusId(page);
		Page page2=null;
		if(pageCount>0){
			page2=new Page(pageCount,"1",4);
		}else{
			page2=new Page(0,"0",1);
			
		}
		
		request.setAttribute("page", page2);
		//request.setAttribute("transList", transList);
		return "forward:/order/user.customer.order.jsp";
	}
	
	
	/**
	 * 查看我的订单
	 * @param request
	 * @param mm
	 * @param transName
	 * @param selectModel
	 * @param searchInput
	 * @return
	 */
	/*@ResponseBody
	@RequestMapping("myOrders")
	public Map<Object,Object> myOrders(HttpServletRequest request,String mm,String buttonValue,String timeInut){
		ClientUserD clientUser= (ClientUserD) request.getSession().getAttribute("clientid");
		
		Page page = new Page();
		String cusId = String.valueOf(clientUser.getId());
		page.setMsgType(cusId);
		page.setNamemsg(buttonValue);
		page.setSecondmsg(timeInut);
		Page page2=new Page(orderService.countCusOrderByCusId(page),mm,4);
		
		
		page2.setMsgType(cusId);
		page2.setNamemsg(buttonValue);
		page2.setSecondmsg(timeInut);
		Map<Object,Object> map=new HashMap<Object,Object>();
		List<Order> orderList=new ArrayList<Order>();
		orderList=orderService.findCusOrderByCusId(page2);
		
		
		//存储译员信息List
		List<Translator> trList=new ArrayList<Translator>();
		for(Order ord:orderList){
			Translator trans=translatorService.queryTransById(ord.getTranslatorid());
			trList.add(trans);
		}
		map.put("orderList", orderList);
		map.put("trList", trList);
		map.put("page", page2);
		//request.setAttribute("page", page2);
		return map;
	}*/

	
	
	/**
	 * 获取国家
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getCountry")
	public Map<String,String> getCountry(HttpServletRequest request,String country,String provinces){
		//获取session语言
		String sessionLanguage=(String) request.getSession().getAttribute("language");
		 LocalUtil lu =  LocalUtil.getInstance(sessionLanguage);  
		 Map<String,String> list=new HashMap<String,String>();
		 /*List<String> listCounttry=new ArrayList<String>();
		 List<String> listProvincs=new ArrayList<String>();
		 List<String> listCity=new ArrayList<String>();*/
		 if((country==null || country=="" )&&( provinces==null || provinces=="")){
			 //查找所有国家
			 list=lu.getCountry();
		 }
		 
		 if(country!=null && country!="" && (provinces==null || provinces=="") ){
			 //查找省
			 list=lu.getProvinces(country);
		 }
		 
		 if(country!=null && country!="" && provinces!=null && provinces!="" ){
			 //查找市
			 list=lu.getCities(country, provinces);
		 }
	
		 return list;
	}
	
	
	
	/**
	 * 企业认证
	 * @param request
	 * @param headPortrait
	 */
	@RequestMapping("companyCertification")
	public String companyCertification(HttpServletRequest request,@RequestParam("registrationURL") MultipartFile registrationURL){
		String shortName=request.getParameter("nameShort");
		
		try {
			//图片名称 xxx.xxx
			 // 获取图片原始文件名  
	       String originalFilename = registrationURL.getOriginalFilename();  
	       
	    // 图片上传的相对路径（因为相对路径放到页面上就可以显示图片）
	       ClientUserD clientUserURL= (ClientUserD) request.getSession().getAttribute("clientid");
	       String path = "upload/customer/"+clientUserURL.getId()+"/registrationURL/company/"+originalFilename; 
	       
	    // 图片上传的绝对路径  
	       String url = request.getSession().getServletContext().getRealPath("") + path; 
	       
	       File dir = new File(url);  
	       if(!dir.exists()) {  
	       dir.mkdirs();  
	       }  
	         
	       // 上传图片  
	       registrationURL.transferTo(new File(url));  
	       
	        String country=request.getParameter("country");
			String province=request.getParameter("province");
			String city=request.getParameter("city");
			String registrationAddress=country+"  "+province+"  "+city;
			OnLineCustomer onlineCustomer=new OnLineCustomer();
			onlineCustomer.setNameZH(request.getParameter("nameZH"));
			onlineCustomer.setNameEN(request.getParameter("nameEN"));
			onlineCustomer.setNameShort(shortName);
			onlineCustomer.setCel(request.getParameter("cel"));
			/*onlineCustomer.setTel(request.getParameter("tel"));*/
			onlineCustomer.setContact(request.getParameter("contact"));
			onlineCustomer.setClientUserId(Integer.parseInt(request.getParameter("cilentUserId")));
			onlineCustomer.setFax(request.getParameter("fax"));
			onlineCustomer.setRegistrationURL(path);
			onlineCustomer.setRegistrationNumber(request.getParameter("registrationNumber"));
			onlineCustomer.setAddress(request.getParameter("address"));
			onlineCustomer.setScope(request.getParameter("scope"));
			onlineCustomer.setSize(Integer.parseInt(request.getParameter("size")));
			onlineCustomer.setLtd(request.getParameter("Ltd"));
			onlineCustomer.setIntro(request.getParameter("intro"));
			onlineCustomer.setIntroEN(request.getParameter("introEN"));
			
			String hiddenCountry=request.getParameter("hiddenCountry");//过去对应版本国家值
			String languageSession=(String)request.getSession().getAttribute("language");
			Map<String,String> map=LocalUtil.getInstance(languageSession).getAddressENAndCN(country, province, city);
			//如果是中文版，返回英文地址，如果是英文版，返回中文地址
			if("".equals(languageSession)||languageSession==null||"undefined".equals(languageSession)||"zh".equals(languageSession)){
				onlineCustomer.setRegistrationAddress(request.getParameter("registrationAddress"));
				onlineCustomer.setCountry(hiddenCountry);
				onlineCustomer.setRegistrationAddressEN(map.get("address"));
				onlineCustomer.setCountryEN(map.get("countryStr"));
			}else if("en".equals(languageSession)){
				onlineCustomer.setRegistrationAddress(map.get("address"));
				onlineCustomer.setRegistrationAddressEN(request.getParameter("registrationAddress"));
				onlineCustomer.setCountry(map.get("countryStr"));
				onlineCustomer.setCountryEN(hiddenCountry);
			}
			
			
			
			OnLineCustomer onlineCustomer1 = clientCustomerService.findUserID(Integer.parseInt(request.getParameter("cilentUserId")));
			if(onlineCustomer1==null){
				//没有对应信息，做添加
				clientCustomerService.saveOnliCustomer(onlineCustomer);
			}else{
				//有对应信息，做修改
				int onlineId=Integer.parseInt(request.getParameter("onlineCusId"));
				onlineCustomer.setId(onlineId);
				clientCustomerService.updateOnlineCustomer(onlineCustomer);
			}
			//clientCustomerService.saveOnliCustomer(onlineCustomer);
			
			//修改个人信息为等待审核
			ClientUserD clientUser=new ClientUserD();
			clientUser.setId(Integer.parseInt(request.getParameter("cilentUserId")));
			clientUser.setCertificationState(1);
			clientCustomerService.editCilentCustomerById(clientUser);
			
			 } catch (Exception e) {  
		            throw new RuntimeException("服务器繁忙，上传图片失败");  
		        } 
		
		return "forward:./findUI.do";
	}
	

	
	/**
	 * 个人认证
	 * @param request
	 * @param topSRC
	 * @param buttomSRC
	 * @return
	 */
	@RequestMapping("personCertification")
	public String personCertification(HttpServletRequest request,@RequestParam("topSRC") MultipartFile topSRC,@RequestParam("buttomSRC") MultipartFile buttomSRC){
		String realName=request.getParameter("realName");
		String cardID=request.getParameter("cardID");
		try {  
			 // 获取图片原始文件名  
	       String topOriginalFilename = topSRC.getOriginalFilename(); 
	       String buttomOriginalFilename = buttomSRC.getOriginalFilename(); 
	       
	    // 图片上传的相对路径（因为相对路径放到页面上就可以显示图片）
	       ClientUserD clientUserURL= (ClientUserD) request.getSession().getAttribute("clientid");
	       String topPath = "/upload/customer/"+clientUserURL.getId()+"/registrationURL/personal/topOriginalFilename/"+ topOriginalFilename; 
	       String buttomPath = "/upload/customer/"+clientUserURL.getId()+"/registrationURL/personal/buttomOriginalFilename/"+ buttomOriginalFilename;  
	       
	    // 图片上传的绝对路径  
	       String topURL = request.getSession().getServletContext().getRealPath("") + topPath; 
	       String buttomURL = request.getSession().getServletContext().getRealPath("") + buttomPath; 
	       
	       File topDIR = new File(topURL);  
	       if(!topDIR.exists()) {  
	    	   topDIR.mkdirs();  
	       } 
	       File buttomDIR = new File(buttomURL);  
	       if(!buttomDIR.exists()) {  
	    	   buttomDIR.mkdirs();  
	       }
	         
	       // 上传图片  
	       topSRC.transferTo(new File(topURL));  
	       buttomSRC.transferTo(new File(buttomURL));  
	       
	     //修改个人信息为等待审核
			ClientUserD clientUser=new ClientUserD();
			clientUser.setId(Integer.parseInt(request.getParameter("cilentUserId")));
			clientUser.setCertificationState(1);
			clientUser.setRealName(realName);
			clientUser.setCardId(cardID);
			clientUser.setTopCardURL(topPath);
			clientUser.setButtomCardURL(buttomPath);
			clientCustomerService.editCilentCustomerById(clientUser);
			
	       
		} catch (Exception e) {  
            throw new RuntimeException("服务器繁忙，上传图片失败");  
        }
		
		return "forward:findUI.do";
	}
	
	
	
	
	/**
	 * 查看订单详情
	 * @param orderId
	 * @param request
	 * @return
	 */
	@RequestMapping("lookOrderById")
	public String lookOrderById(String orderId,HttpServletRequest request){
		int oId=Integer.parseInt(orderId);
		Order order=new Order();
		order=orderService.queryByOrderId(new Order(oId));
		request.setAttribute("orderImpl", order);
		
		int cusId=order.getClientUserId();
		ClientUserD clientUser=clientUserService.findCustomerById(cusId);
		request.setAttribute("clientUser", clientUser);
		
		int taskId=order.getTaskStateId();
		OrderState orderState=orderStateService.findOrderId(new OrderState(taskId));
		request.setAttribute("orderState", orderState);
		int transId=order.getTranslatorid();
		Translator translator=translatorService.queryTransById(transId);
		request.setAttribute("translator", translator);
		
		int clientCustomerNeedId=order.getClientCustomerNeedId();
		ClientCustomerNeed clientCustomerNeed=clientCustomerService.findTransNeedByid(clientCustomerNeedId);
		request.setAttribute("clientCustomerNeed", clientCustomerNeed);
		
		//存储客户上传文件名字,文件路劲,存储路劲
		Map<String,String> needUserNames=new HashMap<String,String>();
		String needUserUrl=clientCustomerNeed.getFileURL();
		
		
		//存储订单翻译文件名字,翻译文件路劲,存储订单翻译路劲
		Map<String,String> fileTransNames=new HashMap<String,String>();
		String transUrl=order.getTransUrl();
		//List<String> fileTransURLs=new ArrayList<String>();
		
		
		//存储订单校对文件名字，文件路劲，存储订单校对路劲
		Map<String,String> fileProofNames=new HashMap<String,String>();
		String proofUrl=order.getProoUrl();
		//List<String> fileProofURLs=new ArrayList<String>();
		
		
		//存储订单审核文件名字，审核文件路劲，存储订单审核文件路径
		Map<String,String> fileAuditNames=new HashMap<String,String>();
		String auditUrl=order.getAuditUrl();
		//List<String> fileAuditURLs=new ArrayList<String>();
		
		
		if(needUserUrl!=null && needUserUrl!="" && !"".equals(needUserUrl)){
			File file = new File(request.getSession().getServletContext().getRealPath("")+needUserUrl);
			File files[]=file.listFiles();
			if(files!=null){
				for(int i=0;i<files.length;i++){
					needUserNames.put(files[i].getName(), files[i].getPath());
					//fileTransURLs.add(files[i].getPath());
				}
			}
			
			request.setAttribute("needUserNames", needUserNames);
			//request.setAttribute("fileTransURLs", fileTransURLs);
		}
		
		
		
		
		if(transUrl!=null && transUrl!="" && !"".equals(transUrl)){
			File file = new File(request.getSession().getServletContext().getRealPath("")+transUrl);
			File files[]=file.listFiles();
			if(files!=null){
				for(int i=0;i<files.length;i++){
					fileTransNames.put(files[i].getName(), files[i].getPath());
					//fileTransURLs.add(files[i].getPath());
				}
			}
			
			request.setAttribute("fileTransNames", fileTransNames);
			//request.setAttribute("fileTransURLs", fileTransURLs);
		}
		
		if(proofUrl!=null && proofUrl!="" && !"".equals(proofUrl)){
			File file = new File(request.getSession().getServletContext().getRealPath("")+proofUrl);
			File files[]=file.listFiles();
			if(files!=null){
				for(int i=0;i<files.length;i++){
					fileProofNames.put(files[i].getName(),order.getProoUrl());
					//fileProofURLs.add(files[i].getPath());
				}
			}
			
			request.setAttribute("fileProofNames", fileProofNames);
			//request.setAttribute("fileProofURLs", fileProofURLs);
		}
		
		
		if(auditUrl!=null && auditUrl!="" && !"".equals(auditUrl)){
			File file = new File(request.getSession().getServletContext().getRealPath("")+auditUrl);
			File files[]=file.listFiles();
			if(files!=null){
				for(int i=0;i<files.length;i++){
					fileAuditNames.put(files[i].getName(),files[i].getPath());
					//fileAuditURLs.add(files[i].getPath());
				}
			}
			
			request.setAttribute("fileAuditNames", fileAuditNames);
			//request.setAttribute("fileAuditURLs", fileAuditURLs);
		}
		
		
		
		return "forward:/order/user.customer.order.details.jsp";
	}
	
	
	
	/**
	 * 客户确认订单
	 * @param orederId
	 * @return
	 */
	@ResponseBody
	@RequestMapping("customerSign")
	public Map<String,String> customerSign(String orderId,String rejection,String okState,HttpServletRequest request,double money){
		Map<String,String> result=new HashMap<String, String>();
		String result1="error";
		ClientUserD clientUser=(ClientUserD) request.getSession().getAttribute("clientid");
		//定义确认订单时间
		Date date=new Date();
		SimpleDateFormat  sdf=new  SimpleDateFormat("yyyy-MM-dd hh:mm:ss");    
 		String  signTime=sdf.format(date);  
 			
		//okState 判断订单为拒收或者签收
		if("y".equals(okState)){
			Order orderNeed=orderService.findOrderId(Integer.parseInt(orderId));
			//增加客户相应的积分==订单支付金额
			int newIntegral=(int) orderNeed.getPayNumber();
			//1.客户原有积分
			int oldintegral=clientUser.getIntegral();
			clientUser.setIntegral(oldintegral+newIntegral);
			//此处，扣除客户钱包
			double newBalance=(clientUser.getBalance()-orderNeed.getPayNumber());
			//修改客户信息
			clientUser.setBalance(newBalance);
			clientCustomerService.editCilentCustomerById(clientUser);
			request.getSession().setAttribute("clientid", clientUser);
			
			//插入交易记录
			Random ran = new java.util.Random();
			Date data = new Date();
			String out_trade_no = DateUtils.dateToStr("yyMMddhhmmss", data);
			for (int i = 0; i < 3; i++) {
				out_trade_no += ran.nextInt(10);
			}
			
			TradingRecord tradingRecord=new TradingRecord();
			tradingRecord.setType("订单支付");
			tradingRecord.setPayer(clientUser.getId()+"");
			tradingRecord.setPayee("环宇爱译");
			tradingRecord.setPayTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date));
			tradingRecord.setPayMoney(orderNeed.getPayNumber());//这是yi 元为单位的
			tradingRecord.setPayState("已转账");
			tradingRecord.setAccountNumber(out_trade_no);
			tradingRecord.setPayeeModel("备用金");
			tradingRecord.setUserType(1);
			int row=tradingRecordService.addTradRecord(tradingRecord);
			
			//通知客户，订单已签收
			try {
				sendMessageAction_sendPhone(clientUser.getTel(),request,orderNeed.getOrderReference(),orderNeed.getPayNumber()+"",0,0,"customerSign");
			} catch (Exception e) {
				e.printStackTrace();
			} 
			
			
			//处理译员
			if(row>0){
				
				//确认译员收入金额---->getMOneyTrans
				double getMoneyKilo=0.0;//单价
				double getMOneyTrans=0.0;
				
				ClientCustomerNeed clientCustomerNeed=clientCustomerService.findTransNeedByid(orderNeed.getClientCustomerNeedId());
				if(clientUser.getUserType()==2){//等于 2说明是内部客户，内部客户项目计算译员收入总价=transTotal
					getMOneyTrans=clientCustomerNeed.getTransTotal();
				}else{//一般情况
					if(clientCustomerNeed.getPublishModel().equals("系统分配模式")){//结算翻译总价=单价*总字数/1000
						getMoneyKilo=getSinglePrice(clientCustomerNeed.getLanguagePair(),clientCustomerNeed.getTransLevel()+"",clientCustomerNeed.getDomainId()+"",clientCustomerNeed.getProcedureTypeId()+"",clientCustomerNeed.getCycle()).doubleValue();
						/*//找到订单对应的译员，主要查找译员的报价信息
						Translator transQ=new Translator();
						transQ.setDomain(fieldService.queryById(clientCustomerNeed.getDomainId()).getField());
						transQ.setLanguages(clientCustomerNeed.getLanguagePair());
						transQ.setId(orderNeed.getTranslatorid());
						transQ=translatorService.findtransQuestion(transQ);
						
						//项目流程
						if(clientCustomerNeed.getProcedureTypeId()==1){//仅翻译
							getMoneyKilo=transQ.getTranPrice();
						}
						if(clientCustomerNeed.getProcedureTypeId()==2){//翻译、校对
							getMoneyKilo=transQ.getProoPrice();
						}
						if(clientCustomerNeed.getProcedureTypeId()==3){//翻译、校对、审核
							getMoneyKilo=transQ.getAuditPrice();
						}*/
						
						//计算总字数length
						double length=0.0;
						if(clientCustomerNeed.getLength()<=500){
							length=500;
						}else{
							length=clientCustomerNeed.getLength();
						}
						
						getMOneyTrans=getMoneyKilo*length/1000*0.8;
					}else{//系统分配模式和招标模式-->结算翻译总价=总价*80%
						getMOneyTrans=orderNeed.getPayNumber()*0.8;
					}
				}
				
				
				
				//插入译员交易记录
				Date dataTrans = new Date();
				String out_trade_no_Trans = DateUtils.dateToStr("yyMMddhhmmss", dataTrans);
				for (int i = 0; i < 3; i++) {
					out_trade_no += ran.nextInt(10);
				}
				
				TradingRecord tradingRecordTrans=new TradingRecord();
				tradingRecordTrans.setType("项目收款");
				tradingRecordTrans.setPayer(clientUser.getId()+"");
				tradingRecordTrans.setPayee(orderNeed.getTranslatorid()+"");
				tradingRecordTrans.setPayTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
				tradingRecordTrans.setPayMoney(getMOneyTrans);//这是yi 元为单位的
				tradingRecordTrans.setPayState("已转账");
				tradingRecordTrans.setAccountNumber(out_trade_no_Trans);
				tradingRecordTrans.setPayeeModel("备用金");
				tradingRecord.setUserType(2);
				int rowTrans=tradingRecordService.addTradRecord(tradingRecordTrans);
				
				if(rowTrans>0){
					//译员钱包增加相应金额
					Translator translator=translatorService.queryTransById(orderNeed.getTranslatorid());
					double oldtransBalance=translator.getWallet();//译员原始余额
					translator.setWallet(oldtransBalance+getMOneyTrans);//重新给译员余额设置值
					translator.setId(orderNeed.getTranslatorid());
					translatorService.updateTransWallet(translator);
					
					//签收
					Order order=new Order();
					order.setId(Integer.parseInt(orderId));
					order.setTaskStateId(6);
					order.setSignTime(signTime);
					order.setPayState(1);
					int task=orderService.updateTaskstateId(order);
					if(task>0){
						result1="success";
						//result.put("result", "success");
						
						if(clientUser.getUserType()!=3){
							//计算客户vip或者普通用户
							Order cusOrder = new Order();
							cusOrder.setClientUserId(clientUser.getId());
							cusOrder.setCompleteTime(signTime);
							List<Order> orderList=orderService.findOrder(cusOrder);
							int orderListSize=orderList.size();
							if(orderListSize<70){//总数小于70，改为普通用户
								clientUser.setUserType(0);
							}else{
								clientUser.setUserType(1);//vip客户
							}
						}
						
						
						//完成订单倒计时评价时间
						/*long deadline1 = date.getTime()+1296000000;*/
				 		long deadline1 = date.getTime()+1296000000;
						Date deadline = new Date(deadline1);
						TimerUtil timerUtil = new TimerUtil();
						timerUtil.EvalueteClientTimer(deadline,orderNeed.getId());
						
						//通知译员，客户已签收
						Translator translatorSendMassage=translatorService.queryTransById(orderNeed.getTranslatorid());
						try {
							sendMessageAction_sendPhone(translatorSendMassage.getTel(),request,orderNeed.getOrderReference(),translatorSendMassage.getAccountName(),orderNeed.getClientCustomerNeedId(),translatorSendMassage.getId(),"okState");
						} catch (Exception e) {
							e.printStackTrace();
						} 
						
					}
				}
				
			}
			
		}
		if("n".equals(okState)){
			//拒收
			Order order=orderService.queryByOrderId(Integer.parseInt(orderId));
			order.setId(order.getId());
			order.setTaskStateId(10);
			order.setRejected(rejection+"拒绝时间："+signTime+";");
			//order.setPayState(1);
			orderService.updateTaskstateId(order);
			result1="success";
			//通知管理员
		}
		
		result.put("result", result1);
		return result;
		
	}
	
	
	
	/**
	 * 计算取消订单扣除费用
	 * @param request
	 * @param orderId
	 * @param orderState
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getDeleteMoney")
	public Map getDeleteMoney(HttpServletRequest request,String orderId,String orderState){
		//ClientUserD clientUser=(ClientUserD) request.getSession().getAttribute("clientid");
		Map map = new HashMap();
		//此处，根据订单进度扣除客户钱包以及订单实际支付金额（需找到相应的需求，查找相应价格系数，最后根据流程进度计算支付金额）
		//1.通过订单找到需求
		Order orderNeed=orderService.findOrderId(Integer.parseInt(orderId));
		int needId=orderNeed.getClientCustomerNeedId();
		ClientCustomerNeed clientCustomerNeed=new ClientCustomerNeed();
		clientCustomerNeed.setId(needId);
		clientCustomerNeed=clientCustomerService.queryByWhere(clientCustomerNeed);
		
		Double totalMoney=0.0;//支付总价
		
		/*//翻译字数
		int length1 =clientCustomerNeed.getLength();
		int length=0;
		if(length1<500){
			length=500;
		}else{
			length=length1;
		}
		//查找语言的基础价格；
		BasicPrice basicPrice = new BasicPrice();
		basicPrice=basicPriceService.queryByLanguage(clientCustomerNeed.getLanguagePair());
		
		//查找领域价格
		Field field = new Field();
		field=fieldService.queryById(clientCustomerNeed.getDomainId());
		
		
		//查找译员等级系数
		TranslatorLevel TranslatorLevel = new TranslatorLevel();
		TranslatorLevel=TransLevelService.queryByLevel(clientCustomerNeed.getTransLevel());
		
		//查找周期系数
		Schedule schedule = new Schedule();
		schedule=scheduleService.queryBySchedule(clientCustomerNeed.getCycle());
		
		
		//只翻译     最终每千字价格 = 基础每千字价格	 *    领域系数    *   等级系数    *   周期系数   *  1
		double trans=basicPrice.getBasicPrice()*field.getFactor()*TranslatorLevel.getFactor()*schedule.getFactor();
		
		
		//翻译和校对 最终每千字价格 = 基础每千字价格	 *    领域系数    *   等级系数    *   周期系数   *  1  +  （（基础每千字价格	 *    领域系数   *   周期系数） *0.5）/*等级系数
		double veri=trans+basicPrice.getBasicPrice()*field.getFactor()*schedule.getFactor()*0.5/TranslatorLevel.getFactor();
		
		//翻译校对和审核  最终每千字价格 = 基础每千字价格	 *    领域系数    *   等级系数    *   周期系数   *  1  +  （（基础每千字价格	 *    领域系数   *   周期系数） *0.5）/*等级系数    +    （基础每千字价格	 *    领域系数   *   周期系数） *0.5 
		double proof=veri+basicPrice.getBasicPrice()*field.getFactor()*schedule.getFactor()*0.5;
		*/
		
		//支付金额
		double getDeleteMoney=0.0;
		if("1".equals(orderNeed.getTaskStateId()) || orderNeed.getTaskStateId()==1){
			//订单成立   不扣钱，扣除信誉分20
			
		}
		if("2".equals(orderNeed.getTaskStateId()) || orderNeed.getTaskStateId()==2){
			//已经开始翻译
			if(clientCustomerNeed.getProcedureTypeId()==1 || "1".equals(clientCustomerNeed.getProcedureTypeId())){
				getDeleteMoney=orderNeed.getPayNumber();
			}else if(clientCustomerNeed.getProcedureTypeId()==2 || "2".equals(clientCustomerNeed.getProcedureTypeId())){
				totalMoney=orderNeed.getPayNumber()*0.67;
				BigDecimal bg = new BigDecimal(totalMoney).setScale(2, RoundingMode.DOWN);
				getDeleteMoney=bg.doubleValue();
			}else if(clientCustomerNeed.getProcedureTypeId()==3 || "3".equals(clientCustomerNeed.getProcedureTypeId())){
				totalMoney=orderNeed.getPayNumber()*0.57;
				BigDecimal bg = new BigDecimal(totalMoney).setScale(2, RoundingMode.DOWN);
				getDeleteMoney=bg.doubleValue();
			}
			
			
		}
		if("3".equals(orderNeed.getTaskStateId()) || orderNeed.getTaskStateId()==3){
			//开始校对
			if(clientCustomerNeed.getProcedureTypeId()==2 || "2".equals(clientCustomerNeed.getProcedureTypeId())){
				getDeleteMoney=orderNeed.getPayNumber();
			}else if(clientCustomerNeed.getProcedureTypeId()==3 || "3".equals(clientCustomerNeed.getProcedureTypeId())){
				totalMoney=orderNeed.getPayNumber()*0.86;
				BigDecimal bg = new BigDecimal(totalMoney).setScale(2, RoundingMode.DOWN);
				getDeleteMoney=bg.doubleValue();
			}
		}
		if("4".equals(orderNeed.getTaskStateId()) || orderNeed.getTaskStateId()==4){
			//开始审核
			if(clientCustomerNeed.getProcedureTypeId()==3 || "3".equals(clientCustomerNeed.getProcedureTypeId())){
				getDeleteMoney=orderNeed.getPayNumber();
			}
		}
		if("5".equals(orderNeed.getTaskStateId()) || orderNeed.getTaskStateId()==5){
			//开始返稿,不能取消订单,但是可以签收订单
			//根据订单流程计算金额
			/*if(clientCustomerNeed.getProcedureTypeId()==1){
				//仅翻译
				totalMoney=trans;
			}else if(clientCustomerNeed.getProcedureTypeId()==2){
				//翻译+校对
				totalMoney=veri;		
			}else if(clientCustomerNeed.getProcedureTypeId()==3){
				//翻译+审核
				totalMoney=proof;
			}*/
			
			getDeleteMoney=orderNeed.getPayNumber();
			
		}
		map.put("getDeleteMoney", getDeleteMoney);
		return map;
	}
	
	
	
	/**
	 * 校对支付密码
	 * @param mode
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getPayPassword")
	public Map getPayPassword(HttpServletRequest request,String payPassword){
		Map map = new HashMap();
		ClientUserD clientUser=(ClientUserD) request.getSession().getAttribute("clientid");
		String result = "error";
		if(payPassword.equals(clientUser.getInitialPassword()) || payPassword==clientUser.getInitialPassword()){
			result="success";
		};
		map.put("result", result);
		return map;
	}
	/**
	 * 取消订单
	 * @param orderId
	 * @param orderState
	 * @return
	 */
	@ResponseBody
	@RequestMapping("deleteOrder")
	public Map<String,String> deleteOrder(HttpServletRequest request,String orderId,String orderState,double money){
		Map<String,String> result=new HashMap<String, String>();
		String result1="error";
		Order orderNeed=orderService.findOrderId(Integer.parseInt(orderId));
		ClientUserD clientUser=(ClientUserD) request.getSession().getAttribute("clientid");
		
		//扣除信誉分,扣除客户相应余额
		clientUser.setReputation(clientUser.getReputation()-20);
		clientUser.setBalance(clientUser.getBalance()-money);//新的余额=余额-实际支付金额
		clientUserService.editReputation(clientUser);
		request.getSession().setAttribute("clientid",clientUser );
		
		
		//插入客户交易记录
		int userId=((ClientUserD)request.getSession().getAttribute("clientid")).getId();
		Random ran = new java.util.Random();
		Date data = new Date();
		String out_trade_no = DateUtils.dateToStr("yyMMddhhmmss", data);
		for (int i = 0; i < 3; i++) {
			out_trade_no += ran.nextInt(10);
		}
		TradingRecord tradingRecord=new TradingRecord();
		tradingRecord.setType("订单支付");
		tradingRecord.setPayer(userId+"");
		tradingRecord.setPayee("环宇爱译");
		tradingRecord.setPayTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		tradingRecord.setPayMoney(money);//这是yi 元为单位的
		tradingRecord.setPayState("已转账");
		tradingRecord.setAccountNumber(out_trade_no);
		tradingRecord.setPayeeModel("备用金");
		tradingRecord.setUserType(1);
		int row=tradingRecordService.addTradRecord(tradingRecord);
		
		//处理译员
		if(row>0){
			//确认译员收入金额---->getMOneyTrans
			double getMoneyKilo=0.0;
			double getMOneyTrans=0.0;
			
			ClientCustomerNeed clientCustomerNeed=clientCustomerService.findTransNeedByid(orderNeed.getClientCustomerNeedId());
			if(clientUser.getUserType()==2){//内部客户取消订单
				getMOneyTrans=money*0.8;
			}else{
				if(clientCustomerNeed.getPublishModel().equals("系统分配模式")){//结算翻译总价=单价*总字数/1000
					
					/*//找到订单对应的译员，主要查找译员的报价信息
					Translator transQ=new Translator();
					transQ.setDomain(fieldService.queryById(clientCustomerNeed.getDomainId()).getField());
					transQ.setLanguages(clientCustomerNeed.getLanguagePair());
					transQ.setId(orderNeed.getTranslatorid());
					transQ=translatorService.findtransQuestion(transQ);
					
					//订单的任务进程可以理解为项目的流程
					if("2".equals(orderNeed.getTaskStateId()) || orderNeed.getTaskStateId()==2){
						//已经开始翻译,译员只拿翻译的价钱，--->单价=译员翻译报价
						getMoneyKilo=transQ.getTranPrice();
					}
					if("3".equals(orderNeed.getTaskStateId()) || orderNeed.getTaskStateId()==3){
						//开始校对，译员只拿校对的价钱，--->单价=译员校对报价
						getMoneyKilo=transQ.getProoPrice();
					}
					if("4".equals(orderNeed.getTaskStateId()) || orderNeed.getTaskStateId()==4){
						//开始审核，译员只拿审核的价钱，--->单价=译员审核报价
						getMoneyKilo=transQ.getAuditPrice();
					}*/
					//订单的任务进程可以理解为项目的流程
					if("2".equals(orderNeed.getTaskStateId()) || orderNeed.getTaskStateId()==2){
						//已经开始翻译,译员只拿翻译的价钱，--->单价=译员翻译报价
						clientCustomerNeed.setProcedureTypeId(1);
					}
					if("3".equals(orderNeed.getTaskStateId()) || orderNeed.getTaskStateId()==3){
						//开始校对，译员只拿校对的价钱，--->单价=译员校对报价
						clientCustomerNeed.setProcedureTypeId(2);
					}
					if("4".equals(orderNeed.getTaskStateId()) || orderNeed.getTaskStateId()==4){
						//开始审核，译员只拿审核的价钱，--->单价=译员审核报价
						clientCustomerNeed.setProcedureTypeId(3);
					}
					getMoneyKilo=getSinglePrice(clientCustomerNeed.getLanguagePair(),clientCustomerNeed.getTransLevel()+"",clientCustomerNeed.getDomainId()+"",clientCustomerNeed.getProcedureTypeId()+"",clientCustomerNeed.getCycle()).doubleValue();
					
					//计算总字数length
					double length=0.0;
					if(clientCustomerNeed.getLength()<=500){
						length=500;
					}else{
						length=clientCustomerNeed.getLength();
					}
					
					getMOneyTrans=getMoneyKilo*length/1000*0.8;
					
				}else{//选定译员模式和招标模式-->结算翻译总价=总价*80%
					getMOneyTrans=money*0.8;
				}
			}
			
			Translator sendTrnsMessage=translatorService.queryTransById(orderNeed.getTranslatorid());//通过订单号，找到对应译员
			
			
			//插入译员交易记录
			Date dataTrans = new Date();
			String out_trade_no_Trans = DateUtils.dateToStr("yyMMddhhmmss", dataTrans);
			for (int i = 0; i < 3; i++) {
				out_trade_no += ran.nextInt(10);
			}
			
			TradingRecord tradingRecordTrans=new TradingRecord();
			tradingRecordTrans.setType("项目收款");
			tradingRecordTrans.setPayer(userId+"");
			tradingRecordTrans.setPayee(orderNeed.getTranslatorid()+"");
			tradingRecordTrans.setPayTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			tradingRecordTrans.setPayMoney(getMOneyTrans);//这是yi 元为单位的
			tradingRecordTrans.setPayState("已转账");
			tradingRecordTrans.setAccountNumber(out_trade_no_Trans);
			tradingRecordTrans.setPayeeModel("备用金");
			tradingRecord.setUserType(2);
			int rowTrans=tradingRecordService.addTradRecord(tradingRecordTrans);
			//通知译员，客户订单已经取消
			if(rowTrans>0){
				//译员钱包增加相应金额
				Translator translator=new Translator();
				double oldtransBalance=sendTrnsMessage.getWallet();//译员原始余额
				translator.setWallet(oldtransBalance+getMOneyTrans);//重新给译员余额设置值
				translator.setId(orderNeed.getTranslatorid());
				translatorService.updateTransWallet(translator);
				
				//订单已取消
				Order order = new Order();
				order.setId(Integer.parseInt(orderId));
				order.setTaskStateId(9);
				order.setPayNumber(money);
				order.setPayState(1);
				int task=orderService.updateTaskstateId(order);
				if(task>0){
					result1="success";
					try {
						sendMessageAction_sendPhone(sendTrnsMessage.getTel(),request,orderNeed.getOrderReference(),sendTrnsMessage.getAccountName(),orderNeed.getClientCustomerNeedId(),sendTrnsMessage.getId(),"deleteOrder");
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
		result.put("result", result1);
		return result;
	}
	
	
	
	
	/**
	 * 跳转积分兑换页面
	 * @return
	 */
	@RequestMapping("exchangeUI")
	public String exchangeUI(HttpServletRequest request){
		ClientUserD clientUser=(ClientUserD) request.getSession().getAttribute("clientid");
		clientUser=clientUserService.findCustomerById(clientUser.getId());
		//查找商品
		Page page2=new Page(integralService.countAll(new Page()),"1",8);
		request.setAttribute("page", page2);
		request.setAttribute("clientUser", clientUser);
		return "forward:/usercenter/user.customer.exchange.jsp";
	}
	
	
	
	/**
	 * 分页展示兑换商品
	 * @param mm
	 * @param type
	 * @return
	 */
	@ResponseBody
	@RequestMapping("findExchange")
	public List<Integral> findExchange(String mm,String type){
		List<Integral> integralList=new ArrayList<Integral>();
		//翻页，按条件查找
		Page page2=new Page(integralService.countAll(new Page()),mm,8);
		if(page2.getTotalCount()>0){
			integralList=integralService.findAllByPage(page2);
		}
		
		return integralList;
	}
	
	
	
	/**
	 * 兑换商品，换一组
	 * @return
	 */
	@ResponseBody
	@RequestMapping("changeclick")
	public List<Integral> changeclick(){
		List<Integral> integralList=new ArrayList<Integral>();
		Page page=new Page();
		int totalCount=(int)integralService.countAll(new Page());//总兑换数
		int arrLength=0;//随机数
		arrLength=getRandom(totalCount,3);
		page.setStartIndex(arrLength);
		page.setPageSize(3);
		page.setTotalCount(totalCount);
		
		integralList=integralService.findAllByPage(page);
		return integralList;
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
	 * 执行兑换
	 * @param goodsMark
	 * @param goodId
	 * @param cusMark
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("exchange")
	public Map<String,String> exchange(String goodsMark,String goodId,String cusMark,HttpServletRequest request){
		ClientUserD clientUser=(ClientUserD) request.getSession().getAttribute("clientid");
		//扣除客户对应积分，并重新设置积分值
		int newcusMark=Integer.parseInt(cusMark)-Integer.parseInt(goodsMark);
		ClientUserD clientUser1=new ClientUserD();
		clientUser1.setIntegral(newcusMark);
		clientUser1.setId(clientUser.getId());
		clientCustomerService.editCilentCustomerById(clientUser1);
		
		
		//将兑换信息填入表中
		
		//1.对换时间
		Date date=new Date();
		SimpleDateFormat  sdf=new  SimpleDateFormat("yyyy-MM-dd hh:mm:ss");    
 		String  exchangeTime=sdf.format(date);  
		
		Exchange exchange=new Exchange();
		exchange.setExchangeState("待发货");
		exchange.setIntegralId(Integer.parseInt(goodId));
		exchange.setUsId(clientUser.getId());
		exchange.setExchangeTime(exchangeTime);
		exchangeService.saveExchange(exchange);
		
		
		Map<String,String> map=new HashMap<String, String>();
		map.put("msg", "success");
		return map;
	}
	
	/**
	 * 跳转等级页面
	 * @param request
	 * @return
	 */
	@RequestMapping("gradeUI")
	public String gradeUI(HttpServletRequest request){
		Order order=new Order();
		
		
		ClientUserD clientUser=(ClientUserD) request.getSession().getAttribute("clientid");
		order.setClientUserId(clientUser.getId());
		
		Date date=new Date();
		SimpleDateFormat  sdf=new  SimpleDateFormat("yyyy-MM-dd");    
 		String  nowTime=sdf.format(date); 
		order.setCompleteTime(nowTime);
 		
		List<Order> orderList=orderService.findOrder(order);
		int orderListSize=orderList.size();
		
		request.setAttribute("orderListSize", orderListSize);
		return "forward:/usercenter/user.customer.grade.jsp";
	}
	
	
	
	/**
	 * 申请提升等级
	 * @param orderSize
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("upgrade")
	public Map<String,String> upgrade(String orderSize,HttpServletRequest request){
		ClientUserD clientUser=(ClientUserD) request.getSession().getAttribute("clientid");
		clientUser.setUserType(2);
	
    	clientCustomerService.editCilentCustomerById(clientUser);
    	Map<String,String> map = new HashMap<String, String>();
    	map.put("msg", "success");
    	return map;
    	
	}

	
	/**
	 * 跳转评价页面
	 * @return
	 */
	@RequestMapping("valuateUI")
	public String valuateUI(HttpServletRequest request,String orderId){
		Order order=orderService.findOrderId(Integer.parseInt(orderId));
		if(order!=null){
			if(order.getExaminationTime()!=null && order.getExaminationTime()!=""){
				order.setExaminationTime(order.getExaminationTime().substring(0,10));
			}
			
			request.setAttribute("orderImpl", order);
			
			//查看需求信息
			ClientCustomerNeed clientCustomerNeed=new ClientCustomerNeed();
			clientCustomerNeed.setId(order.getClientCustomerNeedId());
			clientCustomerNeed=clientCustomerService.queryByWhere(clientCustomerNeed);
			request.setAttribute("clientCustomerNeedImpl", clientCustomerNeed);
			
			
			//查找译员信息
			
			Translator translator=translatorService.queryTransById(order.getTranslatorid());
			request.setAttribute("translatorImpl", translator);
			
		}
		return "forward:/order/user.customer.order.editor.jsp";
	}
	
	
	
/**
 * 跳转钱包页面
 * @return
 */
  @RequestMapping("mywallet")
  public String mywallet(HttpServletRequest request){
	  ClientUserD u1 = (ClientUserD)request.getSession().getAttribute("clientid");
	  int id = u1.getId();
	  ClientUserD  clientUser = clientUserService.findCustomerById(id);
	  request.setAttribute("clientUser", clientUser);
	  
	  //交易记录
	 
	  
	  return "forward:/usercenter/user.customer.wallet.jsp"; 
  }
	  
	  
	  
	
/**
 *添加评价信息页面
 * @param request
 * @param orderId
 * @param understandLevel
 * @param completionSpeed
 * @param degreeOfSmooth
 * @param rigor
 * @param integrality
 * @param format
 * @param score
 * @param evaluateDetails
 * @return
 */
	@ResponseBody
	@RequestMapping("addEvaluate")
	public Map<String, String> addEvaluate(HttpServletRequest request,EvaluateClient evaluateClient){
		evaluateClient.setState(0);
		evaluateService.addEvaluate(evaluateClient);
		int id=evaluateService.queryById(evaluateClient.getOrderId());
		
		
		//完成时间，评价时间
		Date date=new Date();
		SimpleDateFormat  sdf=new  SimpleDateFormat("yyyy-MM-dd hh:mm:ss");    
 		String  nowTime=sdf.format(date); 
		
		//修改订单表评价状态
		Order order1 =new Order();
		order1.setId(evaluateClient.getOrderId());
		order1.setEvaluateId(id);
		order1.setCustomerEvaluate(nowTime);
		order1.setCompleteTime(nowTime);
		orderService.setEvaluateId(order1);
		//修改订单表评价状态结束
		
		//修改信誉值
		ClientUserD clientUser=(ClientUserD) request.getSession().getAttribute("clientid");
		clientUser.setReputation(clientUser.getReputation()+5);
		clientUserService.editReputation(clientUser);
		//修改信誉值结束
		
		request.getSession().setAttribute("clientid",clientUser );
		Map<String, String> map = new HashMap<String, String>();
		/*map.put("message","seccess");*/
		//获取订单id
		int orderIds=evaluateClient.getOrderId();
		//查询订单id查询译员id
		int transId=orderService.queryOrderTrans(orderIds);
		//根据译员id查询译员信息
		Translator translator=translatorService.queryTransById(transId);
		String nickname=translator.getNickname();
		//获取当前译员积分
		int point=translator.getPoint();
		//获取当前译员信誉
		int honor=translator.getHonor();
		//根据订单id查询评价信息
		EvaluateClient  evaluateClients=evaluateService.queryByEvaluteOrder(orderIds);
		//获取评价分数
		BigDecimal score = new BigDecimal(Double.parseDouble(evaluateClients.getScore())).setScale(0, RoundingMode.DOWN);
		double scores=score.doubleValue();
		Order orders=orderService.findOrderId(orderIds);
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
		
		translators.setNickname(nickname);
		translators.setPoint(point);
		translators.setHonor(honor);
		translators.setId(transId);
		translatorService.updataTranslator(translators);
		
		
		Order order = new Order();
		order.setId(evaluateClient.getOrderId());
		order.setTaskStateId(8);
		orderService.updateTaskstateId(order);
		
		return map;
	}
	
	
/*	*//**
	 * 计算当前用户信誉并纪录存入数据库
	 *//*
	@RequestMapping("getReputation")
	public String getReputation(HttpServletRequest request){
		
		ClientUserD clientUser=(ClientUserD) request.getSession().getAttribute("clientid");
		int uid = clientUser.getId();
		ClientUserD clientUser1 =  clientUserService.findCustomerById(uid);
		double balance = clientUser1.getBalance();
		int reputation= clientUser1.getReputation();
		if(balance>=1000){
		reputation = (int) (reputation+(balance*0.01));
		}
		clientUser1.setReputation(reputation);
		clientUserService.editReputation(clientUser1);
		
		request.getSession().setAttribute("clientid",clientUser );
		
		
		return "forward:/usercenter/user.customer.reputation.jsp";
	}*/
	
	/**
	 * 设置密保问题
	 * @param securityQuestion
	 * @param answer
	 * @param request
	 * @return
	 */
	@RequestMapping("setSecurityQuestion")
	public String setSecurityQuestion(String securityQuestion,String answer,HttpServletRequest request){
		ClientUserD clientUser = (ClientUserD) request.getSession().getAttribute("clientid");
		clientUser.setSecurityQuestion(securityQuestion);
		clientUser.setAnswer(answer);
		clientUserService.setSecurityQuestion(clientUser);
		request.getSession().setAttribute("clientid", clientUser);
		
		return "forward:/usercenter/user.customer.password.protection.jsp";
	}
	
	
	/**
	 * 复制需求
	 * @param id
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("copyPublishNeed")
	public String copyPublishNeed(String id,Model model,HttpServletRequest request){
		int needid=0;
		if(id!=null && id!=""){
			needid=Integer.parseInt(id);
		}
		ClientCustomerNeed clientCustomerNeed=clientCustomerService.findTransNeedByid(needid);//原项目信息
		
		
		//翻译流程list processList
		List<ProcedureType> procedureList=new ArrayList<ProcedureType>();
		procedureList=procedureService.queryByAll();		
		
		//翻译领域 doaminList
		List<Field> doaminList=new ArrayList<Field>();
		doaminList=fieldService.queryByAll();
		
		/**
		 * 计算单价开始	
		 */
		/*if(id!=null && id!="" ){
			double kiloMoney=0;//存储每千字价格（单价）
			if(clientCustomerNeed.getLength()<=500){
				kiloMoney=clientCustomerNeed.getTotalMoney()*2;
			}else{
				kiloMoney=clientCustomerNeed.getTotalMoney()/clientCustomerNeed.getLength()*1000;
			}
			Math.round(kiloMoney);
			clientCustomerNeed.setMoneyKilo(kiloMoney);
		}*/
		
		//初始化需求部分信息
		clientCustomerNeed.setAcceptState("");
		//clientCustomerNeed.setFileURL("");
		clientCustomerNeed.setNeedReference("");
		clientCustomerNeed.setTitle("");
		clientCustomerNeed.setPublishModel("");
		
		model.addAttribute("clientCustomerNeed", clientCustomerNeed);
		model.addAttribute("doaminList", doaminList);
		model.addAttribute("procedureList", procedureList);
		
		//已经上传文件
		if(clientCustomerNeed.getFileURL()!=null){
			File file = new File(request.getSession().getServletContext().getRealPath("")+clientCustomerNeed.getFileURL());
			Map<String,String> fileNameMap=new HashMap<String, String>();
			File files[]=file.listFiles();
			if(files!=null){
				for(int i=0;i<files.length;i++){
					fileNameMap.put(files[i].getName(), files[i].getPath());
					//fileTransURLs.add(files[i].getPath());
				}
			}
	         model.addAttribute("fileNames", fileNameMap);  
		}
		
		return "forward:/publishNeed/updatePublish.need.jsp";
	}
	
	//列出目录下所有的文件
	private void listfile(File file, Map<String,String> map){
	    //如果file代表的不是一个文件，而是一个目录
        if(file.isDirectory()){
       //列出该目录下的所有文件和目录
        	File files[] = file.listFiles();
      //遍历files[]数组
        	for(File f : files){
      //递归
        		if(f.isFile()){
        			map.put(file.getPath()+"/"+f.getName(), f.getName());
        		}
        	
        	//listfile(f,map);
        	}
      }else if(file.isFile()){
        //file.getName()得到的是文件的原始名称，这个名称是唯一的，因此可以作为key，realName是处理过后的名称，有可能会重复
    	 // 	String realName=file.getName().substring(14);
    	  //	System.out.println("realName:"+realName);
		      map.put(file.getPath()+"/"+file.getName(), file.getName());
		 }
	 }
	
	
	
	/**
	 * 跳转充值页面Recharge.jsp
	 * @return
	 */
	@RequestMapping("findPayValueUI")
	public String findPayValueUI(HttpServletRequest request,String needMoney){
		ClientUserD clientUser = (ClientUserD) request.getSession().getAttribute("clientid");
		if(clientUser!=null){
			request.setAttribute("userId", clientUser.getId());
		}
		request.setAttribute("needMoney", needMoney);
		
		return  "forward:/ReCharge.jsp";
	}
	
	
	/**
	 * 需求发布成功页面查找按时间计算的前4个需求
	 * @return
	 */
	@ResponseBody
	@RequestMapping("findSuccessFourNeed")
	public List findSuccessFourNeed(HttpServletRequest request){
		List<ClientCustomerNeed> list=new ArrayList<ClientCustomerNeed>();
		ClientUserD clientUser = (ClientUserD) request.getSession().getAttribute("clientid");
		ClientCustomerNeed clientUserNeed = new ClientCustomerNeed();
		clientUserNeed.setClientUserId(clientUser.getId());
		clientUserNeed.setId(4);//查找个数
		String type=request.getParameter("type");//参数用来判断是哪一个页面发来请求，给出相应配置
		//成功页面type=success
		if("success".equals(type)){
			clientUserNeed.setTitle("publishTime");//排序字段
		}
		//lookPublish.jsp--->type=lookPublish
		else if("lookPublish".equals(type)){
			clientUserNeed.setAcceptState("未发布");//状态
			clientUserNeed.setTitle("completeTime");//排序字段
		}
		list=clientCustomerService.findNeedOrderBY(clientUserNeed);
		//如果list<0;没有符合条件的需求，查找热点需求
		if(list.size()<=0){
			ClientCustomerNeed clientUserNeed1 = new ClientCustomerNeed();
			clientUserNeed1.setId(4);//查找个数
			clientUserNeed1.setTitle("completeTime");
			clientUserNeed1.setPublishModel("主动投标模式");
			clientUserNeed1.setCycle("特急");
			list=clientCustomerService.findNeedOrderBY(clientUserNeed1);
		}
		return list;
	}
	
	
	//测试用
	
	/*@RequestMapping("successUI")
	public String successUI(){
		return "forward:../publishNeed/publish.need.error.jsp";
	}*/
	

	

	

	/**
	 * 根据单价和字数计算总价
	 * @return
	 * @author 张鑫
	 */
	@ResponseBody
	@RequestMapping("/getTotalPrice")
	public BigDecimal getTotalPrice(BigDecimal length,BigDecimal count){
		BigDecimal totalPrice = new BigDecimal(0);
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
		return totalPrice;
		/*BigDecimal length = (BigDecimal) request.getAttribute("length");
		BigDecimal count = (BigDecimal) request.getAttribute("count");*/
		/*if(length.intValue() < 500){
			float tp = count.floatValue() * 0.5f;
			totalPrice.setScale(2, BigDecimal.ROUND_HALF_UP);
			totalPrice = totalPrice.add(new BigDecimal(tp));
			return totalPrice;
		}else if(length.intValue() >= 500){
			float tp = (count.floatValue() * length.floatValue())/1000;
			totalPrice.setScale(2, BigDecimal.ROUND_HALF_UP);
			totalPrice = totalPrice.add(new BigDecimal(tp));
			return totalPrice;
		}else{
			return null;
		}*/
		
	}
	
	/**
	 * 实时计算单价
	 * @author 张鑫
	 */
	@RequestMapping("/getSinglePrice")
	@ResponseBody
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
	
	/**
	 * 
	 * @param strings
	 * @param id
	 * @return
	 * @author 张鑫
	 */
	@RequestMapping("/getTransList")
	@ResponseBody
	public List<Translator> getTransList(String strings,String id,String procedureType,String transLanguage,String transDomain){
		List<Translator> translist=new ArrayList<Translator>();//存储译员信息
		if(id!=null && id != ""){
			List<ClientCustomerNeedTrans> needtranslist=clientCustomerTransService.queryByNeedId(Integer.parseInt(id)); 
			for(int i=0;i<needtranslist.size();i++){
				Translator trans=new Translator();
				trans.setMsg2(needtranslist.get(i).getTranslatorId()+"");
				/*trans.setLanguages(transLanguage);
				trans.setDomain(transDomain);
				trans.setMsg(procedureType);*/
				trans=translatorService.queryByWhere(trans).get(0);
				translist.add(trans);
			}
			
		}else{
			String transIds[]=strings.split(",");
			if(transIds!=null){
				for(int i=0;i<transIds.length;i++){
					Translator trans=new Translator();
					trans.setMsg2(transIds[i]);
					/*trans.setLanguages(transLanguage);
					trans.setDomain(transDomain);
					trans.setMsg(procedureType);*/
					trans=translatorService.queryByWhere(trans).get(0);
					translist.add(trans);
				}
			}
		}
		return translist;
	}

}
