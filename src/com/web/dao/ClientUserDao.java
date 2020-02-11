package com.web.dao;

import java.util.List;
import java.util.Map;

import com.web.domain.AdvertiseList;
import com.web.domain.ClientAdVo;
import com.web.domain.ClientUserD;
import com.web.domain.ClientUserShowVo;

public interface ClientUserDao {
   
	
	public List<ClientUserD> queryByAll();
	/**
	 * 添加客户信息
	 * @param cilentUserD
	 */
	public void saveUser(ClientUserD cilentUserD);
	
	/**
	 * 查找登录条件
	 * @param clientUserD
	 * @return
	 */
	public int findUser(ClientUserD clientUserD);
	
	/**
	 * 查询客户id
	 * @param clientUserD
	 * @return
	 */
	public ClientUserD findUserByid(ClientUserD clientUserD);
	/**
	 * 查询当前账户有无重复
	 * @param clientUserD
	 * @return
	 */
	public int checkUserName(ClientUserD clientUserD);
	
	
	/**
	 * 根据用户id查询用户的信息
	 * @param id
	 * @return
	 */
	public ClientUserD findCustomerById(int id);
	
	
	public String findName(int id);
	
    
    
    public int checkEmail(ClientUserD clientUserD);
 
	/**
	 * 根据名称查询用户
	 * @param name
	 * @return
	 */
	public ClientUserD queryByName(String name);
	
	/**
	 * 根据身份证号，及用户名查询用户信息
	 * @param clientUserD
	 * @return
	 */
	public ClientUserD queryByCardId(ClientUserD clientUserD);
	/**
	 * 查询当前用户的手机号
	 * @param name
	 * @return
	 */
	public String getIphone(String name);
 
	/**
	 * 修改信誉值
	 */
	public void editReputation(ClientUserD clientUserD);
	
	/**
	 * 设置密保问题
	 */
	public void setSecurityQuestion(ClientUserD clientUserD);
	
	/**
	 * 根据用户名查询密保问题
	 */
	public String getSecurityQuestion(String name );
	
	
	/**
	 * 检查问题和答案是否匹配
	 * @param clientUser
	 * @return
	 */
	public ClientUserD checkAnswer(ClientUserD clientUser);
	
	
	public int checkUserPhone(ClientUserD clientUserD);
	
	
	public void updateUserWallet(ClientUserD clientUser);
	
	public List<ClientUserShowVo> getUserShow();
	
	public List<ClientUserShowVo> getNotFixedRankData();
	
	public String[] getFixClientIdStr();
	
	public List<ClientUserShowVo> getNewShowRankUpdate(Map<String,Object> map);
	
	public void updateSingleRank(ClientUserShowVo clientUserShowVo);
	
	public ClientAdVo getAd1Type();
	
	public List<ClientAdVo> getAd2Type();
	
	public List<ClientAdVo> getAd3Type();
	
	public List<ClientAdVo> getAd4Type();
	
	public List<AdvertiseList> getOldAdListNotFixed();
	
	public List<AdvertiseList> getNewAdListNotFixed();
	
	public void updatesSingleADV(AdvertiseList advertiseList);
	
	public void insertSingleADV(AdvertiseList advertiseList);
	
}
