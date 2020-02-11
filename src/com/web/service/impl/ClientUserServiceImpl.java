package com.web.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.dao.ClientUserDao;
import com.web.domain.AdvertiseList;
import com.web.domain.ClientAdVo;
import com.web.domain.ClientUserD;
import com.web.domain.ClientUserShowVo;
import com.web.domain.OnLineCustomer;
import com.web.service.ClientUserService;
@Service("clientUserService")
@Transactional
public class ClientUserServiceImpl implements ClientUserService{
    
	@Resource
	private ClientUserDao clientUserDao; 
	
	@Override
	public List<ClientUserD> queryByAll() {
		List<ClientUserD> cilentUserList=clientUserDao.queryByAll();
		return cilentUserList;
	}

	@Override
	public void saveUser(ClientUserD cilentUserD) {
		clientUserDao.saveUser(cilentUserD);
	}

	@Override
	public int findUser(ClientUserD clientUserD) {
		int count=clientUserDao.findUser(clientUserD);
		return count;
	}

	@Override
	public ClientUserD findUserByid(ClientUserD clientUserD) {
		ClientUserD clientUser=clientUserDao.findUserByid(clientUserD);
		return clientUser;
	}

	@Override
	public int checkUserName(ClientUserD clientUserD) {
		int counts=clientUserDao.checkUserName(clientUserD);
		return counts;
	}

	@Override
	public ClientUserD findCustomerById(int id) {
		return clientUserDao.findCustomerById(id);
	}

	@Override
	public String findName(int id) {
		return clientUserDao.findName(id);
	}


	@Override
	public int checkEmail(ClientUserD clientUserD) {
		return clientUserDao.checkEmail(clientUserD);
	}

	@Override
	public ClientUserD queryByName(String name) {
		return clientUserDao.queryByName(name);
	}

	@Override
	public ClientUserD queryByCardId(ClientUserD clientUserD) {
		return clientUserDao.queryByCardId(clientUserD);
	}

	@Override
	public String getIphone(String name) {
		return clientUserDao.getIphone(name);
	}

	@Override
	public void editReputation(ClientUserD clientUserD) {
		
		clientUserDao.editReputation(clientUserD);
	}

	@Override
	public void setSecurityQuestion(ClientUserD clientUserD) {
		clientUserDao.setSecurityQuestion(clientUserD);
		
	}

	@Override
	public String getSecurityQuestion(String name) {

		return clientUserDao.getSecurityQuestion(name);
	}

	@Override
	public ClientUserD checkAnswer(ClientUserD clientUser) {

		return clientUserDao.checkAnswer(clientUser);
	}

	@Override
	public int checkUserPhone(ClientUserD clientUserD) {
		return clientUserDao.checkUserPhone(clientUserD);
	}

	@Override
	public void updateUserWallet(ClientUserD clientUser) {
		clientUserDao.updateUserWallet(clientUser);
	}

	@Override
	public List<ClientUserShowVo> getUserShow() {
		List<ClientUserShowVo> userShow = clientUserDao.getUserShow();
		return userShow;
	}

	@Override
	public List<ClientUserShowVo> getNotFixedRankData() {
		return clientUserDao.getNotFixedRankData();
	}

	@Override
	public String[] getFixClientIdStr() {
		return clientUserDao.getFixClientIdStr();
	}

	@Override
	public List<ClientUserShowVo> getNewShowRankUpdate(Map<String,Object> map) {
		return clientUserDao.getNewShowRankUpdate(map);
	}

	@Override
	public void updateSingleRank(ClientUserShowVo clientUserShowVo) {
		clientUserDao.updateSingleRank(clientUserShowVo);
	}

	@Override
	public ClientAdVo getAd1Type() {
		return clientUserDao.getAd1Type();
	}

	@Override
	public List<ClientAdVo> getAd2Type() {
		return clientUserDao.getAd2Type();
	}

	@Override
	public List<ClientAdVo> getAd3Type() {
		return clientUserDao.getAd3Type();
	}

	@Override
	public List<ClientAdVo> getAd4Type() {
		return clientUserDao.getAd4Type();
	}

	@Override
	public List<AdvertiseList> getOldAdListNotFixed() {
		return clientUserDao.getOldAdListNotFixed();
	}

	@Override
	public List<AdvertiseList> getNewAdListNotFixed() {
		return clientUserDao.getNewAdListNotFixed();
	}

	@Override
	public void updatesSingleADV(AdvertiseList advertiseList) {
		clientUserDao.updatesSingleADV(advertiseList);
	}

	@Override
	public void insertSingleADV(AdvertiseList advertiseList) {
		clientUserDao.insertSingleADV(advertiseList);
	}



}
