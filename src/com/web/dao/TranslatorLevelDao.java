package com.web.dao;

import java.util.List;

import com.web.domain.TranslatorLevel;

public interface TranslatorLevelDao {
		
		/**
		 * 查找所有译员等级所对应的系数
		 * @return 返回译员等级所对应的系数集合实体类
		 */
		public List<TranslatorLevel> queryByAll();
		
		/**
		 * 通过译员等级查找译员信息
		 * @param level
		 * @return
		 */
		public TranslatorLevel queryByLevel(int level);
}
