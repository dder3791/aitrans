package com.web.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.QuotationDao;
import com.web.domain.Field;
import com.web.domain.KeyAndValueVo;
import com.web.domain.Quotation;
import com.web.service.QuotationService;

@Service("quotationService")
@Transactional
public class QuotationServiceImpl implements QuotationService {

	@Resource
	private QuotationDao quotationDao;

	@Override
	public void saveQuotation(Quotation quotation) {
		quotationDao.saveQuotation(quotation);
		
	}

	@Override
	public void updatePrice(Quotation quotation) {
		quotationDao.updatePrice(quotation);
		
	}

	@Override
	public List<Quotation> queryTransQuotation(int id) {
		return quotationDao.queryTransQuotation(id);
	}

	@Override
	public Quotation queryByQuotationid(int id) {
		return quotationDao.queryByQuotationid(id);
	}


	@Override
	public List<Quotation> queryByTransPrice(int id) {
		return quotationDao.queryByTransPrice(id);
	}

	@Override
	public List<Quotation> queryByProoPrice(int id) {
		return quotationDao.queryByProoPrice(id);
	}

	@Override
	public List<Quotation> queryByAuditPrice(int id) {
		return quotationDao.queryByAuditPrice(id);
	}

	@Override
	public Quotation queryByQuoted(int id) {
		return quotationDao.queryByQuoted(id);
	}

	@Override
	public void updateTranLevel(Quotation quotation) {
		quotationDao.updateTranLevel(quotation);
	}


	@Override
	public List<Integer> queryByLevels(Quotation quotation) {
		return quotationDao.queryByLevels(quotation);
	}

	@Override
	public List<KeyAndValueVo> queryByProcedureType(Quotation quotation) {
		return quotationDao.queryByProcedureType(quotation);
	}

	@Override
	public List<Field> queryBylanguagesAndDomain(
			Quotation quotation) {
		return quotationDao.queryBylanguagesAndDomain(quotation);
	}

	@Override
	public Quotation queryByTranPrices(Quotation quotation) {
		return quotationDao.queryByTranPrices(quotation);
	}

	@Override
	public void updateApplyState(Quotation quotation) {
		quotationDao.updateApplyState(quotation);
	}

	@Override
	public int deleteQuotation(Quotation quotation) {
		return quotationDao.deleteQuotation(quotation);
	}

	@Override
	public int deleteQuoByDomain(Quotation quotation) {
		return quotationDao.deleteQuoByDomain(quotation);
	}

	 

 

	 

	
	 

}
