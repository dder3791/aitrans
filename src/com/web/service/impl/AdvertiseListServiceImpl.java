package com.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.AdvertiseListDao;
import com.web.domain.AdvertiseList;
import com.web.service.AdvertiseListService;
import com.web.util.Page;

@Service("advertiseListService")
@Transactional
public class AdvertiseListServiceImpl implements AdvertiseListService {

	@Resource
	private AdvertiseListDao advertiseListDao;
	
	
	@Override
	public long countAdvertiseByPage(Page page) {
		return advertiseListDao.countAdvertiseByPage(page);
	}


	@Override
	public List<AdvertiseList> findAdvertiseByPage(Page page) {
		return advertiseListDao.findAdvertiseByPage(page);
	}

}
