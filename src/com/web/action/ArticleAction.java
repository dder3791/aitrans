package com.web.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.domain.Article;
import com.web.service.ArticleService;
import com.web.util.Page;

@Controller
@Scope("prototype")
@RequestMapping("/article")
@Transactional
public class ArticleAction {
	
	@Resource
	private ArticleService articleService;
	
	/**
	 * 根据目前页面的值，与查询的类型，进行所有资讯信息的查找
	 * @param pageNum  当前页码值
	 * @param type   分类类型
	 * @return 返回含有   分页属性page类  与   实体类集合
	 */
	@ResponseBody
	@RequestMapping("articleAction_queryByAll")
	public Map<Object,Object> queryByAll(String pageNum,String type,String msg){
		if("null".equals(pageNum) || "".equals(pageNum) || "0".equals(pageNum)){
			pageNum="1";
			
		}
		//构建一个page分页属性对象
		Page page =new Page();
		//判断分类类型是否存在
		if(type!=null && type!=""){
			if("置顶资讯".equals(msg)){
				page.setDateType(2);
				page.setMsg(type);
			}else {
				//存在则给予分类类型赋值,并给予分类类型信息赋值
				page.setDateType(1);
				page.setMsg(type);
			}	
		}
	
		//根据page的分页信息进行查询总计路数
		long totalCount= articleService.getTotalCount(page);
		//构建一个分页属性dui象
		Page page1 = new Page(totalCount, pageNum,8);
		//判断并给予分页信息赋值
		if(type!=null && type!=""){
			if("置顶资讯".equals(msg)){
				page1.setDateType(2);
				page1.setMsg(type);
			}else {
				//存在则给予分类类型赋值,并给予分类类型信息赋值
				page1.setDateType(1);
				page1.setMsg(type);
			}
			
		}
		//根据分页属性信息进行所有数据的查询
		List<Article> articles = articleService.queryByAll(page1);
		//构建一个map
		Map<Object, Object> map = new HashMap<Object, Object>();
		//将信息与页面信息存入map并返回给前台页面
		map.put("articles", articles);
		map.put("page", page1);		
		return map;
		
	}
	

	
	

	
	
	/**
	 * 根据id查询 详细信息    
	 * @param id      查询主键
	 * @param request  
	 * @return    返回详细信息页面
	 */
	@RequestMapping("articleAction_queryById")
	public String queryById(@RequestParam(value="id") int id ,HttpServletRequest request){
		//根据id查询该条信息的详细信息
		Article article = articleService.queryById(id);
		//利用request进行传递数据
		request.setAttribute("article", article);
		
		return "forward:/information.details.jsp";
		
	}
	
	
	/**
	 * 获取信息的总记录数
	 * @param request
	 * @return   返回信息展示页面
	 */
	@RequestMapping("articleAction_getActivityTotalCount")
	public String getActivityTotalCount(HttpServletRequest request){
		//构建一个分页信息对象
		Page page = new Page();
		//给予查询条件赋值
		page.setMsg("%平台资讯%");
		page.setDateType(1);
		//获取总记录数
		long totalCount = articleService.getTotalCount(page);	
		//存储总记录数
		page.setTotalCount(totalCount);
		//传递page
		request.setAttribute("page", page);

		return "forward:/informationActivity.jsp";
		
	}
	
	/**
	 * 获取信息的总记录数
	 * @param request
	 * @return   返回信息展示页面
	 */
	@RequestMapping("articleAction_getPlatformTotalCount")
	public String getPlatformTotalCount(HttpServletRequest request){
		//构建一个分页信息对象
		Page page = new Page();
		//给予查询条件赋值
		page.setMsg("%活动资讯%");
		page.setDateType(1);
		//获取总记录数
		long totalCount = articleService.getTotalCount(page);	
		//存储总记录数
		page.setTotalCount(totalCount);
		//传递page
		request.setAttribute("page", page);
		System.out.println("totalCount="+totalCount);
		return "forward:/informationPlatform.jsp";
		
	}
	
	/**
	 * 获取信息的总记录数
	 * @param request
	 * @return   返回信息展示页面
	 */
	@RequestMapping("articleAction_getNoticeTotalCount")
	public String getNoticeTotalCount(HttpServletRequest request){
		//构建一个分页信息对象
		Page page = new Page();
		//给予查询条件赋值
		page.setMsg("%公告资讯%");
		page.setDateType(1);
		//获取总记录数
		long totalCount = articleService.getTotalCount(page);	
		//存储总记录数
		page.setTotalCount(totalCount);
		//传递page
		request.setAttribute("page", page);
		System.out.println("totalCount="+totalCount);
		return "forward:/informationNotice.jsp";
		
	}
	


	/*@RequestMapping("articleAction_queryByType")
	public String queryByType(String pageNum,String type){
		
		if(pageNum==null || pageNum==""){
			pageNum="1";
		}
		Page page =new Page();
		if(type!=null && type!=""){
			page.setDateType(1);
			page.setMsg(type);
		}
	
	
		long totalCount= articleService.getTotalCount(page);
		Page page1 = new Page(totalCount, pageNum);
		
		if(type!=null && type!=""){
			page1.setDateType(1);
			page1.setMsg(type);
		}
		
		List<Article> articles = articleService.queryByAll(page1);
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("articles", articles);
		map.put("page", page1);
		
		return "forward:/information.jsp";
		
	}*/
	
	
	

}
