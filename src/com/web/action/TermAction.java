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

import com.web.domain.Domain;
import com.web.domain.Term;
import com.web.service.DomainService;
import com.web.service.TermService;
import com.web.util.Page;


@Controller
@Scope("prototype")
@RequestMapping("/term")
@Transactional
public class TermAction {

	
	@Resource
	private TermService termService;
	
	@Resource
	private DomainService domainServicem;
	
/*	@ResponseBody
	@RequestMapping("termAction_getTerms")
	public List<Term> getTerms(String language){


		List<Term> terms = termService.getTerms(termType);

		
		
		return terms;
	}*/
	
	/**
	 * 多条件模糊查询术语信息
	 * @param language   语言类型
	 * @param domainId  领域id
	 * @param msg          模糊查询字段
	 * @param pageNum  当前页
	 * @return
	 */
	@ResponseBody
	@RequestMapping("termAction_queryByAll")
	public Map<String,Object> queryByAll(String language,String domainId,String msg,String pageNum){
		//如果没有传入语言类型给予初始值
		if("null".equals(language) || "".equals(language) || language==null ){
			language="英中";
		}
		//如果没有传入当前页给予初始值
		if("null".equals(pageNum) || "".equals(pageNum) || "0".equals(pageNum) || pageNum==null){
			pageNum="1";
			
		}
		//如果没有传入模糊查询字段给予初始值
		if("null".equals(msg) || "".equals(msg) || msg==null){
			msg = "%%";
		}else{
			//传入模糊查询字段添加百分号
			msg = "%"+msg+"%";
		}
		//如果没有传入domainId给予初始值
		if("null".equals(domainId) || "".equals(domainId) || domainId==null){
			domainId = "0";
		}
		//构建一个map容器
		Map<String, Object> map = new HashMap<String, Object>();
		//创建分页page信息
		Page page = new Page();
		page.setMsgType(language);
		page.setMsg(msg);
		page.setDateType(Integer.parseInt(domainId));
		//查询总计路数
		long totalCount = termService.getTotalCount(page);
		//判断总计路数=0则不查询术语信息返回页面分页信息及空术语信息
		if(totalCount==0){
			Page page1 = new Page(totalCount, pageNum, 8);
			page1.setMsgType(language);
			page1.setMsg(msg);
			page1.setDateType(Integer.parseInt(domainId));
			List<Term> terms =new ArrayList<Term>();
			map.put("terms", terms);
			map.put("page", page1);
		}else{
			//如果不为0则构建page分页查询信息
			Page page1 = new Page(totalCount, pageNum, 8);
			page1.setMsgType(language);
			page1.setMsg(msg);
			page1.setDateType(Integer.parseInt(domainId));
			//查询所有领域信息
			List<Domain> domains = domainServicem.queryByAll();
			//查询所有术语信息
			List<Term> terms = termService.getTerms(page1);
			//想容器添加信息
			map.put("domains", domains);
			map.put("terms", terms);
			map.put("page", page1);
			
		}
		
		return map ;
		
	}
	
	
	/**
	 * 获取信息的总记录数
	 * @param request
	 * @return   返回信息展示页面
	 */
	@RequestMapping("termAction_getTotalCount")
	public String getTotalCount(HttpServletRequest request){
		//构建一个分页信息对象
		Page page = new Page();
		page.setMsgType("英中");
		page.setDateType(0);
		page.setMsg("%%");
		//获取总记录数
		long totalCount = termService.getTotalCount(page);	
		//存储总记录数
		page.setTotalCount(totalCount);
		//传递page
		request.setAttribute("page", page);
		System.out.println("totalCount="+totalCount);
		return "forward:/message/patent.knowledge.jsp";
		
	}
}
