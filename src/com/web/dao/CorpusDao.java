package com.web.dao;

import java.util.List;

import com.web.domain.Corpus;
import com.web.util.Page;

public interface CorpusDao {
	
	/**
	 * 根据当前页数据查询总的语料数据
	 */
	public List<Corpus> getCorpuss(Page page);
	
	/**
	 * 根据当前页数据查询总纪录数
	 * @param page
	 * @return
	 */
	public long getTotalCount(Page page);
	
	/**
	 * 根据Id查询语料信息
	 * @param id
	 * @return
	 */
	public Corpus queryById(int id );

}
