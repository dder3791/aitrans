package com.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.QuestionAndAnswerDao;
import com.web.domain.Article;
import com.web.domain.QuestionAndAnswer;
import com.web.service.QuestionAndAnswerService;
import com.web.util.Page;

@Service("QuestionAndAnswerService")
@Transactional
public class QuestionAndAnswerServiceImpl implements QuestionAndAnswerService{
   
	@Resource
	private QuestionAndAnswerDao questionAndAnswerDao;
	
	@Override
	public List<QuestionAndAnswer> queryByAll(Page page) {
       List<QuestionAndAnswer> QuestionAndAnswerList=questionAndAnswerDao.queryByAll(page);
		return QuestionAndAnswerList;
	}

	@Override
	public List<QuestionAndAnswer> findByType(String type) {
		 List<QuestionAndAnswer> QuestionAndAnswerList=questionAndAnswerDao.findByType(type);
		return QuestionAndAnswerList;
	}

	@Override
	public List<QuestionAndAnswer> findByQuestionAndAnswer() {
		 List<QuestionAndAnswer> QuestionAndAnswerList=questionAndAnswerDao.findByQuestionAndAnswer();
		return QuestionAndAnswerList;
	}

	@Override
	public long getTotalCount(Page page) {
		long totalCount=questionAndAnswerDao.getTotalCount(page);
		return totalCount;
	}

	@Override
	public List<QuestionAndAnswer> queryByQuestion(Page page) {
		List<QuestionAndAnswer> questionList=questionAndAnswerDao.queryByQuestion(page);
		return questionList;
	}

	@Override
	public long getTotalCountQuestion(Page page) {
		long totalCountQuestion=questionAndAnswerDao.getTotalCountQuestion(page);
		return totalCountQuestion;
	}

	@Override
	public String findAnswer(String question) {
		String answer=questionAndAnswerDao.findAnswer(question);
		return answer;
	}

	@Override
	public void addQuestion(QuestionAndAnswer questionAndAnswer) {
		questionAndAnswerDao.addQuestion(questionAndAnswer);
	}

	 


 
}
