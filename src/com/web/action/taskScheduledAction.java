package com.web.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.web.domain.AdvertiseList;
import com.web.domain.ClientUserShowVo;
import com.web.service.ClientUserService;

@Component
@Transactional
public class taskScheduledAction {

	@Resource
	private ClientUserService clientUserService;
	
	
	public void updateClientShowRank(){
		 //查询客户展示排名中的非固定值的数量
		List<ClientUserShowVo> notFixedList = clientUserService.getNotFixedRankData();
		int notFixedNo = notFixedList.size();
		
		//查询固定值中固定的在客户表中存在的数据的客户ID
		String[] notInArr = clientUserService.getFixClientIdStr();
		String notIn = "";
		if(notInArr.length != 0){
			for (int i = 0; i < notInArr.length; i++) {
				if(i==0){
					notIn = "'" + notInArr[i] + "'";
				}else{
					notIn = notIn + "," + "'" + notInArr[i] + "'";
				}
			}
		}
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("notFixedNo",notFixedNo);
		map.put("notIn",notIn);
		
		//查询前（非固定值数量）名新的排名
		List<ClientUserShowVo> newShowRankUpdate =  clientUserService.getNewShowRankUpdate(map);
		
		for(int i = 0; i < notFixedList.size(); i++){
			ClientUserShowVo clientUserShowVoOld = notFixedList.get(i);
			ClientUserShowVo clientUserShowVoNew = newShowRankUpdate.get(i);
			clientUserShowVoOld.setUrl(clientUserShowVoNew.getUrl());
			clientUserShowVoOld.setUserId(clientUserShowVoNew.getUserId());
			clientUserShowVoOld.setWeb(clientUserShowVoNew.getWeb());
			clientUserService.updateSingleRank(clientUserShowVoOld);
		}
	}
	
	public void updateClientSelectRank(){
		List<AdvertiseList> oldNotFixed = clientUserService.getOldAdListNotFixed();
		List<AdvertiseList> newNotFixed = clientUserService.getNewAdListNotFixed();
		for (int i = 0; i < newNotFixed.size(); i++) {
			if(newNotFixed.get(i).getProvince() != null && !"".equals(newNotFixed.get(i).getProvince())){
				String privince = newNotFixed.get(i).getProvince();
				String[] split = privince.split(" ");
				if(split.length > 1){
					newNotFixed.get(i).setProvince(split[1]);
				}else{
					newNotFixed.get(i).setProvince("");
				}
			}
			if(i <= oldNotFixed.size()-1){
				newNotFixed.get(i).setId(oldNotFixed.get(i).getId());
				clientUserService.updatesSingleADV(newNotFixed.get(i));
			}else{
				clientUserService.insertSingleADV(newNotFixed.get(i));
			}
		}
	}
	
}
