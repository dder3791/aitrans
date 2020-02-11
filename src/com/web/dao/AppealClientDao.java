package com.web.dao;

import java.util.List;

import com.web.domain.AppealClient;


public interface AppealClientDao {
	
	 /**
	  * 修改申诉信息
	  * @param appealClient
	  */
	 public void updateAppeal(AppealClient appealClient);
	 
	 /**
	  * 添加申诉信息
	  */
	 public void addTransAppeal(AppealClient appealClient);
	 
	 
}
