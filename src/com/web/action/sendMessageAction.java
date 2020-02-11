package com.web.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

 
/**
 * 注册用户手机发送验证码
 * @author vampire
 *
 */
@Controller
@Scope("prototype")
@RequestMapping("/sendMessage")
@Transactional
public class sendMessageAction {
	
	
	  /**
      * 随机生成4位随机验证码
      * @return
      * @author vampire
      * @return String
     */
    public static String createRandomVcode(){
        //验证码
        String vcode = "";
        for (int i = 0; i < 4; i++) {
            vcode = vcode + (int)(Math.random() * 9);
        }
        return vcode;
    }
    
   /**
    * 根据注册用户信息发送手机验证码
    * @param args
    * @author vampire
    * @throws IOException 
    * @throws HttpException 
    * @throws Exception
    */
    @ResponseBody
    @RequestMapping("sendMessageAction_sendPhone")
    public String sendMessageAction_sendPhone(String phone,HttpServletRequest request) throws HttpException, IOException{
    	HttpSession session=request.getSession();
      HttpClient client = new HttpClient();
      PostMethod post = new PostMethod("http://gbk.sms.webchinese.cn"); 
      String code=createRandomVcode();
      post.addRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=gbk");//在头文件中设置转码
      NameValuePair[] data ={ new NameValuePair("Uid", "zhaolei123"),new NameValuePair("Key", "1a5ca651cd2f7335d1c9"),new NameValuePair("smsMob",phone),new NameValuePair("smsText","您的验证码为:"+code+""+"，有效时间为60秒!请注意妥善保存!")};
      post.setRequestBody(data);
      client.executeMethod(post);
      Header[] headers = post.getResponseHeaders();
      int statusCode = post.getStatusCode();
      System.out.println("statusCode:"+statusCode);
      for(Header h : headers){
      System.out.println(h.toString());
      }
     String result = new String(post.getResponseBodyAsString().getBytes("gbk")); 
     post.releaseConnection();
     /*String code="1132";*/
     //将获取的验证码放入用户中
     session.setAttribute("code", code);
	return code;
}
 
    /**
     * 校验验证码
     * @Title: checkCode
     * @Description: TODO
     * @throws
     */ 
  @RequestMapping("sendMessageAction_checkCode")  
  public void checkCode(HttpServletRequest request,HttpServletResponse response,String code) throws ServletException,IOException{
     String codes=(String) request.getSession().getAttribute("code"); 
     String data ="1";
      if(null==codes){//获取session中的验证码
         data="2";
      }else if(!codes.equals(code)){//获取前台传来的用户输入的验证码
         data="0";
      }
  response.setContentType("application/json;charset=UTF-8");  
          response.setHeader("Cache-Control", "no-cache");  
          PrintWriter out = response.getWriter();  
          out.write(data); 
  }
    
 

    
    
    
    
}