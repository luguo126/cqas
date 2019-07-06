package com.github.luguo126.cqas.service.impl;

import com.github.luguo126.cqas.domain.SurfHistory;
import com.github.luguo126.cqas.domain.UserDetail;
import com.github.luguo126.cqas.domain.Answer;
import java.util.List;
import com.github.luguo126.cqas.domain.Question;
// import org.apache.ibatis.annotations.Param;

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.luguo126.cqas.dao.UserDao;
import com.github.luguo126.cqas.domain.User;
import com.github.luguo126.cqas.service.UserService;


@Service("userService")
@Transactional
public class UserServiceImpl extends BaseServiceImpl implements UserService {
    private UserDao userDao;

    @Autowired
	@Qualifier("userDao")
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

    @Override
    @Cacheable(value="cqas_cache")
    public User findUser(String username, String password) {
        return userDao.findUser(username, password);
    }

    @Override
	public void insertUser(User user) {
		userDao.insertUser(user);
	}

    @Override
    public void insertQuestion(Question uestion) {
        userDao.insertQuestion(uestion);
    }

    @Override
    public List<Question> findQuestion() {
        return userDao.findQuestion();
    }

    @Override
    @Cacheable(value="cqas_cache")
    public List<Question> findQuestionWithinTwoHours() {
        return userDao.findQuestionWithinTwoHours();
    }

    @Override
    @Cacheable(value="cqas_cache")
    public List<Question> findHotQuestions(int limit_number) {
        return userDao.findHotQuestions(limit_number);
    }

    // @Override
    // public List<Question> findQuestionByUid(String uid) {
    //     return userDao.findQuestionByUid(uid);
    // }
    @Override
    public void question_like_counter_add_one(long like_number, long qid) {
        userDao.question_like_counter_add_one(like_number, qid);
    }

    @Override
    public void question_surf_counter_add_one(long qid) {
        userDao.question_surf_counter_add_one(qid);
    }

    @Override
    public void insertAnswer(Answer answer) {
        userDao.insertAnswer(answer);
    }

    @Override
    public List<Answer> findAnswerByUid(String uid) {
        return userDao.findAnswerByUid(uid);
    }

    @Override
    public void updateUserPassword(String password, String email) {
        userDao.updateUserPassword(password, email);
    }

    @Override
    public void update_userdetail_headurl_by_uid(String uid,String head_img){
        userDao.update_userdetail_headurl_by_uid(uid, head_img);
    }

    @Override
    public UserDetail find_user_detail_by_uid(String uid) {
        return userDao.find_user_detail_by_uid(uid);
    }

    @Override
    public void insert_userdetail_uid(String uid) {
        userDao.insert_userdetail_uid(uid);
    }


    @Override
    public void add_surf_data(long qid, String uid) {
        userDao.add_surf_data(qid, uid);
    }
    @Override
    public SurfHistory find_surf_data_by_qid_uid(long qid, String uid) {
        return userDao.find_surf_data_by_qid_uid(qid, uid);
    }
    @Override
	public void update_surf_date(long qid, String uid) {
        userDao.update_surf_date(qid, uid);
    }
    @Override
	public void update_surfhistory_thumbsup_set_true(long qid, String uid) {
        userDao.update_surfhistory_thumbsup_set_true(qid, uid);
    }

    @Override
    public void add_question_answer_number_one(long qid){
        userDao.add_question_answer_number_one(qid);
    }

    @Override
    public void update_surfhistory_answered_set_true(long qid, String uid) {
        userDao.update_surfhistory_answered_set_true(qid, uid);
    }
    @Override
    @Cacheable(value="cqas_cache")
    public List<Question> findQuestionsBasedOnSurfhistory(String uid) {
        return userDao.findQuestionsBasedOnSurfhistory(uid);
    }

    @Override
    @Cacheable(value="cqas_cache")
    public List<Question> findQuestionByTypeNRows(String type, long nrow) {
        return userDao.findQuestionByTypeNRows(type, nrow);
    }

    @Override
    @Cacheable(value="cqas_cache")
    public List<Question> findQuestionByTypeWithMostAnswers(String type, long nrow) {
        return userDao.findQuestionByTypeWithMostAnswers(type, nrow);
    }

    public List<Question> findAnsweredQuestionFromSurfhistory(String uid) {
        return userDao.findAnsweredQuestionFromSurfhistory(uid);
    }


}
