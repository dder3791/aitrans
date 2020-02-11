package com.web.dao;

import java.util.List;
import java.util.Map;

import com.web.domain.LanguagesVo;
import com.web.domain.Quotation;
import com.web.domain.Translator;
import com.web.util.Page;

public interface TranslatorDao {
		
   /**
    * 查询所有译员 
    * @return
    */
   public List<Translator> queryByAll(Page page);
		
   /**
	 * 添加译员信息
	 */
	public void saveTranslator(Translator  Translator);
	
	 
	public int checkAccountName(Translator Translator);
	
	public int checkEmail(Translator Translator);
	/**
	 * 查询当前译员信息
	 * @param Translator
	 * @return
	 */
	public Translator findTranslator(Translator Translator);
	
	/**
	 * 修改译员资料信息
	 * @param path
	 */
	public void updataTranslator(Translator Translator);
	
	/**
	 * 时间20180308  twl
	 * 修改译员基本资料信息
	 * @param path
	 */
	public void updateInfo(Translator translator);
	
	
	/**
	 * 根据id查询当前译员信息
	 * @param translator
	 * @return
	 */
	public Translator queryTransById(int transId);
	
	
	/**
	 * 查询当前总记录数
	 * @param page
	 * @return
	 */
	public long getTotalCount(Page page);
	
	/**
	 *查找有无相同用户信息
	 * @param translator
	 * @return
	 */
	public int checkUserName(Translator translator);
	
	
	public Translator queryTransByLanguage(Translator translator);
	/**
	 * 修改图片文件信息
	 * @param translator
	 */
	public void updateUrl(Translator translator);
	
	/**
	 * 根据条件查询译员
	 * @param translator
	 * @return
	 */
	public List<Translator> queryByWhere(Translator translator);
	/**
	 * 根据译员Id查询译员成交数量
	 * @param id
	 * @return
	 */
	public int countProjectByTransId(int id);
	
	/**
	 * 查询当前译员id
	 * @param Translator
	 * @return
	 */
	public Translator findTransById(Translator Translator);
	
	/**
	 * 根据译员id查询译员评价数量
	 * @param id
	 * @return
	 */
	public int countEvaluateByTransId(int id);
	
	
	/**
	 * 修改译员状态
	 */
	public void updatestate(Translator translator);
	
	/**
	 * 查询总记录数
	 * @param id
	 * @return
	 */
	public long queryTransNeedCount(Page page);
	
	
	/**
	 * 根据条件查询符合信息的招标译员
	 * @param translator
	 * @return
	 */
	public long getCountTransNeed(Translator translator);
	
	
	/**
	 * 译员上传作品
	 * @param translator
	 */
	public void updateWorkfile(Translator translator);
	
	
	
	/**
	 * 验证译员个人资料
	 * 
	 */
	public long selectTransInfo(int id);
	
	
    /**
     * 查询译员下的语言报价信息
     * @param transId
     * @return
     */
    public List<Translator>  queryByQuotation(int transId);
    
    /**
     * 查询译员下的语言报价信息
     * @param transId
     * @return
     */
    public List<Translator>  queryByQuotationOnlyLanguage(int transId);
	
    /**
     * 修改译员报价信息
     * @param translator
     *//*
    public void updatePrice(Translator translator);*/
    
    
    public Translator queryQuotationByid(int id);
    
    /**
     * 修改密码
     * @param translator
     * @return
     */
    public void updatePassword(Translator translator);
	
	/**
	 * 根据在线报价内容查询译员总人数
	 */
	public long getCount(Translator translator);
	
	
	
	public String findNickname(int id);
	
	/**
	 * 获取新注册的译员
	 * @return
	 */
	public List<Translator> getNewTranslators();

	
	public void updataTranslators(Translator translator);
	
	/**
	 * 修改验证状态
	 * @param translator
	 */
	public void updateVerifty(Translator translator);

	
	/**
	 * 根据用户名查询用户是否存在
	 * @return
	 */
	public Translator queryByName(String name);
	
