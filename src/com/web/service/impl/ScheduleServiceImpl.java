package com.web.service.impl;

import java.util.List;




import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.ScheduleDao;
import com.web.domain.Schedule;
import com.web.service.ScheduleService;

@Service("scheduleService")
@Transactional
public class ScheduleServiceImpl implements ScheduleService {

		@Resource
		private ScheduleDao scheduleDao;
	
	@Override
	public List<Schedule> queryByAll() {
		List<Schedule> schedules = scheduleDao.queryByAll();
		return schedules;
	}
	@Override
	public Schedule queryBySchedule(String schedule) {
		return scheduleDao.queryBySchedule(schedule);
	}

}
