package com.web.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.domain.Agreetment;
import com.web.service.AgreetmentService;

@Controller
@Scope("prototype")
@RequestMapping("/agreetment")
@Transactional
public class AgreetmentAction {
       
	@Resource  
	private AgreetmentService agreetmentService;
	
	@ResponseBody
	@RequestMapping("queryByAllagreetment")
	public List<Agreetment> queryByAllagreetment(String agreetment){
		List<Agreetment> agreetmentList=agreetmentService.queryByAll(agreetment);
		return agreetmentList;
	}
	public static void main(String[] args){
		System.out.println("jee freamker44400dddaaa99");
		System.out.println("jee freamker44400dddaaa99");
		System.out.println("jee freamker44400dddaaa99w");
		System.out.println("jee freamker44400dddaaa99we");
		System.out.println("jee freamker44400dddaaa99we");
		System.out.println("jee freamker44400dddaaa99we");
		System.out.println("jee freamker44400dddaaa99we");
		
		System.out.println("jee freamker44400dddaaa99we1");
		System.out.println("jee freamker44400dddaaa99we2");
		System.out.println("jee freamker44400dddaaa99we3");
		
		
	}
}
