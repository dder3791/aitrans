package com.web.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.TranslatorDao;
import com.web.domain.LanguagesVo;
import com.web.domain.Quotation;
import com.web.domain.Translator;
import com.web.service.TranslatorService;
import com.web.util.Page;


@Service("translatorService")
@Transactional
public class TranslatorServiceImpl implements TranslatorService {

	 @Resource
	 private TranslatorDao translatorDao;
		
	@Override
	public List<Translator> queryByAll(Page page) {
			List<Translator> translatorList= translatorDao.queryByAll(page);
		return  translatorList;
	}

	@Override
	public void saveTranslator(Translator Translator) {
		translatorDao.saveTranslator(Translator);
	}
 
	@Override
	public Translator findTranslator(Translator translator) {
		translatorDao.findTranslator(translator);
		return translator;
	}

	 

	@Override
	public Translator queryTransById(int transId) {
		return translatorDao.queryTransById(transId);
	}
	
	public long getTotalCount(Page page){
		long countpage=translatorDao.getTotalCount(page);
		return countpage;
	}

	@Override
	public int checkUserName(Translator translator) {
		int counts=translatorDao.checkUserName(translator);
		return counts;
	}

	@Override
	public Translator queryTransByLanguage(Translator translator) {
		translatorDao.queryTransByLanguage(translator);
		return translator;
	}

	@Override
	public void updateUrl(Translator translator) {
		translatorDao.updateUrl(translator);
		
	}

	@Override
	public void updataTranslator(Translator translator) {
		translatorDao.updataTranslator(translator);
		
	}
	
	@Override
	public List<Translator> queryByWhere(Translator translator) {
		return translatorDao.queryByWhere(translator);
	}

	@Override
	public int countProjectByTransId(int id) {
		return translatorDao.countProjectByTransId(id);
	}

	@Override
	public int countEvaluateByTransId(int id) {
		return translatorDao.countEvaluateByTransId(id);
	}

	@Override
	public Translator findTransById(Translator Translator) {
		return translatorDao.findTransById(Translator);
	}

	@Override
	public void updatestate(Translator translator) {
		translatorDao.updatestate(translator);
		
	}


	@Override
	public long queryTransNeedCount(Page page) {
		long totalCount=translatorDao.queryTransNeedCount(page);
		return totalCount;
	}

	@Override
	public long getCountTransNeed(Translator translator) {
		return translatorDao.getCountTransNeed(translator);
	}


	@Override
	public void updateWorkfile(Translator translator) {
		translatorDao.updateWorkfile(translator);
		
	}

	@Override
	public long selectTransInfo(int id) {
		return translatorDao.selectTransInfo(id);
	}

	@Override
	public List<Translator> queryByQuotation(int transId) {
		return translatorDao.queryByQuotation(transId);
	}

	/*@Override
	public void updatePrice(Translator translator) {
		translatorDao.updatePrice(translator);
		
	}*/

	@Override
	public Translator queryQuotationByid(int id) {
		return translatorDao.queryQuotationByid(id);
	}




	@Override
	public long getCount(Translator translator) {
	
		return translatorDao.getCount(translator);
	}

	@Override
	public void updatePassword(Translator translator) {
		translatorDao.updatePassword(translator);
	}

	@Override
	public String findNickname(int id) {
		return translatorDao.findNickname(id);
	}

	@Override
	public List<Translator> getNewTranslators() {
	
		return translatorDao.getNewTranslators();
	}

	@Override
	public int checkAccountName(Translator Translator) {
		return translatorDao.checkAccountName(Translator);
	}

	@Override
	public int checkEmail(Translator Translator) {
		return translatorDao.checkEmail(Translator);
	}

	@Override
	public void updataTranslators(Translator translator) {
		translatorDao.updataTranslators(translator);
		
	}

	@Override
	public void updateVerifty(Translator translator) {
		translatorDao.updateVerifty(translator);
		
	}

	@Override
	public Translator queryByName(String name) {
		return translatorDao.queryByName(name);
	}

	@Override
	public Translator queryByCardId(Translator translator) {
		return translatorDao.queryByCardId(translator);
	}

	@Override
	public String getIphone(String name) {
		return translatorDao.getIphone(name);
	}

	@Override
	public Translator queryQuotation(Translator translator) {
		return translatorDao.queryQuotation(translator);
	}


	/*public void saveQuotation(Translator translator) {
		translatorDao.saveQuotation(translator);
		
	}*/


	@Override
	public String getSecurityQuestion(String name) {
	
		return translatorDao.getSecurityQuestion(name);
	}

	@Override
	public Translator checkAnswer(Translator translator) {
	
		return translatorDao.checkAnswer(translator);
	}


	@Override
	public List<Translator> queryByTranRank() {
		return translatorDao.queryByTranRank();
	}


	@Override
	public int checknameid(Translator translator) {
		return translatorDao.checknameid(translator);
	}

	@Override
	public long checkPapers(Translator translator) {
		return translatorDao.checkPapers(translator);
	}

	@Override
	public Translator findtransQuestion(Translator translator) {
		return translatorDao.findtransQuestion(translator);
	}

	@Override
	public void updateTransWallet(Translator translator) {
		translatorDao.updateTransWallet(translator);
	}

	@Override
	public List<Translator> queryOutCusNeed(Translator translator) {
		return translatorDao.queryOutCusNeed(translator);
	}

	@Override
	public Integer checkNickname(String nickname) {
		return translatorDao.checkNickname(nickname);
	}

	@Override
	public void updateInfo(Translator translator) {
		translatorDao.updateInfo(translator);
		
	}

	@Override
	public void updateQualify(Translator translator) {
		translatorDao.updateQualify(translator);
	}

	@Override
	public List<Translator> queryByQuotationOnlyLanguage(int transId) {
		return translatorDao.queryByQuotationOnlyLanguage(transId);
	}

	@Override
	public List<String> getDomainsByLanguage(Map<String,Object> map) {
		return translatorDao.getDomainsByLanguage(map);
	}

	@Override
	public List<String> notinDomains(Map<String,Object> map) {
		return translatorDao.notinDomains(map);
	}

	@Override
	public List<Translator> selectQuoLanguages(int transId) {
		return translatorDao.selectQuoLanguages(transId);
	}

	@Override
	public void addQuo(Translator translator) {
		translatorDao.addQuo(translator);
	}

	@Override
	public List<Quotation> getQuoByIdAndLanguage(Map<String,Object> map) {
		return translatorDao.getQuoByIdAndLanguage(map);
	}

	@Override
	public int findFieldId(String domain) {
		return translatorDao.findFieldId(domain);
	}

	@Override
	public void updateQuo(Translator translator) {
		translatorDao.updateQuo(translator);
	}

	@Override
	public List<LanguagesVo> getTransLanguages(int id) {
		return translatorDao.getTransLanguages(id);
	}

	@Override
	public long countTranPage(Page page) {
		return translatorDao.countTranPage(page);
	}

	@Override
	public List<Translator> transByPage(Page page) {
		return translatorDao.transByPage(page);
	}

	@Override
	public List<String> getTransLanguagesStr(int id) {
		return translatorDao.getTransLanguagesStr(id);
	}
	@Override
	public int getTranstionIdByTel(Translator translator){
		return translatorDao.getTranstionIdByTel(translator);
	}
	@Override
	public int getTranstionIdByNickName(Translator translator){
		return translatorDao.getTranstionIdByNickName(translator);
	}
	@Override
	public int getTranstionIdByNickNameAndEmail(Translator translator){
		return translatorDao.getTranstionIdByNickNameAndEmail(translator);
	}
	



 
    
}
