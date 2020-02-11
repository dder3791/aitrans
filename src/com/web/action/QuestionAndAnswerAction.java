package com.web.action;

 
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.domain.QuestionAndAnswer;
import com.web.service.QuestionAndAnswerService;
import com.web.util.Page;

@Controller
@Scope("prototype")
@RequestMapping("/questionAndAnswer")
@Transactional
public class QuestionAndAnswerAction {
	
	@Resource
	private QuestionAndAnswerService questionAndAnswerService;
    /**
     * 根据类型进行带分页模糊查询
     * @param pageNum 页码数
     * @param msg 查询条件
     * @return
     */
	@ResponseBody
	@RequestMapping("questionAndAnswer_queryByAll")
	public Map<Object,Object> questionAndAnswer_queryByAll(String pageNum,String msg){
		//构建一个page分页属性对象
		Page page =new Page();
		//判断并给予分页信息赋值
		if(msg==null || msg==""){
		  page.setMsg("%%");
		}else {
		  page.setMsg("%"+msg+"%");
		}
		long totalCount= questionAndAnswerService.getTotalCount(page);
		int size=3; 
		Page pageSize = new Page(totalCount,pageNum,size);
		if(msg==null || msg==""){
		pageSize.setMsg("%%");
		}else {
			pageSize.setMsg("%"+msg+"%");
		}
		Map<Object,Object> questionMap=new HashMap<Object,Object>();
		List<QuestionAndAnswer> QuestionAndAnswerList=questionAndAnswerService.queryByAll(pageSize);
		questionMap.put("QuestionAndAnswerList", QuestionAndAnswerList);
		questionMap.put("page", pageSize);
		return questionMap;
	}
	/**
	 * 根据问题查看答案
	 * @param question
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping("questionAndAnswer_queryByQuestion")
	public Map<Object,Object> questionAndAnswer_queryByQuestion(String pageNum,String msg,HttpServletRequest request){
		//构建一个page分页属性对象
		Page page =new Page();
		Map<Object,Object> questionMap=new HashMap<Object,Object>();
		//判断并给予分页信息赋值
		if(msg==null || msg==""){
		  page.setMsg("%%");
		}else {
		  page.setMsg("%"+msg+"%");
		}
		long totalCount= questionAndAnswerService.getTotalCountQuestion(page);
		if(totalCount==0){
			Page pageSize = new Page(totalCount,pageNum,3);
			List<QuestionAndAnswer> QuestionAndAnswerList=new ArrayList<QuestionAndAnswer>();
		  if(msg==null || msg==""){
			pageSize.setMsg("%%");
		 }else {
			pageSize.setMsg("%"+msg+"%");
		 }
		 questionMap.put("page", pageSize);
		 questionMap.put("QuestionAndAnswerList", QuestionAndAnswerList);
		}else{
		int size=3; 
		Page pageSize = new Page(totalCount,pageNum,size);
		if(msg==null || msg==""){
		pageSize.setMsg("%%");
		}else {
			pageSize.setMsg("%"+msg+"%");
		}
		
		List<QuestionAndAnswer> QuestionAndAnswerList=questionAndAnswerService.queryByQuestion(pageSize);
		questionMap.put("QuestionAndAnswerList", QuestionAndAnswerList);
		questionMap.put("page", pageSize);
	
		}
		return questionMap;
	}
	
	/**
	 * 根据模糊问题查看答案
	 * @param question
	 * @param model
	 * @return
	 */
	@RequestMapping("questionAndAnswer_queryByQuestions")
	public String questionAndAnswer_queryByQuestions(String pageNum,String msg,HttpServletRequest request){
		//构建一个page分页属性对象
		Page page =new Page();
		//判断并给予分页信息赋值
		if(msg==null || msg==""){
		  page.setMsg("%%");
		}else {
		  page.setMsg("%"+msg+"%");
		}
		//如果没有传入当前页给予初始值
	    if("null".equals(pageNum) || "".equals(pageNum) || "0".equals(pageNum) || pageNum==null){
		    pageNum="1";
		}
		long totalCount= questionAndAnswerService.getTotalCountQuestion(page);
		if(totalCount==0){
			Page pageSize = new Page(totalCount,pageNum,3);
			if(msg==null || msg==""){
				pageSize.setMsg("%%");
				}else {
					pageSize.setMsg("%"+msg+"%");
				}
			request.setAttribute("page", pageSize);
			request.setAttribute("msg", msg);
			return "forward:/help.center.jsp";
		}else{
		int size=2; 
		Page pageSize = new Page(totalCount,pageNum,size);
		if(msg==null || msg==""){
		pageSize.setMsg("%%");
		}else {
			pageSize.setMsg("%"+msg+"%");
		}
		Map<Object,Object> questionMap=new HashMap<Object,Object>();
		List<QuestionAndAnswer> QuestionAndAnswerList=questionAndAnswerService.queryByQuestion(pageSize);
		questionMap.put("QuestionAndAnswerList", QuestionAndAnswerList);
		questionMap.put("page", pageSize);
		request.setAttribute("page", pageSize);
		request.setAttribute("msg", msg);
		request.setAttribute("questionMap", questionMap);
		request.setAttribute("QuestionAndAnswerList", QuestionAndAnswerList);
		}
		return "forward:/common.problem3.jsp";
	}
	
