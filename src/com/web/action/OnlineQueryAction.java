package com.web.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.domain.BasicPrice;
import com.web.domain.Field;
import com.web.domain.Schedule;
import com.web.domain.Translator;
import com.web.domain.TranslatorLevel;
import com.web.service.BasicPriceService;
import com.web.service.FieldService;
import com.web.service.ScheduleService;
import com.web.service.TranslatorLevelService;
import com.web.service.TranslatorService;

@Controller
@Scope("prototype")
@RequestMapping("/onlineQuery")
@Transactional
public class OnlineQueryAction {
	//等级信息获取的service
	@Resource
	private TranslatorLevelService translatorLevelService;
	//领域信息获取的service
	@Resource
	private FieldService fieldService;
	//周期信息获取的service
	@Resource
	private ScheduleService scheduleService;
	//基础价格获取的service
	@Resource
	private BasicPriceService basicPriceService;
	
	@Resource
	private TranslatorService	translatorService;
	/**
	 * 按语言查询部分信息
	 * @param language
	 * @return
	 */
	@ResponseBody
	@RequestMapping("onlineQueryAction_queryByLanguage")
	public Map<String , Object> queryByLanguage(String language){
		//通过数据库获取当前语言基础价格
		BasicPrice basicPrice = basicPriceService.queryByLanguage(language);
		//获取译员等级系数整体信息
		List<TranslatorLevel>  translatorLevels = translatorLevelService.queryByAll();
		Map<String , Object> map = new HashMap<String, Object>();
		//添加并返回页面
		map.put("basicPrice", basicPrice);
		map.put("translatorLevels", translatorLevels);
		return map;
		
	}
	/**
	 * 获取在线报价所需要的所有模块
	 * @return
	 */
	@ResponseBody
	@RequestMapping("onlineQueryAction_queryByAll")
	public Map<String , Object> queryByAll(){
		//获取基础价格信息集合
		List<BasicPrice>  bps =basicPriceService.queryByAll();//
		//获取当前报价信息集合
		BasicPrice  basicPrice = basicPriceService.queryById(1);
		//获取译员等级系数集合
		List<TranslatorLevel>  translatorLevels = translatorLevelService.queryByAll();
		//获取领域系数集合
		List<Field> fields = fieldService.queryByAll();
		//获取周期系数集合
		List<Schedule> schedules = scheduleService.queryByAll();
		Map<String , Object> map = new HashMap<String, Object>();
		//添加并返回页面
		map.put("fields", fields);
		map.put("schedules", schedules);
		map.put("bps", bps );
		map.put("basicPrice", basicPrice);
		map.put("translatorLevels", translatorLevels);
		return map;
		
	}
	
	@ResponseBody
	@RequestMapping("onlineQueryAction_getCount")
	public Map<String, Object> getCount(String domain ,String language ,String level){
		Map<String, Object> map = new HashMap<String, Object>();
		Translator translator = new Translator();
		if("汉英".equals(language) || "英汉".equals(language)){
			language="EN";
		}else if("汉韩".equals(language) || "韩汉".equals(language)){
			language="KOR";
		}else if("汉日".equals(language) || "日汉".equals(language)){
			language="JP";
		}else if("汉法".equals(language) || "法汉".equals(language)){
			language="FR";
		}else if("汉徳".equals(language) || "徳汉".equals(language)){
			language="GER";
		}
		translator.setDomain(domain);
		translator.setLanguage(language);
		translator.setLevel(Integer.parseInt(level));
		long count = translatorService.getCount(translator);
		map.put("count", count);
		return map;
	}

}
