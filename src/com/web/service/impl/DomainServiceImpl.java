package com.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.DomainDao;
import com.web.domain.Domain;
import com.web.service.DomainService;



@Service("domainService")
@Transactional
public class DomainServiceImpl implements DomainService {
	
	@Resource
	private DomainDao domainDao;

	@Override
	public List<Domain> queryByAll() {
		List<Domain> domains = domainDao.queryByAll();
		return domains;
	}

	@Override
	public int getDomainId(String domain) {
		
		return domainDao.getDomainId(domain);
	}

}
