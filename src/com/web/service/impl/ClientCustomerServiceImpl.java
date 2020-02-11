package com.web.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.ClientCustomerDao;
import com.web.domain.ClientCustomerNeed;
import com.web.domain.ClientUserD;
import com.web.domain.Customer;
import com.web.domain.OnLineCustomer;
import com.web.service.ClientCustomerService;
import com.web.util.Page;

@Service("clientCustomerService")
@Transactional
public class ClientCustomerServiceImpl implements ClientCustomerService  {

	Timer timer = new Timer();
	
	@Resource
	private ClientCustomerDao clientCustoerDao;
	
	@Override
	public void addCustomer(Customer customer) {
		clientCustoerDao.addCustomer(customer);
		
	}

	@Override
	public void editCilentCustomerById(ClientUserD clientUser) {
		clientCustoerDao.editCilentCustomerById(clientUser);
	}

	@Override
	public void addCustomerNeed(final ClientCustomerNeed clientCustomerNeed) {
		clientCustoerDao.addCustomerNeed(clientCustomerNeed);

	  /*//定时开始
		 SimpleDateFormat  sdf=new  SimpleDateFormat("yyyy-MM-dd hh:mm:ss");//小写的mm表示的是分钟
	     String dstr=clientCustomerNeed.getEXPIRYDATE();
	     Date date;
	     try {
				date = sdf.parse(dstr);
				 //定时任务，指定时间进行
			    timer.schedule(new TimerTask() {
			        public void run() {
			        	//执行方法\
			        	ClientCustomerNeed	clientCustomerNeed1 =clientCustoerDao.queryByWhere(clientCustomerNeed);
			        	clientCustomerNeed1.setAcceptState("失效");
			        	updateNeed(clientCustomerNeed1);
			        	 timer.cancel();
			        }
			        
			    },date);
				
				
				
			} catch (ParseException e) {
				e.printStackTrace();
			}  */
	   
	}

	@Override
	public List<ClientCustomerNeed> queryByPublishNeed(Page page) {
		List <ClientCustomerNeed> ClientCustomerNeedList=clientCustoerDao.queryByPublishNeed(page);
		return ClientCustomerNeedList;
	}

	@Override
	public long getPublishNeedCount(Page page) {
		long countpage=clientCustoerDao.getPublishNeedCount(page);
		return countpage;
	}

	@Override
	public ClientCustomerNeed findTransNeedByid(int id) {
		ClientCustomerNeed clientCustomerNeed=clientCustoerDao.findTransNeedByid(id);
		return clientCustomerNeed;
	}

	@Override
	public ClientCustomerNeed queryByWhere(ClientCustomerNeed clientCustomerNeed) {
		return clientCustoerDao.queryByWhere(clientCustomerNeed);
	}

	@Override
	public List<ClientCustomerNeed> findCusNeedByPage(Page page) {
		return clientCustoerDao.findCusNeedByPage(page);
	}

	@Override
	public long countCusNeesByPage(Page page) {
		return clientCustoerDao.countCusNeesByPage(page);
	}

	@Override
	public List<ClientCustomerNeed> findCusNeedByCusId(Page page) {
		return clientCustoerDao.findCusNeedByCusId(page);
	}

	@Override
	public long countCusNeesByCusId(Page page) {
		return clientCustoerDao.countCusNeesByCusId(page);
	}

	@Override
	public void updateNeed(ClientCustomerNeed clientCustomerNeed) {
		clientCustoerDao.updateNeed(clientCustomerNeed);
		//timer.cancel();
		/*//定时开始
		 SimpleDateFormat  sdf=new  SimpleDateFormat("yyyy-MM-dd hh:mm:ss");//小写的mm表示的是分钟
	     String dstr=clientCustomerNeed.getEXPIRYDATE();
	     Date date;
	     try {
				date = sdf.parse(dstr);
				 //定时任务，指定时间进行
			    timer.schedule(new TimerTask() {
			        public void run() {
			        	//执行方法\
			        	clientCustomerNeed.setAcceptState("失效");
			        	updateNeed(clientCustomerNeed);
			        	timer.cancel();
			        }
			        
			    },date);
				
				
				
			} catch (ParseException e) {
				e.printStackTrace();
			}  */
	}

	@Override
	public List<ClientCustomerNeed> findTransNeed(Page page) {
		return clientCustoerDao.findTransNeed(page);
	}

	@Override
	public void deleteNeed(int id) {
		clientCustoerDao.deleteNeed(id);
		
	}
	

	@Override
	public void saveOnliCustomer(OnLineCustomer onLineCustomer) {
		clientCustoerDao.saveOnliCustomer(onLineCustomer);
	}

	@Override
	public void updateAcceptState(ClientCustomerNeed clientCustomerNeed) {
		clientCustoerDao.updateAcceptState(clientCustomerNeed);
		
	}

	@Override
	public int queryClientCount(int id) {
		return clientCustoerDao.queryClientCount(id);
	}

	@Override
	public int queryAcceptCount(ClientCustomerNeed clientCustomerNeed) {
		return clientCustoerDao.queryAcceptCount(clientCustomerNeed);
	}

	@Override
	public List<ClientCustomerNeed> getNeeds(Page page) {
		return clientCustoerDao.getNeeds(page);
	}

	@Override
	public long getTotalCount(Page page) {
		return clientCustoerDao.getTotalCount(page);
	}

	@Override
	public List<ClientCustomerNeed> queryNeedReference(
			ClientCustomerNeed clientCustomerNeed) {
		return clientCustoerDao.queryNeedReference(clientCustomerNeed);
	}

	@Override
	public List<ClientUserD> findOnlineUser(OnLineCustomer onlinecustomer) {
		return clientCustoerDao.findOnlineUser(onlinecustomer);
	}

	@Override
	public void updateOnlineCustomer(OnLineCustomer onLineCustomer) {
		clientCustoerDao.updateOnlineCustomer(onLineCustomer);
	}

	@Override
	public OnLineCustomer findUserID(int id) {
		return clientCustoerDao.findUserID(id);
	}

	@Override
	public long countCompanyCustomerByPage(Page page) {
		return clientCustoerDao.countCompanyCustomerByPage(page);
	}

	@Override
	public List<OnLineCustomer> findCompanyCustomerByPage(Page page) {
		return clientCustoerDao.findCompanyCustomerByPage(page);
	}

	@Override
	public List<ClientCustomerNeed> findNeedOrderBY(ClientCustomerNeed clientCustomerNeed) {
		return clientCustoerDao.findNeedOrderBY(clientCustomerNeed);
	}

	@Override
	public List<ClientUserD> findCardId(String cardId) {
		return clientCustoerDao.findCardId(cardId);
	}

	@Override
	public String getNeedReference(ClientCustomerNeed clientCustomerNeed) {
		return clientCustoerDao.getNeedReference(clientCustomerNeed);
	}

	@Override
	public List<ClientCustomerNeed> queryOnly(String parameter) {
		return clientCustoerDao.queryOnly(parameter);
	}

	@Override
	public String getPublishPayNum(ClientCustomerNeed clientCustomerNeed) {
		return clientCustoerDao.getPublishPayNum(clientCustomerNeed);
	}
	@Override
	public int getIdentity(){
		return clientCustoerDao.getIdentity();
	}



}