	/**
	 * 根据身份证号，及用户名查询译员信息
	 * @param translator
	 * @return
	 */
	public Translator queryByCardId(Translator translator);
	
	/**
	 * 查询当前用户的手机号
	 * @param name
	 * @return
	 */
	public String getIphone(String name);
	

	/**
	 * 根据条件查询译员报价
	 * @param translator
	 * @return
	 */
	public Translator queryQuotation(Translator translator);
	

	/**
	 * 保存译员翻译报价信息
	 * @param translator
	 *//*
	public void saveQuotation(Translator  translator);
	*/

	/**
	 * 
	 * 根据用户名查询密码保护问题
	 */
	public String getSecurityQuestion(String name );
	
	/**
	 * 检查密保问题和答案是否正确
	 * @param translator
	 * @return
	 */
	public Translator checkAnswer(Translator translator);
	

	/**
	 * 查询当前译员的排名情况
	 * @param id
	 * @return
	 */
	public List<Translator>  queryByTranRank();
	
	
    public int checknameid(Translator translator);	
    
    
    public long checkPapers(Translator translator);
    
    
    /**
     * 根据译员Id，左查询译员报价信息
     * @param translator
     * @return
     */
    public Translator findtransQuestion(Translator translator);
    
    /**
     * 修改译员余额
     * @param translator
     */
    public void updateTransWallet(Translator translator);
    
    
    /**
     * <!-- 查询中间表需求对应译员之外的译员信息-->
     * @param translator
     * @return
     */
    public List<Translator> queryOutCusNeed(Translator translator);
    
    /**
     * 
     * @param nickname
     * @return
     */
    public Integer checkNickname(String nickname);

    
    /**
     * 时间：20180309 twl
     * 修改译员 资格文件路劲 （3个），资格状态（3个）
     * @param translator
     */
    public void updateQualify(Translator translator);
    
    /**
     * 
     * @param id
     * @param language
     * @return
     */
    public List<String> getDomainsByLanguage(Map<String,Object> map);
    
    /**
     * 
     * @param notin
     * @return
     */
    public List<String> notinDomains(Map<String,Object> map);
    
    /**
     * 
     * @param transId
     * @return
     */
    public List<Translator> selectQuoLanguages(int transId);
    
    /**
     * 
     * @param translator
     */
    public void addQuo(Translator translator);
    
    /**
     * 
     * @param languages
     * @param id
     * @return
     */
    public List<Quotation> getQuoByIdAndLanguage(Map<String,Object> map);
    
    /**
     * 
     * @param domain
     * @return
     */
    public int findFieldId(String domain);
    
    /**
     * 
     * @param translator
     */
    public void updateQuo(Translator translator);
    
    /**
     * 
     * @param id
     * @return
     */
    public List<LanguagesVo> getTransLanguages(int id);
    
    /**
     * 译员查找  计算译员总记录数
     * @param page
     * @return
     * 
     * 时间 2018 0321  twl
     */
    public long countTranPage(Page page);
    
    
    /**
     * 译员查找  分页查找译员
     * @param page
     * @return
     * 时间 20180321  twl
     */
    public List<Translator> transByPage(Page page);
    
    /**
     * 
     * @param id
     * @return
     */
    public List<String> getTransLanguagesStr(int id);
    
    /**
     * 译员查找  根据姓名和手机号
     * @param Translator
     * @return int
     * 时间 20200122 sq
     */
    public int getTranstionIdByTel(Translator translator);
    
    /**
     * 译员查找  根据姓名
     * @param Translator
     * @return int
     * 时间 20200221 sq
     */
    public int getTranstionIdByNickName(Translator translator);
    /**
     * 译员查找  根据姓名和email
     * @param Translator
     * @return int
     * 时间 20200221 sq
     */
    public int getTranstionIdByNickNameAndEmail(Translator translator);
    
}