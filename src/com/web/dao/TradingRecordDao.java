package com.web.dao;

import com.web.domain.TradingRecord;

public interface TradingRecordDao {

	public int addTradRecord(TradingRecord tradingRecord);
	
	/**
	 * 根据where条件查询交易记录（格式为   字段="..."）
	 * @param tradingRecord
	 * @param where
	 * @return
	 */
	public TradingRecord selectTradRecordByouttradeno(String where);
	
	/**
	 * 根据订单号修改交易状态
	 * @param tradingRecord
	 * @return
	 */
	public int updateTradRecordBYwhere(TradingRecord tradingRecord);

	public String checkState(String out_trade_no);
}
