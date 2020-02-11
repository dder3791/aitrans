package com.web.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.TradingRecordDao;
import com.web.domain.TradingRecord;
import com.web.service.TradingRecordService;

@Service("tradingRecordService")
@Transactional
public class TradingRecordServiceImpl implements TradingRecordService{

	@Resource
	private TradingRecordDao tradingRecordDao;
	
	@Override
	public int addTradRecord(TradingRecord tradingRecord) {
		return tradingRecordDao.addTradRecord(tradingRecord);
	}

	@Override
	public TradingRecord selectTradRecordByouttradeno(String where) {
		return tradingRecordDao.selectTradRecordByouttradeno(where);
	}

	@Override
	public int updateTradRecordBYwhere(TradingRecord tradingRecord) {
		return tradingRecordDao.updateTradRecordBYwhere(tradingRecord);
	}

	@Override
	public String checkState(String out_trade_no) {
		// TODO Auto-generated method stub
		return tradingRecordDao.checkState(out_trade_no);
	}
 

}
