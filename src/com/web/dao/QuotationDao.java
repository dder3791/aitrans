package com.web.dao;

import java.util.List;
import java.util.Map;

import com.web.domain.Field;
import com.web.domain.KeyAndValueVo;
import com.web.domain.Quotation;


public interface QuotationDao {
	
	 
	/**
	 * 保存译员翻译报价信息
	 * @param translator
	 */
	public void saveQuotation(Quotation  quotation);
	
	
	/**
     * 修改译员报价信息
     * @param translator
     */
    public void updatePrice(Quotation quotation);
    
    public List<Quotation> queryTransQuotation(int id);
    
    
    public   Quotation    queryByQuotationid(int id);
    
  
    public List<Quotation> queryByTransPrice(int id);
    
    public List<Quotation> queryByProoPrice(int id);
	
    public List<Quotation> queryByAuditPrice(int id);
    
    public Quotation queryByQuoted(int id);
    
    public void updateTranLevel(Quotation quotation);
    
    public List<Field>  queryBylanguagesAndDomain(Quotation  quotation);
    
    public List<Integer> queryByLevels(Quotation quotation);
    
    public List<KeyAndValueVo> queryByProcedureType(Quotation quotation);
    
    public Quotation queryByTranPrices(Quotation quotation);
    
    /**
     * 修改译员报价资格状态
     * 时间：20180809 twl
     * @param quotation
     */
    public void updateApplyState(Quotation quotation);
    
    
    /**
     * 根据报价语言对，译员id
     * @param quotation
     * @return
     */
    public int deleteQuotation(Quotation quotation);
    
    /**
     * 根据报价语言对，译员id，领域
     * @param quotation
     * @return
     */
    public int deleteQuoByDomain(Quotation quotation);
}
