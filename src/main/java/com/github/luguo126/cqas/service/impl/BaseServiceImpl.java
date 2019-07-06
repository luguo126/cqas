package com.github.luguo126.cqas.service.impl;

import com.github.luguo126.cqas.domain.Answer;
import com.github.luguo126.cqas.domain.User;
import java.util.List;
import com.github.luguo126.cqas.domain.Question;
// import org.apache.ibatis.annotations.Param;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.luguo126.cqas.dao.BaseDao;
// import com.github.luguo126.cqas.domain.User;
import com.github.luguo126.cqas.service.BaseService;


@Service("baseService")
@Transactional
public class BaseServiceImpl  implements BaseService {
    private BaseDao baseDao;

    @Autowired
	@Qualifier("baseDao")
	public void setUserDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}



    @Override
    public List<Question> findQuestionByUid(String uid) {
        return baseDao.findQuestionByUid(uid);
    }

    @Override
    public Question findQuestionByQid(long qid) {
        return baseDao.findQuestionByQid(qid);
    }

    @Override
    public User findUserByUid(String uid) {
        return baseDao.findUserByUid(uid);
    }

    @Override
    public List<Question> findQuestions(){
        return baseDao.findQuestions();
    }

    @Override
    public List<Question> findAllQuestions() {
        return baseDao.findAllQuestions();
    }

    @Override
    public void delete_question_by_qid(long qid) {
        baseDao.delete_question_by_qid(qid);
    }

    public void update_question(Question question) {
        baseDao.update_question(question);
    }

    public void update_user_password(User user) {
        baseDao.update_user_password(user);
    }

    public List<Answer> findAnswerByQid(long qid) {
        return baseDao.findAnswerByQid(qid);
    }

    
}
