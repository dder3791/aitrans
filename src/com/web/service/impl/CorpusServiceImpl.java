package com.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.CorpusDao;
import com.web.domain.Corpus;
import com.web.service.CorpusService;
import com.web.util.Page;


@Service("corpusService")
@Transactional
public class CorpusServiceImpl implements CorpusService {
	@Resource
	private CorpusDao corpusDao;

	@Override
	public List<Corpus> getCorpuss(Page page) {
		List<Corpus> corpuss = corpusDao.getCorpuss(page);
		return corpuss;
	}

	@Override
	public long getTotalCount(Page page) {
		long totalCount = corpusDao.getTotalCount(page);
		return totalCount;
	}

	@Override
	public Corpus queryById(int id) {
		Corpus corpus = corpusDao.queryById(id);
		return corpus;
	}

}