	 /**
	  * 根据二次模糊查询分页展示
	  * @param pageNum
	  * @param msg
	  * @param request
	  * @return
	  */
	@ResponseBody
	@RequestMapping("questionAndAnswer_queryByQuestionsandProblem3")
	public Map<String,Object> questionAndAnswer_queryByQuestionsandProblem3(String pageNum,String msg,HttpServletRequest request){
		Map<String,Object> map=new HashMap<String,Object>();
		//构建一个page分页属性对象
		Page page =new Page();
		//判断并给予分页信息赋值
		if(msg==null || msg==""){
		  page.setMsg("%%");
		}else {
		  page.setMsg("%"+msg+"%");
		}
		//如果没有传入当前页给予初始值
	    if("null".equals(pageNum) || "".equals(pageNum) || "0".equals(pageNum) || pageNum==null){
		    pageNum="1";
		}
		long totalCount= questionAndAnswerService.getTotalCountQuestion(page);
		Page page1 = new Page(totalCount,pageNum,2);
		if(msg==null || msg==""){
			page1.setMsg("%%");
		}else {
			page1.setMsg("%"+msg+"%");
		}
		List<QuestionAndAnswer> QuestionAndAnswerList=questionAndAnswerService.queryByQuestion(page1);
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("page", page1);
		map.put("QuestionAndAnswerList", QuestionAndAnswerList);
		return map;
		}
	/**
	 * 根据类型查询总记录数
	 * @param type
	 * @return
	 */
	@RequestMapping("getTotalCount")
	public String getTotalCount(HttpServletRequest request,String msg){
	 Page page=new Page();
	 long totalCount;
	//判断并给予分页信息赋值
	 if(msg==null || msg==""){
		 page.setMsg("%%");
	 }else {
	     page.setMsg("%"+msg+"%");
	  }
     totalCount=questionAndAnswerService.getTotalCount(page);
	 request.getSession().setAttribute("totalCount", totalCount);
	 request.setAttribute("msg", msg);
	 return "forward:/common.problem.jsp";
	}
	
	@RequestMapping("getTotalQuestionCount")
	public String getTotalQuestionCount(HttpServletRequest request,String msg){
	 Page page=new Page();
	 long totalCount;
	//判断并给予分页信息赋值
	 if(msg==null || msg==""){
		 page.setMsg("%%");
	 }else {
	     page.setMsg("%"+msg+"%");
	  }
	 totalCount= questionAndAnswerService.getTotalCountQuestion(page);
	 page.setTotalCount(totalCount);
	 request.setAttribute("msg", msg);
	 request.setAttribute("totalCount", totalCount);
	 return "forward:/common.problem3.jsp";
	}
	/**
	 * 根据特点问题查询特定答案
	 * @param request
	 * @return
	 */
	@RequestMapping("findAnswer")
	public String findAnswer(HttpServletRequest request){
	 String question=request.getParameter("question");
	 if(question.contains("java")){
	 //前台取到的问题值因为使用this属性所有会有javascript:对此进行截取
	 question=question.substring(question.lastIndexOf(":")+1);
	 }
	 String answer=questionAndAnswerService.findAnswer(question);
	 List<Object> answerList=new ArrayList<Object>();
	 answerList.add(question);
	 answerList.add(answer);
	 request.setAttribute("question", question);
	 request.setAttribute("answerList", answerList);
	 return "forward:/common.problem2.jsp";
	}
	/**
	 * 根据类型查询对应问题与答案
	 * @param type
	 * @return
	 */
	@ResponseBody
	@RequestMapping("findByType")
	public List<QuestionAndAnswer> findByType(String type){
		List<QuestionAndAnswer> QuestionAndAnswerList=questionAndAnswerService.findByType(type);
		return QuestionAndAnswerList;
	}
}
