package com.github.luguo126.cqas.service;

import com.github.luguo126.cqas.domain.Answer;
import com.github.luguo126.cqas.domain.Question;
// import org.apache.ibatis.annotations.Param;


// import com.github.luguo126.cqas.dao.UserDao;
import com.github.luguo126.cqas.domain.User;

import java.util.List;


public interface BaseService {

    // public User findUser(String username,String password);
	// public void insertUser(User user);
    // public void insertQuestion(Question uestion);
    //
    // public List<Question> findQuestion();
    public List<Question> findQuestionByUid(String uid);
    public Question findQuestionByQid(long qid);

    public User findUserByUid(String uid);
    public List<Question> findQuestions();
    public List<Question> findAllQuestions();

    public void delete_question_by_qid(long qid);

    public void update_question(Question question);

    public void update_user_password(User user);
    public List<Answer> findAnswerByQid(long qid);
}
