package com.web.dao;

import java.util.List;

import com.web.domain.QuestionAndAnswer;
import com.web.util.Page;

public interface QuestionAndAnswerDao {
    
	/**
	 * 查看所有问题与答案
	 * @return
	 */
	public List<QuestionAndAnswer>  queryByAll(Page page);
	
	/**
	 * 根据类型查询相对应得问题与答案信息
	 * @param type
	 * @return
	 */
	public List<QuestionAndAnswer> findByType(String type);
	
	/**
	 * 查询所有问题与答案
	 * @return
	 */
	public List<QuestionAndAnswer> findByQuestionAndAnswer();
	
	/**
	 * 根据类型查询总记录数
	 * @param page
	 * @return
	 */
	public long getTotalCount(Page page);
	
	
	/**
	 * 根据问题查询答案
	 * @param page
	 * @return
	 */
	public List<QuestionAndAnswer> queryByQuestion(Page page);
	
	
	
	/**
	 * 根据问题查询总记录数
	 * @param page
	 * @return
	 */
	public long getTotalCountQuestion(Page page);
	
	/**
	 * 根据特定问题查询特定答案
	 * @param question
	 * @return
	 */
	public String  findAnswer(String question);
	
	public void addQuestion(QuestionAndAnswer questionAndAnswer);
   
}
