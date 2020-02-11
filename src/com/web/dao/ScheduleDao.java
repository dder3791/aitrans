package com.web.dao;

import java.util.List;

import com.web.domain.Schedule;

public interface ScheduleDao {
		/**
		 * 查找所有翻译周期及对应系数
		 * @return 返回翻译周期系数集合
		 */
	public List<Schedule> queryByAll();
	
	/**
	 * 根据周期名称查找周期信息
	 * @param schedule
	 * @return
	 */
	public Schedule queryBySchedule(String schedule);
}
