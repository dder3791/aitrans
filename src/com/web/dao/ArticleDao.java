package com.web.dao;

import java.util.List;

import com.web.domain.Article;
import com.web.util.Page;

public interface ArticleDao {
	
	/**
	 * 查询所有资讯信息
	 * @return
	 */	
	public List<Article> queryByAll(Page page);
	
	/**
	 * 按资讯类型查询资讯信息
	 * @return
	 */	
	public List<Article> queryByType(String type);
	
	/**
	 * 依据条件查询总记录数
	 * @param page
	 * @return
	 */
	public long getTotalCount(Page page);
	
	
	/**
	 * 查询资讯详细信息
	 * @param id
	 * @return
	 */
	public Article queryById(int id );
	
	/**
	 * 查询首页所需的公告资讯信息
	 * @return
	 */
	public List<Article> getNoticeArticle();
	
	/**
	 * 查询首页所需的平台资讯信息
	 * @return
	 */
	public List<Article> getPlatformArticle();
	
	/**
	 * 查询首页所需活动资讯信息
	 * @return
	 */
	public List<Article> getActivityArticle();
}
