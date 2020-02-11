package com.web.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.ArticleDao;
import com.web.domain.Article;
import com.web.service.ArticleService;
import com.web.util.Page;

@Service("articleService")
@Transactional
public class ArticleServiceImpl implements ArticleService{
	
	@Resource
	private ArticleDao articleDao;

	@Override
	public List<Article> queryByAll(Page page) {

		List<Article> articles = articleDao.queryByAll(page);
		return articles;
	}

	@Override
	public List<Article> queryByType(String type) {
		List<Article> articles = articleDao.queryByType(type);
		return articles;
	}

	@Override
	public long getTotalCount(Page page) {
		long count = articleDao.getTotalCount(page);
		return count;
	}

	@Override
	public Article queryById(int id) {
		Article article = articleDao.queryById(id);
		
		return article;
	}

	@Override
	public List<Article> getNoticeArticle() {

		return articleDao.getNoticeArticle();
	}

	@Override
	public List<Article> getPlatformArticle() {
		
		return articleDao.getPlatformArticle();
	}

	@Override
	public List<Article> getActivityArticle() {

		return articleDao.getActivityArticle();
	}
	
	

}
