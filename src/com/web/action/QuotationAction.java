package com.web.action;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.web.domain.Quotation;
import com.web.domain.Translator;
import com.web.service.QuotationService;
import com.web.service.TranslatorService;


/**
 * 报价管理
 * @author Dell
 *
 *时间20180809  twl
 */
@Controller
@Scope("prototype")
@RequestMapping("/quotation")
@Transactional
public class QuotationAction {

	@Resource
	private QuotationService quotationService;
	
	@Resource
	private TranslatorService translatorService;
	
	
	/**
	 * 添加报价信息
	 * @return
	 */
	@RequestMapping("/addQuotation")
	public String addQuotation(HttpServletRequest request,@RequestParam("transFile")CommonsMultipartFile transFile,@RequestParam("proofFile")CommonsMultipartFile proofFile,@RequestParam("auditFile")CommonsMultipartFile auditFile){
		try{
			//获取添加报价人  ====session
			Translator trans=(Translator) request.getSession().getAttribute("transid");
			
			//获取服务器路劲
			String classPath=request.getSession().getServletContext().getRealPath("");
			
			
			//处理翻译文件，
			//如果翻译文件不是null--看译员是否有翻译资格，设置译员翻译资格IsVerifty=1等待审核，暂时不能翻译
			if(0!=transFile.getSize()){
				//设置翻译文件  数据库存储路劲
				String transURL="/upload/" + trans.getAccountName()+"/"+"翻译简历"+"/"+transFile.getOriginalFilename();
				//上传文件路劲==classPath+transURL
				String transPath=classPath+transURL;
				File originalDIR=new File(transPath);
				if(!originalDIR.exists()) {  
					originalDIR.mkdirs();  
			       }
				//上传文件
				transFile.transferTo(originalDIR); 
				
				//设置翻译资格
				if(trans.getIsVerifty()!=2){
					trans.setIsVerifty(1);
				}
				
				trans.setResumeUrl(transURL);//设置翻译文件存储路径
			}
			
			//处理校对文件
			if(0!=proofFile.getSize()){
				//设置校对文件  数据库存储路劲
				String proofURL="/upload/" + trans.getAccountName()+"/"+"校对简历"+"/"+proofFile.getOriginalFilename();
				//上传文件路劲==classPath+transURL
				String proofPath=classPath+proofURL;
				//上传文件
				File originalDIR=new File(proofPath);
				if(!originalDIR.exists()) {  
					originalDIR.mkdirs();  
			       }
				proofFile.transferTo(originalDIR); 
				
				//设置校对资格
				if(trans.getIsProofread()!=2){
					trans.setIsProofread(1);
				}
				trans.setProofreadUrl(proofURL);//设置校对文件存储路径
			}
			
			
			if(0!=auditFile.getSize()){
				//设置翻译文件  数据库存储路劲
				String auditURL="/upload/" + trans.getAccountName()+"/"+"审核简历"+"/"+auditFile.getOriginalFilename();
				//上传文件路劲==classPath+transURL
				String auditPath=classPath+auditURL;
				//上传文件
				File originalDIR=new File(auditPath);
				if(!originalDIR.exists()) {  
					originalDIR.mkdirs();  
			       }
				auditFile.transferTo(originalDIR); 
				
				//设置审核资格
				if(trans.getIsAudit()!=2){
					trans.setIsAudit(1);
				}
				trans.setAuditUrl(auditURL);//设置审核文件存储路径
			}
			
			String domainName=request.getParameter("domain");//存储领域（前端页面）信息
			String languagePair=request.getParameter("language");//存储语言对（前端页面）信息
			
			
			//查询报价表是否有该译员对应的领域，语言的报价，有做修改，没有添加
			Quotation quotation=new Quotation();
			quotation.setDomain(domainName);
			quotation.setLanguages(languagePair);
			quotation.setTranstionId(trans.getId());
			Quotation quotationSQL=quotationService.queryByTranPrices(quotation);//存储数据库中的报价
			if(quotationSQL==null){//若是null 说明没有该译员对应的领域语言报价，可以添加
				
				if(0!=transFile.getSize()){//不是null 说明译员申请翻译资格
					quotation.setApplyStateT(1);
				}else{
					quotation.setApplyStateT(0);
				}
				if(0!=proofFile.getSize()){//不是null 说明译员申请校对资格
					quotation.setApplyStateP(1);
				}else{
					quotation.setApplyStateP(0);
				}
				if(0!=auditFile.getSize()){//不是null 说明译员申请审核资格
					quotation.setApplyStateA(1);
				}else{
					quotation.setApplyStateA(0);
				}
				
				quotationService.saveQuotation(quotation);
				
				//修改译员信息  文件路劲（3个），资格
				translatorService.updateQualify(trans);
			}else{//做修改
				if(0!=transFile.getSize() && (quotationSQL.getApplyStateT()==0 || quotationSQL.getApplyStateT()==3)){//不是null 说明译员申请翻译资格
					quotationSQL.setApplyStateT(1);
				}
				if(0!=proofFile.getSize() && (quotationSQL.getApplyStateP()==0 || quotationSQL.getApplyStateP()==3)){//不是null 说明译员申请校对资格
					quotationSQL.setApplyStateP(1);
				}
				if(0!=auditFile.getSize() && (quotationSQL.getApplyStateA()==0 || quotationSQL.getApplyStateA()==3)){//不是null 说明译员申请审核资格
					quotationSQL.setApplyStateA(1);
				}
				
				//修改报价信息审核状态
				quotationService.updateApplyState(quotationSQL);
			}
			return "forward:/translator/translatorAction_findTrans.do?page=addQuo";
		}catch(Exception e){
			return "forward:/error/500Error.jsp";
		}
	}
	
	
	@ResponseBody
	@RequestMapping("deleteQuotation")
	public String deleteQuotation(String id,String languagePair){
		Quotation quotation=new Quotation();
		if(!"".equals(id) && null!=id && ""!=id){
			int transId=Integer.parseInt(id);
			quotation.setTranstionId(transId);
		}
		quotation.setLanguages(languagePair);
		
		int num=quotationService.deleteQuotation(quotation);
		if(num>0){
			return "success";
		}else{
			return "error";
		}
		
	}
}
