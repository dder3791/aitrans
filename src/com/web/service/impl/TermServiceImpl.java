package com.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.TermDao;
import com.web.domain.Term;
import com.web.service.TermService;
import com.web.util.Page;

@Service("termService")
@Transactional
public class TermServiceImpl implements TermService {
	
	@Resource
	private TermDao termDao;
	
	@Override
	public List<Term> getTerms(Page page ) {
		List<Term>  terms = termDao.getTerms(page);
		return terms;
	}

	@Override
	public long getTotalCount(Page page) {
		long totalCount = termDao.getTotalCount(page);
		return totalCount;
	}

	@Override
	public List<Term> queryByMsg(Page page) {
		
		return termDao.queryByMsg(page);
	}

}
